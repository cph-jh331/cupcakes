CREATE DATABASE  IF NOT EXISTS `cupcakeproject` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cupcakeproject`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 207.154.197.253    Database: cupcakeproject
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `cakebottoms`
--

DROP TABLE IF EXISTS `cakebottoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cakebottoms` (
  `bname` varchar(40) NOT NULL,
  `bprice` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cakebottoms`
--

LOCK TABLES `cakebottoms` WRITE;
/*!40000 ALTER TABLE `cakebottoms` DISABLE KEYS */;
INSERT INTO `cakebottoms` VALUES ('Almond',7),('Chocolate',5),('Nutmeg',5),('Pistacio',6),('Vanilla',5);
/*!40000 ALTER TABLE `cakebottoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caketoppings`
--

DROP TABLE IF EXISTS `caketoppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caketoppings` (
  `tname` varchar(40) NOT NULL,
  `tprice` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caketoppings`
--

LOCK TABLES `caketoppings` WRITE;
/*!40000 ALTER TABLE `caketoppings` DISABLE KEYS */;
INSERT INTO `caketoppings` VALUES ('Blue cheese',9),('Blueberry',5),('Chocolate',5),('Crispy',6),('Lemon',8),('Orange',8),('Rasberry',5),('Rum/Raisin',7),('Strawberry',6);
/*!40000 ALTER TABLE `caketoppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odetails`
--

DROP TABLE IF EXISTS `odetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odetails` (
  `oid` int(11) NOT NULL,
  `tname` varchar(40) NOT NULL,
  `bname` varchar(40) NOT NULL,
  `qty` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`oid`,`tname`,`bname`),
  KEY `tname` (`tname`),
  KEY `bname` (`bname`),
  CONSTRAINT `odetails_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `odetails_ibfk_2` FOREIGN KEY (`tname`) REFERENCES `caketoppings` (`tname`),
  CONSTRAINT `odetails_ibfk_3` FOREIGN KEY (`bname`) REFERENCES `cakebottoms` (`bname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odetails`
--

LOCK TABLES `odetails` WRITE;
/*!40000 ALTER TABLE `odetails` DISABLE KEYS */;
INSERT INTO `odetails` VALUES (8,'Blue cheese','Almond',5),(8,'Blueberry','Almond',8),(9,'Blue cheese','Almond',3),(10,'Blue cheese','Almond',4),(11,'Blue cheese','Almond',5),(11,'Lemon','Chocolate',5),(12,'Blue cheese','Almond',4),(13,'Blue cheese','Almond',5),(14,'Blue cheese','Almond',5),(14,'Crispy','Pistacio',5),(15,'Blue cheese','Almond',5),(15,'Orange','Nutmeg',3),(16,'Blue cheese','Almond',4),(16,'Lemon','Almond',4);
/*!40000 ALTER TABLE `odetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `price` double unsigned NOT NULL,
  `odate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (8,1,176,'2017-03-05 15:12:20'),(9,1,48,'2017-03-05 15:13:38'),(10,1,64,'2017-03-05 16:17:06'),(11,1,145,'2017-03-05 16:48:59'),(12,1,64,'2017-03-05 16:54:02'),(13,1,80,'2017-03-05 16:57:43'),(14,1,140,'2017-03-05 16:58:01'),(15,1,119,'2017-03-05 16:58:49'),(16,1,124,'2017-03-05 17:20:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `umail` varchar(70) NOT NULL,
  `uname` varchar(70) NOT NULL,
  `upass` varchar(70) NOT NULL,
  `balance` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `umail` (`umail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@admin.dk','Herr Admin','hest123',37);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cupcakeproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-05 18:25:09
