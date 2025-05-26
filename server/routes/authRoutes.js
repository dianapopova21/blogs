const express = require("express");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const db = require("../db"); // Подключение к MySQL
require("dotenv").config();


const router = express.Router();

// Регистрация
router.post("/register", async (req, res) => {
    try {
        const { username, email, password, role } = req.body;

        const hashedPassword = await bcrypt.hash(password, 10);
        const defaultAvatar = "https://res.cloudinary.com/diqtvi9m5/image/upload/v1740498729/default-avatar_tlxou0.jpg";

        const query = "INSERT INTO users (username, email, password, role, avatar) VALUES (?, ?, ?, ?, ?)";
        connection.query(query, [username, email, hashedPassword, role, defaultAvatar], (err, results) => {
            if (err) {
                console.error("Ошибка при добавлении пользователя в БД:", err);
                return res.status(500).json({ error: "Ошибка сервера" });
            }
            res.status(201).json({ message: "Пользователь зарегистрирован" });
        });
    } catch (error) {
        console.error("Ошибка регистрации:", error);
        res.status(500).json({ error: "Ошибка сервера" });
    }
});

// Авторизация
router.post("/login", async (req, res) => {
    try {
        const { email, password } = req.body;

        // Проверяем, есть ли пользователь в MySQL
        const [users] = await db.execute("SELECT * FROM users WHERE email = ?", [email]);
        if (users.length === 0) return res.status(404).json({ error: "Пользователь не найден" });

        const user = users[0];

        // Проверяем пароль
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ error: "Неверный пароль" });

        // Создаем токен
        const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: "7d" });

        console.log("Ответ сервера:", { token, user }); // Проверяем, что отправляем

        // Отправляем клиенту корректные данные
        res.json({
            token,
            user: {
                id: user.id,
                username: user.username,
                email: user.email,
                avatar: user.avatar // <-- Убедись, что в БД есть это поле
            }
        });

    } catch (error) {
        console.error("Ошибка авторизации:", error);
        res.status(500).json({ error: "Ошибка сервера" });
    }
});

router.put("/update-username", authMiddleware, async (req, res) => {
    try {
        const { username } = req.body;
        const userId = req.user.id;

        if (!username) {
            return res.status(400).json({ error: "Имя не может быть пустым" });
        }

        const updatedUser = await User.findByIdAndUpdate(userId, { username }, { new: true });

        if (!updatedUser) {
            return res.status(404).json({ error: "Пользователь не найден" });
        }

        res.json({ username: updatedUser.username });
    } catch (error) {
        console.error("Ошибка обновления имени:", error);
        res.status(500).json({ error: "Ошибка обновления имени" });
    }
});

module.exports = router;
