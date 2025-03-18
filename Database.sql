CREATE DATABASE  IF NOT EXISTS `web_laptop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `web_laptop`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: web_laptop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1','2'),('12132','$2a$10$UO0jw3rXB9C81NcSCzhv.O..pBBOeFlyipNTSaikXNzmQhW1XCIsa'),('123','$2a$10$UERzRTz5Ssf05DvXpCOA.OcysO11tWCfYguJ31BpLOlPs.5nA6/3C'),('124',NULL),('admin','$2a$10$.9QIpsSiyycECaFV0HBy2O8Xu0CND5GNydt911vCXqrz1zAlmzaJu'),('anh1234','$2a$10$vsA1gXJxLv8j.qNTCliAK.vXufglO3FdsNOzCVFa9T687zKYqMrjm'),('binh17ce','$2a$10$rrEEAqZdUdqyQy/F3ceEV.Q4xuqQmRs6Ut5WFkU2kG9AxziHyaXpy'),('dat','$2a$10$.9QIpsSiyycECaFV0HBy2O8Xu0CND5GNydt911vCXqrz1zAlmzaJu'),('dat123','$2a$10$NCVkPiDJ/11xsLf1/vXXfu8DbGHcwaCiFxY.UujCmqNBoxYkmXDMS'),('hieu12345','$2a$10$3PxGcmJzGFUnr76/SOQDdOflnoHWIo0PdX5NwHdNifZWsWQHhnmyK'),('hieu17ce','$2a$10$4PZOR8dv/JeEbjq5SXUEK.Xb9gR2cSgeexbca0xZ2oh4xXsD0QbkW'),('qlthuan','$2a$10$C93.jMtc/JdRqokXMMAbeuAGANlyXj9L9kMwFJfnyOfJ/SHv15tFu'),('thanh123','$2a$10$peFqYELXySMbP3arxzuYveOpgf7C.Ovic9kHZdpOnPb8WE9d2zCMq'),('thuan2k','$2a$10$wP9bJFKndnGH7AtqX9Xfbu3rUez/R57bY59AEWAw0VATKgxjb7b1q'),('tram123','$2a$10$DFC/Vj8m5OvcmHZ6Q.JZuet9oxIhFixxxljXcWPyxzQkjVVYoijwC'),('Trung1','$2a$10$.9QIpsSiyycECaFV0HBy2O8Xu0CND5GNydt911vCXqrz1zAlmzaJu'),('Trung123','$2a$10$.9QIpsSiyycECaFV0HBy2O8Xu0CND5GNydt911vCXqrz1zAlmzaJu'),('Trung2','$2a$10$.9QIpsSiyycECaFV0HBy2O8Xu0CND5GNydt911vCXqrz1zAlmzaJu'),('trunghoa','$2a$10$NO/xmQ19il6STnv1KnaUpe8b1eJEFwZRWChLga8YTLqDRAu6tZZpq'),('tuan123','$2a$10$kVppbi2aNlZw3pUcZQVAIO5cQjOUPXcZdZQeTBQDlH5.sMQJhhLHu');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_role` (
  `role_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`,`user_name`),
  KEY `FK6mib7vu4jbpkbiwhhc9x1hc5i` (`user_name`),
  CONSTRAINT `FK6mib7vu4jbpkbiwhhc9x1hc5i` FOREIGN KEY (`user_name`) REFERENCES `account` (`user_name`),
  CONSTRAINT `FKrs2s3m3039h0xt8d5yhwbuyam` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (2,'12132'),(2,'123'),(3,'admin'),(2,'anh1234'),(2,'binh17ce'),(1,'dat'),(2,'dat123'),(2,'hieu12345'),(2,'hieu17ce'),(1,'qlthuan'),(2,'thanh123'),(2,'thuan2k'),(2,'tram123'),(1,'Trung1'),(1,'Trung123'),(2,'Trung2'),(2,'trunghoa'),(2,'tuan123');
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_founded` varchar(255) DEFAULT NULL,
  `payment_methods` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `received` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `total_money` float NOT NULL,
  `id_customer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `FKfhkxwb71lvn1t7d0l234hxywa` (`id_customer`),
  CONSTRAINT `FKfhkxwb71lvn1t7d0l234hxywa` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (43,'Nghệ An','2024-04-10','Trực tiếp khi nhận hàng','0934342234','Lê Thế Đạt',2,34090000,'KH-815'),(44,'Nghệ An','2024-01-11','Qua thẻ ngân hàng','0934342234','Lê Thế Đạt',2,34090000,'KH-815'),(48,'Hà Nội','2024-02-12','Trực tiếp khi nhận hàng','0375140585','Nguyễn Văn Bình',2,87480000,'KH-609'),(50,'Nghệ An','2024-04-22','Trực tiếp khi nhận hàng','0375140585','Lê Thế Trung',2,34090000,'KH-296'),(51,'Nghệ An','2024-04-22','Trực tiếp khi nhận hàng','0375140585','Lê Thị Thành',1,40790000,'KH-753'),(52,'Nghệ An','2024-04-22','Qua thẻ ngân hàng','0375140585','Lê Thế Trung',1,96380000,'KH-296'),(56,'Hà Nội','2024-04-19','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',2,28790000,'KH-127'),(57,'Hà Nội','2024-04-24','Qua thẻ ngân hàng','0986456123','Tạ Văn Thuận',2,13990000,'KH-127'),(58,'Hà Nội','2024-04-28','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',2,14800000,'KH-127'),(60,'Hà Nội','2024-08-30','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',1,22000000,'KH-127'),(61,'Hà Nội','2024-04-30','Qua thẻ ngân hàng','0986456123','Tạ Văn Thuận',2,22000000,'KH-127'),(63,'Hà Nội','2024-05-07','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',1,43000000,'KH-127'),(64,'Hà Nội','2024-10-07','Qua thẻ ngân hàng','0986456123','Tạ Văn Thuận',1,21000000,'KH-127'),(65,'Hà Nội','2024-05-07','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',1,40000000,'KH-127'),(66,'Hà Nội','2024-05-12','Trực tiếp khi nhận hàng','0986456123','Tạ Văn Thuận',1,28790000,'KH-127');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_detail`
--

DROP TABLE IF EXISTS `contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contract_detail` (
  `id_bill` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_bill`,`id_product`),
  KEY `FKjhefq9wymasr86okkjk5bi2fo` (`id_product`),
  CONSTRAINT `FK5f9ixat3me0qoaaf4uialtlt7` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  CONSTRAINT `FKjhefq9wymasr86okkjk5bi2fo` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_detail`
--

LOCK TABLES `contract_detail` WRITE;
/*!40000 ALTER TABLE `contract_detail` DISABLE KEYS */;
INSERT INTO `contract_detail` VALUES (43,2,14800000,1),(43,3,19290000,1),(44,2,14800000,1),(44,3,19290000,1),(48,2,14800000,1),(48,6,21000000,1),(48,10,24990000,1),(48,11,26690000,1),(50,2,14800000,1),(50,3,19290000,1),(51,4,18790000,1),(51,5,22000000,1),(52,5,22000000,1),(52,6,21000000,1),(52,11,26690000,2),(56,1,13990000,1),(56,2,14800000,1),(57,1,13990000,1),(58,2,14800000,1),(60,5,22000000,1),(61,5,22000000,1),(63,5,22000000,1),(63,6,21000000,1),(64,26,20000000,1),(65,26,20000000,2),(66,1,13990000,1),(66,2,14800000,1);
/*!40000 ALTER TABLE `contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id_customer` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `FK9hhabijn4amjcahhjxbi5aumx` (`user_name`),
  CONSTRAINT `FK9hhabijn4amjcahhjxbi5aumx` FOREIGN KEY (`user_name`) REFERENCES `account` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('KH-11','Gia Lai','nmhieu17ce@vku.udn.vn','1','Hiếu','0375140585',1,'Lê Thị','hieu12345'),('KH-127','Hà Nội','tavanthuan@gmail.com','1','Thuận','0986456123',1,'Tạ Văn','thuan2k'),('KH-296','Nghệ An','trunghoa130299@gmail.com','1','Trung','0375140585',1,'Lê Thế','trunghoa'),('KH-330','Gia Lai','nmhieu17ce@vku.udn.vn','1','Hiếu','0375140585',1,'Nguyễn Minh','hieu17ce'),('KH-393','Nghệ An','trunghoa130299@gmail.com','1','Tuấn','0934342234',1,'Nguyễn Tất','tuan123'),('KH-609','Hà Nội','lttrung.17ce@vku.udn.vn','1','Bình','0375140585',1,'Nguyễn Văn','binh17ce'),('KH-655','Quảng Trị','lttrung.17ce@vku.udn.vn','1','Nam','0375140585',1,'Nguyễn Đình','12132'),('KH-753','Nghệ An','lttrung.17ce@vku.udn.vn','2','Thành','0375140585',1,'Lê Thị','thanh123'),('KH-812','Hà Tĩnh','nhhieu.17ce@vku.udn.vn','2','Trâm','0934342234',1,'Đặng Thị','tram123'),('KH-815','Nghệ An','dat123@gmail.com','1','Đạt','0934342234',1,'Lê Thế','dat123'),('KH-928','Quảng Nam','anh122345@gmail.com','2','Anh','0934342234',1,'Nguyễn Minh','anh1234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id_employee` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avt_url` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `FK1pqc3aygf1dslbfmpwa14net3` (`user_name`),
  KEY `FKbc8rdko9o9n1ri9bpdyxv3x7i` (`position_id`),
  CONSTRAINT `FK1pqc3aygf1dslbfmpwa14net3` FOREIGN KEY (`user_name`) REFERENCES `account` (`user_name`),
  CONSTRAINT `FKbc8rdko9o9n1ri9bpdyxv3x7i` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('NV-0001','Quốc Oai - Hà Nội','logo.png','2000-01-01','thuanta2000@gmail.com','Tạ Văn Thuận','0901234567','qlthuan',1),('NV-1111','Nghệ An','logo.png','1999-02-13','trung12@gmail.com','Lê Thế Trung','0900009999','Trung2',1),('NV-1114','Đà Nẵng','logo.png','2001-10-18','bac567@gmail.com','Nguyễn Văn Bắc','0900007777','dat',2),('NV-1115','Quảng Nam','44080_hp_14_dq_silver_ha5.jpg','2001-09-09','0989308199ad@gmail.com','Trần Văn Nam','0900009999','Trung123',2),('NV-1333','Hà Nội','logo.png','1998-11-12','hieu@gmail.com','Lê Văn Hiếu','0900008888','Trung1',2),('NV-1355','Nghệ An','logo.png','1997-02-20','nhung123@gmail.com','Đặng Thị Bích Nhung','0900008888','123',1),('NV-1366','Gia Lai','logo.png','2002-01-01','hieuhoc@gmail.com','Nguyễn Minh Hiếu','0900008888','124',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evaluate` (
  `id_evaluate` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_founded` varchar(255) DEFAULT NULL,
  `number_of_star` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_evaluate`),
  KEY `FKan4q4h2gfgmsxb9jjusjiiahj` (`id_product`),
  CONSTRAINT `FKan4q4h2gfgmsxb9jjusjiiahj` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

LOCK TABLES `evaluate` WRITE;
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluates`
--

DROP TABLE IF EXISTS `evaluates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evaluates` (
  `id_customer` varchar(255) NOT NULL,
  `id_product` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_founded` date DEFAULT NULL,
  `number_of_star` int(11) NOT NULL,
  PRIMARY KEY (`id_customer`,`id_product`),
  KEY `FKkuny9p51h05uyvuqji9l5q3cd` (`id_product`),
  CONSTRAINT `FK9f1telx2xr0e0doi5dsdu3yh6` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `FKkuny9p51h05uyvuqji9l5q3cd` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluates`
--

LOCK TABLES `evaluates` WRITE;
/*!40000 ALTER TABLE `evaluates` DISABLE KEYS */;
INSERT INTO `evaluates` VALUES ('KH-11',7,'Đẹp quá','2022-01-19',5),('KH-127',1,'Khách hàng đã ghé thắm','2024-04-24',5),('KH-127',4,'Đã ghé thăm','2024-04-24',5),('KH-127',19,'Test','2024-05-07',5),('KH-127',22,'Đã ghé thăm','2024-04-24',5),('KH-127',23,'Đã ghé thăm','2024-04-24',5),('KH-296',2,'Xuất sắc luôn','2022-01-22',5),('KH-296',3,'Mua đi các bạn ơii','2022-01-22',5),('KH-296',4,'Xinh quá!','2022-01-22',5),('KH-393',2,'Đẹp quá','2022-01-23',5),('KH-655',1,'Giá này k mua thì còn đu đỉnh giá nào nữa ^^!','2022-01-11',5),('KH-655',6,'Vào đu đỉnh đi anh em ơiiiiiiiiiiii','2022-01-11',5),('KH-753',10,'Tuyệt vời','2022-01-22',5),('KH-812',1,'Xịn xò quá đi','2022-01-22',5),('KH-812',2,'Mua đi mọi người ơi','2022-01-22',5),('KH-812',3,'Quá đẹp!','2022-01-22',5),('KH-812',4,'Đẹp quá','2022-01-22',5),('KH-812',5,'Hơn cả tuyệt vời !','2022-01-22',5),('KH-815',1,'Xịn Quá!','2022-01-11',5),('KH-815',2,'Xuất sắc','2022-01-11',5),('KH-815',7,'Tuyệt vời!','2022-01-11',5),('KH-815',10,'ádasdasasas','2022-01-19',5),('KH-815',18,'Máy xịn quá','2022-01-19',5);
/*!40000 ALTER TABLE `evaluates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (67);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oder`
--

DROP TABLE IF EXISTS `oder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oder` (
  `ma_sp` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `ten_sp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_sp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oder`
--

LOCK TABLES `oder` WRITE;
/*!40000 ALTER TABLE `oder` DISABLE KEYS */;
/*!40000 ALTER TABLE `oder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Quản Lý'),(2,'Nhân Viên');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `avt` varchar(255) DEFAULT NULL,
  `camerat` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `hdh` varchar(255) DEFAULT NULL,
  `num_of_review` int(11) NOT NULL,
  `num_of_star` int(11) NOT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `sd_card` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_promotion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FKjnavkoass3f8t4me1tvfavo3b` (`id_type`),
  KEY `FK5y91nfsk3v6ulgmlpr2wj2aa6` (`id_promotion`),
  CONSTRAINT `FK5y91nfsk3v6ulgmlpr2wj2aa6` FOREIGN KEY (`id_promotion`) REFERENCES `promotion` (`id_promotion`),
  CONSTRAINT `FKjnavkoass3f8t4me1tvfavo3b` FOREIGN KEY (`id_type`) REFERENCES `product_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'hp_14-dq2055wm_39k15ua_2_ca655121e03b4fa09aad4f8fc7f995da_grande.jpg','HP True Vision 720p HD','Intel Core i3-1115G4','Windows 10 Home SL',5,4,'3-cell, 41 Wh Li-ion',13990000,'HP 14-dq2055WM 39K15UA',993,'4GB','256GB SSD','14″ FHD','Intel UHD Graphics',1,1,2),(2,'32339_dell_inspiron_3593_black_1.jpg','720p HD','Intel Core i5 8350U','Intel',4,5,'4 Cell ExpressCharge™',14800000,'Laptop Dell Latitude 7390',990,'8GB DDR4','SSD 256GB','13.3 Inch Full HD','Intel HD 620',1,3,2),(3,'laptop-man-hinh-cam-ung-asus-vivobook-tp412fa-ec599t_1633688415.jpg','HD Webcam','Intel® Core™ i5-1135G7','Windows 10 bản quyền',2,4,'42WHrs, 3S1P, 3-cell',19290000,'ASUS VivoBook 15',996,'8 GB Onboard','512 GB M.2 NVMe','15.6-inch','Intel® Iris® Xe Graphics',1,2,3),(4,'44080_hp_14_dq_silver_ha5.jpg','HP TrueVision HD','Intel Core i7-1165G7','Intel',7,4,'3-cell 41 Wh Li-ion',18790000,'HP 15s fq2556TU i7',998,'8GB(2 x 4GB) DDR4','512GB SSD NVMe','15.6 inch HD','Intel® Iris® Xe Graphics',1,1,1),(5,'macbook-air-2019.gif','HD Webcam','Core i5 Gen 8','Mac OS',2,4,' 49.9 W h Li-Poly',22000000,'Macbook Air New 2019 MVFK2 Silver',989,'8GB','128GB','13.3 inch','Intel UHD Graphics 617',1,4,2),(6,'laptop-asus-tuf-gaming-f15-fx506hm-hn018t-6.png','720P HD camera','Intel Core i5-11400H','Windows 10 Home SL',2,4,'3 Cell 90WHr',21000000,'ASUS TUF Gaming F15 ',994,'8GB','512GB SSD M.2 PCIE G3X2','15.6 inches','NVIDIA GeForce RTX 3060',1,2,1),(7,'dell-latitude-e5480-laptop-tcc-new-min-1.jpg','720P HD camera','CPU Intel Core i5-6300U','Intel',2,4,'3000Map',10200000,'Dell Latitude E5480',999,'8GB','128GB','15 inch','Intel Graphics 620',1,3,3),(10,'macbook-air-13-inch-m1-16gb-256gb-didongviet.jpg','720p FaceTime HD camera','Apple M1','Mac OS',3,4,'Lithium-Polymer',24990000,'MacBook Air 13\" 2020 M1 256GB',994,'8 GB, LPDDR4','256 GB','13.3\", 2560 x 1600 Pixel','Apple M1 GPU 7 nhân',1,4,3),(11,'34191_lenovo_yoga_s730_13iwl_81j00052vn_4.jpg','Có','Core i7 8565U 1.8Ghz-8Mb','Windows 10 Home',0,4,'4 cell',26690000,'Lenovo Yoga S730 ',996,'8Gb','512Gb SSD','13.3Inch Full HD','Intel HD Graphics 620',1,5,1),(12,'45970_gaming_gf63_thin_10_ha2.jpg','Có','Core i5 10500H','Windows 10 Home',0,3,'3 cell',20590000,' MSI Gaming GF63',999,'8Gb','512GB SSD','15.6Inch Full HD','Nvidia GTX1650',1,6,3),(13,'44250_pulse_gl66_ha2.jpg','Có','Core i7 11800H ','Windows 10 Home',0,3,'3 cell',32790000,'MSI Gaming Pulse GL66',998,'16Gb','512GB NVMe PCle','15.6Inch Full HD','NVIDIA® GeForce RTX™',1,6,1),(14,'37829_lenovo_ideapad_c340_ha1.jpg','Có','Ryzen 5 3500U','Windows 10 Home',0,4,'4 cell',14290000,'Lenovo Ideapad C340',999,'8Gb','256Gb SSD','14.0Inch HD','Radeon Vega 8 ',1,5,1),(15,'1217_laptop_lenovo_thinkpad_t490s_20nxs00000_black_2.png','HD 720p ','Intel® Core™ i5-8265U','DOS',0,4,'3Cell 57WH',26990000,'Lenovo Thinkpad T490S',999,'8GB','256GB M.2 NVMe','14.0Inch Full HD','Intel® UHD Graphics 620',1,5,1),(16,'43495_tuf_gaming_fx516_ha1.jpg','Không có','Core i5 11300H','Windows 10 Home',0,4,'4 cell',25290000,'Asus TUF Gaming FX516PC',996,'8Gb','512GB M.2 NVMe™','15.6Inch Full HD','Nvidia RTX 3050 4GB DDR6',1,2,2),(17,'41084_vostro_3405_black_h1.jpg','Có','Ryzen 5 3500U','Windows 10 Home',0,4,'3 cell',16790000,'Dell Vostro 3405 V4R53500U003W',999,'8GB','512Gb SSD','14.0Inch Full HD','AMD Radeon™ Vega 3',1,3,3),(18,'600_macbook-pro-m1-pro-2021-14-inch-16gb-512gb-xtmobile_1.jpg','Có',' Apple M1 chip with 8-core','Mac OS',1,4,'	Built-in 58.2-watt-hour',36990000,' Apple Macbook Pro M1 ',999,'16Gb','256Gb SSD','13-inch Retina','VGA onboard ',1,4,2),(19,'44669_hp_victus_16_black_ha4.jpg','Có','Ryzen 5 5600H','Windows 11 Home',1,4,'4 cell',25790000,' HP VICTUS 16-e0179AX 4R0V0PA',999,'8GB','512GB ','16.1Inch FHD','NVIDIA RTX 3050 TI 4GB',1,1,1),(20,'45297_vivobook_asus_x515_silver_bh_ha3.jpg','Có','Core i5 1135G7','Windows 10 Home',0,4,'4 cell',18390000,'Vivobook Asus X515EP-EJ268T',999,'8GB','512 GB M.2 NVMe','15.6Inch Full HD','NVIDIA GeForce MX330-2GB',1,2,1),(22,'Laptop-MSI-Modern-14-B11MO5_1.jpg','720P HD camera','CPU Intel Core i5-6300U','Windows 10 Home',1,4,'4 cell',99999999,'MSI MODERN 14 B11MO 418VN',999,'8GB','128GB','15.6Inch Full HD','Intel UHD Graphics',1,6,2),(23,'600_macbook-pro-m1-pro-2021-14-inch-16gb-512gb-xtmobile_1.jpg','720P HD camera','5','Windows 10 Home',1,4,'4 cell',30000000,'MacBook Air 13\" 2020 M1 526GB',999,'8GB','128GB','15.6Inch Full HD','Intel UHD Graphics',1,4,1),(26,'1217_laptop_lenovo_thinkpad_t490s_20nxs00000_black_2.png','test','test','test',0,4,'test',20000000,'test',200,'test','test','test','test',1,1,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_type` (
  `id_type` int(11) NOT NULL,
  `avt` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'1','1','HP'),(2,'2','2','Asus'),(3,'3','3','Dell'),(4,'4','4','Apple'),(5,'5','5','Lenovo'),(6,'6','6','MSI');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotion` (
  `id_promotion` int(11) NOT NULL,
  `date_end` varchar(255) DEFAULT NULL,
  `date_start` varchar(255) DEFAULT NULL,
  `name_promotion` varchar(255) DEFAULT NULL,
  `promotional_value` float NOT NULL,
  `type_promotion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_promotion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'1','1','Giá rẻ online',1,'1'),(2,'2','2','Mới ra mắt',2,'2'),(3,'3','3','Trả góp 0%',3,'3');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_NV'),(2,'ROLE_USER'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25 11:43:05
