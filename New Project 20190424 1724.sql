-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.62


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema chat_bot
--

CREATE DATABASE IF NOT EXISTS chat_bot;
USE chat_bot;

--
-- Definition of table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `bkid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`bkid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block`
--

/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` (`bkid`,`uid`,`name`) VALUES 
 (5,'null',''),
 (6,'null','Shivangi'),
 (7,'3','Shivangi'),
 (8,'null','');
/*!40000 ALTER TABLE `block` ENABLE KEYS */;


--
-- Definition of table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `user` varchar(1000) NOT NULL,
  `bot` varchar(1000) NOT NULL,
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(90) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`user`,`bot`,`chatid`,`uid`,`date`,`time`) VALUES 
 ('who are you?','i am human generated bot.',1200,'2','2019-04-22','17:19:18.013'),
 ('who are you?','i am human generated bot.',1201,'3','2020-05-20','23:28:14.188');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1000) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`uid`,`Name`,`contact`,`email`,`password`) VALUES 
 (1,'Mayuresh Deshmukh','7773902008','mayureshdeshmukh101@gmail.com','Mayuresh123!@#'),
 (3,'Chetan','9090909090','c@gmail.com','Chetan123!@#');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


--
-- Definition of table `unrecognize`
--

DROP TABLE IF EXISTS `unrecognize`;
CREATE TABLE `unrecognize` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unrecognize`
--

/*!40000 ALTER TABLE `unrecognize` DISABLE KEYS */;
INSERT INTO `unrecognize` (`qid`,`question`,`userid`,`date`,`time`) VALUES 
 (1,'hi','1','2019-04-05','14:24:28.583'),
 (2,'hi','1','2019-04-05','18:57:34.838'),
 (3,'how are you?','1','2019-04-05','18:57:41.872'),
 (4,'hi','1','2019-04-05','18:57:45.791'),
 (5,'hi','1','2019-04-05','18:58:36.616'),
 (6,'hi','1','2019-04-11','11:37:02.132'),
 (7,'who are you?','1','2019-04-11','11:37:39.642'),
 (8,'who are you','1','2019-04-11','14:57:32.336'),
 (9,'kjweb','1','2019-04-12','18:25:47.958'),
 (10,'kjbksbv','1','2019-04-12','18:26:30.536'),
 (11,'who are you?','2','2019-04-22','17:08:03.604'),
 (12,'how are you?','2','2019-04-22','17:08:49.935'),
 (13,'who are you?','2','2019-04-22','17:08:58.413'),
 (14,'h','2','2019-04-22','17:10:42.088'),
 (15,'how are you?','2','2019-04-22','17:10:50.900'),
 (16,'who are you?','2','2019-04-22','17:11:02.696'),
 (17,'kokokokokokokokokokokokoko','2','2019-04-22','17:11:26.476'),
 (18,'kokokokokokokokokokokokoko','2','2019-04-22','17:14:30.659'),
 (19,'kokokokokokokokokokokokoko','2','2019-04-22','17:14:30.659'),
 (20,'c','2','2019-04-22','17:14:36.836'),
 (22,'who are you?','2','2019-04-22','17:14:51.495'),
 (23,'who are you?','2','2019-04-22','17:15:53.717'),
 (24,'who are you?','2','2019-04-22','17:16:03.447'),
 (26,'who are you?','2','2019-04-22','17:16:22.433'),
 (27,'who are you?','2','2019-04-22','17:18:35.022'),
 (28,'how are you?','2','2019-04-22','17:18:40.233'),
 (29,'who are you?','3','2020-05-20','23:28:14.188');
/*!40000 ALTER TABLE `unrecognize` ENABLE KEYS */;


--
-- Definition of table `words`
--

DROP TABLE IF EXISTS `words`;
CREATE TABLE `words` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `synonym` varchar(1000) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `words`
--

/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` (`uid`,`word`,`answer`,`synonym`) VALUES 
 (8,'who are you?','i am human generated bot.','who'),
 (9,'a','a? a is the first character from english alphabets','a');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
