-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: petadoptiondb
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adoption_applications`
--

DROP TABLE IF EXISTS `adoption_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `application_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Submitted','Approved','Rejected','Cancelled') DEFAULT 'Submitted',
  PRIMARY KEY (`application_id`),
  KEY `user_id` (`user_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `adoption_applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `adoption_applications_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_applications`
--

LOCK TABLES `adoption_applications` WRITE;
/*!40000 ALTER TABLE `adoption_applications` DISABLE KEYS */;
INSERT INTO `adoption_applications` VALUES (1,1,1,'2024-03-01 20:00:00','Submitted'),(4,2,1,'2024-12-07 06:00:15','Submitted'),(5,2,3,'2024-12-07 06:44:09','Submitted'),(6,2,13,'2024-12-07 07:34:29','Submitted'),(8,2,14,'2024-12-07 09:59:19','Submitted'),(9,2,1,'2024-12-11 03:08:03','Submitted');
/*!40000 ALTER TABLE `adoption_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `approvedapplicationsview`
--

DROP TABLE IF EXISTS `approvedapplicationsview`;
/*!50001 DROP VIEW IF EXISTS `approvedapplicationsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `approvedapplicationsview` AS SELECT 
 1 AS `application_id`,
 1 AS `adopter_name`,
 1 AS `pet_name`,
 1 AS `species`,
 1 AS `shelter_name`,
 1 AS `application_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `follow_up_status`
--

DROP TABLE IF EXISTS `follow_up_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_up_status` (
  `follow_up_id` int NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL,
  `follow_up_date` date DEFAULT NULL,
  `status` enum('Scheduled','Completed','Missed') DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`follow_up_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `follow_up_status_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `adoption_applications` (`application_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up_status`
--

LOCK TABLES `follow_up_status` WRITE;
/*!40000 ALTER TABLE `follow_up_status` DISABLE KEYS */;
INSERT INTO `follow_up_status` VALUES (1,1,'2024-04-01','Scheduled','First follow-up scheduled.');
/*!40000 ALTER TABLE `follow_up_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_health_record`
--

DROP TABLE IF EXISTS `pet_health_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_health_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `checkup_date` date NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `vaccinations` text,
  `health_notes` text,
  PRIMARY KEY (`record_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `pet_health_record_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_health_record`
--

LOCK TABLES `pet_health_record` WRITE;
/*!40000 ALTER TABLE `pet_health_record` DISABLE KEYS */;
INSERT INTO `pet_health_record` VALUES (1,1,'2024-03-10',65.50,'Rabies, Parvo','Healthy and active.'),(3,3,'2024-12-05',5.00,'COVID RNA, FLEES, RABIES SHOTS, GOOD BOY SHOT, LOVE IN A SYRINGE SHOT','Finn is a skinny little boy, be careful to not step on his little feet with his little jellybean toes.'),(4,10,'2028-10-12',30.00,'Covid 27 Vaccine','This pet is from the future, be mindful.');
/*!40000 ALTER TABLE `pet_health_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_photos`
--

DROP TABLE IF EXISTS `pet_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_photos` (
  `photo_id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `upload_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`photo_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `pet_photos_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_photos`
--

LOCK TABLES `pet_photos` WRITE;
/*!40000 ALTER TABLE `pet_photos` DISABLE KEYS */;
INSERT INTO `pet_photos` VALUES (1,1,'https://example.com/buddy1.jpg','2024-12-06 22:07:02'),(2,1,'https://example.com/buddy2.jpg','2024-12-06 22:07:02'),(4,1,'https://example.com/buddy1.jpg','2024-12-07 07:14:21'),(5,1,'https://example.com/buddy2.jpg','2024-12-07 07:14:21'),(6,3,'https://pawversity.com/wp-content/uploads/2016/01/itlian-greyhound.jpg','2024-12-07 07:14:21'),(7,1,'https://example.com/buddy1.jpg','2024-12-07 07:15:16'),(8,1,'https://example.com/buddy2.jpg','2024-12-07 07:15:16'),(9,3,'https://pawversity.com/wp-content/uploads/2016/01/itlian-greyhound.jpg','2024-12-07 07:15:16');
/*!40000 ALTER TABLE `pet_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pethealthrecordsview`
--

DROP TABLE IF EXISTS `pethealthrecordsview`;
/*!50001 DROP VIEW IF EXISTS `pethealthrecordsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pethealthrecordsview` AS SELECT 
 1 AS `shelter_name`,
 1 AS `pet_name`,
 1 AS `species`,
 1 AS `checkup_date`,
 1 AS `vaccinations`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `pet_id` int NOT NULL AUTO_INCREMENT,
  `shelter_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `species` enum('Dog','Cat','Bird','Other') NOT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `status` enum('Available','Adopted','Pending') DEFAULT 'Available',
  `description` text,
  `arrival_date` date DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `shelter_id` (`shelter_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`shelter_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,1,'Buddy','Dog','Golden Retriever',3,'Male','Available','Friendly and energetic.','2024-01-01','https://pawversity.com/wp-content/uploads/2016/01/itlian-greyhound.jpg'),(3,3,'Finn','Dog','Italian Grey Hound',2,'Male','Available','Finn is my Good boy, he is beloved, and he was very expensive. Finn is from Utah, and he has a few brothers and sisters. He came from a known breeder.','2024-12-06','https://th.bing.com/th/id/OIP.w3mnUaPRoEAkH69YPu_iHAHaE7?rs=1&pid=ImgDetMain'),(9,1,'Bella','Dog','Golden Retriever',3,'Female','Available','Friendly and playful, loves fetch.','2024-01-01','https://www.publicdomainpictures.net/pictures/40000/velka/golden-retriever-dog-1362597631o6g.jpg'),(10,2,'Max','Cat','Maine Coon',2,'Male','Available','Calm and affectionate, great with kids.','2024-01-10','https://th.bing.com/th/id/OIP.p4qIAmsMC1TBIo5S-sEAHwHaHd?rs=1&pid=ImgDetMain'),(11,3,'Charlie','Dog','Beagle',1,'Male','Available','Energetic and curious, loves walks.','2024-01-15','https://th.bing.com/th/id/OIP.U5EQQ6SOMoxV6qr34pJBCwHaE7?rs=1&pid=ImgDetMain'),(12,1,'Luna','Cat','Siamese',4,'Female','Available','Independent and loves sunny spots.','2024-02-01','https://th.bing.com/th/id/R.357d0158e6329a1f41c800729104fc1f?rik=qgsse5Ap782%2fRw&pid=ImgRaw&r=0'),(13,2,'Coco','Bird','Parrot',5,'Female','Available','Talkative and enjoys company.','2024-02-10','https://th.bing.com/th/id/OIP.N9PsAeEpteVMxCjL81a7bwHaEo?rs=1&pid=ImgDetMain'),(14,3,'Polly','Bird','parrotish',69,'Male','Available','A very peculiar fella.','2029-07-07','https://th.bing.com/th/id/R.c18a15c28301ae8c8c7a07d8bae12223?rik=Ksl3UUVdEUDPxA&pid=ImgRaw&r=0'),(15,1,'Test_Image_url_animal!','Other','testLOL',0,'Male','Available','testing image url function of add new pat','2024-12-04','https://th.bing.com/th/id/R.23c17f11af8528adb0c98dc9b1c680ed?rik=pKftq0TmvQPYRA&pid=ImgRaw&r=0'),(16,1,'Test_Image_url_animal!','Dog','testLOL',0,'Male','Available','testing new feature of add a new pet function','2024-12-12','https://th.bing.com/th/id/R.73e4730893a8040faa4b0204dc5b07fe?rik=AkwIMlTilLfeTQ&riu=http%3a%2f%2fimages.wikia.com%2fclifford%2fimages%2f8%2f85%2fClifford.jpg&ehk=H8xv%2bDP0BTXknpQ9cGOSGA5gpr9THzU%2bJLPRAz50IEI%3d&risl=&pid=ImgRaw&r=0');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelters`
--

DROP TABLE IF EXISTS `shelters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelters` (
  `shelter_id` int NOT NULL AUTO_INCREMENT,
  `shelter_name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shelter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelters`
--

LOCK TABLES `shelters` WRITE;
/*!40000 ALTER TABLE `shelters` DISABLE KEYS */;
INSERT INTO `shelters` VALUES (1,'Happy Tails Shelter','101 Pet Lane','555-101-2020','contact@happytails.com','2024-12-06 22:07:02'),(2,'Furry Friends Haven','202 Dogwood Ave','555-202-3030','info@furryfriends.com','2024-12-06 22:07:02'),(3,'test shelter','Orange','425-911-6969','deckerm@hotmail.com','2024-12-07 03:22:46');
/*!40000 ALTER TABLE `shelters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_type` enum('Adopter','Admin') DEFAULT 'Adopter',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adopter1','password123','adopter1@example.com','123-456-7890','123 Main St','Adopter','2024-12-06 22:07:02'),(2,'admin1','adminpass','admin1@example.com','987-654-3210','456 Admin Blvd','Admin','2024-12-06 22:07:02'),(3,'trinity','2002','deckermecham@gmail.com','4256474002','935 evergreen dr','Adopter','2024-12-07 03:20:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `approvedapplicationsview`
--

/*!50001 DROP VIEW IF EXISTS `approvedapplicationsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `approvedapplicationsview` AS select `a`.`application_id` AS `application_id`,`u`.`username` AS `adopter_name`,`p`.`name` AS `pet_name`,`p`.`species` AS `species`,`s`.`shelter_name` AS `shelter_name`,`a`.`application_date` AS `application_date` from (((`adoption_applications` `a` join `users` `u` on((`a`.`user_id` = `u`.`user_id`))) join `pets` `p` on((`a`.`pet_id` = `p`.`pet_id`))) join `shelters` `s` on((`p`.`shelter_id` = `s`.`shelter_id`))) where (`a`.`status` = 'Approved') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pethealthrecordsview`
--

/*!50001 DROP VIEW IF EXISTS `pethealthrecordsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pethealthrecordsview` AS select `s`.`shelter_name` AS `shelter_name`,`p`.`name` AS `pet_name`,`p`.`species` AS `species`,`h`.`checkup_date` AS `checkup_date`,`h`.`vaccinations` AS `vaccinations` from ((`pet_health_record` `h` join `pets` `p` on((`h`.`pet_id` = `p`.`pet_id`))) join `shelters` `s` on((`p`.`shelter_id` = `s`.`shelter_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 19:30:51
