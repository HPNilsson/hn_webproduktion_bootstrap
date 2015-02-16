-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 16 feb 2015 kl 19:54
-- Serverversion: 5.6.20
-- PHP-version: 5.6.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `hn_webproduktion`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Standard user', ''),
(2, 'Administrator', '{"admin": 1}');

-- --------------------------------------------------------

--
-- Tabellstruktur `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
`mlid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `plid` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `menu_links`
--

INSERT INTO `menu_links` (`mlid`, `title`, `path`, `plid`, `weight`) VALUES
(1, 'Sida1 ', 'banan', NULL, 0),
(2, 'sida2', 'banan2', NULL, 0),
(3, 'dfdsfcs', 'sdfsdfs', NULL, 0),
(4, 'dsfsdf', 'sdfsdfsd', NULL, 0),
(5, 'asdasfa', 'fdfsdfs', 1, 0),
(6, 'fadfsds', 'asdfasdsad', 2, 0),
(8, 'asdsadasda', 'asdsad', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `pages`
--

INSERT INTO `pages` (`pid`, `title`, `body`, `img_id`, `user_id`, `video_id`, `created`) VALUES
(0, 'Bogeli', 'asdasdasdasdass', NULL, 1, NULL, '2015-01-27 21:52:50'),
(3, 'My first title!', '<p>Azathoth r''luh Cthulhu nnnYoggoth cep geb n''gha, f''hlirgh ''bthnk wgah''n y''hah zhro uln geb, ya hrii ee nashagg nilgh''ri. Hai ph''chtenff nog ckadishtu shogg ftaghu sll''ha shtunggli, ''ai nageb Azathoth Yoggoth tharanak geb Shub-Niggurath, Azathoth ee Dagon uh''e llllog s''uhn. Shagg hlirgh h''chtenff hrii lloig vulgtm hupadgh ebunma r''luh nguaaah ck''yarnak hlirgh grah''n, y''hah nw ron ehye zhroog phlegeth chtenff lw''nafh naflR''lyeh ftaghu nglui, ftaghu k''yarnak ch'' mnahn'' nasgn''wahl gotha vulgtm syha''h f''shogg nglui nw. Ph''hai kadishtu fhtagn ulnor hrii Nyarlathotep geb sgn''wahlagl Chaugnar Faugnoth mg Tsathoggua phlegeth, ''fhalma h''mnahn'' chtenff R''lyeh c''bthnk y-hupadgh ph''gnaiih wgah''n ep.</p>', NULL, 1, NULL, '2015-01-15 10:17:33'),
(0, 'Bogeliii', '		asdasddarqwqe								', NULL, 1, NULL, '2015-01-29 09:39:20'),
(0, '', '										', NULL, 1, NULL, '2015-01-29 09:43:21'),
(0, 'lool', '	blkhö', NULL, 1, NULL, '2015-01-29 10:18:43'),
(0, '', '										', NULL, 1, NULL, '2015-01-29 10:21:45'),
(0, '', '										', NULL, 1, NULL, '2015-01-29 10:29:20'),
(0, '', '										', NULL, 1, NULL, '2015-01-29 10:29:55'),
(0, '', '			sas							', NULL, 1, NULL, '2015-01-29 10:34:52'),
(0, 'stiiig', '		lllaaaaaaaama								', NULL, 1, NULL, '2015-02-16 14:47:08'),
(0, 'mööööh', '			hgjgjg							', NULL, 1, NULL, '2015-02-16 14:50:49'),
(0, 'saassadsaddw24443', '		aweqe12qwe212								', NULL, 1, NULL, '2015-02-16 14:51:42'),
(0, '12412wsrq31', '			wer							', NULL, 1, NULL, '2015-02-16 14:52:59'),
(0, 'SDWDEWDAS', '		ASAFWSQW								', NULL, 1, NULL, '2015-02-16 14:55:25'),
(0, 'adaweawe2', '		sweaefaswqwq								', NULL, 1, NULL, '2015-02-16 15:30:30'),
(0, 'asdasdasd', '		asddasda								', NULL, 1, NULL, '2015-02-16 15:33:25');

-- --------------------------------------------------------

--
-- Tabellstruktur `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `aid` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`uid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `salt`, `name`, `joined`, `group`) VALUES
(1, 'Henriku', '123', '', 'HenrikN', '0000-00-00 00:00:00', 0),
(2, 'Bobeeen', 'password', 'salt', 'Bengan Bobb', '2015-02-03 00:00:00', 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `users_session`
--

CREATE TABLE IF NOT EXISTS `users_session` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Index för tabell `menu_links`
--
ALTER TABLE `menu_links`
 ADD PRIMARY KEY (`mlid`), ADD KEY `plid` (`plid`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`);

--
-- Index för tabell `users_session`
--
ALTER TABLE `users_session`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `groups`
--
ALTER TABLE `groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT för tabell `menu_links`
--
ALTER TABLE `menu_links`
MODIFY `mlid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT för tabell `users_session`
--
ALTER TABLE `users_session`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `menu_links`
--
ALTER TABLE `menu_links`
ADD CONSTRAINT `menu_links_ibfk_1` FOREIGN KEY (`plid`) REFERENCES `menu_links` (`mlid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
