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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.images: ~2 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`iid`, `title`, `path`, `alt`, `description`, `uploaded`) VALUES
	(1, 'Chouginga Gurren Lagann', 'http://storge.pic2.me/cm/800x480/736/5293fff046aad.jpg', NULL, NULL, '2015-02-20 19:51:25'),
	(2, 'Raison D\'etre GL ', 'http://storge.pic2.me/cm/800x480/494/52940079ab7f5.jpg', NULL, NULL, '2015-02-20 20:21:29');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.menu_links
CREATE TABLE IF NOT EXISTS `menu_links` (
  `mlid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `plid` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `FK_menu_links_menu_links` (`plid`),
  CONSTRAINT `FK_menu_links_menu_links` FOREIGN KEY (`plid`) REFERENCES `menu_links` (`mlid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.menu_links: ~5 rows (approximately)
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` (`mlid`, `title`, `path`, `plid`, `weight`) VALUES
	(29, 'Home', 'Home', NULL, 0),
	(30, 'Example Page', 'GeneratedPage', NULL, 0),
	(31, 'Page Two', 'PageNumberTwo', 30, 0),
	(32, 'Dev Notes', 'DevNotes', NULL, 0),
	(33, 'Looking for work?', 'JobListings', NULL, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.pages: ~5 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`pid`, `title`, `body`, `img_id`, `user_id`, `video_id`, `created`) VALUES
	(2, 'Welcome!', 'This is a site where you can post things about things :)			', NULL, 1, NULL, '2015-02-22 16:50:12'),
	(3, 'This is a user generated page!', 'Here you can lorem your ipsum.\nAnd ipsum your lorem.', NULL, 1, NULL, '2015-02-22 17:56:57'),
	(4, 'Generated Page number two!', 'You can also nest your pages!\nAnd ipsum lorem ipsum and such.										', NULL, 1, NULL, '2015-02-22 17:58:56'),
	(5, 'Dev Notes', 'A feature that doesn\'t work as of yet is the part where you can choose an accompanying image to your post in the select list in the admin pages form.\n\nYou can choose an image, but it doesn\'t really do anything.\n\nOther things that are currently missing:\nA banner and a footer.\nOverall cool transitions.\nA rich text editor for the admin pages form.\nAnd a more competent dev.\n\n						', NULL, 1, NULL, '2015-02-22 18:04:03'),
	(6, 'Animestuff.web Is currently hiring!', 'Are you a even slightly competent web-designer/developer with a talent for not procrastinating and doing other things while you should be developing websites and do code?\n\nThen we are looking for you!\nAnimestuff.web are looking to hire a full time web-designer/developer for our site.\nThe hours are pretty flexible and we offer a decent dental plan.\nIf this sounds interesting, do not hesitate to send your resume and a short presentation of yourself to: \nanimestuff@email.web\n\nWe look forward to reading your application!', NULL, 1, NULL, '2015-02-22 18:11:58');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Dumping structure for table hn_webproduktion.url_alias
CREATE TABLE IF NOT EXISTS `url_alias` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table hn_webproduktion.url_alias: ~5 rows (approximately)
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
INSERT INTO `url_alias` (`aid`, `path`, `pid`) VALUES
	(2, 'Home', 2),
	(3, 'GeneratedPage', 3),
	(4, 'PageNumberTwo', 4),
	(5, 'DevNotes', 5),
	(6, 'JobListings', 6);
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
