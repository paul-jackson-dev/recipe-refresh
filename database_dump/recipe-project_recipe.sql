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
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL,
  `relative_path` varchar(255) DEFAULT NULL,
  `upload_directory` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `portion_num` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc8o8io8s0f7nqcd3429u6cxjs` (`user_id`),
  CONSTRAINT `FKc8o8io8s0f7nqcd3429u6cxjs` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (4,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/StHq4lOUdceBGOhJJe0oGLiOu_cake.png','Chocolate Mayonnaise Sheet Cake',4,3),(19,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/A7lGtMgv4IKOl05m00odeKGfF_green_cake.png','Grasshopper Pie',4,3),(36,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/ghnHG6GmvT0B99p8o4ifh1fOU_soup.png','Teriyaki Chicken Noodle Soup',6,3),(56,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/dXB7edxIv1r9rgScNvB4R6PI6_tacos.png','Buffalo Chicken Tacos',5,2),(87,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/CsomXCcovaKaX5HxAcrQlZdx8_curry.png','Microwave Red Curry Poached Salmon',8,2),(111,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/uhrvpMf6iZcIlJbvN9zLYTGcb_tort.png','Skillet Cacio e Pepe Tortellini',4,2),(127,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/LYE9NvAf2v8y5Ba1Tc3KechaF_bul.png','Easy Beef Bulgogi',4,1),(143,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/H4DCiZUbETjQzeoy2iFc44VIa_flor.png','Creamy Chicken Florentine',4,1),(160,'/uploads/static/images/recipe/','C:\\Users\\great\\Desktop\\recipe-refresh/src/main/uploads/static/images/recipe/',_binary '\0','/uploads/static/images/recipe/ob1gOUQ07Rt8WnvgvZIWiYPuW_shrimp.png','Sheet Pan Shrimp and Asparagus',4,1);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
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
