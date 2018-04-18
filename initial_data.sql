-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cas_server
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `casserver_lt`
--

DROP TABLE IF EXISTS `casserver_lt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casserver_lt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `consumed` datetime DEFAULT NULL,
  `client_hostname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_casserver_lt_on_ticket` (`ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casserver_lt`
--

LOCK TABLES `casserver_lt` WRITE;
/*!40000 ALTER TABLE `casserver_lt` DISABLE KEYS */;
INSERT INTO `casserver_lt` VALUES (1,'LT-1524019023rDitSpUYmCA5d3JpXEg','2018-04-18 10:37:03',NULL,'80.82.77.39'),(2,'LT-1524024154rbQZviNq3TYcKhA6Ur2','2018-04-18 12:02:34','2018-04-18 12:02:40','35.189.180.76'),(3,'LT-1524024160rpdJV59fs83a2USTfFV','2018-04-18 12:02:40','2018-04-18 12:02:44','35.189.180.76'),(4,'LT-1524024164rz3CWGT-etkGaQMp1jU','2018-04-18 12:02:44','2018-04-18 12:02:58','35.189.180.76'),(5,'LT-1524024178rKS5xDZuZuwDe-34pLw','2018-04-18 12:02:58','2018-04-18 12:03:25','35.189.180.76'),(6,'LT-1524024205rkdcpt7hsNM8DvMWXy6','2018-04-18 12:03:25','2018-04-18 12:06:26','35.189.180.76'),(7,'LT-1524024336rzGuQRoKZbIqzKb4-V9','2018-04-18 12:05:36',NULL,'35.189.180.76'),(8,'LT-1524024386rlc5veNZ-BgwFQfznm9','2018-04-18 12:06:26','2018-04-18 12:06:33','35.189.180.76'),(9,'LT-1524024393r6GKXRQvU9KnNBc5Wsr','2018-04-18 12:06:33','2018-04-18 12:06:45','35.189.180.76'),(10,'LT-1524024405rSlfMIImCWzNpOef5hX','2018-04-18 12:06:45',NULL,'35.189.180.76');
/*!40000 ALTER TABLE `casserver_lt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casserver_pgt`
--

DROP TABLE IF EXISTS `casserver_pgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casserver_pgt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `client_hostname` varchar(255) NOT NULL,
  `iou` varchar(255) NOT NULL,
  `service_ticket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_casserver_pgt_on_ticket` (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casserver_pgt`
--

LOCK TABLES `casserver_pgt` WRITE;
/*!40000 ALTER TABLE `casserver_pgt` DISABLE KEYS */;
/*!40000 ALTER TABLE `casserver_pgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casserver_st`
--

DROP TABLE IF EXISTS `casserver_st`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casserver_st` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) NOT NULL,
  `service` text NOT NULL,
  `created_on` datetime NOT NULL,
  `consumed` datetime DEFAULT NULL,
  `client_hostname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `granted_by_pgt_id` int(11) DEFAULT NULL,
  `granted_by_tgt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_casserver_st_on_ticket` (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casserver_st`
--

LOCK TABLES `casserver_st` WRITE;
/*!40000 ALTER TABLE `casserver_st` DISABLE KEYS */;
/*!40000 ALTER TABLE `casserver_st` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casserver_tgt`
--

DROP TABLE IF EXISTS `casserver_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casserver_tgt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `client_hostname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `extra_attributes` text,
  PRIMARY KEY (`id`),
  KEY `index_casserver_tgt_on_ticket` (`ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casserver_tgt`
--

LOCK TABLES `casserver_tgt` WRITE;
/*!40000 ALTER TABLE `casserver_tgt` DISABLE KEYS */;
INSERT INTO `casserver_tgt` VALUES (1,'TGC-1524024160rhNs--Ge-7H4KEiPiVG','2018-04-18 12:02:40','35.189.180.76','510045240@qq.com','--- {}\n'),(2,'TGC-1524024164rvUtkeffJ2X4Mg4wYs4','2018-04-18 12:02:44','35.189.180.76','510045240@qq.com','--- {}\n'),(3,'TGC-1524024178rmuhyEOwik9gKda76Cm','2018-04-18 12:02:58','35.189.180.76','2323','--- {}\n'),(4,'TGC-1524024205rAE7qLQN2gylInW0ldy','2018-04-18 12:03:25','35.189.180.76','3223223','--- {}\n'),(5,'TGC-1524024405rQZ9dVCKhuu--ax1OAD','2018-04-18 12:06:45','35.189.180.76','510045240@qq.com','--- {}\n');
/*!40000 ALTER TABLE `casserver_tgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('2');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-18 14:17:14
