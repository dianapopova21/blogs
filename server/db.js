const mysql = require("mysql2");
require("dotenv").config(); // Для работы с переменными окружения

// Создаем подключение к базе данных
const connection = mysql.createConnection({
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "db_blogs",
    port: process.env.DB_PORT || 3306,  // вот тут добавь порт
});


// Подключаемся к базе данных
connection.connect((err) => {
    if (err) {
        console.error("Ошибка подключения к базе данных:", err);
        return;
    }
    console.log("✅ Подключено к базе данных MySQL");
});

module.exports = connection; // Экспортируем подключение для использования в других файлах
