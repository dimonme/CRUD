CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.1.53-community

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `age` int(3) NOT NULL,
  `isAdmin` bit(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Игорь',24,'','2017-02-21 18:24:52'),(2,'IvanSan',26,'','2017-02-21 10:37:46'),(3,'Alexei',30,'\0','2017-02-20 18:59:50'),(4,'Марк',44,'\0','2017-02-20 19:42:29'),(5,'Antony',72,'\0','2017-02-15 20:15:49'),(6,'Cesar',48,'\0','2017-02-15 20:15:39'),(7,'Roarg',43,'\0','2017-02-16 18:16:49'),(8,'Rollo',42,'\0','2017-02-16 18:15:54'),(9,'Ragnar',45,'\0','2017-02-16 18:16:16'),(10,'Ivan',29,'','2017-02-21 13:57:10'),(11,'Ivan',28,'','2017-02-21 14:00:11'),(12,'Alex',20,'\0','2017-02-18 20:22:48'),(13,'Alex',20,'\0','2017-02-19 18:14:36'),(14,'Alex',20,'\0','2017-02-19 18:15:07'),(15,'Alex',20,'\0','2017-02-19 19:04:42'),(16,'Alex',20,'\0','2017-02-19 19:02:50'),(17,'Alex',20,'','2017-02-21 18:32:17'),(18,'Alex',20,'\0','2017-02-19 19:37:16'),(19,'Alex',20,'\0','2017-02-19 19:39:48'),(20,'Alex',20,'\0','2017-02-19 19:41:54'),(21,'Kirill',20,'\0','2017-02-19 19:41:54'),(22,'Alex',20,'\0','2017-02-19 19:43:38'),(23,'Kirill',20,'\0','2017-02-19 19:43:38'),(24,'Alex',20,'\0','2017-02-19 19:59:31'),(25,'Kirill',20,'\0','2017-02-19 19:59:31'),(26,'Alex',20,'\0','2017-02-19 20:10:15'),(27,'Kirill',20,'\0','2017-02-19 20:10:15'),(28,'Alex',20,'\0','2017-02-19 20:12:28'),(29,'Alex',20,'\0','2017-02-19 20:14:00'),(30,'Alex',20,'\0','2017-02-19 22:50:44'),(31,'Kirill',20,'\0','2017-02-19 22:50:44'),(32,'Alex',20,'\0','2017-02-19 22:51:56'),(33,'Kirill',20,'\0','2017-02-19 22:51:56'),(34,'Alex',20,'\0','2017-02-19 23:02:11'),(35,'Kirill',20,'\0','2017-02-19 23:02:11'),(36,'Alex',20,'\0','2017-02-20 18:46:44'),(37,'kira',88,'\0','2017-02-21 15:58:02');
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

-- Dump completed on 2017-02-18 22:07:35
