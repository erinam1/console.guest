-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.5.42-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных controlsocket
CREATE DATABASE IF NOT EXISTS `controlsocket` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `controlsocket`;


-- Дамп структуры для таблица controlsocket.company
CREATE TABLE IF NOT EXISTS `company` (
  `id_comp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Организация - пользователь (потребитель)',
  `short_name` varchar(45) NOT NULL COMMENT 'Краткое название (без ООО, для вывода везде)',
  `full_name` varchar(145) NOT NULL COMMENT 'Полное наименование, официальное, для документов',
  `address` varchar(145) DEFAULT NULL COMMENT 'Адрес для документов',
  `note` varchar(255) DEFAULT NULL,
  UNIQUE KEY `short_name_UNIQUE` (`short_name`),
  KEY `id_comp` (`id_comp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.company: ~5 rows (приблизительно)
DELETE FROM `company`;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id_comp`, `short_name`, `full_name`, `address`, `note`) VALUES
	(5, 'egdv', 'dc', 'c ', 'cv '),
	(4, 'wdg2222', 'wdfbv', 'wdfvc', 'w'),
	(2, 'Новый тест', 'ЗАО "Новый тест орг"', 'СПб, пр. Обуховской обороны, 167', 'NULL'),
	(1, 'Тест', 'ООО "Тестовая организация"', 'СПб, пр. Энгельса, 129, к.4', 'Примечаний, как таковых, нет. Это не реальная организация. При сдаче проекта должна быть удалена безжалостно!'),
	(3, 'ЭнергоМет-СУС', 'ООО "ЭнергоМет-СУС', 'СПб, метро Проллетарская', 'Новая запись для тестов');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.dispenser
CREATE TABLE IF NOT EXISTS `dispenser` (
  `id_disp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'колонка (ящик)',
  `name` varchar(10) NOT NULL COMMENT 'название',
  `id_type` int(11) NOT NULL COMMENT 'тип',
  `count_eq` int(11) NOT NULL COMMENT 'количество разъемов',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_disp`),
  UNIQUE KEY `id_disp_UNIQUE` (`id_disp`),
  KEY `fk_type_idx` (`id_type`),
  CONSTRAINT `fk_сonnection_type_connect1` FOREIGN KEY (`id_type`) REFERENCES `type_dispenser` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.dispenser: ~4 rows (приблизительно)
DELETE FROM `dispenser`;
/*!40000 ALTER TABLE `dispenser` DISABLE KEYS */;
INSERT INTO `dispenser` (`id_disp`, `name`, `id_type`, `count_eq`, `note`) VALUES
	(1, '0001', 1, 2, 'NULL'),
	(2, 'К-01-1', 2, 4, 'NULL'),
	(3, 'Р-01-2', 3, 3, 'NULL'),
	(4, 'EO-01', 1, 2, 'Тестовый шкаф');
/*!40000 ALTER TABLE `dispenser` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.equipment
CREATE TABLE IF NOT EXISTS `equipment` (
  `id_eq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Разъемы (розетки)',
  `number` int(11) DEFAULT NULL COMMENT 'номер на колонке',
  `id_type` int(11) NOT NULL COMMENT 'тип разъема',
  `id_disp` int(11) NOT NULL COMMENT 'колонка',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_eq`),
  UNIQUE KEY `id_eq_UNIQUE` (`id_eq`),
  KEY `fk_type_idx` (`id_type`),
  KEY `fk_dispenser_idx` (`id_disp`),
  CONSTRAINT `fk_equipment_dispenser1` FOREIGN KEY (`id_disp`) REFERENCES `dispenser` (`id_disp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_type_equip1` FOREIGN KEY (`id_type`) REFERENCES `type_equip` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.equipment: ~11 rows (приблизительно)
DELETE FROM `equipment`;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` (`id_eq`, `number`, `id_type`, `id_disp`, `note`) VALUES
	(1, 1, 1, 1, 'NULL'),
	(2, 2, 3, 1, 'NULL'),
	(3, 1, 2, 2, 'NULL'),
	(4, 2, 1, 2, 'NULL'),
	(5, 3, 3, 2, 'NULL'),
	(6, 4, 1, 2, 'NULL'),
	(7, 1, 1, 3, 'NULL'),
	(8, 3, 2, 3, 'NULL'),
	(9, 2, 3, 3, 'NULL'),
	(10, 1, 1, 4, 'Первая тестоовая розетка'),
	(11, 2, 2, 4, 'Второй тестовый разъем');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.events
CREATE TABLE IF NOT EXISTS `events` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT COMMENT 'События включения / выключения оборудования',
  `name_disp` varchar(10) NOT NULL COMMENT 'название колонки',
  `event` int(11) NOT NULL COMMENT 'событие: включение, выключение, аварийное',
  `equip` int(11) NOT NULL COMMENT 'номер разъема',
  `time` datetime NOT NULL COMMENT 'время события',
  `staff_card` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  UNIQUE KEY `id_stop_UNIQUE` (`id_event`),
  KEY `fk_dispenser_idx` (`name_disp`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.events: ~50 rows (приблизительно)
DELETE FROM `events`;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id_event`, `name_disp`, `event`, `equip`, `time`, `staff_card`) VALUES
	(1, '111', 11, 1, '2015-05-22 13:11:51', '222'),
	(2, '222', 10, 1, '2015-05-22 13:12:06', '4444'),
	(3, 'EO-01', 66, 0, '1899-12-30 00:00:00', ''),
	(4, 'EO-01', 77, 0, '2015-05-22 16:51:17', ''),
	(5, 'EO-01', 11, 1, '2015-05-22 16:51:22', '12365478'),
	(6, 'EO-01', 10, 1, '2015-05-22 16:51:24', ''),
	(7, 'EO-01', 66, 0, '2015-05-22 16:51:28', ''),
	(8, 'EO-01', 77, 0, '2015-05-22 16:53:07', ''),
	(9, 'EO-01', 11, 1, '2015-05-22 16:53:12', '12365478'),
	(10, 'EO-01', 11, 2, '2015-05-22 16:53:15', '12365478'),
	(11, 'EO-01', 10, 1, '2015-05-22 16:53:17', ''),
	(12, 'EO-01', 10, 2, '2015-05-22 16:53:17', ''),
	(13, 'EO-01', 11, 1, '2015-05-22 16:53:19', ''),
	(14, 'EO-01', 11, 2, '2015-05-22 16:53:19', ''),
	(15, 'EO-01', 10, 1, '2015-05-22 16:53:21', ''),
	(16, 'EO-01', 10, 2, '2015-05-22 16:53:21', ''),
	(17, 'EO-01', 66, 0, '2015-05-22 16:53:23', ''),
	(18, 'EO-01', 77, 0, '2015-05-22 16:54:21', ''),
	(19, 'EO-01', 11, 1, '2015-05-22 16:54:42', '12365478'),
	(20, 'EO-01', 10, 1, '2015-05-22 16:54:46', ''),
	(21, 'EO-01', 11, 1, '2015-05-22 16:54:50', '12365478'),
	(22, 'EO-01', 11, 2, '2015-05-22 16:54:53', '12365478'),
	(23, 'EO-01', 10, 1, '2015-05-22 16:54:56', ''),
	(24, 'EO-01', 10, 2, '2015-05-22 16:54:58', ''),
	(25, 'EO-01', 11, 1, '2015-05-22 16:55:08', '12365478'),
	(26, 'EO-01', 11, 2, '2015-05-22 16:55:12', '12365478'),
	(27, 'EO-01', 10, 1, '2015-05-22 16:55:14', ''),
	(28, 'EO-01', 10, 2, '2015-05-22 16:55:15', ''),
	(29, 'EO-01', 11, 1, '2015-05-22 16:55:18', '12365478'),
	(30, 'EO-01', 11, 2, '2015-05-22 16:55:20', '12365478'),
	(31, 'EO-01', 10, 1, '2015-05-22 16:55:22', ''),
	(32, 'EO-01', 10, 2, '2015-05-22 16:55:22', ''),
	(33, 'EO-01', 13, 0, '2015-05-22 16:55:22', ''),
	(34, 'EO-01', 31, 0, '2015-05-22 16:55:22', ''),
	(35, 'EO-01', 13, 0, '2015-05-22 16:55:22', ''),
	(36, 'EO-01', 31, 0, '2015-05-22 16:55:24', ''),
	(37, 'EO-01', 11, 1, '2015-05-22 16:55:24', ''),
	(38, 'EO-01', 11, 2, '2015-05-22 16:55:24', ''),
	(39, 'EO-01', 10, 1, '2015-05-22 16:55:39', ''),
	(40, 'EO-01', 10, 2, '2015-05-22 16:55:42', ''),
	(41, 'EO-01', 11, 1, '2015-05-22 16:56:23', '12365478'),
	(42, 'EO-01', 10, 1, '2015-05-22 16:56:30', ''),
	(43, 'EO-01', 11, 1, '2015-05-22 16:57:29', '12365478'),
	(44, 'EO-01', 11, 2, '2015-05-22 16:57:46', '12365478'),
	(45, 'EO-01', 10, 1, '2015-05-22 16:58:45', ''),
	(46, 'EO-01', 13, 0, '2015-05-22 16:58:50', ''),
	(47, 'EO-01', 10, 2, '2015-05-22 16:58:51', ''),
	(48, 'EO-01', 31, 0, '2015-05-22 16:59:11', ''),
	(49, 'EO-01', 11, 2, '2015-05-22 16:59:12', ''),
	(50, 'EO-01', 10, 2, '2015-05-22 17:00:07', '');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Персонал, имеющий доступ к системе',
  `first_name` varchar(45) NOT NULL COMMENT 'Имя',
  `last_name` varchar(45) NOT NULL COMMENT 'Отчество',
  `second_name` varchar(45) DEFAULT NULL COMMENT 'Фамилия',
  `id_comp` int(11) NOT NULL COMMENT 'Предприятие - потребитель',
  `begin_date` date DEFAULT NULL COMMENT 'Дата начала полномочий',
  `end_date` date DEFAULT NULL COMMENT 'Окончание полномочий',
  `status` varchar(15) DEFAULT NULL COMMENT 'Текущий статус: \nактив,\nуволен,\nнеактив\n',
  PRIMARY KEY (`id_staff`),
  UNIQUE KEY `id_staff_UNIQUE` (`id_staff`),
  KEY `fk_company_idx` (`id_comp`),
  CONSTRAINT `fk_Staff_Company` FOREIGN KEY (`id_comp`) REFERENCES `company` (`id_comp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.staff: ~8 rows (приблизительно)
DELETE FROM `staff`;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`id_staff`, `first_name`, `last_name`, `second_name`, `id_comp`, `begin_date`, `end_date`, `status`) VALUES
	(1, 'Иванов', 'Иван', 'Иванович', 1, '2010-10-10', '2075-12-31', 'актив'),
	(2, 'Петров', 'Петр', 'Петрович', 2, '2015-01-11', '2075-12-31', 'актив'),
	(3, 'Сидоров', 'Сидор', 'Сидорович', 2, '2015-12-12', '2075-12-31', 'неактив'),
	(4, 'Андреев', 'Андрей', 'Андреевич', 1, '2015-04-23', '2075-12-31', 'актив'),
	(5, 'Алексеев', 'Алексей', 'Алексеевич', 1, '2010-10-10', '2015-04-30', 'уволен'),
	(6, 'Дмитриев', 'Дмитрий', 'Дмитриевич', 1, '2015-01-11', '2075-12-31', 'неактив'),
	(7, 'Сергеев', 'Сергей', 'Сергеевич', 1, '2015-12-12', '2075-12-31', 'неактив'),
	(8, 'Валентинов', 'Валентин', 'Валентинович', 2, '2015-04-21', '2075-12-31', 'актив');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.staff_card
CREATE TABLE IF NOT EXISTS `staff_card` (
  `id_card` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Карты персонала для доступа к оборудованию',
  `number` varchar(8) NOT NULL COMMENT 'номер карты',
  `id_staff` int(11) NOT NULL COMMENT 'Сотрудник',
  `date_create` date DEFAULT NULL COMMENT 'Дата создания карты',
  `date_begin` date DEFAULT NULL COMMENT 'Дата начала действия',
  `date_end` date DEFAULT NULL COMMENT 'Дата окончания действия',
  `status` varchar(45) DEFAULT NULL COMMENT 'статус:\nактив,\nнеактив,\nутеряна,\nблокирована,\nуничтожена',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_card`),
  UNIQUE KEY `id_staff_card_UNIQUE` (`id_card`),
  UNIQUE KEY `number_card_UNIQUE` (`number`),
  KEY `fk_staff_idx` (`id_staff`),
  CONSTRAINT `fk_StaffCard_Staff1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.staff_card: ~3 rows (приблизительно)
DELETE FROM `staff_card`;
/*!40000 ALTER TABLE `staff_card` DISABLE KEYS */;
INSERT INTO `staff_card` (`id_card`, `number`, `id_staff`, `date_create`, `date_begin`, `date_end`, `status`, `note`) VALUES
	(1, '12365478', 1, '2010-10-10', '2010-10-10', '2075-12-31', 'актив', ''),
	(2, ' 2365478', 2, '2015-01-11', '2015-01-11', '2015-04-15', 'неактив', ''),
	(3, '12345670', 2, '2015-04-30', '2015-05-10', '2075-12-31', 'актив', 'NULL');
/*!40000 ALTER TABLE `staff_card` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id_trans` int(11) NOT NULL AUTO_INCREMENT COMMENT 'транзакции',
  `id_card` int(11) DEFAULT NULL COMMENT 'ссылка на карту',
  `id_eq` int(11) DEFAULT NULL COMMENT 'ссылка на розетку',
  `time_begin` datetime DEFAULT NULL COMMENT 'включение',
  `time_end` datetime DEFAULT NULL COMMENT 'выключение',
  `time_total` time DEFAULT NULL COMMENT 'время эксплуатации, секунд',
  `status` varchar(15) DEFAULT NULL COMMENT 'статус: вкл, выкл, откл, авар',
  PRIMARY KEY (`id_trans`),
  UNIQUE KEY `id_trans_UNIQUE` (`id_trans`),
  KEY `fk_staff_card_idx` (`id_card`),
  KEY `fk_equipment_idx` (`id_eq`),
  CONSTRAINT `fk_transaction_equipment1` FOREIGN KEY (`id_eq`) REFERENCES `equipment` (`id_eq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_StaffCard1` FOREIGN KEY (`id_card`) REFERENCES `staff_card` (`id_card`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.transaction: ~165 rows (приблизительно)
DELETE FROM `transaction`;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`id_trans`, `id_card`, `id_eq`, `time_begin`, `time_end`, `time_total`, `status`) VALUES
	(1, 1, 10, '2015-05-22 16:51:22', '2015-05-22 16:51:24', '00:00:02', 'откл'),
	(2, 1, 10, '2015-05-22 16:53:12', '2015-05-22 16:53:21', '00:00:09', 'откл'),
	(3, 1, 11, '2015-05-22 16:53:15', '2015-05-22 16:53:21', '00:00:06', 'откл'),
	(4, 1, 10, '2015-05-22 16:54:42', '2015-05-22 16:54:46', '00:00:04', 'откл'),
	(5, 1, 10, '2015-05-22 16:54:50', '2015-05-22 16:54:56', '00:00:06', 'откл'),
	(6, 1, 11, '2015-05-22 16:54:53', '2015-05-22 16:54:58', '00:00:05', 'откл'),
	(7, 1, 10, '2015-05-22 16:55:08', '2015-05-22 16:55:14', '00:00:06', 'откл'),
	(8, 1, 11, '2015-05-22 16:55:12', '2015-05-22 16:55:15', '00:00:03', 'откл'),
	(9, 1, 10, '2015-05-22 16:55:18', '2015-05-22 16:55:39', '00:00:21', 'откл'),
	(10, 1, 11, '2015-05-22 16:55:20', '2015-05-22 16:55:42', '00:00:22', 'откл'),
	(11, 1, 10, '2015-05-22 16:56:23', '2015-05-22 16:56:30', '00:00:07', 'откл'),
	(12, 1, 10, '2015-05-22 16:57:29', '2015-05-22 16:58:45', '00:01:16', 'откл'),
	(13, 1, 11, '2015-05-22 16:57:46', '2015-05-22 17:00:07', '00:02:21', 'откл'),
	(14, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(16, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(28, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(31, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(32, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(34, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(43, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(44, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(48, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(51, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(52, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(59, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(61, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(62, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(70, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(72, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(75, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(76, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(83, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(84, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(87, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(91, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(96, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(97, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(100, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(102, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(103, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(111, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(116, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(118, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(121, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(122, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(125, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(126, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(131, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(133, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(134, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(136, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(141, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(142, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(145, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(146, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(153, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(154, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(156, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(158, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(163, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(171, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(173, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(175, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(178, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(180, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(182, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(186, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(189, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(211, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(213, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(214, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(217, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(218, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(222, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(226, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(232, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(238, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(243, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(244, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(247, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(248, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(251, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(252, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(262, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(263, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(274, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(275, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(278, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(279, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(285, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(288, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(289, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(292, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(294, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(296, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(297, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(320, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(321, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(324, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(325, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(328, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(330, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(332, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(333, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(335, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(338, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(339, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(342, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(343, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(345, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(347, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(349, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(351, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(353, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(356, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(357, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(360, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(362, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(363, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(366, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(367, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(369, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(371, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(373, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(375, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(378, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(390, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(393, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(394, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(396, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(397, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(400, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(401, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(404, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(405, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(408, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(410, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(411, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(418, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(419, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(420, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(423, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(425, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(426, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(429, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(430, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(433, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(435, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(437, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(439, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(441, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(443, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(445, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(447, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(449, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(451, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(455, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(457, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(459, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(460, 1, 11, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(463, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(465, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(467, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(478, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл'),
	(479, 1, 10, '1899-12-30 00:00:00', NULL, NULL, 'вкл');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.type_dispenser
CREATE TABLE IF NOT EXISTS `type_dispenser` (
  `id_type` int(11) NOT NULL COMMENT 'Тип колонки',
  `type` varchar(45) NOT NULL COMMENT 'Тип',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `id_type_UNIQUE` (`id_type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.type_dispenser: ~3 rows (приблизительно)
DELETE FROM `type_dispenser`;
/*!40000 ALTER TABLE `type_dispenser` DISABLE KEYS */;
INSERT INTO `type_dispenser` (`id_type`, `type`, `note`) VALUES
	(1, 'Колонка односторонняя', 'NULL'),
	(2, 'Клонка двухсторонняя', 'NULL'),
	(3, 'Блок розеток', 'NULL');
/*!40000 ALTER TABLE `type_dispenser` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.type_equip
CREATE TABLE IF NOT EXISTS `type_equip` (
  `id_type` int(11) NOT NULL COMMENT 'тип разъема',
  `phase` int(11) DEFAULT NULL COMMENT 'количество фаз',
  `nominal` varchar(45) NOT NULL COMMENT 'номинальный ток',
  `cost` int(11) DEFAULT NULL COMMENT 'стоимость, коп/час',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `id_type_UNIQUE` (`id_type`),
  UNIQUE KEY `type_UNIQUE` (`nominal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.type_equip: ~3 rows (приблизительно)
DELETE FROM `type_equip`;
/*!40000 ALTER TABLE `type_equip` DISABLE KEYS */;
INSERT INTO `type_equip` (`id_type`, `phase`, `nominal`, `cost`, `note`) VALUES
	(1, NULL, '220 В 10 А', NULL, 'NULL'),
	(2, NULL, '220 В 12 А', NULL, 'NULL'),
	(3, NULL, '12 В 5 А', NULL, 'NULL');
/*!40000 ALTER TABLE `type_equip` ENABLE KEYS */;


-- Дамп структуры для таблица controlsocket.type_event
CREATE TABLE IF NOT EXISTS `type_event` (
  `id_type_event` int(11) NOT NULL COMMENT 'Тип события',
  `event` varchar(45) NOT NULL DEFAULT '0' COMMENT 'событие',
  `note` varchar(255) NOT NULL DEFAULT '0' COMMENT 'пояснение',
  PRIMARY KEY (`id_type_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы controlsocket.type_event: ~9 rows (приблизительно)
DELETE FROM `type_event`;
/*!40000 ALTER TABLE `type_event` DISABLE KEYS */;
INSERT INTO `type_event` (`id_type_event`, `event`, `note`) VALUES
	(10, 'отключение разъема', '0'),
	(11, 'включение разъема', '0'),
	(13, 'срабатывание кнопки аварийного останова', '0'),
	(31, 'снятие аварийной остановки кнопкой', '0'),
	(33, 'аварийное выключение рубильника питания', '0'),
	(44, 'включение после не аварийного отключения', '0'),
	(55, 'включение после аварийного отключения', '0'),
	(66, 'отключение контроллера', '0'),
	(77, 'включение контроллера', '0');
/*!40000 ALTER TABLE `type_event` ENABLE KEYS */;


-- Дамп структуры для триггер controlsocket.transaction_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `transaction_before_update` BEFORE UPDATE ON `transaction` FOR EACH ROW BEGIN
	if new.time_begin<>NULL and new.time_end<>NULL then 
		set new.time_total=new.time_end-new.time_begin;
    END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
