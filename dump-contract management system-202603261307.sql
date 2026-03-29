/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.100.85    Database: contract management system
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `contract_documents`
--

DROP TABLE IF EXISTS `contract_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_documents` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `uploaded_at` timestamp NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `contract_documents_contracts_FK` (`contract_id`),
  CONSTRAINT `contract_documents_contracts_FK` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_documents`
--

LOCK TABLES `contract_documents` WRITE;
/*!40000 ALTER TABLE `contract_documents` DISABLE KEYS */;
INSERT INTO `contract_documents` VALUES
(1,1,'bbb','jpg','2028-01-03 08:00:00'),
(2,12,'uploads/contract_documents\\contract_12\\1774497130_6x9-Book-Cover-Template-edit-online.png','png','2026-03-26 03:52:10'),
(3,16,'uploads/contract_documents\\contract_16\\1774500480_1003w-Qb8uSVdJDzw.webp','webp','2026-03-26 04:48:00'),
(4,17,'uploads/contract_documents\\contract_17\\1774501208_minecrafte diamonf.jpg','jpg','2026-03-26 05:00:08');
/*!40000 ALTER TABLE `contract_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` enum('Active','Expired','Terminated','Pending') NOT NULL,
  `renewal_type` enum('Manual',' Auto-Renew') NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `contracts_vendors_FK` (`vendor_id`),
  CONSTRAINT `contracts_vendors_FK` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES
(1,'123','aaa','aaaaaaa','2028-06-03','2028-06-08',1,'Active',' Auto-Renew','2028-01-03 08:00:00'),
(2,'234','sss','sssssssssss','2026-03-25','2026-06-30',1,'Pending','Manual','2026-03-25 09:25:53'),
(3,'555','aaaaaa','aaaaaaaaaaaaaaa','2026-04-30','2029-02-14',1,'Pending','Manual','2026-03-25 09:34:42'),
(8,'222','kkkk','kkkkkkk','2026-03-25','2026-04-10',1,'Active',' Auto-Renew','2026-03-25 09:35:24'),
(9,'444','tttt','tttttttttttttt','2026-09-30','2026-12-12',1,'Active',' Auto-Renew','2026-03-25 09:54:43'),
(10,'666','asssss','wwwwwwww','2026-12-30','2027-02-06',1,'Active',' Auto-Renew','2026-03-25 09:58:26'),
(11,'111','ii','i','2002-05-30','2025-09-25',1,'Active','Manual','2026-03-25 09:59:34'),
(12,'1345','book-template','ไม่จ่ายค่าลิขสิทธ์หนังสือ','2569-04-30','2569-11-30',1,'Pending','Manual','2026-03-26 03:52:04'),
(16,'6556','asdsa','asdsadxzc','2026-04-01','2026-04-15',1,'Pending','Manual','2026-03-26 04:47:54'),
(17,'4444','xcvbsfd','wreyhgbnk','2026-03-10','2026-03-30',1,'Active','Manual','2026-03-26 05:00:02'),
(18,'7289','Doggy','Fake sell doggy','2026-03-26','2026-04-10',1,'Pending','Manual','2026-03-26 05:28:51'),
(19,'62728','jsissb','bdixnd','2026-03-15','2026-03-30',1,'Active','Manual','2026-03-26 05:42:48');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `remind_before_days` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `is_sent` tinyint(1) NOT NULL,
  `last_sent_at` datetime NOT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `notifications_contracts_FK` (`contract_id`),
  CONSTRAINT `notifications_contracts_FK` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES
(1,'john','1','john@gmail.com','0812345678');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'contract management system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-26 13:07:56
