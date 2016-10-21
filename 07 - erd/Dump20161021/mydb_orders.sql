-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유번호',
  `order_no` int(11) NOT NULL COMMENT '주문번호*',
  `total_sum` int(11) NOT NULL COMMENT 'op_sum + pro_sum',
  `member_id` int(11) NOT NULL COMMENT '고객 고유번호',
  `or_reg_date` datetime NOT NULL COMMENT '예약시각',
  `pickup_time` datetime DEFAULT NULL COMMENT '수령시간',
  `barcode` varchar(8) DEFAULT NULL COMMENT '바코드',
  `order_category` varchar(45) NOT NULL,
  `or_edit_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,123,4000,1,'2016-10-16 00:00:00',NULL,'123','reservation','2016-10-16 00:00:00'),(2,123,50000,1,'2016-10-16 00:00:00','2016-10-19 00:00:00','123','pay','2016-10-16 00:00:00'),(3,123,5000,1,'2016-10-16 00:00:00',NULL,'123','reservation','2016-10-16 00:00:00'),(5,123,22,1,'2016-10-16 00:00:00','2016-10-16 00:00:00','213','pay','2016-10-16 00:00:00'),(6,111,5000,1,'2016-10-20 09:57:09','2016-10-20 09:57:09','1233','pay','2016-10-20 09:57:09'),(7,111,5000,1,'2016-10-20 09:58:20','2016-10-20 17:25:40',NULL,'pay','2016-10-20 17:25:40'),(8,1111,1000,1,'2016-10-20 09:59:18','2016-10-20 09:59:18',NULL,'reservation','2016-10-20 09:59:18'),(9,111,5000,1,'2016-10-21 16:12:00',NULL,'1233','reservation','2016-10-21 16:12:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-21 16:27:16
