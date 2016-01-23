-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mumscrum
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `sec_roles`
--

DROP TABLE IF EXISTS `sec_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL,
  `role_lv` tinyint(4) DEFAULT '1',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_roles`
--

LOCK TABLES `sec_roles` WRITE;
/*!40000 ALTER TABLE `sec_roles` DISABLE KEYS */;
INSERT INTO `sec_roles` VALUES (10,'ScrumMaster','Scrum Master',NULL,NULL,'sammy',1,1),(11,'Developer','Develoeper',NULL,NULL,'sammy',1,1),(12,'Tester','Tester',NULL,NULL,'sammy',1,1),(13,'HRAdmin','HR Administrator',NULL,NULL,'sammy',1,1);
/*!40000 ALTER TABLE `sec_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_user_roles`
--

DROP TABLE IF EXISTS `sec_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`,`username`,`role_id`),
  UNIQUE KEY `UK_5vm2xwp8lnutcks4swpgfxh99` (`user_role_id`),
  UNIQUE KEY `UK_nts06rkth9dey7mch5rc4qpje` (`username`,`role_id`),
  KEY `FK_onfi35um8vkdpgxnfx8oukaph` (`username`),
  KEY `FK_bwhfx4giumro7tb6vfqoho29e` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_user_roles`
--

LOCK TABLES `sec_user_roles` WRITE;
/*!40000 ALTER TABLE `sec_user_roles` DISABLE KEYS */;
INSERT INTO `sec_user_roles` VALUES (32,'sammy',13,'2016-01-22 18:40:00',NULL,NULL,'sammy'),(33,'sammy',12,'2016-01-22 18:40:00',NULL,NULL,'sammy'),(34,'sammy2',12,'2016-01-22 18:46:37',NULL,NULL,'sammy'),(35,'sammy3',11,'2016-01-22 18:52:23',NULL,NULL,'sammy'),(36,'sammy4',13,'2016-01-22 18:55:49',NULL,NULL,'sammy'),(51,'sammy5',11,'2016-01-22 19:24:47',NULL,NULL,'sammy'),(73,'sammy6',11,'2016-01-22 20:05:55',NULL,NULL,'sammy'),(74,'sammy6',10,'2016-01-22 20:05:55',NULL,NULL,'sammy'),(75,'sammy',10,'2016-01-22 22:38:06',NULL,NULL,'sammy'),(76,'sammy22',12,'2016-01-22 23:51:56',NULL,NULL,'sammy'),(77,'sammy22',10,'2016-01-22 23:51:56',NULL,NULL,'sammy');
/*!40000 ALTER TABLE `sec_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_users`
--

DROP TABLE IF EXISTS `sec_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `full_name_kh` varchar(100) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `account_expired_date` date DEFAULT NULL,
  `pwd_expired_date` date DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `account_lock_date` datetime DEFAULT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `first_login` bit(1) NOT NULL DEFAULT b'1',
  `locked` bit(1) NOT NULL DEFAULT b'0',
  `attemp_no` tinyint(4) DEFAULT NULL,
  `max_attemp_no` tinyint(4) DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL,
  `syn_date` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_users`
--

LOCK TABLES `sec_users` WRITE;
/*!40000 ALTER TABLE `sec_users` DISABLE KEYS */;
INSERT INTO `sec_users` VALUES ('sammy','$2a$10$NVXHcGzsr.S0Z8bH.zpefeO5pZOwzUCKa7jrWbgvmsRQ91rb50f16','123','Chi Proeng DOV','sdfs','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-23 00:02:52'),('sammy2','$2a$10$eXfS9cmYKWN3NvG5QRsuPeWbE6tYeuqbJj.BSMCyaQwyYGqWXX/IC','df','dfd','dfds','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-23 00:04:39'),('sammy22','$2a$10$T0L0y1VDTjRUGWruZZtKBuxIC6ww56/IN2z1LBSl87eSHZ.NdPqNW','dsaf','asdsad',NULL,'Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-22 23:51:56'),('sammy3','$2a$10$oDTOVtcfdQtqAdzivw.ZveAxGN.le3q8YTQDqKCMzuHJ1G2ojMtEW','412','123','1231','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-22 18:52:23'),('sammy4','$2a$10$uwbGxDffOR6ajUlrfquzUefNxoqURFuhovhQLnKMeByxZJFBQzozG','df','ds','ddf','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-22 18:55:49'),('sammy5','$2a$10$hcro0mrQ4Rn9Wg6l20HgqeKuENCHXD7NTVR8vtx4pc9p/6T1RswhS','asfd','asdfa','afdas','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-22 19:24:47'),('sammy6','$2a$10$lLwm5cz.eyObgw7Y.FEFuOXTJhaik8MG4VNzNjQCg8WtPc1ZrrfqO','dasfasd','sfa','sadfa','Male','d.chiproeng@gmail.com',NULL,'2016-04-22',NULL,NULL,'','\0','\0',0,3,'sammy','2016-01-22 20:05:54');
/*!40000 ALTER TABLE `sec_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mumscrum'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-23  8:36:09
