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
-- Table structure for table `recipe_menu_users`
--

DROP TABLE IF EXISTS `recipe_menu_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_menu_users` (
  `menu_recipes_id` int NOT NULL,
  `menu_users_id` int NOT NULL,
  KEY `FK8htb8jl63evhn4qb63ha0nnha` (`menu_users_id`),
  KEY `FKip1jr2j6mo3xtl5n3gpfqv3n4` (`menu_recipes_id`),
  CONSTRAINT `FK8htb8jl63evhn4qb63ha0nnha` FOREIGN KEY (`menu_users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKip1jr2j6mo3xtl5n3gpfqv3n4` FOREIGN KEY (`menu_recipes_id`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_menu_users`
--

LOCK TABLES `recipe_menu_users` WRITE;
/*!40000 ALTER TABLE `recipe_menu_users` DISABLE KEYS */;
INSERT INTO `recipe_menu_users` VALUES (4,3),(87,2),(87,1),(160,1),(143,3),(127,1),(127,2),(56,2),(19,3),(19,2),(36,3),(36,1),(36,2);
/*!40000 ALTER TABLE `recipe_menu_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 15:14:36
