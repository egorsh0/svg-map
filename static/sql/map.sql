-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 16 2016 г., 17:21
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

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `codeGroup` int(10) NOT NULL,
  `numberGroup` int(4) NOT NULL,
  `department` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `course` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`codeGroup`, `numberGroup`, `department`, `course`) VALUES
(1, 2301, 'КТИ', 4),
(2, 2302, 'КТИ', 4),
(3, 1305, 'КТИ', 5),
(4, 3306, 'КТИ', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `period`
--

CREATE TABLE IF NOT EXISTS `period` (
  `numberLesson` int(10) NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `period`
--

INSERT INTO `period` (`numberLesson`, `start`, `end`) VALUES
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

CREATE TABLE IF NOT EXISTS `room` (
  `codeHall` int(10) NOT NULL,
  `numberHall` decimal(5,1) NOT NULL,
  `nameHall` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`codeHall`, `numberHall`, `nameHall`) VALUES
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

CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleCode` int(10) NOT NULL,
  `Weekday` int(10) DEFAULT NULL,
  `Period` int(10) DEFAULT NULL,
  `Teacher` int(10) DEFAULT NULL,
  `Group` int(10) DEFAULT NULL,
  `Subject` int(10) DEFAULT NULL,
  `Room` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`scheduleCode`, `Weekday`, `Period`, `Teacher`, `Group`, `Subject`, `Room`) VALUES
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
(37, 7, 2, 4, 3, 4, 37),
(38, 11, 4, 2, 3, 2, 12),
(39, 8, 6, 5, 4, 6, 2),
(40, 10, 6, 5, 4, 6, 2),
(41, 8, 5, 4, 3, 5, 3),
(42, 8, 4, 3, 2, 1, 5),
(43, 8, 3, 2, 1, 6, 7),
(44, 8, 2, 1, 4, 5, 8),
(45, 8, 1, 5, 3, 4, 10),
(46, 8, 6, 4, 2, 3, 12),
(47, 8, 5, 3, 1, 2, 13),
(48, 8, 4, 3, 4, 1, 15),
(49, 8, 3, 2, 3, 6, 16),
(50, 8, 2, 1, 2, 5, 18),
(51, 8, 1, 5, 1, 4, 19),
(52, 8, 6, 4, 4, 3, 20),
(53, 8, 5, 3, 3, 2, 22),
(54, 8, 4, 2, 2, 1, 23),
(55, 8, 3, 2, 1, 6, 25),
(56, 8, 2, 1, 4, 5, 26),
(57, 8, 1, 5, 3, 4, 28),
(58, 8, 6, 4, 2, 3, 30),
(59, 8, 5, 3, 1, 1, 32),
(60, 8, 2, 1, 3, 3, 34),
(61, 8, 6, 5, 4, 6, 35),
(62, 8, 1, 1, 1, 1, 37),
(63, 10, 6, 5, 4, 6, 2),
(64, 8, 5, 4, 3, 5, 3),
(65, 8, 4, 3, 2, 1, 5),
(66, 8, 3, 2, 1, 6, 7),
(67, 8, 2, 1, 4, 5, 8),
(68, 8, 1, 5, 3, 4, 10),
(69, 8, 6, 4, 2, 3, 12),
(70, 8, 5, 3, 1, 2, 13),
(71, 8, 4, 3, 4, 1, 15),
(72, 8, 3, 2, 3, 6, 16),
(73, 8, 2, 1, 2, 5, 18),
(74, 8, 1, 5, 1, 4, 19),
(75, 8, 6, 4, 4, 3, 20),
(76, 8, 5, 3, 3, 2, 22),
(77, 8, 4, 2, 2, 1, 23),
(78, 8, 3, 2, 1, 6, 25),
(79, 8, 2, 1, 4, 5, 26),
(80, 8, 1, 5, 3, 4, 28),
(81, 8, 6, 4, 2, 3, 30),
(82, 8, 5, 3, 1, 1, 32),
(83, 8, 2, 1, 3, 3, 34),
(84, 8, 6, 5, 4, 6, 35),
(85, 8, 1, 1, 1, 1, 37),
(86, 8, 1, 1, 1, 1, 37),
(87, 8, 4, 2, 2, 1, 23),
(88, 8, 3, 2, 1, 6, 25),
(89, 8, 2, 1, 4, 5, 26),
(90, 8, 1, 5, 3, 4, 28),
(91, 8, 6, 4, 2, 3, 30),
(92, 8, 5, 3, 1, 1, 32),
(93, 8, 2, 1, 3, 3, 34),
(94, 8, 6, 5, 4, 6, 35),
(95, 8, 5, 4, 3, 5, 3),
(96, 8, 4, 3, 2, 1, 5),
(97, 8, 3, 2, 1, 6, 7),
(98, 8, 2, 1, 4, 5, 8),
(99, 8, 1, 5, 3, 4, 10),
(100, 8, 6, 4, 2, 3, 12),
(101, 8, 5, 3, 1, 2, 13),
(102, 8, 4, 3, 4, 1, 15),
(103, 8, 3, 2, 3, 6, 16),
(104, 8, 2, 1, 2, 5, 18),
(105, 8, 1, 5, 1, 4, 19),
(106, 8, 6, 4, 4, 3, 20),
(107, 8, 5, 3, 3, 2, 22),
(108, 8, 4, 2, 2, 1, 23),
(109, 8, 3, 2, 1, 6, 25),
(110, 8, 2, 1, 4, 5, 26),
(111, 8, 1, 5, 3, 4, 28),
(112, 8, 6, 4, 2, 3, 30),
(113, 8, 5, 3, 1, 1, 32),
(114, 8, 2, 1, 3, 3, 34),
(115, 8, 6, 5, 4, 6, 35),
(116, 8, 1, 1, 1, 1, 37),
(117, 10, 5, 4, 3, 5, 3),
(118, 10, 4, 3, 2, 1, 5),
(119, 10, 3, 2, 1, 6, 7),
(120, 10, 2, 1, 4, 5, 8),
(121, 10, 1, 5, 3, 4, 10),
(122, 10, 6, 4, 2, 3, 12),
(123, 10, 5, 3, 1, 2, 13),
(124, 10, 4, 3, 4, 1, 15),
(125, 10, 3, 2, 3, 6, 16),
(126, 10, 2, 1, 2, 5, 18),
(127, 10, 1, 5, 1, 4, 19),
(128, 10, 6, 4, 4, 3, 20),
(129, 10, 5, 3, 3, 2, 22),
(130, 10, 4, 2, 2, 1, 23),
(131, 10, 3, 2, 1, 6, 25),
(132, 10, 2, 1, 4, 5, 26),
(133, 10, 1, 5, 3, 4, 28),
(134, 10, 6, 4, 2, 3, 30),
(135, 10, 5, 3, 1, 1, 32),
(136, 10, 2, 1, 3, 3, 34),
(137, 10, 6, 5, 4, 6, 35),
(138, 10, 1, 1, 1, 1, 37),
(139, 9, 6, 5, 4, 6, 2),
(140, 9, 5, 4, 3, 5, 3),
(141, 9, 4, 3, 2, 4, 5),
(142, 9, 3, 2, 1, 3, 6),
(143, 9, 2, 1, 4, 2, 7),
(144, 9, 1, 5, 3, 1, 9),
(145, 9, 6, 4, 2, 6, 10),
(146, 9, 5, 3, 1, 5, 12),
(147, 9, 4, 2, 4, 4, 14),
(148, 9, 3, 1, 3, 5, 15),
(149, 9, 2, 5, 2, 4, 17),
(150, 9, 1, 5, 4, 6, 19),
(151, 9, 6, 4, 3, 4, 20),
(152, 9, 4, 2, 1, 3, 22),
(153, 9, 3, 4, 4, 5, 24),
(154, 9, 2, 3, 3, 4, 25),
(155, 9, 1, 2, 2, 3, 27),
(156, 9, 6, 1, 1, 2, 29),
(157, 9, 6, 5, 4, 6, 30),
(158, 9, 5, 4, 3, 2, 32),
(159, 9, 2, 1, 2, 1, 33),
(160, 9, 1, 1, 1, 1, 34),
(161, 9, 2, 4, 2, 4, 36),
(162, 9, 3, 3, 3, 2, 37),
(163, 11, 5, 4, 3, 5, 3),
(164, 11, 4, 3, 2, 4, 5),
(165, 11, 3, 2, 1, 3, 6),
(166, 11, 2, 1, 4, 2, 7),
(167, 11, 1, 5, 3, 1, 9),
(168, 11, 6, 4, 2, 6, 10),
(169, 11, 5, 3, 1, 5, 12),
(170, 11, 4, 2, 4, 4, 14),
(171, 11, 3, 1, 3, 5, 15),
(172, 11, 2, 5, 2, 4, 17),
(173, 11, 1, 5, 4, 6, 19),
(174, 11, 6, 4, 3, 4, 20),
(175, 11, 4, 2, 1, 3, 22),
(176, 11, 3, 4, 4, 5, 24),
(177, 11, 2, 3, 3, 4, 25),
(178, 11, 1, 2, 2, 3, 27),
(179, 11, 6, 1, 1, 2, 29),
(180, 11, 6, 5, 4, 6, 30),
(181, 11, 5, 4, 3, 2, 32),
(182, 11, 2, 1, 2, 1, 33),
(183, 11, 1, 1, 1, 1, 34),
(184, 11, 2, 4, 2, 4, 36),
(185, 11, 3, 3, 3, 2, 37),
(186, 7, 5, 4, 3, 5, 3),
(187, 7, 4, 3, 2, 4, 5),
(188, 7, 3, 2, 1, 3, 6),
(189, 7, 2, 1, 4, 2, 7),
(190, 7, 1, 5, 3, 1, 9),
(191, 7, 6, 4, 2, 6, 10),
(192, 7, 5, 3, 1, 5, 12),
(193, 7, 4, 2, 4, 4, 14),
(194, 7, 3, 1, 3, 5, 15),
(195, 7, 2, 5, 2, 4, 17),
(196, 7, 1, 5, 4, 6, 19),
(197, 7, 6, 4, 3, 4, 20),
(198, 7, 4, 2, 1, 3, 22),
(199, 7, 3, 4, 4, 5, 24),
(200, 7, 2, 3, 3, 4, 25),
(201, 7, 1, 2, 2, 3, 27),
(202, 7, 6, 1, 1, 2, 29),
(203, 7, 6, 5, 4, 6, 30),
(204, 7, 5, 4, 3, 2, 32),
(205, 7, 2, 1, 2, 1, 33),
(206, 7, 1, 1, 1, 1, 34),
(207, 7, 2, 4, 2, 4, 36),
(208, 7, 3, 3, 3, 2, 37);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subjectCode` int(10) NOT NULL,
  `nameSubject` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`subjectCode`, `nameSubject`) VALUES
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

CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherCode` int(10) NOT NULL,
  `surname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `patronymic` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `post` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`teacherCode`, `surname`, `name`, `patronymic`, `post`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', ''),
(2, 'Петров', 'Петр', 'Петрович', ''),
(3, 'Сергеев', 'Сергей', 'Сергеевич', ''),
(4, 'Алексеев', 'Алексей', 'Алексеевич', ''),
(5, 'Егоров', 'Егор', 'Егорович', '');

-- --------------------------------------------------------

--
-- Структура таблицы `territory`
--

CREATE TABLE IF NOT EXISTS `territory` (
  `id` int(11) NOT NULL,
  `nameHouse` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `numFroors` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `territory`
--

INSERT INTO `territory` (`id`, `nameHouse`, `description`, `numFroors`) VALUES
(1, '1', 'деканат ФЭЛ?\r\nкабинет директора?\r\nмузей А.С. Попова?\r\nвоенная кафедра', 4),
(2, '2', 'деканат ФРТ?\r\nдеканат ФКТИ?\r\nвоенно-учетный стол', 4),
(3, '3', 'юридический отдел?\r\nбухгалтерия?\r\nректорат?\r\nдеканат ОФ', 4),
(4, '4', 'студенческая канцелярия', 4),
(5, '5', 'деканат ФЭМ?\r\nмагазин?\r\nдеканат ГФ?\r\nдеканат ФЭЛ?\r\nдеканат ФИБС?', 5),
(6, '7', 'жилищно-эксплуатационный отдел', 2),
(7, 'P', 'Кафедра русского языка', 2),
(8, 'C', 'кафедра физического воспитания и спорта ', 4),
(9, 'D', 'музей-квартира А.С. Попова?\r\nздравпункт?\r\nкомпьютерный класс кафедры ИИСТ', 4),
(10, 'K', 'Нет данных', NULL),
(11, 'M', 'Нет данных', NULL),
(12, 'E', 'Нет данных', NULL),
(13, '8', 'Нет данных', NULL),
(14, 'O', 'Нет данных', NULL),
(15, 'T', 'Технолит', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `weekday`
--

CREATE TABLE IF NOT EXISTS `weekday` (
  `dayCode` int(10) NOT NULL,
  `dayName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `parity` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `weekday`
--

INSERT INTO `weekday` (`dayCode`, `dayName`, `parity`) VALUES
(1, 'Monday', 1),
(2, 'Monday', 0),
(3, 'Tuesday', 1),
(4, 'Tuesday', 0),
(5, 'Wednesday', 1),
(6, 'Wednesday', 0),
(7, 'Thursday', 1),
(8, 'Thursday', 0),
(9, 'Friday', 1),
(10, 'Friday', 0),
(11, 'Saturday', 1),
(12, 'Saturday', 0),
(13, 'Sunday', 1),
(14, 'Sunday', 0);

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
  ADD KEY `FKSchedule871686` (`Room`);

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
  MODIFY `scheduleCode` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209;
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
  ADD CONSTRAINT `FKSchedule871686` FOREIGN KEY (`Room`) REFERENCES `room` (`codeHall`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
