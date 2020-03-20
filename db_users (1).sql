-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 20 2020 г., 17:34
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_users`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `pubdate` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `categories_name`, `pubdate`, `update_date`) VALUES
(4, 'wge', '2020-03-20 20:14:18', '2020-03-20 16:14:18');

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `models_name` varchar(255) NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `pubdate` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `models`
--

INSERT INTO `models` (`id`, `models_name`, `categories_id`, `pubdate`, `update_date`) VALUES
(2, 'wegweg', 4, '2020-03-20 20:15:11', '2020-03-20 16:15:11'),
(3, 'sdsc', 4, '2020-03-20 20:23:13', '2020-03-20 16:23:13'),
(4, 's', 4, '2020-03-20 20:23:16', '2020-03-20 16:23:16');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `products_name` varchar(255) NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `models_id` int(11) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `isNew` tinyint(3) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pubdate` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(5) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cookie_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `cookie_key`) VALUES
(1, 'admin', 'admin', 'r41n1y54e98c86q50m46h87w37l28x7o34x97');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`),
  ADD KEY `models_id` (`models_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_10` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_100` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_101` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_102` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_103` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_104` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_105` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_106` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_107` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_108` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_109` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_11` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_110` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_111` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_112` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_113` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_114` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_115` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_116` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_117` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_118` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_119` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_12` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_120` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_121` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_122` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_123` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_124` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_125` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_126` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_127` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_128` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_129` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_13` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_130` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_131` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_132` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_133` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_134` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_135` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_136` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_137` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_138` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_139` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_14` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_140` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_141` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_15` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_16` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_17` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_18` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_19` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_2` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_20` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_21` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_22` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_23` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_24` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_25` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_26` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_27` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_28` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_29` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_3` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_30` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_31` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_32` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_33` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_34` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_35` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_36` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_37` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_38` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_39` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_4` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_40` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_41` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_42` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_43` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_44` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_45` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_46` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_47` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_48` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_49` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_5` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_50` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_51` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_52` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_53` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_54` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_55` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_56` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_57` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_58` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_59` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_6` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_60` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_61` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_62` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_63` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_64` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_65` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_66` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_67` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_68` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_69` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_70` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_71` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_72` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_73` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_74` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_75` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_76` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_77` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_78` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_79` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_8` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_80` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_81` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_82` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_83` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_84` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_85` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_86` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_87` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_88` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_89` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_9` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_90` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_91` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_92` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_93` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_94` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_95` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_96` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_97` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_98` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `models_ibfk_99` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_10` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_100` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_101` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_102` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_103` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_104` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_105` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_106` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_107` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_108` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_109` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_11` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_110` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_111` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_112` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_113` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_114` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_115` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_116` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_117` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_118` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_119` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_12` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_120` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_121` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_122` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_123` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_124` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_125` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_126` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_127` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_128` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_129` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_13` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_130` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_131` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_132` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_133` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_134` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_135` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_136` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_137` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_138` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_139` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_14` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_140` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_141` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_142` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_143` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_144` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_145` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_146` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_147` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_148` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_149` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_15` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_150` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_151` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_152` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_153` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_154` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_155` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_156` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_157` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_158` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_159` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_16` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_160` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_161` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_162` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_163` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_164` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_165` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_166` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_167` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_168` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_169` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_17` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_170` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_171` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_172` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_173` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_174` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_175` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_176` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_177` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_178` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_179` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_18` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_180` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_181` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_182` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_183` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_184` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_185` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_186` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_187` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_188` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_189` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_19` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_190` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_191` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_192` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_193` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_194` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_195` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_196` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_197` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_198` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_199` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_20` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_200` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_201` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_202` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_203` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_204` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_205` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_206` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_207` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_208` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_209` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_21` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_210` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_211` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_212` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_213` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_214` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_215` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_216` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_217` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_218` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_219` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_22` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_220` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_221` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_222` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_223` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_224` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_225` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_226` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_227` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_228` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_229` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_23` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_230` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_231` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_232` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_233` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_234` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_235` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_236` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_237` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_238` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_239` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_24` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_240` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_241` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_242` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_243` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_244` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_245` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_246` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_247` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_248` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_249` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_25` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_250` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_251` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_252` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_253` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_254` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_255` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_256` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_257` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_258` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_259` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_26` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_260` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_261` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_262` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_263` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_264` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_265` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_266` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_267` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_268` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_269` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_27` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_270` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_271` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_272` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_273` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_274` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_275` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_276` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_277` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_278` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_279` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_28` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_280` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_281` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_282` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_29` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_30` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_31` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_32` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_33` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_34` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_35` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_36` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_37` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_38` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_39` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_40` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_41` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_42` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_43` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_44` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_45` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_46` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_47` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_48` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_49` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_50` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_51` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_52` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_53` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_54` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_55` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_56` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_57` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_58` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_59` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_6` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_60` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_61` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_62` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_63` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_64` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_65` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_66` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_67` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_68` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_69` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_70` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_71` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_72` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_73` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_74` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_75` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_76` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_77` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_78` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_79` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_8` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_80` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_81` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_82` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_83` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_84` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_85` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_86` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_87` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_88` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_89` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_9` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_90` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_91` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_92` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_93` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_94` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_95` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_96` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_97` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_98` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `products_ibfk_99` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
