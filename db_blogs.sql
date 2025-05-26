-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 04:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image`, `category`, `content`, `keywords`, `created_at`, `author_id`) VALUES
(19, '5 простых уходовых средств', 'https://res.cloudinary.com/diqtvi9m5/image/upload/v1748268175/avatars/1748268175027.jpg', 'Beauty', '<p data-start=\"195\" data-end=\"452\"><i>В мире косметики легко потеряться: новые продукты появляются каждый день, и каждый обещает мгновенный эффект. Но иногда самые простые средства оказываются самыми эффективными. Сегодня делюсь подборкой уходовых средств, которые приятно удивили своей работой.</i></p>\n<p data-start=\"454\" data-end=\"629\"><strong data-start=\"454\" data-end=\"477\">1. Мицеллярная вода</strong><br data-start=\"477\" data-end=\"480\">\nИдеально подходит для мягкого очищения кожи. Удаляет макияж, не пересушивая и не оставляя ощущения липкости. Особенно хороша для чувствительной кожи.</p>\n<p data-start=\"631\" data-end=\"799\"><strong data-start=\"631\" data-end=\"656\">2. Гидрофильное масло</strong><br data-start=\"656\" data-end=\"659\">\nЕсли вы до сих пор не пробовали двухэтапное очищение — начните с него. Масло растворяет даже стойкий макияж и подходит для любого типа кожи.</p>\n<p data-start=\"801\" data-end=\"947\"><strong data-start=\"801\" data-end=\"837\">3. Увлажняющий крем с пантенолом</strong><br data-start=\"837\" data-end=\"840\">\nПростой состав, но мощное действие. Успокаивает раздражения, питает и отлично работает как база под макияж.</p>\n<p data-start=\"949\" data-end=\"1113\"><strong data-start=\"949\" data-end=\"970\">4. </strong><span data-start=\"949\" data-end=\"970\"><b>Тканевые маски</b></span><br data-start=\"970\" data-end=\"973\">\nБыстрое решение перед важным событием. Лучше всего выбирать маски с гиалуроновой кислотой или экстрактом алоэ — они мгновенно освежают лицо.</p>\n<p data-start=\"1115\" data-end=\"1268\"><strong data-start=\"1115\" data-end=\"1149\">5. Солнцезащитный крем SPF 30+</strong><br data-start=\"1149\" data-end=\"1152\">\nСамое недооцененное средство ухода. Защищает кожу от фотостарения, гиперпигментации и помогает сохранить ровный тон.</p>\n<p data-start=\"1270\" data-end=\"1403\"><i>Главное — выбирать продукты, которые подходят именно вам. Не гонитесь за трендами, слушайте свою кожу и не забывайте о базовом уходе.</i></p>', 'cosmetic, beauty, oil, face, wash, skincare', '2025-05-26 14:02:56', 68),
(20, 'Мальта — остров, который удивляет', 'https://res.cloudinary.com/diqtvi9m5/image/upload/v1748268538/avatars/1748268537102.jpg', 'Travelling', '<p data-start=\"174\" data-end=\"352\">Когда думаешь о Мальте, представляешь себе открытки: лазурное море, старинные улочки, солнце круглый год. Всё это правда — но остров оказался гораздо интереснее, чем я ожидала.</p>\n<p data-start=\"354\" data-end=\"601\">Первое, что поражает — это контраст. <b><span style=\"font-size: 20px; font-weight: bold;\">Валлетта </span></b>— маленькая столица, но каждый поворот улицы будто отсылает к разным эпохам. Здесь рыцарские крепости соседствуют с современными кафе, а в узких переулках слышна как мальтийская, так и английская речь.</p>\n<p data-start=\"603\" data-end=\"781\">Море — это отдельная история. Не пляжи, а именно скалы, солёный ветер, шум волн и прозрачнейшая вода. Идеальное место, чтобы просто сидеть, смотреть вдаль и отключиться от всего.</p>\n<p data-start=\"783\" data-end=\"799\">Что попробовать:</p>\n<ul data-start=\"800\" data-end=\"1007\">\n<li data-start=\"800\" data-end=\"881\">\n<p data-start=\"802\" data-end=\"881\"><strong data-start=\"802\" data-end=\"814\">Пастицци</strong> — слоёные пирожки с рикоттой или горохом. Дёшево, вкусно, повсюду.</p>\n</li>\n<li data-start=\"882\" data-end=\"949\">\n<p data-start=\"884\" data-end=\"949\"><strong data-start=\"884\" data-end=\"904\">Каперсы и оливки</strong> — кажется, на Мальте они особенно ароматные.</p>\n</li>\n<li data-start=\"950\" data-end=\"1007\">\n<p data-start=\"952\" data-end=\"1007\"><strong data-start=\"952\" data-end=\"963\">Канноли</strong> — десерт с рикоттой, который сложно забыть.</p>\n</li>\n</ul>\n<p data-start=\"1009\" data-end=\"1177\"><i>Мальта — это не про роскошь, а про атмосферу. Здесь легко забыть про время и просто наслаждаться жизнью. Если хочется перезагрузки — стоит слетать хотя бы на пару дней.</i></p>', 'malta, travel, food, valetta, sea', '2025-05-26 14:08:59', 68),
(21, 'Уличная еда в Японии', 'https://res.cloudinary.com/diqtvi9m5/image/upload/v1748268794/avatars/1748268794255.jpg', 'Food', '<p data-start=\"172\" data-end=\"420\">Если вы думаете, что Япония — это только суши и рамен, то уличная еда быстро развеет этот стереотип. На местных фестивалях, в торговых кварталах и возле храмов можно найти десятки вкуснейших блюд, которые подают с собой — быстро, горячо и недорого.</p>\n<p data-start=\"422\" data-end=\"445\"><b><span style=\"font-size: 20px; font-weight: bold;\">Вот несколько must-try:</span></b></p>\n<p data-start=\"447\" data-end=\"655\"><strong data-start=\"447\" data-end=\"468\">1. Такояки (たこ焼き)</strong><br data-start=\"468\" data-end=\"471\">\nШарики из теста с кусочком осьминога внутри, жареные на специальной сковороде. Сверху — соус, майонез, стружка тунца и водоросли. Горячие и безумно вкусные. Особенно популярны в Осаке.</p>\n<p data-start=\"657\" data-end=\"825\"><strong data-start=\"657\" data-end=\"677\">2. Тайяки (たい焼き)</strong><br data-start=\"677\" data-end=\"680\">\nФормой напоминают рыбку, а внутри — сладкая начинка. Чаще всего это анко (паста из красной фасоли), но бывают с кремом, шоколадом или даже сыром.</p>\n<p data-start=\"827\" data-end=\"973\"><strong data-start=\"827\" data-end=\"847\">3. Якитори (焼き鳥)</strong><br data-start=\"847\" data-end=\"850\">\nШашлычки из курицы (и не только) на деревянных шпажках. Идеально сочетаются с холодным напитком вечером на уличной террасе.</p>\n<p data-start=\"975\" data-end=\"1158\"><strong data-start=\"975\" data-end=\"1000\">4. Окономияки (お好み焼き)</strong><br data-start=\"1000\" data-end=\"1003\">\nЧто-то между омлетом и капустным блинчиком. Каждый готовит по-своему, отсюда и название — «жарь, как тебе нравится». Особенно популярно в Хиросиме и Осаке.</p>\n<p data-start=\"1160\" data-end=\"1331\"><strong data-start=\"1160\" data-end=\"1177\">5. ДANGO (団子)</strong><br data-start=\"1177\" data-end=\"1180\">\nМаленькие круглые шарики из рисовой муки на шпажке. Часто подаются с карамельным соусом. Выглядят просто, а вкус — как у детства на японском фестивале.</p>\n<p data-start=\"1333\" data-end=\"1592\"><br></p><p data-start=\"1333\" data-end=\"1592\"><i>Приятно, что японская уличная еда — это не просто перекус, а часть культуры. Всё готовится на месте, быстро, но с вниманием к деталям. Если окажетесь в Японии — не проходите мимо маленьких ларьков и фудтраков, именно там скрывается настоящее гастро-сокровище.</i></p>', 'japan, street food, food, dango', '2025-05-26 14:13:15', 68);

-- --------------------------------------------------------

--
-- Table structure for table `blog_keywords`
--

CREATE TABLE `blog_keywords` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `keyword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_keywords`
--

INSERT INTO `blog_keywords` (`id`, `blog_id`, `keyword`) VALUES
(52, 19, 'cosmetic'),
(53, 19, 'beauty'),
(54, 19, 'oil'),
(55, 19, 'face'),
(56, 19, 'wash'),
(57, 19, 'skincare'),
(58, 20, 'malta'),
(59, 20, 'travel'),
(60, 20, 'food'),
(61, 20, 'valetta'),
(62, 20, 'sea'),
(63, 21, 'japan'),
(64, 21, 'street food'),
(65, 21, 'food'),
(66, 21, 'dango');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `avatar`) VALUES
(68, 'Diana', 'diana@gmail.com', '$2a$10$twxtpCvWb3BFWZWf.Drq.O6Z6NpAqqxQ6P4R6kCOrloYGT8xqRXJW', '', 'https://res.cloudinary.com/diqtvi9m5/image/upload/v1740498729/default-avatar_tlxou0.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `blog_keywords`
--
ALTER TABLE `blog_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `favorites_ibfk_2` (`blog_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `blog_keywords`
--
ALTER TABLE `blog_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_keywords`
--
ALTER TABLE `blog_keywords`
  ADD CONSTRAINT `blog_keywords_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
