-- MySQL dump 10.14  Distrib 5.5.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: timeclock
-- ------------------------------------------------------
-- Server version	5.5.38-MariaDB

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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140717214000'),('20140718001141'),('20140718011932'),('20140719022635');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_logs`
--

DROP TABLE IF EXISTS `time_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `clock_in` datetime DEFAULT NULL,
  `clock_out` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_time_logs_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_logs`
--

LOCK TABLES `time_logs` WRITE;
/*!40000 ALTER TABLE `time_logs` DISABLE KEYS */;
INSERT INTO `time_logs` VALUES (1,2,'2014-07-19 13:52:55','2014-07-19 20:31:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(2,2,'2014-07-19 16:40:55','2014-07-19 20:14:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(3,2,'2014-07-19 14:00:55','2014-07-19 20:24:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(4,3,'2014-07-19 18:10:55','2014-07-19 20:27:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(5,3,'2014-07-19 17:01:55','2014-07-19 20:24:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(6,3,'2014-07-19 16:44:55','2014-07-19 20:27:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(7,4,'2014-07-19 18:59:55','2014-07-19 20:12:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(8,4,'2014-07-19 17:52:55','2014-07-19 20:12:55','2014-07-19 20:35:55','2014-07-19 20:35:55'),(9,4,'2014-07-19 15:37:55','2014-07-19 20:34:55','2014-07-19 20:35:55','2014-07-19 20:35:55');
/*!40000 ALTER TABLE `time_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@email.com','$2a$10$l8IKTLArxhNilrT/JZWk1e1th3oMJVdYQahU5U1xdQ7kNojF3Vdgm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-07-19 20:35:55','2014-07-19 20:35:55',0,'Admin','John'),(2,'employee1@email.com','$2a$10$gPNj42uqrayMD5jJoO6MI.uM/H7CFAiK77ki0sMTc0hlJ4fNKugK.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-07-19 20:35:55','2014-07-19 20:35:55',1,'Employee','George'),(3,'employee2@email.com','$2a$10$2Oo3RBi4TyDuUrhabLN/C.zWILBut1vPSNxqqRZptxC4kNlkQ5l6a',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-07-19 20:35:55','2014-07-19 20:35:55',1,'Employee','Jeff'),(4,'employee3@email.com','$2a$10$fn7R9FJLAMUEmn4RT3f5EOgqHTJdcKbR1dApW3oF5zCxDko1JttfC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-07-19 20:35:55','2014-07-19 20:35:55',1,'Employee','Sam');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-19 16:50:58
