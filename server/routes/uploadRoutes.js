const express = require("express");
const multer = require("multer");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const cloudinary = require("../config/cloudinary");
const authMiddleware = require("../middleware/authMiddleware");
const connection = require("../db"); // Подключаем БД

const router = express.Router();

const storage = new CloudinaryStorage({
    cloudinary,
    params: {
        folder: "avatars",
        format: async () => "jpg",
        public_id: () => Date.now().toString(),
    },
});
const upload = multer({ storage });

router.post("/upload-avatar", authMiddleware, upload.single("avatar"), async (req, res) => {
    try {
        if (!req.file) return res.status(400).json({ error: "Файл не загружен" });

        const userId = req.user.id;
        const avatarUrl = req.file.path;

        // Обновляем аватар в MySQL
        const query = "UPDATE users SET avatar = ? WHERE id = ?";
        connection.query(query, [avatarUrl, userId], (err, results) => {
            if (err) {
                console.error("Ошибка обновления аватара:", err);
                return res.status(500).json({ error: "Ошибка обновления аватара" });
            }

            if (results.affectedRows === 0) {
                return res.status(404).json({ error: "Пользователь не найден" });
            }

            res.json({ avatar: avatarUrl });
        });

    } catch (error) {
        console.error("Ошибка загрузки аватара:", error);
        res.status(500).json({ error: "Ошибка загрузки аватара" });
    }
});

// Обработчик для загрузки изображений блогов
router.post("/upload-image", authMiddleware, upload.single("image"), async (req, res) => {
    try {
        if (!req.file) return res.status(400).json({ error: "Файл не загружен" });

        // Ссылка на изображение после загрузки
        const imageUrl = req.file.path;

        // Возвращаем ссылку на изображение
        res.json({ imageUrl });
    } catch (error) {
        console.error("Ошибка загрузки изображения:", error);
        res.status(500).json({ error: "Ошибка загрузки изображения" });
    }
});
module.exports = router;
