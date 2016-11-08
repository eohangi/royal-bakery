-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유번호\n',
  `Member_id` int(11) DEFAULT NULL COMMENT '관리자 고유번호',
  `co_content` text NOT NULL COMMENT '답변 내용',
  `co_edit_date` datetime NOT NULL COMMENT '수정일',
  `Document_id` int(11) DEFAULT NULL,
  `co_reg_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_Member1_idx` (`Member_id`),
  KEY `fk_Comment_Document1_idx` (`Document_id`),
  CONSTRAINT `fk_Comment_Document1` FOREIGN KEY (`Document_id`) REFERENCES `document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_Member1` FOREIGN KEY (`Member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (8,1,'<p>zxzx</p>','2016-11-07 16:57:28',3,'2016-11-07 16:57:28'),(9,1,'<p>1231312313123</p>','2016-11-08 13:11:49',14,'2016-11-08 13:11:49'),(10,1,'<p>asdfasfsdafsadf</p>','2016-11-08 13:15:22',12,'2016-11-08 13:15:22'),(11,1,'<p>asdfsafdsadfasdfsdf</p>','2016-11-08 13:15:35',11,'2016-11-08 13:15:35'),(12,1,'<p>asdfsdafsatdagdstygadsfsdf</p>','2016-11-08 13:15:42',4,'2016-11-08 13:15:42'),(13,1,'<p>sdfsadfasdfsafd</p>','2016-11-08 13:15:48',3,'2016-11-08 13:15:48'),(14,1,'<p>asdfasdfasdfsafsafd</p>','2016-11-08 13:16:05',2,'2016-11-08 13:16:05'),(15,1,'<p>씨발</p>','2016-11-08 13:28:09',1,'2016-11-08 13:28:09'),(16,1,'<p>걍아아아ㅗㅇㄱ갸오오옥</p>','2016-11-08 13:31:42',15,'2016-11-08 13:31:42'),(17,1,'<p>걍아아아ㅗㅇㄱ갸오오옥</p>','2016-11-08 13:32:08',15,'2016-11-08 13:32:08'),(18,1,'<p>ㄹㅇㅁㄴㄹㅇ</p>','2016-11-08 13:32:14',15,'2016-11-08 13:32:14'),(19,1,'<p>ㄹㅇㅁㄴㄹㅇ</p>','2016-11-08 13:32:37',15,'2016-11-08 13:32:37'),(22,1,'<p>asdlkfj;askdlfj;a</p>','2016-11-08 13:39:23',16,'2016-11-08 13:39:23'),(23,1,'<p>asdlkfj;askdlfj;a</p>','2016-11-08 13:39:56',16,'2016-11-08 13:39:56');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-08 14:43:23
