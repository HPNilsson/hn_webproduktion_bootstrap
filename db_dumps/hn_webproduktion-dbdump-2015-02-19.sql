-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Server version:               5.6.20 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for hn_webproduktion
CREATE DATABASE IF NOT EXISTS `hn_webproduktion` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hn_webproduktion`;


-- Dumping structure for table hn_webproduktion.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
	(1, 'Standard user', ''),
	(2, 'Administrator', '{"admin": 1}');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.images
CREATE TABLE IF NOT EXISTS `images` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` text,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.images: ~0 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.menu_links
CREATE TABLE IF NOT EXISTS `menu_links` (
  `mlid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `plid` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `plid` (`plid`),
  CONSTRAINT `menu_links_ibfk_1` FOREIGN KEY (`plid`) REFERENCES `menu_links` (`mlid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.menu_links: ~2 rows (approximately)
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` (`mlid`, `title`, `path`, `plid`, `weight`) VALUES
	(14, 'adaw2as3qe', 'awdawdawdaw', NULL, 0),
	(15, 'a23qwq2', '23123w', NULL, 0);
/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.pages: ~11 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`pid`, `title`, `body`, `img_id`, `user_id`, `video_id`, `created`) VALUES
	(5, 'papadopulus', 'papapapapararparapaa										', NULL, 1, NULL, '2015-02-18 15:06:36'),
	(6, 'christonastick', '			asdasdasdasdasdas							', NULL, 1, NULL, '2015-02-18 15:07:09'),
	(7, 'tomato', 'tomatototo										', NULL, 1, NULL, '2015-02-18 15:07:25'),
	(8, 'potato', 'potpaptao										', NULL, 1, NULL, '2015-02-18 15:07:39'),
	(9, 'aubergine', 'aubergineinin										', NULL, 1, NULL, '2015-02-18 15:07:58'),
	(10, 'sparrisparris', 'parissparris										', NULL, 1, NULL, '2015-02-18 15:08:16'),
	(11, 'adadwawda', '		dawdawdawdawdawd								', NULL, 1, NULL, '2015-02-18 15:10:51'),
	(12, 'awdaw2ad2aw2', '				awdawdad						', NULL, 1, NULL, '2015-02-18 15:13:40'),
	(13, '2222', '					adasd555522					', NULL, 1, NULL, '2015-02-18 15:15:13'),
	(14, '123213', '			123							', NULL, 1, NULL, '2015-02-19 14:20:58'),
	(15, 'asdaweasd', '		dadsaweas', NULL, 1, NULL, '2015-02-19 14:23:00');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.url_alias
CREATE TABLE IF NOT EXISTS `url_alias` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.url_alias: ~11 rows (approximately)
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
INSERT INTO `url_alias` (`aid`, `path`, `pid`) VALUES
	(3, 'paaaaaaaapadopulus', 5),
	(4, 'stickoftruuuth', 6),
	(5, 'tomatoo', 7),
	(6, 'potatooo', 8),
	(7, 'auberginein', 9),
	(8, 'sparrispariss', 10),
	(9, 'awdawdawdaw', 11),
	(10, 'ae12a2eaq2eas', 12),
	(11, '212312', 13),
	(12, '123123123', 14),
	(13, '23123w', 15);
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.users
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`, `username`, `password`, `salt`, `name`, `joined`, `group`) VALUES
	(1, 'Henriku', '123', '', 'HenrikN', '0000-00-00 00:00:00', 0),
	(2, 'Bobeeen', 'password', 'salt', 'Bengan Bobb', '2015-02-03 00:00:00', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.users_session
CREATE TABLE IF NOT EXISTS `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.users_session: ~0 rows (approximately)
/*!40000 ALTER TABLE `users_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_session` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
