<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_rms
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_payment`
--

DROP TABLE IF EXISTS `billing_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_payment` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_payment`
--

LOCK TABLES `billing_payment` WRITE;
/*!40000 ALTER TABLE `billing_payment` DISABLE KEYS */;
INSERT INTO `billing_payment` VALUES ('PAY001','CASH',0,1,'2025-10-03 16:28:06','2025-10-04 01:26:29','system','system'),('PAY002','CREDIT_CARD',0,0,'2025-10-03 16:28:06','2025-10-03 16:28:06','system','system'),('PAY003','BANK_TRANSFER',1,1,'2025-10-03 16:28:06','2025-10-04 01:45:38','system','system'),('PAY004','E_WALLET',0,0,'2025-10-03 16:28:06','2025-10-03 16:28:06','system','system');
/*!40000 ALTER TABLE `billing_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_authority`
--

DROP TABLE IF EXISTS `customer_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_authority` (
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_authority`
--

LOCK TABLES `customer_authority` WRITE;
/*!40000 ALTER TABLE `customer_authority` DISABLE KEYS */;
INSERT INTO `customer_authority` VALUES ('admin'),('customer'),('staff');
/*!40000 ALTER TABLE `customer_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_feedback`
--

DROP TABLE IF EXISTS `customer_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_feedback` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `comment` text,
  `rating` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `customer_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_feedback_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_feedback`
--

LOCK TABLES `customer_feedback` WRITE;
/*!40000 ALTER TABLE `customer_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_permission`
--

DROP TABLE IF EXISTS `customer_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `target_key` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_permission`
--

LOCK TABLES `customer_permission` WRITE;
/*!40000 ALTER TABLE `customer_permission` DISABLE KEYS */;
INSERT INTO `customer_permission` VALUES (1,'Quản trị hệ thống','user_management','create, read, update, delete',0,'customer_module','https://example.com/images/permission1.png','2025-10-01 16:44:49','2025-10-01 16:44:49','admin','admin'),(2,'Xem báo cáo','reporting','read',0,'inventory_module',NULL,'2025-10-01 16:44:49','2025-10-01 16:44:49','admin','admin'),(3,'order bàn ăn','order','create, update',0,'order_module','https://example.com/images/permission3.png','2025-10-01 16:44:49','2025-10-01 16:44:49','system','system');
/*!40000 ALTER TABLE `customer_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_position`
--

DROP TABLE IF EXISTS `customer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_position` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_position`
--

LOCK TABLES `customer_position` WRITE;
/*!40000 ALTER TABLE `customer_position` DISABLE KEYS */;
INSERT INTO `customer_position` VALUES ('pos001','Quản trị viên','Quản lý hệ thống, người dùng và phân quyền.','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','admin',0),('pos002','Nhân viên phụ vụ','Phụ trách tư vấn và bán sản phẩm cho khách hàng.','2025-10-01 16:27:41','2025-10-01 16:28:15','system','admin',0),('pos003','Kế toán','Theo dõi thu chi, lập báo cáo tài chính.','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','admin',0),('pos004','Khách hàng','Người sửa dụng dịch vụ','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','system',0);
/*!40000 ALTER TABLE `customer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_profile`
--

DROP TABLE IF EXISTS `customer_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `address` text,
  `gender` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_profile`
--

LOCK TABLES `customer_profile` WRITE;
/*!40000 ALTER TABLE `customer_profile` DISABLE KEYS */;
INSERT INTO `customer_profile` VALUES (1,12,'Nguyen','Van','An','0905123456','an.nguyen@example.com','1990-05-20 00:00:00','123 Le Duan, Da Nang','M','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(3,3,'Le','Hoang','Minh','0907345678','minh.le@example.com','1992-07-10 00:00:00','78 Hai Ba Trung, Hue','M','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(5,10,'Nguyen','Thi','Cam','0914012345','cam.nguyen@example.com','1987-08-08 00:00:00','11 Tran Hung Dao, Quang Nam','F','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(8,4,'Le','Quang','Dung','0907345678','minh.le@example.com',NULL,NULL,'M','2025-10-03 00:24:45',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activated` int DEFAULT '0',
  `activation_key` varchar(100) DEFAULT NULL,
  `reset_key` varchar(100) DEFAULT NULL,
  `target_key` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES (2,'550e8400-e29b-41d4-a716-446655440000','nguyenvanan','$2y$10$abc123xyz456def789ghi012jkl345mno678pqr901stu234vwx567',1,'actkey789','resetkey789','targetkey789','https://example.com/images/user1.jpg','2025-10-01 13:22:41','2025-10-01 16:39:18'),(3,'550e8400-e29b-41d4-a716-446655440001','tranthibich','$2y$10$def456ghi789jkl012mno345pqr678stu901vwx234yz567abc890',0,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-01 13:22:41','2025-10-01 16:17:15'),(4,'550e8400-e29b-41d4-a716-446655440002','lequanghung','$2y$10$ghi789jkl012mno345pqr678stu901vwx234yz567abc890def123',1,'actkey456','resetkey456','targetkey456',NULL,'2025-10-01 13:22:41','2025-10-01 16:17:15'),(5,'550e8400-e29b-41d4-a716-446655440004','lehuy','123',1,'actkey123','resetkey123','targetkey123',NULL,'2025-10-01 16:39:18','2025-10-01 16:39:18'),(6,'550e8400-e29b-41d4-a716-446655440005','nguyenthily','$2y$10$abc123xyz456def789ghi012jkl345mno678pqr901stu234vwx567',1,'actkey567','resetkey567','targetkey567','https://example.com/images/user6.jpg','2025-10-01 17:11:08','2025-10-01 17:11:08'),(7,'934f1bb5-4fc7-41da-aacb-d9172d6386a8','minhanh','$2a$10$l2ZCR45gf/B0StqjzRaYy.4G7deJhQap54iFAkJSIIOJzSLyysfHO',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 00:18:44','2025-10-02 15:07:13'),(9,'abc4db9c-6266-4712-a74c-ff994505824c','tranthilinh','$2a$10$16jrnDggnWiwH9T3kOVSbOWCip6yCRHJO9KxUwqnqu4bcsJ5gwKIm',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 01:28:27','2025-10-02 15:07:13'),(10,'e37d312d-efc8-4e7e-99e3-093460eb751e','tranthilinh','$2a$10$lrvWzGVxBOJJD0r4TstFROJHgFbROvgx47FyTRChbmF/W0Ygdqmma',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:09:47','2025-10-02 15:07:13'),(11,'fd2b5684-843f-4b03-8e21-788c8df4ad5b','tranthilinh','$2a$10$WnVgk2R7B9gQWXaPX09ztehhMJ50tEU/4bCkRMs/6BquXsSWRNouy',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:15:03','2025-10-02 15:07:13'),(12,'50c30121-f4e9-413d-9255-bf9c00dc8d2d','tranthilinh','$2a$10$n5uxoPMAiKpnohXAXJjTtO/xtE0V7AdAIgbt9y0bJT7xIMcwG5FBS',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:18:04','2025-10-02 15:07:13'),(13,'22804d9e-68e5-4c6f-bd58-02e90a9081fb','tranthilinh','$2a$10$ACZvlzVGLrb4UwGGRjpmjO0AAUeItPrHlxlIaH3Lhh379QAvIMBM6',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:22:32','2025-10-02 15:07:13'),(14,'98dd6966-2f6f-461d-a4c9-c9b6e60e6cd5','tranthilinh','$2a$10$l4HK/mXsDrd9MjOOUnEH9.CEGNHWn.yI8nPssu6SLw1GsAxDELB56',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:22:56','2025-10-02 15:07:13'),(15,'74d29ff3-64b5-49a5-9a2b-bf6b571f15b2','tranthilinh','$2a$10$kvxIkbCn2VNWNtvIXtxLOOKIwz4Buxkvs87PghKdDJxeJjXLHt7tW',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:29:33','2025-10-02 15:07:13'),(16,'5cf888ab-fd1f-4261-ace7-ba3ab23fcec9','tranthilinh','$2a$10$ZYuQeqUZr62JRZ0jtaqtkuMsIxhkRX0pmHEHPLIEjFyQql07CoiZW',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:36:32','2025-10-02 15:07:13'),(17,'d533c7a4-5b4b-4137-bd54-75252ea83742','tranthilinh','$2a$10$tFdIgRR7KDqtC9ZCSdTu/uw.B4QGZD5EI3W3VWAXJpG6CbMxPhbye',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:41:31','2025-10-02 15:07:13'),(18,'41653777-ab3a-4acb-8597-c2641e8436b1','tranthilinh','$2a$10$FccFl2U6kV1t5Q1D2sb0Z.WNKiwAavCVn2hWSFYuF4T5UM0dIen3S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:25:59','2025-10-02 15:07:13'),(19,'fddc6068-a914-4700-a0d7-5460b1afdf48','trang','$2a$10$T5dMSjs.Gvz5S8Pl5JMj3eYk4asjTv7vO0c7s0PH6y5eQ6u88qtOG',1,NULL,NULL,NULL,'avatar.png','2025-10-02 07:27:42','2025-10-02 15:07:13'),(20,'e9d467d7-380f-42bb-996b-04f16a792bfc','trang','$2a$10$MKcYXW68XzffUUB1kF/QFe/R2gdVsbo2NJ/ZCkH8BVk3hw.B2Hjha',1,NULL,NULL,NULL,'avatar.png','2025-10-02 07:29:03','2025-10-02 15:07:13'),(21,'d469cd0d-643b-483c-a7b4-a92b63fe66df','tranthilinh','$2a$10$YQhiWPbdhWA5bxTk3bafHO2T/6sHRdL4wgAANOW.HUbfp1q/Opaom',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:36:24','2025-10-02 15:07:13'),(22,'284df822-d937-406d-ba4b-3e052ee95fde','tranthilinh','$2a$10$Twm/O21t8vZ0X8WpGTFjheNTbwkXj8nNnUq1tkxBAB2g.63tUFyLm',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:36:40','2025-10-02 15:07:13'),(24,'c1579399-9da4-4d44-b827-486fb43d91b0','tranthilinh','$2a$10$PzmSvSxnhGJDSRPrC0AqZOlZqdfD12mq1xg5bm1pUxo.JDhvLxqXG',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:46:31','2025-10-02 15:07:13'),(25,'db559204-16cc-4094-906d-188ac23fa21c','tranthilinh','$2a$10$dDK68LsHlV8pu3utUr6FpuKioLvjcgcjAdbjWyfZSxE1pdk3nHhzu',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:47:44','2025-10-02 15:07:13'),(26,'5724b552-9c94-41ea-a2b1-598297c4d998','tranthilinh','$2a$10$5Xf6JW.EQb6dcvZ5PwTnv.TyIGni.za0NUxD4oyyBXh9rm1KS5Soy',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:49:11','2025-10-02 15:07:13'),(27,'d6d79a98-4925-494d-9256-d0237fa11f7c','tranthilinh','$2a$10$hF.spp23NAkVE2IrEJ2tiesofVqNXZvmib//shvsFRbtJn0eyT2uC',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:56:23','2025-10-02 15:07:13'),(28,'e62b1196-dc93-4370-9c1b-1adf50e6ed3c','tranthilinh','$2a$10$uscNlCM.roKxtWS1sNeAeevjh2bI3JRNLyMg0A8sq/3a0HEmkqP8a',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:56:26','2025-10-02 15:07:13'),(29,'9f9739cd-a25b-4809-8e7f-0b33f0f0c868','tranthilinh','$2a$10$PSkschr4suwz2qERwdDQuO5i4jn6Azj8X1NWIbOpftwQz5rqAIwlq',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:17','2025-10-02 15:07:13'),(30,'12d6d8d7-3862-4099-95f6-3197b3427fd1','tranthilinh','$2a$10$m3DK.rbqtNitu3mH1M/cgOCNn32R.9A4OslMEbF2WRIBAmoG87lbi',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:45','2025-10-02 15:07:13'),(31,'cfa6e6cb-282e-41d3-922e-fb27c907c64f','tranthilinh','$2a$10$7SQpHE08pZCxCaPbR6/9oO5xbNpQ56xNV991/Vx46E1lsxdU8qU4S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:48','2025-10-02 15:07:13'),(32,'63573862-e9ab-4485-8a5a-98ebb300eb49','tranthilinh','$2a$10$1C3Vr6a67g14lLnfLshj6.dF9mSvTL9o9B7XTpNbqQeXLoMzdxk2e',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:31:19','2025-10-02 15:07:13'),(33,'02f91502-8f37-46db-94f2-45a376cfbd99','tranthilinh','$2a$10$MXKOVhqh8hWvDq5.ZI/2H.2ePA/LCHRRd9l6SfYpVIg1cUoPnOzS6',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:39:29','2025-10-02 15:07:13'),(35,'7c4295f1-9a47-4f2c-b8ea-979656fb0cfd','tranthilinh','$2a$10$p7YWftYldScURpp4ls9l0OT2WC1Bo5bz9V6V7J05TPhY9SFmdjN2S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:50:00','2025-10-02 15:07:13'),(46,'ca991cca-ae69-4499-9de8-5154ff2e7b72','tranthilinh','$2a$10$2sYaD4luSdZOqodv4AYxq.NrU5i2w92uBOkWP2h5cZDzJa.99bHaa',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 12:46:02','2025-10-02 15:07:13');
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_authority`
--

DROP TABLE IF EXISTS `customer_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user_authority` (
  `id` varchar(36) NOT NULL,
  `user_id` bigint NOT NULL,
  `authority_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `authority_name` (`authority_name`),
  CONSTRAINT `customer_user_authority_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_user_authority_ibfk_2` FOREIGN KEY (`authority_name`) REFERENCES `customer_authority` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_authority`
--

LOCK TABLES `customer_user_authority` WRITE;
/*!40000 ALTER TABLE `customer_user_authority` DISABLE KEYS */;
INSERT INTO `customer_user_authority` VALUES ('auth001',4,'customer'),('auth002',2,'staff'),('auth003',3,'customer'),('auth004',5,'admin');
/*!40000 ALTER TABLE `customer_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_permission`
--

DROP TABLE IF EXISTS `customer_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `customer_user_permission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_user_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `customer_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_permission`
--

LOCK TABLES `customer_user_permission` WRITE;
/*!40000 ALTER TABLE `customer_user_permission` DISABLE KEYS */;
INSERT INTO `customer_user_permission` VALUES (1,5,1),(2,2,2),(3,3,3),(4,4,3);
/*!40000 ALTER TABLE `customer_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_publication`
--

DROP TABLE IF EXISTS `event_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_publication` (
  `id` binary(16) NOT NULL,
  `completion_date` datetime(6) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `listener_id` varchar(255) DEFAULT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `serialized_event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_publication`
--

LOCK TABLES `event_publication` WRITE;
/*!40000 ALTER TABLE `event_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_export`
--

DROP TABLE IF EXISTS `inventory_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_export` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `export_date` date DEFAULT NULL,
  `note` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_export_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_export`
--

LOCK TABLES `inventory_export` WRITE;
/*!40000 ALTER TABLE `inventory_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_export_details`
--

DROP TABLE IF EXISTS `inventory_export_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_export_details` (
  `id` varchar(50) NOT NULL,
  `export_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `export_id` (`export_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `inventory_export_details_ibfk_1` FOREIGN KEY (`export_id`) REFERENCES `inventory_export` (`id`),
  CONSTRAINT `inventory_export_details_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_export_details`
--

LOCK TABLES `inventory_export_details` WRITE;
/*!40000 ALTER TABLE `inventory_export_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_export_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_import`
--

DROP TABLE IF EXISTS `inventory_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_import` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `imported_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_import_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_import`
--

LOCK TABLES `inventory_import` WRITE;
/*!40000 ALTER TABLE `inventory_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_import_details`
--

DROP TABLE IF EXISTS `inventory_import_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_import_details` (
  `id` varchar(50) NOT NULL,
  `import_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `inventory_import_details_ibfk_1` FOREIGN KEY (`import_id`) REFERENCES `inventory_import` (`id`),
  CONSTRAINT `inventory_import_details_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_import_details`
--

LOCK TABLES `inventory_import_details` WRITE;
/*!40000 ALTER TABLE `inventory_import_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_import_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_supplier`
--

DROP TABLE IF EXISTS `inventory_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_supplier` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_supplier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_supplier`
--

LOCK TABLES `inventory_supplier` WRITE;
/*!40000 ALTER TABLE `inventory_supplier` DISABLE KEYS */;
INSERT INTO `inventory_supplier` VALUES ('sup001','Fresh Farms Co.','123 Main Street, Hanoi','0987654321',6,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup002','Ocean Seafood Ltd.','456 Ocean Avenue, Hai Phong','0912345678',2,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup003','Green Veggies Supply','789 Green Road, Da Nang','0901122334',3,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup004','Tropical Dairy Co.','12 Coconut Street, Ho Chi Minh','0934455667',4,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup005','Choco Delight Factory','34 Cocoa Lane, Binh Duong','0945566778',5,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0);
/*!40000 ALTER TABLE `inventory_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES ('cate001','Main Courses','https://example.com/icons/main_courses.png'),('cate002','Appetizers','https://example.com/icons/appetizers.png'),('cate003','Desserts','https://example.com/icons/desserts.png'),('cate004','Beverages','https://example.com/icons/beverages.png'),('cate005','Vegetarian Dishes','https://example.com/icons/vegetarian.png'),('cate006','MainCourses','https://example.com/icons/main_courses.png');
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ingredient`
--

DROP TABLE IF EXISTS `menu_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_ingredient` (
  `id` varchar(50) NOT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `cate_id` varchar(50) DEFAULT NULL,
  `unit_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `cate_id` (`cate_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `menu_ingredient_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `inventory_supplier` (`id`),
  CONSTRAINT `menu_ingredient_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `menu_category` (`id`),
  CONSTRAINT `menu_ingredient_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `menu_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ingredient`
--

LOCK TABLES `menu_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_product`
--

DROP TABLE IF EXISTS `menu_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_product` (
  `id` varchar(50) NOT NULL,
  `cate_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `price_promotion` double DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `menu_product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `menu_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product`
--

LOCK TABLES `menu_product` WRITE;
/*!40000 ALTER TABLE `menu_product` DISABLE KEYS */;
INSERT INTO `menu_product` VALUES ('dish001','cate001','Grilled Salmon','Fresh salmon fillet grilled with lemon butter sauce.',180000,160000,'https://example.com/images/grilled_salmon.jpg',0,'2025-10-02 21:54:40','2025-10-02 21:54:40','admin','admin'),('dish0011','cate002','Iced Tea','Refreshing lemon tea served with ice.',30000,40000,'https://example.com/images/lemon_tea.jpg',NULL,'2025-10-03 02:38:50','2025-10-03 02:38:50',NULL,NULL),('dish0012','cate002','Iced Tea','Refreshing lemon tea served with ice.',40000,30000,'https://example.com/images/lemon_tea.jpg',NULL,'2025-10-04 13:30:08','2025-10-04 13:30:08',NULL,NULL),('dish005','cate003','Coconut Ice Cream','Homemade coconut ice cream served with roasted peanuts.',50000,40000,'https://example.com/images/coconut_ice_cream.jpg',0,'2025-10-02 21:54:40','2025-10-04 13:09:38','admin','admin'),('dish007','cate004','Iced Lemon Tea','Refreshing lemon tea served with ice.',30000,40000,'https://example.com/images/lemon_tea.jpg',0,'2025-10-02 21:54:40','2025-10-03 01:23:50','admin','admin');
/*!40000 ALTER TABLE `menu_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_product_ingredient`
--

DROP TABLE IF EXISTS `menu_product_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_product_ingredient` (
  `id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `menu_product_ingredient_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `menu`.`product` (`id`),
  CONSTRAINT `menu_product_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu`.`ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product_ingredient`
--

LOCK TABLES `menu_product_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_product_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_product_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_unit`
--

DROP TABLE IF EXISTS `menu_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_unit` (
  `id` varchar(50) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_unit`
--

LOCK TABLES `menu_unit` WRITE;
/*!40000 ALTER TABLE `menu_unit` DISABLE KEYS */;
INSERT INTO `menu_unit` VALUES ('unit001','Bottle','2025-10-02 21:51:20','admin',0),('unit002','Can','2025-10-02 21:51:20','admin',0),('unit003','Piece','2025-10-02 21:51:20','admin',0);
/*!40000 ALTER TABLE `menu_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_notification`
--

DROP TABLE IF EXISTS `order_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_notification` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `order_notification_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_notification`
--

LOCK TABLES `order_notification` WRITE;
/*!40000 ALTER TABLE `order_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order_details`
--

DROP TABLE IF EXISTS `orders_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order_details` (
  `id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`),
  CONSTRAINT `orders_order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `menu_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order_details`
--

LOCK TABLES `orders_order_details` WRITE;
/*!40000 ALTER TABLE `orders_order_details` DISABLE KEYS */;
INSERT INTO `orders_order_details` VALUES ('OD005','ORDER004','dish005',3,150000),('OD006','ORDER004','dish007',3,150000),('ORDER001','ORDER001','dish007',3,150000),('ORDER002','ORDER001','dish007',3,150000),('ORDER003','ORDER001','dish005',3,150000),('ORDER004','ORDER003','dish005',3,150000);
/*!40000 ALTER TABLE `orders_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orders`
--

DROP TABLE IF EXISTS `orders_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orders` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `table_id` varchar(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `order_type` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `payment_id` (`payment_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `orders_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `orders_orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `billing_payment` (`id`),
  CONSTRAINT `orders_orders_ibfk_3` FOREIGN KEY (`table_id`) REFERENCES `table_management_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orders`
--

LOCK TABLES `orders_orders` WRITE;
/*!40000 ALTER TABLE `orders_orders` DISABLE KEYS */;
INSERT INTO `orders_orders` VALUES ('ORDER001',3,'PAY003','TBL002',450000,'tại bàn','2025-10-03 16:53:50','2025-10-03 16:53:50','admin','admin',0),('ORDER003',3,'PAY003','TBL002',NULL,'tại bàn','2025-10-04 15:54:22',NULL,NULL,NULL,0),('ORDER004',3,'PAY003','TBL002',NULL,'tại bàn','2025-10-04 15:57:09',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `orders_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_attendance` (
  `id` varchar(36) NOT NULL,
  `user_id` bigint NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_salary`
--

DROP TABLE IF EXISTS `staff_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_salary` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `date_for_salary` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_salary_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_salary`
--

LOCK TABLES `staff_salary` WRITE;
/*!40000 ALTER TABLE `staff_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_management_table`
--

DROP TABLE IF EXISTS `table_management_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_management_table` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_management_table`
--

LOCK TABLES `table_management_table` WRITE;
/*!40000 ALTER TABLE `table_management_table` DISABLE KEYS */;
INSERT INTO `table_management_table` VALUES ('TBL001','VIP Room A',10,1,'Zone 1',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL002','VIP Room B',8,1,'Zone 1',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL003','Standard Table 1',4,1,'Zone 2',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL004','Standard Table 2',4,0,'Zone 2',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL005','Outdoor Table 1',6,1,'Garden Area',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL006','Outdoor Table 2',6,1,'Garden Area',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL007','Family Table A',12,1,'Zone 3',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL008','Couple Table 1',2,1,'Zone 4',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL009','Couple Table 2',2,0,'Zone 4',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL010','Conference Table',20,1,'Meeting Room',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin');
/*!40000 ALTER TABLE `table_management_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_rms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-04 23:42:36
=======
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_rms
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_payment`
--

DROP TABLE IF EXISTS `billing_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_payment` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_payment`
--

LOCK TABLES `billing_payment` WRITE;
/*!40000 ALTER TABLE `billing_payment` DISABLE KEYS */;
INSERT INTO `billing_payment` VALUES ('PAY001','CASH',0,1,'2025-10-03 16:28:06','2025-10-04 01:26:29','system','system'),('PAY002','CREDIT_CARD',0,0,'2025-10-03 16:28:06','2025-10-03 16:28:06','system','system'),('PAY003','BANK_TRANSFER',1,1,'2025-10-03 16:28:06','2025-10-04 01:45:38','system','system'),('PAY004','E_WALLET',0,0,'2025-10-03 16:28:06','2025-10-03 16:28:06','system','system');
/*!40000 ALTER TABLE `billing_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_authority`
--

DROP TABLE IF EXISTS `customer_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_authority` (
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_authority`
--

LOCK TABLES `customer_authority` WRITE;
/*!40000 ALTER TABLE `customer_authority` DISABLE KEYS */;
INSERT INTO `customer_authority` VALUES ('admin'),('customer'),('staff');
/*!40000 ALTER TABLE `customer_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_feedback`
--

DROP TABLE IF EXISTS `customer_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_feedback` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `comment` text,
  `rating` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `customer_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_feedback_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_feedback`
--

LOCK TABLES `customer_feedback` WRITE;
/*!40000 ALTER TABLE `customer_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_permission`
--

DROP TABLE IF EXISTS `customer_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `target_key` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_permission`
--

LOCK TABLES `customer_permission` WRITE;
/*!40000 ALTER TABLE `customer_permission` DISABLE KEYS */;
INSERT INTO `customer_permission` VALUES (1,'Quản trị hệ thống','user_management','create, read, update, delete',0,'customer_module','https://example.com/images/permission1.png','2025-10-01 16:44:49','2025-10-01 16:44:49','admin','admin'),(2,'Xem báo cáo','reporting','read',0,'inventory_module',NULL,'2025-10-01 16:44:49','2025-10-01 16:44:49','admin','admin'),(3,'order bàn ăn','order','create, update',0,'order_module','https://example.com/images/permission3.png','2025-10-01 16:44:49','2025-10-01 16:44:49','system','system');
/*!40000 ALTER TABLE `customer_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_position`
--

DROP TABLE IF EXISTS `customer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_position` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_position`
--

LOCK TABLES `customer_position` WRITE;
/*!40000 ALTER TABLE `customer_position` DISABLE KEYS */;
INSERT INTO `customer_position` VALUES ('pos001','Quản trị viên','Quản lý hệ thống, người dùng và phân quyền.','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','admin',0),('pos002','Nhân viên phụ vụ','Phụ trách tư vấn và bán sản phẩm cho khách hàng.','2025-10-01 16:27:41','2025-10-01 16:28:15','system','admin',0),('pos003','Kế toán','Theo dõi thu chi, lập báo cáo tài chính.','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','admin',0),('pos004','Khách hàng','Người sửa dụng dịch vụ','2025-10-01 16:27:41','2025-10-01 16:27:41','admin','system',0);
/*!40000 ALTER TABLE `customer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_profile`
--

DROP TABLE IF EXISTS `customer_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `address` text,
  `gender` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_profile`
--

LOCK TABLES `customer_profile` WRITE;
/*!40000 ALTER TABLE `customer_profile` DISABLE KEYS */;
INSERT INTO `customer_profile` VALUES (1,12,'Nguyen','Van','An','0905123456','an.nguyen@example.com','1990-05-20 00:00:00','123 Le Duan, Da Nang','M','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(3,3,'Le','Hoang','Minh','0907345678','minh.le@example.com','1992-07-10 00:00:00','78 Hai Ba Trung, Hue','M','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(5,10,'Nguyen','Thi','Cam','0914012345','cam.nguyen@example.com','1987-08-08 00:00:00','11 Tran Hung Dao, Quang Nam','F','2025-10-02 13:19:02','2025-10-02 13:19:02','admin','admin',0),(8,4,'Le','Quang','Dung','0907345678','minh.le@example.com',NULL,NULL,'M','2025-10-03 00:24:45',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activated` int DEFAULT '0',
  `activation_key` varchar(100) DEFAULT NULL,
  `reset_key` varchar(100) DEFAULT NULL,
  `target_key` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES (2,'550e8400-e29b-41d4-a716-446655440000','nguyenvanan','$2y$10$abc123xyz456def789ghi012jkl345mno678pqr901stu234vwx567',1,'actkey789','resetkey789','targetkey789','https://example.com/images/user1.jpg','2025-10-01 13:22:41','2025-10-01 16:39:18'),(3,'550e8400-e29b-41d4-a716-446655440001','tranthibich','$2y$10$def456ghi789jkl012mno345pqr678stu901vwx234yz567abc890',0,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-01 13:22:41','2025-10-01 16:17:15'),(4,'550e8400-e29b-41d4-a716-446655440002','lequanghung','$2y$10$ghi789jkl012mno345pqr678stu901vwx234yz567abc890def123',1,'actkey456','resetkey456','targetkey456',NULL,'2025-10-01 13:22:41','2025-10-01 16:17:15'),(5,'550e8400-e29b-41d4-a716-446655440004','lehuy','123',1,'actkey123','resetkey123','targetkey123',NULL,'2025-10-01 16:39:18','2025-10-01 16:39:18'),(6,'550e8400-e29b-41d4-a716-446655440005','nguyenthily','$2y$10$abc123xyz456def789ghi012jkl345mno678pqr901stu234vwx567',1,'actkey567','resetkey567','targetkey567','https://example.com/images/user6.jpg','2025-10-01 17:11:08','2025-10-01 17:11:08'),(7,'934f1bb5-4fc7-41da-aacb-d9172d6386a8','minhanh','$2a$10$l2ZCR45gf/B0StqjzRaYy.4G7deJhQap54iFAkJSIIOJzSLyysfHO',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 00:18:44','2025-10-02 15:07:13'),(9,'abc4db9c-6266-4712-a74c-ff994505824c','tranthilinh','$2a$10$16jrnDggnWiwH9T3kOVSbOWCip6yCRHJO9KxUwqnqu4bcsJ5gwKIm',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 01:28:27','2025-10-02 15:07:13'),(10,'e37d312d-efc8-4e7e-99e3-093460eb751e','tranthilinh','$2a$10$lrvWzGVxBOJJD0r4TstFROJHgFbROvgx47FyTRChbmF/W0Ygdqmma',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:09:47','2025-10-02 15:07:13'),(11,'fd2b5684-843f-4b03-8e21-788c8df4ad5b','tranthilinh','$2a$10$WnVgk2R7B9gQWXaPX09ztehhMJ50tEU/4bCkRMs/6BquXsSWRNouy',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:15:03','2025-10-02 15:07:13'),(12,'50c30121-f4e9-413d-9255-bf9c00dc8d2d','tranthilinh','$2a$10$n5uxoPMAiKpnohXAXJjTtO/xtE0V7AdAIgbt9y0bJT7xIMcwG5FBS',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:18:04','2025-10-02 15:07:13'),(13,'22804d9e-68e5-4c6f-bd58-02e90a9081fb','tranthilinh','$2a$10$ACZvlzVGLrb4UwGGRjpmjO0AAUeItPrHlxlIaH3Lhh379QAvIMBM6',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:22:32','2025-10-02 15:07:13'),(14,'98dd6966-2f6f-461d-a4c9-c9b6e60e6cd5','tranthilinh','$2a$10$l4HK/mXsDrd9MjOOUnEH9.CEGNHWn.yI8nPssu6SLw1GsAxDELB56',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:22:56','2025-10-02 15:07:13'),(15,'74d29ff3-64b5-49a5-9a2b-bf6b571f15b2','tranthilinh','$2a$10$kvxIkbCn2VNWNtvIXtxLOOKIwz4Buxkvs87PghKdDJxeJjXLHt7tW',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:29:33','2025-10-02 15:07:13'),(16,'5cf888ab-fd1f-4261-ace7-ba3ab23fcec9','tranthilinh','$2a$10$ZYuQeqUZr62JRZ0jtaqtkuMsIxhkRX0pmHEHPLIEjFyQql07CoiZW',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:36:32','2025-10-02 15:07:13'),(17,'d533c7a4-5b4b-4137-bd54-75252ea83742','tranthilinh','$2a$10$tFdIgRR7KDqtC9ZCSdTu/uw.B4QGZD5EI3W3VWAXJpG6CbMxPhbye',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 02:41:31','2025-10-02 15:07:13'),(18,'41653777-ab3a-4acb-8597-c2641e8436b1','tranthilinh','$2a$10$FccFl2U6kV1t5Q1D2sb0Z.WNKiwAavCVn2hWSFYuF4T5UM0dIen3S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:25:59','2025-10-02 15:07:13'),(19,'fddc6068-a914-4700-a0d7-5460b1afdf48','trang','$2a$10$T5dMSjs.Gvz5S8Pl5JMj3eYk4asjTv7vO0c7s0PH6y5eQ6u88qtOG',1,NULL,NULL,NULL,'avatar.png','2025-10-02 07:27:42','2025-10-02 15:07:13'),(20,'e9d467d7-380f-42bb-996b-04f16a792bfc','trang','$2a$10$MKcYXW68XzffUUB1kF/QFe/R2gdVsbo2NJ/ZCkH8BVk3hw.B2Hjha',1,NULL,NULL,NULL,'avatar.png','2025-10-02 07:29:03','2025-10-02 15:07:13'),(21,'d469cd0d-643b-483c-a7b4-a92b63fe66df','tranthilinh','$2a$10$YQhiWPbdhWA5bxTk3bafHO2T/6sHRdL4wgAANOW.HUbfp1q/Opaom',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:36:24','2025-10-02 15:07:13'),(22,'284df822-d937-406d-ba4b-3e052ee95fde','tranthilinh','$2a$10$Twm/O21t8vZ0X8WpGTFjheNTbwkXj8nNnUq1tkxBAB2g.63tUFyLm',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:36:40','2025-10-02 15:07:13'),(24,'c1579399-9da4-4d44-b827-486fb43d91b0','tranthilinh','$2a$10$PzmSvSxnhGJDSRPrC0AqZOlZqdfD12mq1xg5bm1pUxo.JDhvLxqXG',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:46:31','2025-10-02 15:07:13'),(25,'db559204-16cc-4094-906d-188ac23fa21c','tranthilinh','$2a$10$dDK68LsHlV8pu3utUr6FpuKioLvjcgcjAdbjWyfZSxE1pdk3nHhzu',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:47:44','2025-10-02 15:07:13'),(26,'5724b552-9c94-41ea-a2b1-598297c4d998','tranthilinh','$2a$10$5Xf6JW.EQb6dcvZ5PwTnv.TyIGni.za0NUxD4oyyBXh9rm1KS5Soy',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:49:11','2025-10-02 15:07:13'),(27,'d6d79a98-4925-494d-9256-d0237fa11f7c','tranthilinh','$2a$10$hF.spp23NAkVE2IrEJ2tiesofVqNXZvmib//shvsFRbtJn0eyT2uC',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:56:23','2025-10-02 15:07:13'),(28,'e62b1196-dc93-4370-9c1b-1adf50e6ed3c','tranthilinh','$2a$10$uscNlCM.roKxtWS1sNeAeevjh2bI3JRNLyMg0A8sq/3a0HEmkqP8a',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:56:26','2025-10-02 15:07:13'),(29,'9f9739cd-a25b-4809-8e7f-0b33f0f0c868','tranthilinh','$2a$10$PSkschr4suwz2qERwdDQuO5i4jn6Azj8X1NWIbOpftwQz5rqAIwlq',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:17','2025-10-02 15:07:13'),(30,'12d6d8d7-3862-4099-95f6-3197b3427fd1','tranthilinh','$2a$10$m3DK.rbqtNitu3mH1M/cgOCNn32R.9A4OslMEbF2WRIBAmoG87lbi',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:45','2025-10-02 15:07:13'),(31,'cfa6e6cb-282e-41d3-922e-fb27c907c64f','tranthilinh','$2a$10$7SQpHE08pZCxCaPbR6/9oO5xbNpQ56xNV991/Vx46E1lsxdU8qU4S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 07:58:48','2025-10-02 15:07:13'),(32,'63573862-e9ab-4485-8a5a-98ebb300eb49','tranthilinh','$2a$10$1C3Vr6a67g14lLnfLshj6.dF9mSvTL9o9B7XTpNbqQeXLoMzdxk2e',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:31:19','2025-10-02 15:07:13'),(33,'02f91502-8f37-46db-94f2-45a376cfbd99','tranthilinh','$2a$10$MXKOVhqh8hWvDq5.ZI/2H.2ePA/LCHRRd9l6SfYpVIg1cUoPnOzS6',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:39:29','2025-10-02 15:07:13'),(35,'7c4295f1-9a47-4f2c-b8ea-979656fb0cfd','tranthilinh','$2a$10$p7YWftYldScURpp4ls9l0OT2WC1Bo5bz9V6V7J05TPhY9SFmdjN2S',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 08:50:00','2025-10-02 15:07:13'),(46,'ca991cca-ae69-4499-9de8-5154ff2e7b72','tranthilinh','$2a$10$2sYaD4luSdZOqodv4AYxq.NrU5i2w92uBOkWP2h5cZDzJa.99bHaa',1,NULL,NULL,NULL,'https://example.com/images/user2.jpg','2025-10-02 12:46:02','2025-10-02 15:07:13');
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_authority`
--

DROP TABLE IF EXISTS `customer_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user_authority` (
  `id` varchar(36) NOT NULL,
  `user_id` bigint NOT NULL,
  `authority_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `authority_name` (`authority_name`),
  CONSTRAINT `customer_user_authority_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_user_authority_ibfk_2` FOREIGN KEY (`authority_name`) REFERENCES `customer_authority` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_authority`
--

LOCK TABLES `customer_user_authority` WRITE;
/*!40000 ALTER TABLE `customer_user_authority` DISABLE KEYS */;
INSERT INTO `customer_user_authority` VALUES ('auth001',4,'customer'),('auth002',2,'staff'),('auth003',3,'customer'),('auth004',5,'admin');
/*!40000 ALTER TABLE `customer_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_permission`
--

DROP TABLE IF EXISTS `customer_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `customer_user_permission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `customer_user_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `customer_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_permission`
--

LOCK TABLES `customer_user_permission` WRITE;
/*!40000 ALTER TABLE `customer_user_permission` DISABLE KEYS */;
INSERT INTO `customer_user_permission` VALUES (1,5,1),(2,2,2),(3,3,3),(4,4,3);
/*!40000 ALTER TABLE `customer_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_publication`
--

DROP TABLE IF EXISTS `event_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_publication` (
  `id` binary(16) NOT NULL,
  `completion_date` datetime(6) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `listener_id` varchar(255) DEFAULT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `serialized_event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_publication`
--

LOCK TABLES `event_publication` WRITE;
/*!40000 ALTER TABLE `event_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_export`
--

DROP TABLE IF EXISTS `inventory_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_export` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `export_date` date DEFAULT NULL,
  `note` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_export_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_export`
--

LOCK TABLES `inventory_export` WRITE;
/*!40000 ALTER TABLE `inventory_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_export_details`
--

DROP TABLE IF EXISTS `inventory_export_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_export_details` (
  `id` varchar(50) NOT NULL,
  `export_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `export_id` (`export_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `inventory_export_details_ibfk_1` FOREIGN KEY (`export_id`) REFERENCES `inventory_export` (`id`),
  CONSTRAINT `inventory_export_details_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_export_details`
--

LOCK TABLES `inventory_export_details` WRITE;
/*!40000 ALTER TABLE `inventory_export_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_export_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_import`
--

DROP TABLE IF EXISTS `inventory_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_import` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `imported_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_import_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_import`
--

LOCK TABLES `inventory_import` WRITE;
/*!40000 ALTER TABLE `inventory_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_import_details`
--

DROP TABLE IF EXISTS `inventory_import_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_import_details` (
  `id` varchar(50) NOT NULL,
  `import_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  `quantity` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `inventory_import_details_ibfk_1` FOREIGN KEY (`import_id`) REFERENCES `inventory_import` (`id`),
  CONSTRAINT `inventory_import_details_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_import_details`
--

LOCK TABLES `inventory_import_details` WRITE;
/*!40000 ALTER TABLE `inventory_import_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_import_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_supplier`
--

DROP TABLE IF EXISTS `inventory_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_supplier` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inventory_supplier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_supplier`
--

LOCK TABLES `inventory_supplier` WRITE;
/*!40000 ALTER TABLE `inventory_supplier` DISABLE KEYS */;
INSERT INTO `inventory_supplier` VALUES ('sup001','Fresh Farms Co.','123 Main Street, Hanoi','0987654321',6,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup002','Ocean Seafood Ltd.','456 Ocean Avenue, Hai Phong','0912345678',2,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup003','Green Veggies Supply','789 Green Road, Da Nang','0901122334',3,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup004','Tropical Dairy Co.','12 Coconut Street, Ho Chi Minh','0934455667',4,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0),('sup005','Choco Delight Factory','34 Cocoa Lane, Binh Duong','0945566778',5,'2025-10-02 21:47:25','2025-10-02 21:47:25','admin','admin',0);
/*!40000 ALTER TABLE `inventory_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES ('cate001','Main Courses','https://example.com/icons/main_courses.png'),('cate002','Appetizers','https://example.com/icons/appetizers.png'),('cate003','Desserts','https://example.com/icons/desserts.png'),('cate004','Beverages','https://example.com/icons/beverages.png'),('cate005','Vegetarian Dishes','https://example.com/icons/vegetarian.png'),('cate006','MainCourses','https://example.com/icons/main_courses.png');
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ingredient`
--

DROP TABLE IF EXISTS `menu_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_ingredient` (
  `id` varchar(50) NOT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `cate_id` varchar(50) DEFAULT NULL,
  `unit_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `cate_id` (`cate_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `menu_ingredient_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `inventory_supplier` (`id`),
  CONSTRAINT `menu_ingredient_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `menu_category` (`id`),
  CONSTRAINT `menu_ingredient_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `menu_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ingredient`
--

LOCK TABLES `menu_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_product`
--

DROP TABLE IF EXISTS `menu_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_product` (
  `id` varchar(50) NOT NULL,
  `cate_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `price_promotion` double DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `menu_product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `menu_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product`
--

LOCK TABLES `menu_product` WRITE;
/*!40000 ALTER TABLE `menu_product` DISABLE KEYS */;
INSERT INTO `menu_product` VALUES ('dish001','cate001','Grilled Salmon','Fresh salmon fillet grilled with lemon butter sauce.',180000,160000,'https://example.com/images/grilled_salmon.jpg',0,'2025-10-02 21:54:40','2025-10-02 21:54:40','admin','admin'),('dish0011','cate002','Iced Tea','Refreshing lemon tea served with ice.',30000,40000,'https://example.com/images/lemon_tea.jpg',NULL,'2025-10-03 02:38:50','2025-10-03 02:38:50',NULL,NULL),('dish0012','cate002','Iced Tea','Refreshing lemon tea served with ice.',40000,30000,'https://example.com/images/lemon_tea.jpg',NULL,'2025-10-04 13:30:08','2025-10-04 13:30:08',NULL,NULL),('dish005','cate003','Coconut Ice Cream','Homemade coconut ice cream served with roasted peanuts.',50000,40000,'https://example.com/images/coconut_ice_cream.jpg',0,'2025-10-02 21:54:40','2025-10-04 13:09:38','admin','admin'),('dish007','cate004','Iced Lemon Tea','Refreshing lemon tea served with ice.',30000,40000,'https://example.com/images/lemon_tea.jpg',0,'2025-10-02 21:54:40','2025-10-03 01:23:50','admin','admin');
/*!40000 ALTER TABLE `menu_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_product_ingredient`
--

DROP TABLE IF EXISTS `menu_product_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_product_ingredient` (
  `id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `ingredient_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `menu_product_ingredient_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `menu`.`product` (`id`),
  CONSTRAINT `menu_product_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `menu`.`ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_product_ingredient`
--

LOCK TABLES `menu_product_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_product_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_product_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_unit`
--

DROP TABLE IF EXISTS `menu_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_unit` (
  `id` varchar(50) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_unit`
--

LOCK TABLES `menu_unit` WRITE;
/*!40000 ALTER TABLE `menu_unit` DISABLE KEYS */;
INSERT INTO `menu_unit` VALUES ('unit001','Bottle','2025-10-02 21:51:20','admin',0),('unit002','Can','2025-10-02 21:51:20','admin',0),('unit003','Piece','2025-10-02 21:51:20','admin',0);
/*!40000 ALTER TABLE `menu_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_notification`
--

DROP TABLE IF EXISTS `order_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_notification` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `order_notification_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_notification`
--

LOCK TABLES `order_notification` WRITE;
/*!40000 ALTER TABLE `order_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order_details`
--

DROP TABLE IF EXISTS `orders_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order_details` (
  `id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders_orders` (`id`),
  CONSTRAINT `orders_order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `menu_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order_details`
--

LOCK TABLES `orders_order_details` WRITE;
/*!40000 ALTER TABLE `orders_order_details` DISABLE KEYS */;
INSERT INTO `orders_order_details` VALUES ('OD005','ORDER004','dish005',3,150000),('OD006','ORDER004','dish007',3,150000),('ORDER001','ORDER001','dish007',3,150000),('ORDER002','ORDER001','dish007',3,150000),('ORDER003','ORDER001','dish005',3,150000),('ORDER004','ORDER003','dish005',3,150000);
/*!40000 ALTER TABLE `orders_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orders`
--

DROP TABLE IF EXISTS `orders_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orders` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `table_id` varchar(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `order_type` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `payment_id` (`payment_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `orders_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`),
  CONSTRAINT `orders_orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `billing_payment` (`id`),
  CONSTRAINT `orders_orders_ibfk_3` FOREIGN KEY (`table_id`) REFERENCES `table_management_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orders`
--

LOCK TABLES `orders_orders` WRITE;
/*!40000 ALTER TABLE `orders_orders` DISABLE KEYS */;
INSERT INTO `orders_orders` VALUES ('ORDER001',3,'PAY003','TBL002',450000,'tại bàn','2025-10-03 16:53:50','2025-10-03 16:53:50','admin','admin',0),('ORDER003',3,'PAY003','TBL002',NULL,'tại bàn','2025-10-04 15:54:22',NULL,NULL,NULL,0),('ORDER004',3,'PAY003','TBL002',NULL,'tại bàn','2025-10-04 15:57:09',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `orders_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_attendance` (
  `id` varchar(36) NOT NULL,
  `user_id` bigint NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_salary`
--

DROP TABLE IF EXISTS `staff_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_salary` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `date_for_salary` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_salary_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_salary`
--

LOCK TABLES `staff_salary` WRITE;
/*!40000 ALTER TABLE `staff_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_management_table`
--

DROP TABLE IF EXISTS `table_management_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_management_table` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_management_table`
--

LOCK TABLES `table_management_table` WRITE;
/*!40000 ALTER TABLE `table_management_table` DISABLE KEYS */;
INSERT INTO `table_management_table` VALUES ('TBL001','VIP Room A',10,1,'Zone 1',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL002','VIP Room B',8,1,'Zone 1',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL003','Standard Table 1',4,1,'Zone 2',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL004','Standard Table 2',4,0,'Zone 2',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL005','Outdoor Table 1',6,1,'Garden Area',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL006','Outdoor Table 2',6,1,'Garden Area',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL007','Family Table A',12,1,'Zone 3',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL008','Couple Table 1',2,1,'Zone 4',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL009','Couple Table 2',2,0,'Zone 4',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin'),('TBL010','Conference Table',20,1,'Meeting Room',1,'2025-10-02 15:39:23','2025-10-02 15:39:23','admin','admin');
/*!40000 ALTER TABLE `table_management_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_rms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-04 23:42:36
>>>>>>> 9b727fe (first commit)
