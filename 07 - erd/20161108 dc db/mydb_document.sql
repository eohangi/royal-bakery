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
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유번호',
  `writer_name` varchar(45) NOT NULL COMMENT '글쓴이 이름',
  `writer_pw` varchar(150) NOT NULL COMMENT '작성자 비밀번호',
  `subject` varchar(50) NOT NULL COMMENT '제목',
  `content` text NOT NULL COMMENT '내용',
  `reg_date` datetime NOT NULL COMMENT '게시일',
  `edit_date` datetime NOT NULL COMMENT '수정일',
  `ip_addr` varchar(255) NOT NULL COMMENT '아이피 주소',
  `category` varchar(45) NOT NULL COMMENT '질문/ 공지사항',
  `checks` varchar(45) DEFAULT NULL COMMENT '답변 유무\n\n기본값 N',
  `Member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Document_Member1_idx` (`Member_id`),
  CONSTRAINT `fk_Document_Member1` FOREIGN KEY (`Member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'확인중','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257','안녕','<p>안녕</p>\r\n','2016-11-02 18:23:38','2016-11-02 18:23:58','0:0:0:0:0:0:0:1','qna',NULL,NULL),(2,'확인중','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257','asdf','<p>asdf</p>\r\n','2016-11-02 18:24:58','2016-11-02 18:25:40','0:0:0:0:0:0:0:1','qna',NULL,NULL),(3,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','이 사이트 왜 이리 후졌나요','<p>ㅇㅈㅈ?</p>\r\n\r\n<p>&nbsp;</p>\r\n','2016-11-04 18:07:54','2016-11-07 14:48:25','0:0:0:0:0:0:0:1','qna',NULL,4),(4,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','갸아아악스','<p>ㄻㄴㅇㄻㄴㅇㄹ</p>\r\n','2016-11-04 18:12:03','2016-11-07 14:48:38','0:0:0:0:0:0:0:1','qna',NULL,4),(6,'물고기','*A4B6157319038724E3560894F7F932C8886EBFCF','asdfsafd','<p>sdfasdf</p>','2016-11-07 15:05:56','2016-11-07 15:05:56','0:0:0:0:0:0:0:1','notice',NULL,3),(7,'물고기','*A4B6157319038724E3560894F7F932C8886EBFCF','asdfasd','<p>asdfasdfsasdfasdfasf</p>','2016-11-07 15:13:04','2016-11-07 15:13:22','0:0:0:0:0:0:0:1','notice',NULL,3),(8,'물고기','*A4B6157319038724E3560894F7F932C8886EBFCF','dddf','<p>ddfd</p>','2016-11-07 15:13:12','2016-11-07 15:13:12','0:0:0:0:0:0:0:1','notice',NULL,3),(9,'물고기','*A4B6157319038724E3560894F7F932C8886EBFCF','공지사항 테스트입니다 수정합니다','<p>또 수정합니다</p>','2016-11-07 15:22:21','2016-11-07 18:27:55','0:0:0:0:0:0:0:1','notice',NULL,3),(10,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','흑흑흑 ','<p>살려주세요</p>\r\n','2016-11-07 17:13:38','2016-11-07 17:13:38','0:0:0:0:0:0:0:1','qna',NULL,4),(11,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','sdfasdfa','<p>fasdfasdfasdf</p>\r\n','2016-11-07 17:18:47','2016-11-07 17:18:47','0:0:0:0:0:0:0:1','qna',NULL,4),(12,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','asdfasdfasdf','<p>asdfasdfasdfs</p>\r\n','2016-11-07 17:19:30','2016-11-07 17:19:30','0:0:0:0:0:0:0:1','qna',NULL,4),(13,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','asdfafd','<p>asdfasfd</p>\r\n','2016-11-07 17:27:28','2016-11-07 17:27:28','0:0:0:0:0:0:0:1','qna','n',4),(14,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','asdfasdfa','<p>sfdasdfasdfsafd</p>\r\n','2016-11-08 12:15:46','2016-11-08 12:15:46','0:0:0:0:0:0:0:1','qna','답변대기',5),(15,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','으아앙','<p>이ㅏㅓㄹ;머ㅏㅁ;ㄴ라인ㅁ</p>\r\n','2016-11-08 13:31:28','2016-11-08 13:31:28','0:0:0:0:0:0:0:1','qna','답변대기',5),(16,'테스트','*A4B6157319038724E3560894F7F932C8886EBFCF','ㄴㅇㄴㄹㄴㄹㅇㅁㄴㄹㅇ','<p>ㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴㅇㄹ</p>\r\n','2016-11-08 13:32:32','2016-11-08 13:32:32','0:0:0:0:0:0:0:1','qna','답변대기',5);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
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
