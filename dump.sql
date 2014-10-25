-- MySQL dump 10.13  Distrib 5.6.20, for osx10.9 (x86_64)
--
-- Host: localhost    Database: proceedings_development
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `mst_api_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_api_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mst_api_configs_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_api_configs`
--

LOCK TABLES `mst_api_configs` WRITE;
/*!40000 ALTER TABLE `mst_api_configs` DISABLE KEYS */;
INSERT INTO `mst_api_configs` VALUES (1,'Mst::YahooApi','dj0zaiZpPU1IMGFtd3cxYUQySiZzPWNvbnN1bWVyc2VjcmV0Jng9ZTU-','c50101f660ac808a2ec676c695558807554f73ec','2014-10-18 13:54:39','2014-10-18 13:54:39');
/*!40000 ALTER TABLE `mst_api_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_api_feature_configs`
--

DROP TABLE IF EXISTS `mst_api_feature_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_api_feature_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mst_api_config_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `request_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_format` int(11) NOT NULL,
  `limit_count` int(11) DEFAULT NULL,
  `limit_request_capacity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mst_api_feature_configs_request_index` (`mst_api_config_id`,`category`,`request_url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_api_feature_configs`
--

LOCK TABLES `mst_api_feature_configs` WRITE;
/*!40000 ALTER TABLE `mst_api_feature_configs` DISABLE KEYS */;
INSERT INTO `mst_api_feature_configs` VALUES (1,1,0,'http://jlp.yahooapis.jp/DAService/V1/parse',1,50000,4000,'2014-10-18 13:57:20','2014-10-18 13:57:20'),(2,1,1,'http://jlp.yahooapis.jp/KeyphraseService/V1/extract',1,50000,100000,'2014-10-18 14:00:48','2014-10-18 14:00:48'),(3,1,2,'http://jlp.yahooapis.jp/KouseiService/V1/kousei',1,50000,100000,'2014-10-18 14:02:21','2014-10-18 14:02:21');
/*!40000 ALTER TABLE `mst_api_feature_configs` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-19  2:44:29
