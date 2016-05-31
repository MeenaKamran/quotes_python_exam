CREATE DATABASE  IF NOT EXISTS `quotedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Quotedb`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: Quotedb
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_quotes_idx` (`quote_id`),
  KEY `fk_favorites_users1_idx` (`user_id`),
  CONSTRAINT `fk_favorites_quotes` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (11,4,2),(12,3,2),(13,6,4),(14,2,4),(16,6,1),(17,3,3),(18,7,3),(19,8,3),(20,8,2),(21,10,4),(22,10,2),(23,2,1);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `quoted_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotes_users1_idx` (`user_id`),
  CONSTRAINT `fk_quotes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Do not go where the path may lead, go instead where there is no path','Ralph Waldo Emerson','2016-05-20 11:34:19',2),(2,'Experience is not what happens to you, it\'s what you do with what happens to you','Aldous Huxley','2016-05-20 11:34:19',1),(3,'It\'s not what you look at that matters, it\'s what you see','Henry David Thoreau','2016-05-20 12:02:36',3),(4,'A man must be big enough to admit his mistakes, smart enough to profit from them, and strong enough to correct them.','John C. Maxwell','2016-05-20 12:14:43',4),(5,'If you talk to a man in a language that he understands, that goes to his head. If you talk to him in his language, that goes to his heart.','Nelson Mandela','2016-05-21 16:30:18',2),(6,'To succeed in your mission, you must have single-minded devotion to your goal.','A.P.J Abdul Kalam','2016-05-21 20:59:41',2),(7,'Strive not to be a success, but rather to be of value','Albert Einstein','2016-05-21 22:34:40',3),(8,'Live as if you were to die tomorrow; learn as if you were to live forever.','Mohandas K. Gandhi','2016-05-22 20:29:17',3),(9,'No matter what happens in life, be good to people. Being good to people is a wonderful legacy to leave behind.','Taylor Swift','2016-05-22 20:31:38',4),(10,'Whatever happens to you, you can either see it as a curse and suffer it, or you can see it as a blessing and make use of it.','Sadhguru','2016-05-22 20:33:34',4);
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Meena','Meenu','meena@meena.com','$2b$12$CrQVa7gp..IVgSmmhClQveDaIW81.9LtmozOUGdTROpR7oSHGw5fK','2016-05-20 12:20:45'),(2,'Anjali','Vani','anjali@anjali.com','$2b$12$sD.dnrslEmg.SVbsVMJ6EO2VJavBDFYQk9TYXVx0TtKYJHpW7XHh.','2016-05-20 12:20:45'),(3,'Kapil','Kai','Kapil@smark.com','$2b$12$rZanaNEAUQr4bs2FQLdM2.yIywWMqhaQN.Uvb4uW8JuxFQ5h7B.9y','2016-05-20 12:20:45'),(4,'Radhika','Radz','Radz@smark.com','$2b$12$Y2DprBg0z6SOh7526N/BYe8Awuad/emdXGf8MpBmdP7Bn.dMHt61a','2016-05-20 12:20:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 20:29:19
