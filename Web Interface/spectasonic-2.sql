-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 13 Mai 2016 à 13:10
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `spectasonic`
--

-- --------------------------------------------------------

--
-- Structure de la table `specta_client`
--

CREATE TABLE `specta_client` (
  `ID` int(255) NOT NULL,
  `Last_name` varchar(102) NOT NULL,
  `First_name` varchar(102) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_client`
--

INSERT INTO `specta_client` (`ID`, `Last_name`, `First_name`, `Password`) VALUES
(1, 'ODE', 'LOICK', '*E8B6FE90954109B5369C4B237F2A40B0C043E040'),
(2, 'PLESSY', 'PIERRE', '*C0C5057AAF9C5F8E432983998995E8D2B10DBB1F');

-- --------------------------------------------------------

--
-- Structure de la table `specta_days`
--

CREATE TABLE `specta_days` (
  `heure` time NOT NULL,
  `value` int(150) NOT NULL,
  `device_id` int(11) NOT NULL COMMENT 'Numero de serie',
  `type_capteur` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_days`
--

INSERT INTO `specta_days` (`heure`, `value`, `device_id`, `type_capteur`) VALUES
('07:10:33', 34, 4, 'TEMPERATURE'),
('12:12:27', 14, 4, 'TEMPERATURE'),
('09:11:24', 99, 4, 'TEMPERATURE'),
('13:34:19', 34, 4, 'TEMPERATURE'),
('20:00:00', 2, 4, 'HUMIDITE'),
('07:10:33', 34, 4, 'TEMPERATURE'),
('12:12:27', 14, 4, 'TEMPERATURE'),
('09:11:24', 99, 4, 'TEMPERATURE'),
('13:34:19', 34, 4, 'TEMPERATURE'),
('20:00:00', 2, 4, 'HUMIDITE'),
('07:10:33', 10, 4, 'HUMIDITE'),
('12:12:27', 14, 4, 'HUMIDITE'),
('09:11:24', 30, 4, 'HUMIDITE'),
('13:34:19', 4, 4, 'HUMIDITE'),
('20:00:00', 45, 4, 'HALLSENSOR'),
('07:10:33', 20, 4, 'HALLSENSOR'),
('12:12:27', 4, 4, 'HALLSENSOR'),
('09:11:24', 5, 4, 'HALLSENSOR'),
('13:34:19', 24, 4, 'HALLSENSOR'),
('20:00:00', 2, 4, 'VIBRATION'),
('07:10:33', 11, 4, 'VIBRATION'),
('12:12:27', 24, 4, 'VIBRATION'),
('09:11:24', 15, 4, 'VIBRATION'),
('13:34:19', 40, 4, 'VIBRATION'),
('07:10:33', 34, 1, 'TEMPERATURE'),
('12:12:27', 14, 1, 'TEMPERATURE'),
('09:11:24', 99, 1, 'TEMPERATURE'),
('13:34:19', 34, 1, 'TEMPERATURE'),
('20:00:00', 2, 1, 'HUMIDITE'),
('07:10:33', 10, 1, 'HUMIDITE'),
('12:12:27', 14, 1, 'HUMIDITE'),
('09:11:24', 30, 1, 'HUMIDITE'),
('13:34:19', 1, 1, 'HUMIDITE'),
('20:00:00', 45, 1, 'HALLSENSOR'),
('07:10:33', 20, 1, 'HALLSENSOR'),
('12:12:27', 4, 1, 'HALLSENSOR'),
('09:11:24', 5, 1, 'HALLSENSOR'),
('13:34:19', 24, 1, 'HALLSENSOR'),
('20:00:00', 2, 1, 'VIBRATION'),
('07:10:33', 11, 1, 'VIBRATION'),
('12:12:27', 24, 1, 'VIBRATION'),
('09:11:24', 15, 1, 'VIBRATION'),
('13:34:19', 40, 1, 'VIBRATION'),
('07:10:33', 4, 2, 'TEMPERATURE'),
('12:12:27', 24, 2, 'TEMPERATURE'),
('09:11:24', 9, 2, 'TEMPERATURE'),
('13:34:19', 4, 2, 'TEMPERATURE'),
('20:00:00', 12, 2, 'HUMIDITE'),
('07:10:33', 1, 2, 'HUMIDITE'),
('12:12:27', 4, 2, 'HUMIDITE'),
('09:11:24', 30, 2, 'HUMIDITE'),
('13:34:19', 2, 2, 'HUMIDITE'),
('20:00:00', 5, 2, 'HALLSENSOR'),
('07:10:33', 24, 2, 'HALLSENSOR'),
('12:12:27', 4, 2, 'HALLSENSOR'),
('09:11:24', 15, 2, 'HALLSENSOR'),
('13:34:19', 24, 2, 'HALLSENSOR'),
('20:00:00', 32, 2, 'VIBRATION'),
('07:10:33', 1, 2, 'VIBRATION'),
('12:12:27', 14, 2, 'VIBRATION'),
('09:11:24', 15, 2, 'VIBRATION'),
('13:34:19', 4, 2, 'VIBRATION'),
('07:10:33', 34, 3, 'TEMPERATURE'),
('12:12:27', 34, 3, 'TEMPERATURE'),
('09:11:24', 39, 3, 'TEMPERATURE'),
('13:34:19', 24, 3, 'TEMPERATURE'),
('20:00:00', 22, 3, 'HUMIDITE'),
('07:10:33', 21, 3, 'HUMIDITE'),
('12:12:27', 24, 3, 'HUMIDITE'),
('09:11:24', 30, 3, 'HUMIDITE'),
('13:34:19', 12, 3, 'HUMIDITE'),
('20:00:00', 15, 3, 'HALLSENSOR'),
('07:10:33', 14, 3, 'HALLSENSOR'),
('12:12:27', 14, 3, 'HALLSENSOR'),
('09:11:24', 35, 3, 'HALLSENSOR'),
('13:34:19', 34, 3, 'HALLSENSOR'),
('20:00:00', 32, 3, 'VIBRATION'),
('07:10:33', 31, 3, 'VIBRATION'),
('12:12:27', 34, 3, 'VIBRATION'),
('09:11:24', 35, 3, 'VIBRATION'),
('13:34:19', 34, 3, 'VIBRATION'),
('07:10:33', 6, 5, 'TEMPERATURE'),
('12:12:27', 36, 5, 'TEMPERATURE'),
('09:11:24', 63, 5, 'TEMPERATURE'),
('13:34:19', 24, 5, 'TEMPERATURE'),
('20:00:00', 52, 5, 'HUMIDITE'),
('07:10:33', 15, 5, 'HUMIDITE'),
('12:12:27', 25, 5, 'HUMIDITE'),
('09:11:24', 50, 5, 'HUMIDITE'),
('13:34:19', 15, 5, 'HUMIDITE'),
('20:00:00', 55, 5, 'HALLSENSOR'),
('07:10:33', 15, 5, 'HALLSENSOR'),
('12:12:27', 54, 5, 'HALLSENSOR'),
('09:11:24', 55, 5, 'HALLSENSOR'),
('13:34:19', 4, 5, 'HALLSENSOR'),
('20:00:00', 52, 5, 'VIBRATION'),
('07:10:33', 35, 5, 'VIBRATION'),
('12:12:27', 54, 5, 'VIBRATION'),
('09:11:24', 5, 5, 'VIBRATION'),
('13:34:19', 4, 5, 'VIBRATION'),
('07:10:33', 1, 6, 'TEMPERATURE'),
('12:12:27', 26, 6, 'TEMPERATURE'),
('09:11:24', 13, 6, 'TEMPERATURE'),
('13:34:19', 14, 6, 'TEMPERATURE'),
('20:00:00', 12, 6, 'HUMIDITE'),
('07:10:33', 6, 6, 'HUMIDITE'),
('12:12:27', 15, 6, 'HUMIDITE'),
('09:11:24', 10, 6, 'HUMIDITE'),
('13:34:19', 6, 6, 'HUMIDITE'),
('20:00:00', 15, 6, 'HALLSENSOR'),
('07:10:33', 6, 6, 'HALLSENSOR'),
('12:12:27', 51, 6, 'HALLSENSOR'),
('09:11:24', 15, 6, 'HALLSENSOR'),
('13:34:19', 14, 6, 'HALLSENSOR'),
('20:00:00', 12, 6, 'VIBRATION'),
('07:10:33', 6, 6, 'VIBRATION'),
('12:12:27', 14, 6, 'VIBRATION'),
('09:11:24', 15, 6, 'VIBRATION'),
('13:34:19', 14, 6, 'VIBRATION');

-- --------------------------------------------------------

--
-- Structure de la table `specta_device`
--

CREATE TABLE `specta_device` (
  `ID` int(255) NOT NULL COMMENT 'Numéro de série',
  `Client_id` int(255) NOT NULL,
  `Type` int(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_device`
--

INSERT INTO `specta_device` (`ID`, `Client_id`, `Type`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 1),
(4, 1, 1),
(5, 1, 2),
(6, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `specta_hour`
--

CREATE TABLE `specta_hour` (
  `hour` time NOT NULL,
  `value` int(255) NOT NULL,
  `device_id` int(11) NOT NULL,
  `type_capteur` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_hour`
--

INSERT INTO `specta_hour` (`hour`, `value`, `device_id`, `type_capteur`) VALUES
('11:10:20', 13, 4, 'TEMPERATURE'),
('11:11:14', 17, 4, 'TEMPERATURE'),
('11:12:54', 15, 4, 'TEMPERATURE'),
('11:13:23', 16, 4, 'TEMPERATURE'),
('11:14:14', 14, 4, 'TEMPERATURE'),
('11:15:15', 15, 4, 'TEMPERATURE'),
('11:16:14', 16, 4, 'TEMPERATURE'),
('11:17:15', 17, 4, 'TEMPERATURE'),
('11:18:15', 17, 4, 'TEMPERATURE'),
('11:19:15', 17, 4, 'TEMPERATURE'),
('11:20:15', 17, 4, 'TEMPERATURE'),
('11:21:15', 17, 4, 'TEMPERATURE'),
('11:22:15', 17, 4, 'TEMPERATURE'),
('11:23:15', 17, 4, 'TEMPERATURE'),
('01:00:00', 12, 1, 'TEMPERATURE'),
('02:00:00', 23, 1, 'TEMPERATURE'),
('03:00:00', 40, 1, 'TEMPERATURE'),
('05:00:00', 12, 1, 'TEMPERATURE'),
('01:00:00', 30, 2, 'TEMPERATURE'),
('02:00:00', 10, 2, 'TEMPERATURE'),
('03:00:00', 5, 2, 'TEMPERATURE'),
('04:00:00', 60, 2, 'TEMPERATURE'),
('05:00:00', 22, 2, 'TEMPERATURE'),
('01:00:00', 33, 3, 'TEMPERATURE'),
('02:00:00', 11, 3, 'TEMPERATURE'),
('03:00:00', 50, 3, 'TEMPERATURE'),
('04:00:00', 0, 3, 'TEMPERATURE'),
('05:00:00', 10, 3, 'TEMPERATURE'),
('01:00:00', 3, 4, 'TEMPERATURE'),
('02:00:00', 1, 4, 'TEMPERATURE'),
('03:00:00', 52, 4, 'TEMPERATURE'),
('04:00:00', 20, 4, 'TEMPERATURE'),
('05:00:00', 10, 4, 'TEMPERATURE'),
('01:00:00', 3, 5, 'TEMPERATURE'),
('02:00:00', 33, 5, 'TEMPERATURE'),
('03:00:00', 23, 5, 'TEMPERATURE'),
('04:00:00', 33, 5, 'TEMPERATURE'),
('05:00:00', 13, 5, 'TEMPERATURE'),
('01:00:00', 33, 6, 'TEMPERATURE'),
('02:00:00', 3, 6, 'TEMPERATURE'),
('03:00:00', 23, 6, 'TEMPERATURE'),
('04:00:00', 13, 6, 'TEMPERATURE'),
('05:00:00', 1, 6, 'TEMPERATURE'),
('11:10:20', 13, 4, 'HUMIDITE'),
('11:11:14', 17, 4, 'HUMIDITE'),
('11:12:54', 15, 4, 'HUMIDITE'),
('11:13:23', 16, 4, 'HUMIDITE'),
('11:14:14', 14, 4, 'HUMIDITE'),
('11:15:15', 15, 4, 'HUMIDITE'),
('11:16:14', 16, 4, 'HUMIDITE'),
('11:17:15', 17, 4, 'HUMIDITE'),
('11:18:15', 17, 4, 'HUMIDITE'),
('11:19:15', 17, 4, 'HUMIDITE'),
('11:20:15', 17, 4, 'HUMIDITE'),
('11:21:15', 17, 4, 'HUMIDITE'),
('11:22:15', 17, 4, 'HUMIDITE'),
('11:23:15', 17, 4, 'HUMIDITE'),
('01:00:00', 12, 1, 'HUMIDITE'),
('02:00:00', 23, 1, 'HUMIDITE'),
('03:00:00', 40, 1, 'HUMIDITE'),
('05:00:00', 12, 1, 'HUMIDITE'),
('01:00:00', 30, 2, 'HUMIDITE'),
('02:00:00', 10, 2, 'HUMIDITE'),
('03:00:00', 5, 2, 'HUMIDITE'),
('04:00:00', 60, 2, 'HUMIDITE'),
('05:00:00', 22, 2, 'HUMIDITE'),
('01:00:00', 33, 3, 'HUMIDITE'),
('02:00:00', 11, 3, 'HUMIDITE'),
('03:00:00', 50, 3, 'HUMIDITE'),
('04:00:00', 0, 3, 'HUMIDITE'),
('05:00:00', 10, 3, 'HUMIDITE'),
('01:00:00', 3, 4, 'HUMIDITE'),
('02:00:00', 1, 4, 'HUMIDITE'),
('03:00:00', 52, 4, 'HUMIDITE'),
('04:00:00', 20, 4, 'HUMIDITE'),
('05:00:00', 10, 4, 'HUMIDITE'),
('01:00:00', 3, 5, 'HUMIDITE'),
('02:00:00', 33, 5, 'HUMIDITE'),
('03:00:00', 23, 5, 'HUMIDITE'),
('04:00:00', 33, 5, 'HUMIDITE'),
('05:00:00', 13, 5, 'HUMIDITE'),
('01:00:00', 33, 6, 'HUMIDITE'),
('02:00:00', 3, 6, 'HUMIDITE'),
('03:00:00', 23, 6, 'HUMIDITE'),
('04:00:00', 13, 6, 'HUMIDITE'),
('05:00:00', 1, 6, 'HUMIDITE'),
('11:10:20', 13, 4, 'HUMIDITE'),
('11:11:14', 17, 4, 'HUMIDITE'),
('11:12:54', 15, 4, 'HUMIDITE'),
('11:13:23', 16, 4, 'HUMIDITE'),
('11:14:14', 14, 4, 'HUMIDITE'),
('11:15:15', 15, 4, 'HUMIDITE'),
('11:16:14', 16, 4, 'HUMIDITE'),
('11:17:15', 17, 4, 'HUMIDITE'),
('11:18:15', 17, 4, 'HUMIDITE'),
('11:19:15', 17, 4, 'HUMIDITE'),
('11:20:15', 17, 4, 'HUMIDITE'),
('11:21:15', 17, 4, 'HUMIDITE'),
('11:22:15', 17, 4, 'HUMIDITE'),
('11:23:15', 17, 4, 'HUMIDITE'),
('01:00:00', 12, 1, 'HUMIDITE'),
('02:00:00', 23, 1, 'HUMIDITE'),
('03:00:00', 40, 1, 'HUMIDITE'),
('05:00:00', 12, 1, 'HUMIDITE'),
('01:00:00', 30, 2, 'HUMIDITE'),
('02:00:00', 10, 2, 'HUMIDITE'),
('03:00:00', 5, 2, 'HUMIDITE'),
('04:00:00', 60, 2, 'HUMIDITE'),
('05:00:00', 22, 2, 'HUMIDITE'),
('01:00:00', 33, 3, 'HUMIDITE'),
('02:00:00', 11, 3, 'HUMIDITE'),
('03:00:00', 50, 3, 'HUMIDITE'),
('04:00:00', 0, 3, 'HUMIDITE'),
('05:00:00', 10, 3, 'HUMIDITE'),
('01:00:00', 3, 4, 'HUMIDITE'),
('02:00:00', 1, 4, 'HUMIDITE'),
('03:00:00', 52, 4, 'HUMIDITE'),
('04:00:00', 20, 4, 'HUMIDITE'),
('05:00:00', 10, 4, 'HUMIDITE'),
('01:00:00', 3, 5, 'HUMIDITE'),
('02:00:00', 33, 5, 'HUMIDITE'),
('03:00:00', 23, 5, 'HUMIDITE'),
('04:00:00', 33, 5, 'HUMIDITE'),
('05:00:00', 13, 5, 'HUMIDITE'),
('01:00:00', 33, 6, 'HUMIDITE'),
('02:00:00', 3, 6, 'HUMIDITE'),
('03:00:00', 23, 6, 'HUMIDITE'),
('04:00:00', 13, 6, 'HUMIDITE'),
('05:00:00', 1, 6, 'HUMIDITE'),
('11:10:20', 13, 4, 'HALLSENSOR'),
('11:11:14', 17, 4, 'HALLSENSOR'),
('11:12:54', 15, 4, 'HALLSENSOR'),
('11:13:23', 16, 4, 'HALLSENSOR'),
('11:14:14', 14, 4, 'HALLSENSOR'),
('11:15:15', 15, 4, 'HALLSENSOR'),
('11:16:14', 16, 4, 'HALLSENSOR'),
('11:17:15', 17, 4, 'HALLSENSOR'),
('11:18:15', 17, 4, 'HALLSENSOR'),
('11:19:15', 17, 4, 'HALLSENSOR'),
('11:20:15', 17, 4, 'HALLSENSOR'),
('11:21:15', 17, 4, 'HALLSENSOR'),
('11:22:15', 17, 4, 'HALLSENSOR'),
('11:23:15', 17, 4, 'HALLSENSOR'),
('01:00:00', 12, 1, 'HALLSENSOR'),
('02:00:00', 23, 1, 'HALLSENSOR'),
('03:00:00', 40, 1, 'HALLSENSOR'),
('05:00:00', 12, 1, 'HALLSENSOR'),
('01:00:00', 30, 2, 'HALLSENSOR'),
('02:00:00', 10, 2, 'HALLSENSOR'),
('03:00:00', 5, 2, 'HALLSENSOR'),
('04:00:00', 60, 2, 'HALLSENSOR'),
('05:00:00', 22, 2, 'HALLSENSOR'),
('01:00:00', 33, 3, 'HALLSENSOR'),
('02:00:00', 11, 3, 'HALLSENSOR'),
('03:00:00', 50, 3, 'HALLSENSOR'),
('04:00:00', 0, 3, 'HALLSENSOR'),
('05:00:00', 10, 3, 'HALLSENSOR'),
('01:00:00', 3, 4, 'HALLSENSOR'),
('02:00:00', 1, 4, 'HALLSENSOR'),
('03:00:00', 52, 4, 'HALLSENSOR'),
('04:00:00', 20, 4, 'HALLSENSOR'),
('05:00:00', 10, 4, 'HALLSENSOR'),
('01:00:00', 3, 5, 'HALLSENSOR'),
('02:00:00', 33, 5, 'HALLSENSOR'),
('03:00:00', 23, 5, 'HALLSENSOR'),
('04:00:00', 33, 5, 'HALLSENSOR'),
('05:00:00', 13, 5, 'HALLSENSOR'),
('01:00:00', 33, 6, 'HALLSENSOR'),
('02:00:00', 3, 6, 'HALLSENSOR'),
('03:00:00', 23, 6, 'HALLSENSOR'),
('04:00:00', 13, 6, 'HALLSENSOR'),
('05:00:00', 1, 6, 'HALLSENSOR'),
('11:10:20', 13, 4, 'HALLSENSOR'),
('11:11:14', 17, 4, 'HALLSENSOR'),
('11:12:54', 15, 4, 'HALLSENSOR'),
('11:13:23', 16, 4, 'HALLSENSOR'),
('11:14:14', 14, 4, 'HALLSENSOR'),
('11:15:15', 15, 4, 'HALLSENSOR'),
('11:16:14', 16, 4, 'HALLSENSOR'),
('11:17:15', 17, 4, 'HALLSENSOR'),
('11:18:15', 17, 4, 'HALLSENSOR'),
('11:19:15', 17, 4, 'HALLSENSOR'),
('11:20:15', 17, 4, 'HALLSENSOR'),
('11:21:15', 17, 4, 'HALLSENSOR'),
('11:22:15', 17, 4, 'HALLSENSOR'),
('11:23:15', 17, 4, 'HALLSENSOR'),
('01:00:00', 12, 1, 'HALLSENSOR'),
('02:00:00', 23, 1, 'HALLSENSOR'),
('03:00:00', 40, 1, 'HALLSENSOR'),
('05:00:00', 12, 1, 'HALLSENSOR'),
('01:00:00', 30, 2, 'HALLSENSOR'),
('02:00:00', 10, 2, 'HALLSENSOR'),
('03:00:00', 5, 2, 'HALLSENSOR'),
('04:00:00', 60, 2, 'HALLSENSOR'),
('05:00:00', 22, 2, 'HALLSENSOR'),
('01:00:00', 33, 3, 'HALLSENSOR'),
('02:00:00', 11, 3, 'HALLSENSOR'),
('03:00:00', 50, 3, 'HALLSENSOR'),
('04:00:00', 0, 3, 'HALLSENSOR'),
('05:00:00', 10, 3, 'HALLSENSOR'),
('01:00:00', 3, 4, 'HALLSENSOR'),
('02:00:00', 1, 4, 'HALLSENSOR'),
('03:00:00', 52, 4, 'HALLSENSOR'),
('04:00:00', 20, 4, 'HALLSENSOR'),
('05:00:00', 10, 4, 'HALLSENSOR'),
('01:00:00', 3, 5, 'HALLSENSOR'),
('02:00:00', 33, 5, 'HALLSENSOR'),
('03:00:00', 23, 5, 'HALLSENSOR'),
('04:00:00', 33, 5, 'HALLSENSOR'),
('05:00:00', 13, 5, 'HALLSENSOR'),
('01:00:00', 33, 6, 'HALLSENSOR'),
('02:00:00', 3, 6, 'HALLSENSOR'),
('03:00:00', 23, 6, 'HALLSENSOR'),
('04:00:00', 13, 6, 'HALLSENSOR'),
('05:00:00', 1, 6, 'HALLSENSOR'),
('11:10:20', 13, 4, 'VIBRATION'),
('11:11:14', 17, 4, 'VIBRATION'),
('11:12:54', 15, 4, 'VIBRATION'),
('11:13:23', 16, 4, 'VIBRATION'),
('11:14:14', 14, 4, 'VIBRATION'),
('11:15:15', 15, 4, 'VIBRATION'),
('11:16:14', 16, 4, 'VIBRATION'),
('11:17:15', 17, 4, 'VIBRATION'),
('11:18:15', 17, 4, 'VIBRATION'),
('11:19:15', 17, 4, 'VIBRATION'),
('11:20:15', 17, 4, 'VIBRATION'),
('11:21:15', 17, 4, 'VIBRATION'),
('11:22:15', 17, 4, 'VIBRATION'),
('11:23:15', 17, 4, 'VIBRATION'),
('01:00:00', 12, 1, 'VIBRATION'),
('02:00:00', 23, 1, 'VIBRATION'),
('03:00:00', 40, 1, 'VIBRATION'),
('05:00:00', 12, 1, 'VIBRATION'),
('01:00:00', 30, 2, 'VIBRATION'),
('02:00:00', 10, 2, 'VIBRATION'),
('03:00:00', 5, 2, 'VIBRATION'),
('04:00:00', 60, 2, 'VIBRATION'),
('05:00:00', 22, 2, 'VIBRATION'),
('01:00:00', 33, 3, 'VIBRATION'),
('02:00:00', 11, 3, 'VIBRATION'),
('03:00:00', 50, 3, 'VIBRATION'),
('04:00:00', 0, 3, 'VIBRATION'),
('05:00:00', 10, 3, 'VIBRATION'),
('01:00:00', 3, 4, 'VIBRATION'),
('02:00:00', 1, 4, 'VIBRATION'),
('03:00:00', 52, 4, 'VIBRATION'),
('04:00:00', 20, 4, 'VIBRATION'),
('05:00:00', 10, 4, 'VIBRATION'),
('01:00:00', 3, 5, 'VIBRATION'),
('02:00:00', 33, 5, 'VIBRATION'),
('03:00:00', 23, 5, 'VIBRATION'),
('04:00:00', 33, 5, 'VIBRATION'),
('05:00:00', 13, 5, 'VIBRATION'),
('01:00:00', 33, 6, 'VIBRATION'),
('02:00:00', 3, 6, 'VIBRATION'),
('03:00:00', 23, 6, 'VIBRATION'),
('04:00:00', 13, 6, 'VIBRATION'),
('05:00:00', 1, 6, 'VIBRATION'),
('11:10:20', 13, 4, 'VIBRATION'),
('11:11:14', 17, 4, 'VIBRATION'),
('11:12:54', 15, 4, 'VIBRATION'),
('11:13:23', 16, 4, 'VIBRATION'),
('11:14:14', 14, 4, 'VIBRATION'),
('11:15:15', 15, 4, 'VIBRATION'),
('11:16:14', 16, 4, 'VIBRATION'),
('11:17:15', 17, 4, 'VIBRATION'),
('11:18:15', 17, 4, 'VIBRATION'),
('11:19:15', 17, 4, 'VIBRATION'),
('11:20:15', 17, 4, 'VIBRATION'),
('11:21:15', 17, 4, 'VIBRATION'),
('11:22:15', 17, 4, 'VIBRATION'),
('11:23:15', 17, 4, 'VIBRATION'),
('01:00:00', 12, 1, 'VIBRATION'),
('02:00:00', 23, 1, 'VIBRATION'),
('03:00:00', 40, 1, 'VIBRATION'),
('05:00:00', 12, 1, 'VIBRATION'),
('01:00:00', 30, 2, 'VIBRATION'),
('02:00:00', 10, 2, 'VIBRATION'),
('03:00:00', 5, 2, 'VIBRATION'),
('04:00:00', 60, 2, 'VIBRATION'),
('05:00:00', 22, 2, 'VIBRATION'),
('01:00:00', 33, 3, 'VIBRATION'),
('02:00:00', 11, 3, 'VIBRATION'),
('03:00:00', 50, 3, 'VIBRATION'),
('04:00:00', 0, 3, 'VIBRATION'),
('05:00:00', 10, 3, 'VIBRATION'),
('01:00:00', 3, 4, 'VIBRATION'),
('02:00:00', 1, 4, 'VIBRATION'),
('03:00:00', 52, 4, 'VIBRATION'),
('04:00:00', 20, 4, 'VIBRATION'),
('05:00:00', 10, 4, 'VIBRATION'),
('01:00:00', 3, 5, 'VIBRATION'),
('02:00:00', 33, 5, 'VIBRATION'),
('03:00:00', 23, 5, 'VIBRATION'),
('04:00:00', 33, 5, 'VIBRATION'),
('05:00:00', 13, 5, 'VIBRATION'),
('01:00:00', 33, 6, 'VIBRATION'),
('02:00:00', 3, 6, 'VIBRATION'),
('03:00:00', 23, 6, 'VIBRATION'),
('04:00:00', 13, 6, 'VIBRATION'),
('05:00:00', 1, 6, 'VIBRATION');

-- --------------------------------------------------------

--
-- Structure de la table `specta_months`
--

CREATE TABLE `specta_months` (
  `date` date NOT NULL,
  `value` int(255) NOT NULL,
  `device_id` int(11) NOT NULL COMMENT 'Numéro de série',
  `type_capteur` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_months`
--

INSERT INTO `specta_months` (`date`, `value`, `device_id`, `type_capteur`) VALUES
('2016-05-13', 10, 1, 'TEMPERATURE'),
('2016-05-13', 10, 1, 'TEMPERATURE'),
('2016-05-14', 14, 1, 'TEMPERATURE'),
('2016-05-15', 10, 1, 'TEMPERATURE'),
('2016-05-16', 20, 1, 'TEMPERATURE'),
('2016-05-17', 18, 1, 'TEMPERATURE'),
('2016-05-18', 45, 1, 'TEMPERATURE'),
('2016-05-13', 10, 1, 'HUMIDITE'),
('2016-05-14', 14, 1, 'HUMIDITE'),
('2016-05-15', 10, 1, 'HUMIDITE'),
('2016-05-16', 20, 1, 'HUMIDITE'),
('2016-05-17', 18, 1, 'HUMIDITE'),
('2016-05-18', 45, 1, 'HUMIDITE'),
('2016-05-13', 10, 1, 'HALLSENSOR'),
('2016-05-14', 14, 1, 'HALLSENSOR'),
('2016-05-15', 10, 1, 'HALLSENSOR'),
('2016-05-16', 20, 1, 'HALLSENSOR'),
('2016-05-17', 18, 1, 'HALLSENSOR'),
('2016-05-18', 45, 1, 'HALLSENSOR'),
('2016-05-13', 10, 1, 'VIBRATION'),
('2016-05-14', 14, 1, 'VIBRATION'),
('2016-05-15', 10, 1, 'VIBRATION'),
('2016-05-16', 20, 1, 'VIBRATION'),
('2016-05-17', 18, 1, 'VIBRATION'),
('2016-05-18', 45, 1, 'VIBRATION'),
('2026-05-23', 10, 2, 'TEMPERATURE'),
('2026-05-24', 33, 2, 'TEMPERATURE'),
('2026-05-25', 2, 2, 'TEMPERATURE'),
('2026-05-26', 2, 2, 'TEMPERATURE'),
('2026-05-27', 3, 2, 'TEMPERATURE'),
('2026-05-28', 34, 2, 'TEMPERATURE'),
('2026-05-23', 10, 2, 'HUMIDITE'),
('2026-05-24', 33, 2, 'HUMIDITE'),
('2026-05-25', 2, 2, 'HUMIDITE'),
('2026-05-26', 2, 2, 'HUMIDITE'),
('2026-05-27', 3, 2, 'HUMIDITE'),
('2026-05-28', 34, 2, 'HUMIDITE'),
('2026-05-23', 10, 2, 'HALLSENSOR'),
('2026-05-24', 33, 2, 'HALLSENSOR'),
('2026-05-25', 2, 2, 'HALLSENSOR'),
('2026-05-26', 2, 2, 'HALLSENSOR'),
('2026-05-27', 3, 2, 'HALLSENSOR'),
('2026-05-28', 34, 2, 'HALLSENSOR'),
('2026-05-23', 10, 2, 'VIBRATION'),
('2026-05-24', 33, 2, 'VIBRATION'),
('2026-05-25', 2, 2, 'VIBRATION'),
('2026-05-26', 2, 2, 'VIBRATION'),
('2026-05-27', 3, 2, 'VIBRATION'),
('2026-05-28', 34, 2, 'VIBRATION'),
('2016-05-13', 1, 3, 'VIBRATION'),
('2036-05-14', 32, 3, 'VIBRATION'),
('2036-05-15', 10, 3, 'VIBRATION'),
('2036-05-16', 5, 3, 'VIBRATION'),
('2036-05-17', 0, 3, 'VIBRATION'),
('2036-05-18', 34, 3, 'VIBRATION'),
('2016-05-13', 1, 3, 'TEMPERATURE'),
('2036-05-14', 32, 3, 'TEMPERATURE'),
('2036-05-15', 10, 3, 'TEMPERATURE'),
('2036-05-16', 5, 3, 'TEMPERATURE'),
('2036-05-17', 0, 3, 'TEMPERATURE'),
('2036-05-18', 34, 3, 'TEMPERATURE'),
('2016-05-13', 1, 3, 'HUMIDITE'),
('2036-05-14', 32, 3, 'HUMIDITE'),
('2036-05-15', 10, 3, 'HUMIDITE'),
('2036-05-16', 5, 3, 'HUMIDITE'),
('2036-05-17', 0, 3, 'HUMIDITE'),
('2036-05-18', 34, 3, 'HUMIDITE'),
('2016-05-13', 1, 4, 'HUMIDITE'),
('2036-05-14', 32, 4, 'HUMIDITE'),
('2036-05-15', 10, 4, 'HUMIDITE'),
('2036-05-16', 5, 4, 'HUMIDITE'),
('2036-05-17', 0, 4, 'HUMIDITE'),
('2036-05-18', 34, 4, 'HUMIDITE'),
('2016-05-13', 1, 4, 'TEMPERATURE'),
('2036-05-14', 32, 4, 'TEMPERATURE'),
('2036-05-15', 10, 4, 'TEMPERATURE'),
('2036-05-16', 5, 4, 'TEMPERATURE'),
('2036-05-17', 0, 4, 'TEMPERATURE'),
('2036-05-18', 34, 4, 'TEMPERATURE'),
('2016-05-13', 1, 4, 'HALLSENSOR'),
('2036-05-14', 32, 4, 'HALLSENSOR'),
('2036-05-15', 10, 4, 'HALLSENSOR'),
('2036-05-16', 5, 4, 'HALLSENSOR'),
('2036-05-17', 0, 4, 'HALLSENSOR'),
('2036-05-18', 34, 4, 'HALLSENSOR'),
('2016-05-13', 1, 4, 'VIBRATION'),
('2036-05-14', 32, 4, 'VIBRATION'),
('2036-05-15', 10, 4, 'VIBRATION'),
('2036-05-16', 5, 4, 'VIBRATION'),
('2036-05-17', 0, 4, 'VIBRATION'),
('2036-05-18', 34, 4, 'VIBRATION'),
('2016-05-13', 10, 5, 'VIBRATION'),
('2036-05-14', 2, 5, 'VIBRATION'),
('2036-05-15', 110, 5, 'VIBRATION'),
('2036-05-16', 50, 5, 'VIBRATION'),
('2036-05-17', 20, 5, 'VIBRATION'),
('2036-05-18', 11, 5, 'VIBRATION'),
('2016-05-13', 10, 5, 'TEMPERATURE'),
('2036-05-14', 2, 5, 'TEMPERATURE'),
('2036-05-15', 110, 5, 'TEMPERATURE'),
('2036-05-16', 50, 5, 'TEMPERATURE'),
('2036-05-17', 20, 5, 'TEMPERATURE'),
('2036-05-18', 11, 5, 'TEMPERATURE'),
('2016-05-13', 10, 5, 'HUMIDITE'),
('2036-05-14', 2, 5, 'HUMIDITE'),
('2036-05-15', 110, 5, 'HUMIDITE'),
('2036-05-16', 50, 5, 'HUMIDITE'),
('2036-05-17', 20, 5, 'HUMIDITE'),
('2036-05-18', 11, 5, 'HUMIDITE'),
('2016-05-13', 10, 5, 'HALLSENSOR'),
('2036-05-14', 2, 5, 'HALLSENSOR'),
('2036-05-15', 110, 5, 'HALLSENSOR'),
('2036-05-16', 50, 5, 'HALLSENSOR'),
('2036-05-17', 20, 5, 'HALLSENSOR'),
('2036-05-18', 11, 5, 'HALLSENSOR'),
('2016-05-13', 10, 6, 'HALLSENSOR'),
('2036-05-14', 2, 6, 'HALLSENSOR'),
('2036-05-15', 110, 6, 'HALLSENSOR'),
('2036-05-16', 50, 6, 'HALLSENSOR'),
('2036-05-17', 20, 6, 'HALLSENSOR'),
('2036-05-18', 11, 6, 'HALLSENSOR'),
('2016-05-13', 34, 6, 'VIBRATION'),
('2036-05-14', 22, 6, 'VIBRATION'),
('2036-05-15', 0, 6, 'VIBRATION'),
('2036-05-16', 50, 6, 'VIBRATION'),
('2036-05-17', 20, 6, 'VIBRATION'),
('2036-05-18', 2, 6, 'VIBRATION'),
('2016-05-13', 34, 6, 'TEMPERATURE'),
('2036-05-14', 22, 6, 'TEMPERATURE'),
('2036-05-15', 0, 6, 'TEMPERATURE'),
('2036-05-16', 50, 6, 'TEMPERATURE'),
('2036-05-17', 20, 6, 'TEMPERATURE'),
('2036-05-18', 2, 6, 'TEMPERATURE');

-- --------------------------------------------------------

--
-- Structure de la table `specta_types`
--

CREATE TABLE `specta_types` (
  `ID` int(11) NOT NULL,
  `product` varchar(102) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specta_types`
--

INSERT INTO `specta_types` (`ID`, `product`, `description`) VALUES
(1, 'ampli', 'On parle d\'amplificateur de force pour toute une palette de systèmes qui amplifient les efforts : mécanique, hydraulique, pneumatique, électrique.'),
(2, 'radio', 'Le préfixe radio- (du latin radius, « rayon ») est en général lié à l\'étude ou à l\'utilisation des ondes radio.\r\nL\'abréviation radio désigne couramment la radiodiffusion ou la radiocommunication.');

-- --------------------------------------------------------

--
-- Structure de la table `spect_years`
--

CREATE TABLE `spect_years` (
  `date` date NOT NULL,
  `value` int(255) NOT NULL,
  `device_id` int(255) NOT NULL,
  `type_capture` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `spect_years`
--

INSERT INTO `spect_years` (`date`, `value`, `device_id`, `type_capture`) VALUES
('2016-05-12', 13, 4, 'TEMPERATURE'),
('2016-06-08', 23, 4, 'TEMPERATURE'),
('2016-07-20', 16, 4, 'TEMPERATURE'),
('2016-09-12', 16, 4, 'TEMPERATURE'),
('2016-08-12', 18, 4, 'TEMPERATURE'),
('2016-04-12', 16, 4, 'TEMPERATURE'),
('2016-05-12', 13, 4, 'HUMIDITE'),
('2016-06-08', 23, 4, 'HUMIDITE'),
('2016-07-20', 16, 4, 'HUMIDITE'),
('2016-09-12', 16, 4, 'HUMIDITE'),
('2016-08-12', 18, 4, 'HUMIDITE'),
('2016-04-12', 16, 4, 'HALLSENSOR'),
('2016-05-12', 13, 4, 'HALLSENSOR'),
('2016-06-08', 23, 4, 'HALLSENSOR'),
('2016-07-20', 16, 4, 'HALLSENSOR'),
('2016-09-12', 16, 4, 'HALLSENSOR'),
('2016-08-12', 18, 4, 'VIBRATION'),
('2016-04-12', 16, 4, 'VIBRATION'),
('2016-05-12', 13, 4, 'VIBRATION'),
('2016-06-08', 23, 4, 'VIBRATION'),
('2016-07-20', 16, 4, 'VIBRATION'),
('2016-09-12', 16, 4, 'VIBRATION'),
('2016-08-12', 18, 4, 'VIBRATION'),
('2016-04-12', 16, 4, 'TEMPERATURE'),
('2016-05-12', 13, 4, 'TEMPERATURE'),
('2016-06-08', 23, 4, 'TEMPERATURE'),
('2016-07-20', 16, 4, 'TEMPERATURE'),
('2016-09-12', 16, 4, 'TEMPERATURE'),
('2016-08-12', 18, 4, 'TEMPERATURE'),
('2016-05-12', 23, 1, 'HUMIDITE'),
('2016-06-08', 43, 1, 'HUMIDITE'),
('2016-07-20', 16, 1, 'HUMIDITE'),
('2016-09-12', 12, 1, 'HUMIDITE'),
('2016-08-12', 8, 1, 'HUMIDITE'),
('2016-04-12', 6, 1, 'HALLSENSOR'),
('2016-05-12', 13, 1, 'HALLSENSOR'),
('2016-06-08', 22, 1, 'HALLSENSOR'),
('2016-07-20', 19, 1, 'HALLSENSOR'),
('2016-09-12', 5, 1, 'HALLSENSOR'),
('2016-08-12', 18, 1, 'VIBRATION'),
('2016-04-12', 4, 1, 'VIBRATION'),
('2016-05-12', 4, 1, 'VIBRATION'),
('2016-06-08', 9, 1, 'VIBRATION'),
('2016-07-20', 10, 1, 'VIBRATION'),
('2016-09-12', 16, 1, 'VIBRATION'),
('2016-08-12', 18, 1, 'VIBRATION'),
('2016-04-12', 16, 1, 'TEMPERATURE'),
('2016-05-12', 60, 1, 'TEMPERATURE'),
('2016-06-08', 23, 1, 'TEMPERATURE'),
('2016-07-20', 45, 1, 'TEMPERATURE'),
('2016-09-12', 16, 1, 'TEMPERATURE'),
('2016-08-12', 18, 1, 'TEMPERATURE'),
('2016-05-12', 23, 2, 'HUMIDITE'),
('2016-06-08', 43, 2, 'HUMIDITE'),
('2016-07-20', 16, 2, 'HUMIDITE'),
('2016-09-12', 12, 2, 'HUMIDITE'),
('2016-08-12', 8, 2, 'HUMIDITE'),
('2016-04-12', 6, 2, 'HALLSENSOR'),
('2016-05-12', 13, 2, 'HALLSENSOR'),
('2016-06-08', 22, 2, 'HALLSENSOR'),
('2016-07-20', 19, 2, 'HALLSENSOR'),
('2016-09-12', 5, 2, 'HALLSENSOR'),
('2016-08-12', 18, 2, 'VIBRATION'),
('2016-04-12', 4, 2, 'VIBRATION'),
('2016-05-12', 4, 2, 'VIBRATION'),
('2016-06-08', 9, 2, 'VIBRATION'),
('2016-07-20', 10, 2, 'VIBRATION'),
('2016-09-12', 16, 2, 'VIBRATION'),
('2016-08-12', 18, 2, 'VIBRATION'),
('2016-04-12', 16, 2, 'TEMPERATURE'),
('2016-05-12', 60, 2, 'TEMPERATURE'),
('2016-06-08', 23, 2, 'TEMPERATURE'),
('2016-07-20', 45, 2, 'TEMPERATURE'),
('2016-09-12', 16, 2, 'TEMPERATURE'),
('2016-08-12', 18, 2, 'TEMPERATURE'),
('2016-05-12', 3, 3, 'HUMIDITE'),
('2016-06-08', 43, 3, 'HUMIDITE'),
('2016-07-20', 1, 3, 'HUMIDITE'),
('2016-09-12', 3, 3, 'HUMIDITE'),
('2016-08-12', 8, 3, 'HUMIDITE'),
('2016-04-12', 6, 3, 'HALLSENSOR'),
('2016-05-12', 45, 3, 'HALLSENSOR'),
('2016-06-08', 10, 3, 'HALLSENSOR'),
('2016-07-20', 19, 3, 'HALLSENSOR'),
('2016-09-12', 5, 3, 'HALLSENSOR'),
('2016-08-12', 18, 3, 'VIBRATION'),
('2016-04-12', 4, 3, 'VIBRATION'),
('2016-05-12', 12, 3, 'VIBRATION'),
('2016-06-08', 9, 3, 'VIBRATION'),
('2016-07-20', 10, 3, 'VIBRATION'),
('2016-09-12', 30, 3, 'VIBRATION'),
('2016-08-12', 18, 3, 'VIBRATION'),
('2016-04-12', 4, 3, 'TEMPERATURE'),
('2016-05-12', 60, 3, 'TEMPERATURE'),
('2016-06-08', 23, 3, 'TEMPERATURE'),
('2016-07-20', 50, 3, 'TEMPERATURE'),
('2016-09-12', 20, 3, 'TEMPERATURE'),
('2016-08-12', 18, 3, 'TEMPERATURE'),
('2016-05-12', 31, 5, 'HUMIDITE'),
('2016-06-08', 5, 5, 'HUMIDITE'),
('2016-07-20', 11, 5, 'HUMIDITE'),
('2016-09-12', 31, 5, 'HUMIDITE'),
('2016-08-12', 18, 5, 'HUMIDITE'),
('2016-04-12', 16, 5, 'HALLSENSOR'),
('2016-05-12', 5, 5, 'HALLSENSOR'),
('2016-06-08', 11, 5, 'HALLSENSOR'),
('2016-07-20', 11, 5, 'HALLSENSOR'),
('2016-09-12', 51, 5, 'HALLSENSOR'),
('2016-08-12', 8, 5, 'VIBRATION'),
('2016-04-12', 14, 5, 'VIBRATION'),
('2016-05-12', 12, 5, 'VIBRATION'),
('2016-06-08', 9, 5, 'VIBRATION'),
('2016-07-20', 10, 5, 'VIBRATION'),
('2016-09-12', 20, 5, 'VIBRATION'),
('2016-08-12', 18, 5, 'VIBRATION'),
('2016-04-12', 42, 5, 'TEMPERATURE'),
('2016-05-12', 10, 5, 'TEMPERATURE'),
('2016-06-08', 13, 5, 'TEMPERATURE'),
('2016-07-20', 30, 5, 'TEMPERATURE'),
('2016-09-12', 20, 5, 'TEMPERATURE'),
('2016-08-12', 28, 5, 'TEMPERATURE'),
('2016-05-12', 1, 5, 'HUMIDITE'),
('2016-06-08', 115, 5, 'HUMIDITE'),
('2016-07-20', 1, 5, 'HUMIDITE'),
('2016-09-12', 12, 5, 'HUMIDITE'),
('2016-08-12', 8, 5, 'HUMIDITE'),
('2016-04-12', 12, 5, 'HALLSENSOR'),
('2016-05-12', 15, 5, 'HALLSENSOR'),
('2016-06-08', 10, 5, 'HALLSENSOR'),
('2016-07-20', 41, 5, 'HALLSENSOR'),
('2016-09-12', 1, 5, 'HALLSENSOR'),
('2016-08-12', 82, 5, 'VIBRATION'),
('2016-04-12', 14, 5, 'VIBRATION'),
('2016-05-12', 12, 5, 'VIBRATION'),
('2016-06-08', 9, 5, 'VIBRATION'),
('2016-07-20', 1, 5, 'VIBRATION'),
('2016-09-12', 20, 5, 'VIBRATION'),
('2016-08-12', 18, 5, 'VIBRATION'),
('2016-04-12', 42, 5, 'TEMPERATURE'),
('2016-05-12', 12, 5, 'TEMPERATURE'),
('2016-06-08', 13, 5, 'TEMPERATURE'),
('2016-07-20', 30, 5, 'TEMPERATURE'),
('2016-09-12', 1, 5, 'TEMPERATURE'),
('2016-08-12', 28, 5, 'TEMPERATURE');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `specta_client`
--
ALTER TABLE `specta_client`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `specta_device`
--
ALTER TABLE `specta_device`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `specta_types`
--
ALTER TABLE `specta_types`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `specta_client`
--
ALTER TABLE `specta_client`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `specta_device`
--
ALTER TABLE `specta_device`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Numéro de série', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `specta_types`
--
ALTER TABLE `specta_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
