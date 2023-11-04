-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe-project
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `recipe_user_ratings`
--

DROP TABLE IF EXISTS `recipe_user_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_user_ratings` (
  `recipe_id` int NOT NULL,
  `user_ratings_id` int NOT NULL,
  UNIQUE KEY `UK_nk3wtomkvtihnemep1ko9d80d` (`user_ratings_id`),
  KEY `FK1u9tag2ydpn7fbcvcwbss3ymf` (`recipe_id`),
  CONSTRAINT `FK1u9tag2ydpn7fbcvcwbss3ymf` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  CONSTRAINT `FK6ph26qouvwxcwrx27u0uf7fvf` FOREIGN KEY (`user_ratings_id`) REFERENCES `user_rating` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_user_ratings`
--

LOCK TABLES `recipe_user_ratings` WRITE;
/*!40000 ALTER TABLE `recipe_user_ratings` DISABLE KEYS */;
INSERT INTO `recipe_user_ratings` VALUES (4,18),(4,107),(19,33),(19,108),(36,53),(36,76),(56,109),(87,110),(111,185),(127,140),(127,181),(143,156),(143,179),(143,188),(160,176),(160,177);
/*!40000 ALTER TABLE `recipe_user_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 15:14:34
