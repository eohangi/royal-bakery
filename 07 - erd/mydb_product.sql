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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_classify` char(1) NOT NULL,
  `pro_name` varchar(225) NOT NULL,
  `pro_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` char(1) NOT NULL COMMENT '판매여부',
  `content` text NOT NULL COMMENT '제품 상세설명',
  `kcal` int(11) NOT NULL COMMENT '칼로리',
  `na` int(11) NOT NULL COMMENT '나트륨',
  `sugar` int(11) NOT NULL COMMENT '당',
  `fat` int(11) NOT NULL COMMENT '지방',
  `protein` int(11) NOT NULL COMMENT '단백질',
  `pro_img` varchar(255) NOT NULL COMMENT '이미지경로\n',
  `pro_edit_date` datetime NOT NULL COMMENT '제품 수정 날짜',
  `pro_reg_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'a','클라우드 팝',5800,43,'o','부드러운 슈와 바삭한 패스트리, 속에는 달콤한 슈크림을 듬뿍넣어 조화롭게 어우러진 봉긋한 구름을 형상화 한 제품',400,320,26,13,9,'C:/Product_img/bread/b001.jpg','2016-10-19 18:09:53','2016-10-19 18:09:53'),(2,'a','오징어 먹물 치즈미니식빵',18000,37,'o','오징어 먹물이 들어간 식빵 안에 촉촉한 나쵸 크림치즈가 들어있는 뜯어먹는 타입의 미니식빵',220,330,13,3,7,'C:/Product_img/bread/b002.jpg','2016-10-19 18:14:15','2016-10-19 18:14:15'),(3,'a','순우유 브레드',6300,27,'o','유기농우유로 반죽하여 더 부드럽고 촉촉한 순우유 브레드 (유기농우유함량:18.77%)',420,550,20,8,10,'C:/Product_img/bread/b003.jpg','2016-10-19 18:17:35','2016-10-19 18:17:35'),(4,'a','건포도 호두 미니식빵',8500,16,'o','여성에게 필요한 영양소인 엽산, 철분 등의 미네랄이 첨가된 프리믹스가 들어가있고 건포도와 호두가 들어간 미니식빵',185,250,14,1,5,'C:/Product_img/bread/b004.jpg','2016-10-19 18:20:14','2016-10-19 18:20:14'),(5,'a','올리브/치즈미니식빵',9000,17,'o','고소한 고다치즈와 블랙올리브, 그린올리브를 넣은 한끼식사로도 든든한 미니식빵',205,460,11,1,7,'C:/Product_img/bread/b005.jpg','2016-10-19 18:21:36','2016-10-19 18:21:36'),(6,'a','망고 아이스 브레드',3800,47,'o','부드러운 빵속 새콤한 망고크림을 넣어 바삭한 피를 입힌 동글동글 귀여운 망고 아이스브레드!',310,230,17,8,7,'C:/Product_img/bread/b006.jpg','2016-10-19 18:23:21','2016-10-19 18:23:21'),(7,'a','바닐라 아이스 브레드',3800,27,'o','부드러운 빵속 달콤한 크림을 넣고 바삭한 피를 입힌 동글동글 귀여운 바닐라 아이스브레드!',330,230,17,9,7,'C:/Product_img/bread/b007.jpg','2016-10-19 18:24:30','2016-10-19 18:24:30'),(8,'a','클라우드 브레드',4800,17,'o','크림치즈가 들어간 폭신한 구름모양빵에 부드러운 우유크림과 땅콩크림이 샌드된 뚜레쥬르의 대표제품',335,380,12,8,9,'C:/Product_img/bread/b008.jpg','2016-10-19 22:31:49','2016-10-19 22:31:49'),(9,'a','뚜레쥬르 브레드',5300,13,'o','맛있는 빵내음이 퍼져나가는 반죽모양을 형상화한 브리오쉬 빵에 카라멜크림과 우유크림을 넣은 제품',240,240,12,6,7,'C:/Product_img/bread/b009.jpg','2016-10-19 23:49:45','2016-10-19 22:32:51'),(10,'a','카페 카야 번',5200,18,'o','국내에서 직접 로스팅한 그랑드카페 원두를 곱게 갈아 넣은 카페 번에 카야 잼을 넣어 향긋한 풍미와 맛을 업그레이드 한 제품',275,260,17,6,6,'C:/Product_img/bread/b010.jpg','2016-10-19 22:41:42','2016-10-19 22:41:42'),(11,'a','카페모카 롤브레드',6800,19,'o','국내에서 직접 로스팅한 그랑드카페 원두를 곱게 갈아 넣은 향긋한 커피 내음 가득한 롤브레드',305,330,15,3,8,'C:/Product_img/bread/b011.jpg','2016-10-26 15:23:36','2016-10-19 22:42:59'),(12,'a','흑보리찰떡빵',4000,36,'o','전라북도 고창 흑보리를 넣은 빵에 찹쌀떡과 달콤한 시럽을 뿌려 쫄깃함과 달콤함을 더한 찰떡빵',270,210,15,3,6,'C:/Product_img/bread/b012.jpg','2016-10-19 22:44:50','2016-10-19 22:44:50'),(13,'a','흑보리앙금빵',3800,31,'o','전라북도 고창 흑보리를 넣은 빵에 달콤한 팥앙금을 넣어 구수함과 달콤함이 어우러진 앙금빵',250,210,21,2,7,'C:/Product_img/bread/b013.jpg','2016-10-19 22:45:52','2016-10-19 22:45:52'),(14,'a','순꿀몽키브레드',6300,5,'o','꿀을 넣은 필링을 곁들여 더 달콤! 뜯어먹는 재미가 있는 몽키브레드',505,420,28,15,7,'C:/Product_img/bread/b014.jpg','2016-10-19 22:47:07','2016-10-19 22:47:07'),(15,'b','엔젤프레즈쉬폰1호',38000,40,'o','촉촉한 쉬폰안에 상큼한 딸기를 가득 넣고 신선한 생크림으로 아이싱한 뚜레쥬르 시그니쳐 쉬폰 케이크',2200,5760,144,64,24,'C:/Product_img/cake/k001.jpg','2016-10-19 23:43:14','2016-10-19 23:43:14'),(16,'b','클라우드 쉬폰',36000,6,'o','폭신하고 부드러운 쉬폰에 신선한 생크림과 커스터드 크림을 듬뿍 넣은 디저트 케이크',520,170,42,14,12,'C:/Product_img/cake/k002.jpg','2016-10-19 23:56:46','2016-10-19 23:46:15'),(17,'b','떠먹는 쁘띠 티라미수',36000,6,'o','마스카포네 치즈와 진한 커피향을 느낄 수 있으며 간편하게 떠먹을 수 있는 쁘띠 케이크',650,140,32,30,8,'C:/Product_img/cake/k003.jpg','2016-10-19 23:57:51','2016-10-19 23:47:25'),(18,'b','블루밍생크림케이크1호C',32000,6,'o','풍부한 맛의 생크림과 상큼한 과일로 장식한 케이크',1520,480,112,48,24,'C:/Product_img/cake/k004.jpg','2016-10-19 23:59:16','2016-10-19 23:48:52'),(19,'b','블루밍생크림케이크2호C',42000,5,'o','풍부한 맛의 생크림과 상큼한 과일로 장식한 케이크',1500,1050,150,50,50,'C:/Product_img/cake/k005.jpg','2016-10-20 00:02:01','2016-10-19 23:50:55'),(20,'b','블루밍생크림케이크3호B',52000,3,'o','풍부한 맛의 생크림과 상큼한 과일로 장식한 케이크',2940,980,238,98,42,'C:/Product_img/cake/k006.jpg','2016-10-20 00:03:14','2016-10-19 23:52:04'),(21,'b','초코터치쉬폰1호',39000,4,'o','초코쉬폰에 달콤한 초코크림을 가득 얹은 부드럽고 촉촉한 쉬폰 케이크',1785,630,112,63,28,'C:/Product_img/cake/k007.jpg','2016-10-20 00:23:09','2016-10-19 23:53:22'),(22,'b','블루베리터치쉬폰1호',38000,8,'o','블루베리쉬폰에 상큼한 블랙커런트 크림을 가득 얹은 부드럽고 촉촉한 쉬폰 케이크',1720,600,96,64,24,'C:/Product_img/cake/k008.jpg','2016-10-20 00:05:33','2016-10-20 00:05:33'),(23,'b','떠먹는 쁘띠 연유 생크림',39000,9,'o','신선한 생크림에 달콤한 연유를 더한 간편하게 떠먹을 수 있는 쁘띠 케이크',1560,480,136,48,24,'C:/Product_img/cake/k009.jpg','2016-10-20 00:07:02','2016-10-20 00:07:02'),(24,'b','떠먹는 망고 치즈 케이크',39000,4,'o','상큼한 망고 과육이 씹히는 달콤한 망고 무스와 부드러운 치즈무스를 촉촉한 시트와 함께 떠먹는 케이크',1000,480,112,16,16,'C:/Product_img/cake/k011.jpg','2016-10-20 00:20:37','2016-10-20 00:08:00'),(25,'b','쇼콜라 더 롤라운드 케이크',48000,9,'o','세로로 롤링한 초코 롤시트 안에 신선한 우유 생크림&달콤한 초코 생크림과 바삭한 초코볼이 가득 들어있는 반전매력 케이크',720,240,78,6,18,'C:/Product_img/cake/k012.jpg','2016-10-20 00:12:25','2016-10-20 00:12:25'),(26,'b','블루베리요거트 치즈티라미수',63000,12,'o','국내에서 직접 로스팅한 그랑드카페 원두를 사용한 티라미수와 상큼한 블루베리 요거 치즈 무스를 함께 즐길 수 있는 케이크',1575,560,119,49,28,'C:/Product_img/cake/k013.jpg','2016-10-20 00:16:05','2016-10-20 00:16:05'),(27,'b','초코 골드레이어 케이크',73000,13,'o','진한 벨기에산 초콜릿과 생크림을 듬뿍 넣은 가나슈 초콜릿이 부드러운 시트와 크리미하게 잘 어우러지는 뚜레쥬르만의 시그니쳐 케이크',2640,720,132,96,36,'C:/Product_img/cake/k014.jpg','2016-10-20 00:17:30','2016-10-20 00:17:30'),(28,'b','떠먹는 블루베리 요거 케이크',51000,12,'o','새콤달콤한 블루베리잼과 상큼한 요거무스가 촉촉한 시트와 어우러진 떠먹는 케이크',2520,660,168,96,36,'C:/Product_img/cake/k010.jpg','2016-10-20 00:25:17','2016-10-20 00:25:17'),(29,'c','바닐라마카롱',3000,53,'o','달콤한 바닐라크림이 입안가득 느껴지는 마카롱',70,10,6,1,1,'C:/Product_img/cookie/c001.jpg','2016-10-20 00:31:12','2016-10-20 00:31:12'),(30,'c','패션마카롱',3000,57,'o','상큼한 패션후르츠 크림이 가득 들어있는 마카롱',65,10,7,1,1,'C:/Product_img/cookie/c002.jpg','2016-10-20 00:32:34','2016-10-20 00:32:34'),(31,'c','산딸기마카롱',3000,63,'o','새콤달콤한 산딸기잼이 가득한 마카롱',75,10,7,1,1,'C:/Product_img/cookie/c003.jpg','2016-10-20 00:33:07','2016-10-20 00:33:07'),(32,'c','블루베리마카롱',3000,37,'o','상큼한 블루베리잼이 가득한 마카롱',75,10,8,1,1,'C:/Product_img/cookie/c005.jpg','2016-10-20 00:33:38','2016-10-20 00:33:38'),(33,'c','녹차마카롱',3000,21,'o','은은한 녹차향이 매력적인 마카롱',70,10,6,1,1,'C:/Product_img/cookie/c006.jpg','2016-10-20 00:34:22','2016-10-20 00:34:22'),(34,'c','초코마카롱',3000,81,'o','깊고진한 초콜릿의 풍미가 느껴지는 마카롱',70,10,6,1,1,'C:/Product_img/cookie/c004.jpg','2016-10-20 00:35:19','2016-10-20 00:35:19'),(35,'c','피넛버터쿠키',3800,43,'o','피넛버터맛의 뚜레쥬르 쿠키',180,105,12,4,1,'C:/Product_img/cookie/c007.jpg','2016-10-20 00:37:59','2016-10-20 00:37:59'),(36,'c','청키초코칩쿠키',3800,12,'o','청키초코칩이 들어간 뚜레쥬르 쿠키',155,95,11,3,1,'C:/Product_img/cookie/c008.jpg','2016-10-20 00:38:53','2016-10-20 00:38:53'),(37,'c','더블초코칩쿠키',3800,13,'o','더블초코칩 뚜레쥬르 쿠키',165,105,11,4,1,'C:/Product_img/cookie/c009.jpg','2016-10-20 00:39:43','2016-10-20 00:39:43');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-03 17:49:46