-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 22 2016 г., 22:56
-- Версия сервера: 5.7.12
-- Версия PHP: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `map`
--
CREATE DATABASE IF NOT EXISTS `map` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `map`;

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `codeGroup` int(10) NOT NULL,
  `numberGroup` int(4) NOT NULL,
  `department` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `course` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `group`
--

TRUNCATE TABLE `group`;
--
-- Дамп данных таблицы `group`
--

INSERT DELAYED IGNORE INTO `group` (`codeGroup`, `numberGroup`, `department`, `course`) VALUES
(1, 2301, 'КТИ', 4),
(2, 2302, 'КТИ', 4),
(3, 1305, 'КТИ', 5),
(4, 3306, 'КТИ', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `period`
--

DROP TABLE IF EXISTS `period`;
CREATE TABLE IF NOT EXISTS `period` (
  `numberLesson` int(10) NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `period`
--

TRUNCATE TABLE `period`;
--
-- Дамп данных таблицы `period`
--

INSERT DELAYED IGNORE INTO `period` (`numberLesson`, `start`, `end`) VALUES
(1, '08:00:00', '09:30:00'),
(2, '09:50:00', '11:20:00'),
(3, '11:40:00', '13:15:00'),
(4, '13:45:00', '15:15:00'),
(5, '15:35:00', '16:55:00'),
(6, '17:15:00', '18:45:00');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `codeHall` int(10) NOT NULL,
  `numberHall` decimal(5,1) NOT NULL,
  `nameHall` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `room`
--

TRUNCATE TABLE `room`;
--
-- Дамп данных таблицы `room`
--

INSERT DELAYED IGNORE INTO `room` (`codeHall`, `numberHall`, `nameHall`) VALUES
(1, '2201.0', 'ФРТ'),
(2, '2201.1', NULL),
(3, '2202.0', NULL),
(4, '2203.0', NULL),
(5, '2204.0', NULL),
(6, '2204.1', NULL),
(7, '2205.0', NULL),
(8, '2206.0', NULL),
(9, '2207.0', NULL),
(10, '2208.0', NULL),
(11, '2209.0', NULL),
(12, '2210.0', NULL),
(13, '2211.0', NULL),
(14, '2211.1', NULL),
(15, '2211.2', NULL),
(16, '2212.0', NULL),
(17, '2213.0', NULL),
(18, '2214.0', NULL),
(19, '2215.0', NULL),
(20, '2216.0', NULL),
(21, '2216.1', NULL),
(22, '2217.0', NULL),
(23, '2218.0', NULL),
(24, '2219.0', NULL),
(25, '2220.0', NULL),
(26, '2221.0', NULL),
(27, '2222.0', NULL),
(28, '2223.0', NULL),
(29, '2223.1', NULL),
(30, '2223.2', NULL),
(31, '2224.0', 'ФКТИ'),
(32, '2225.0', NULL),
(33, '2226.0', NULL),
(34, '2231.0', NULL),
(35, '2232.0', NULL),
(36, '2233.0', NULL),
(37, '2234.0', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleCode` int(10) NOT NULL,
  `Weekday` int(10) DEFAULT NULL,
  `Period` int(10) DEFAULT NULL,
  `Teacher` int(10) DEFAULT NULL,
  `Group` int(10) DEFAULT NULL,
  `Subject` int(10) DEFAULT NULL,
  `RoomcodeHall` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `schedule`
--

TRUNCATE TABLE `schedule`;
--
-- Дамп данных таблицы `schedule`
--

INSERT DELAYED IGNORE INTO `schedule` (`scheduleCode`, `Weekday`, `Period`, `Teacher`, `Group`, `Subject`, `RoomcodeHall`) VALUES
(1, 1, 1, 1, 1, 1, 3),
(2, 1, 3, 2, 2, 2, 3),
(3, 2, 2, 1, 4, 5, 3),
(4, 3, 5, 5, 3, 4, 4),
(5, 3, 5, 5, 3, 4, 4),
(6, 4, 6, 5, 4, 6, 5),
(7, 5, 3, 3, 3, 1, 6),
(8, 6, 3, 1, 2, 3, 7),
(9, 7, 3, 1, 4, 6, 8),
(10, 8, 6, 2, 1, 1, 9),
(11, 9, 2, 3, 1, 2, 10),
(12, 10, 2, 1, 4, 6, 11),
(13, 11, 1, 5, 2, 5, 12),
(14, 12, 2, 4, 3, 2, 13),
(15, 13, 3, 3, 2, 1, 14),
(16, 14, 6, 5, 4, 6, 15),
(17, 1, 6, 5, 4, 6, 16),
(18, 2, 5, 4, 3, 3, 17),
(19, 3, 4, 3, 2, 1, 18),
(20, 4, 3, 2, 1, 6, 19),
(21, 5, 6, 5, 4, 6, 20),
(22, 6, 5, 4, 3, 2, 21),
(23, 7, 4, 2, 1, 1, 22),
(24, 8, 2, 1, 4, 5, 23),
(25, 9, 1, 3, 2, 1, 24),
(26, 10, 4, 4, 4, 6, 25),
(27, 11, 6, 2, 3, 1, 26),
(28, 12, 3, 3, 1, 2, 27),
(29, 13, 2, 1, 4, 6, 28),
(30, 14, 6, 1, 1, 1, 29),
(31, 1, 2, 3, 4, 5, 30),
(32, 2, 1, 3, 4, 5, 32),
(33, 3, 2, 1, 1, 3, 33),
(34, 4, 5, 5, 4, 6, 34),
(35, 5, 2, 1, 2, 1, 35),
(36, 6, 6, 3, 4, 3, 36),
(37, 7, 2, 4, 3, 4, 37);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subjectCode` int(10) NOT NULL,
  `nameSubject` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `subject`
--

TRUNCATE TABLE `subject`;
--
-- Дамп данных таблицы `subject`
--

INSERT DELAYED IGNORE INTO `subject` (`subjectCode`, `nameSubject`) VALUES
(1, 'Алгебра и Геометрия'),
(2, 'Физика'),
(3, 'Дискретная математика'),
(4, 'Программирование'),
(5, 'Математическая логика'),
(6, 'Электричество и магнетизм');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherCode` int(10) NOT NULL,
  `surname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `patronymic` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `teacher`
--

TRUNCATE TABLE `teacher`;
--
-- Дамп данных таблицы `teacher`
--

INSERT DELAYED IGNORE INTO `teacher` (`teacherCode`, `surname`, `name`, `patronymic`) VALUES
(1, 'Иванов', 'Иван', 'Иванович'),
(2, 'Петров', 'Петр', 'Петрович'),
(3, 'Сергеев', 'Сергей', 'Сергеевич'),
(4, 'Алексеев', 'Алексей', 'Алексеевич'),
(5, 'Егоров', 'Егор', 'Егорович');

-- --------------------------------------------------------

--
-- Структура таблицы `territory`
--

DROP TABLE IF EXISTS `territory`;
CREATE TABLE IF NOT EXISTS `territory` (
  `id` int(11) NOT NULL,
  `nameHouse` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `numFroors` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `territory`
--

TRUNCATE TABLE `territory`;
--
-- Дамп данных таблицы `territory`
--

INSERT DELAYED IGNORE INTO `territory` (`id`, `nameHouse`, `description`, `numFroors`) VALUES
(1, '1', 'Основные места: деканат ФЭЛ;\r\nкабинет директора;\r\nмузей А.С. Попова;\r\nвоенная кафедра', 4),
(2, '2', 'Основные места:\r\nдеканат ФРТ;\r\nдеканат ФКТИ;\r\nвоенно-учетный стол', 4),
(3, '3', 'Основные места:\r\nюридический отдел;\r\nбухгалтерия;\r\nректорат;\r\nдеканат ОФ', 4),
(4, '4', 'Основные места:\r\nстуденческая канцелярия', 4),
(5, '5', 'Основные места:\r\nдеканат ФЭМ;\r\nмагазин;\r\nдеканат ГФ;\r\nдеканат ФЭЛ;\r\nдеканат ФИБС;', 5),
(6, '7', 'Основные места:\r\nжилищно-эксплуатационный отдел', 2),
(7, 'P', 'Кафедра русского языка', 2),
(8, 'C', 'кафедра физического воспитания и спорта ', 4),
(9, 'D', 'музей-квартира А.С. Попова\r\nздравпункт\r\nкомпьютерный класс кафедры ИИСТ', 4),
(10, 'K', 'Не известно', NULL),
(11, 'M', 'Нет данных', NULL),
(12, 'E', 'Unknown', NULL),
(13, '8', 'Не имею понятия', NULL),
(14, 'O', 'Кто подскажет?', NULL),
(15, 'T', 'Технолит', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `weekday`
--

DROP TABLE IF EXISTS `weekday`;
CREATE TABLE IF NOT EXISTS `weekday` (
  `dayCode` int(10) NOT NULL,
  `dayName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `parity` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Очистить таблицу перед добавлением данных `weekday`
--

TRUNCATE TABLE `weekday`;
--
-- Дамп данных таблицы `weekday`
--

INSERT DELAYED IGNORE INTO `weekday` (`dayCode`, `dayName`, `parity`) VALUES
(1, 'Понедельник', 'Нечетная'),
(2, 'Понедельник', 'Четная'),
(3, 'Вторник', 'Нечетная'),
(4, 'Вторник', 'Четная'),
(5, 'Среда', 'Нечетная'),
(6, 'Среда', 'Четная'),
(7, 'Четверг', 'Нечетная'),
(8, 'Четверг', 'Четная'),
(9, 'Пятница', 'Нечетная'),
(10, 'Пятница', 'Четная'),
(11, 'Суббота', 'Нечетная'),
(12, 'Суббота', 'Четная'),
(13, 'Воскресенье', 'Нечетная'),
(14, 'Воскресенье', 'Четная');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`codeGroup`);

--
-- Индексы таблицы `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`numberLesson`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`codeHall`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleCode`),
  ADD KEY `FKSchedule247577` (`Weekday`),
  ADD KEY `FKSchedule265545` (`Period`),
  ADD KEY `FKSchedule63470` (`Teacher`),
  ADD KEY `FKSchedule459683` (`Subject`),
  ADD KEY `FKSchedule363365` (`Group`),
  ADD KEY `FKSchedule871686` (`RoomcodeHall`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectCode`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherCode`);

--
-- Индексы таблицы `territory`
--
ALTER TABLE `territory`
  ADD UNIQUE KEY `id_3` (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Индексы таблицы `weekday`
--
ALTER TABLE `weekday`
  ADD PRIMARY KEY (`dayCode`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `codeGroup` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `period`
--
ALTER TABLE `period`
  MODIFY `numberLesson` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `codeHall` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleCode` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectCode` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherCode` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `territory`
--
ALTER TABLE `territory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `weekday`
--
ALTER TABLE `weekday`
  MODIFY `dayCode` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `FKSchedule247577` FOREIGN KEY (`Weekday`) REFERENCES `weekday` (`dayCode`),
  ADD CONSTRAINT `FKSchedule265545` FOREIGN KEY (`Period`) REFERENCES `period` (`numberLesson`),
  ADD CONSTRAINT `FKSchedule363365` FOREIGN KEY (`Group`) REFERENCES `group` (`codeGroup`),
  ADD CONSTRAINT `FKSchedule459683` FOREIGN KEY (`Subject`) REFERENCES `subject` (`subjectCode`),
  ADD CONSTRAINT `FKSchedule63470` FOREIGN KEY (`Teacher`) REFERENCES `teacher` (`teacherCode`),
  ADD CONSTRAINT `FKSchedule871686` FOREIGN KEY (`RoomcodeHall`) REFERENCES `room` (`codeHall`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
