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
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL,
  `measurement` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` double NOT NULL,
  `recipe_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj0s4ywmqqqw4h5iommigh5yja` (`recipe_id`),
  CONSTRAINT `FKj0s4ywmqqqw4h5iommigh5yja` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (5,'unit','Butter',1,4),(6,'cup','Flour',2,4),(7,'tsp.','Baking Powder',1.5,4),(8,'tsp.','Salt',0.25,4),(9,'unit','Eggs',2,4),(10,'cup','Mayonnaise',1,4),(20,'unit','Oreo Cookies',30,19),(21,'tbsp.','Butter',6,19),(22,'cup','Milk',0.75,19),(23,'unit','Marshmellows',24,19),(24,'cup','Creme',0.25,19),(25,'cup','Heavy Cream',1,19),(26,'tbsp.','Chocolate Shavings',1,19),(37,'cup','Soy Sauce',1,36),(38,'cup','Brown Sugar',0.25,36),(39,'cup','Mirin',0.25,36),(40,'tbsp.','Grated Ginger',1,36),(41,'tsp.','Grated Garlic',2,36),(42,'unit','Scallions',4,36),(43,'cup','Chicken Broth',6,36),(44,'unit','Mushrooms',1,36),(57,'tbsp.','Butter',6,56),(58,'cup','Hot Sauce',0.5,56),(59,'tsp.','Garlic Powder',0.5,56),(60,'unit','Chicken',1,56),(61,'tbsp.','Greek Yogurt',3,56),(62,'tbsp.','Lime Juice',2,56),(63,'tbsp.','Olive Oil',1,56),(64,'unit','Tortillas',12,56),(88,'tbsp.','Vegetable Oil',2,87),(89,'unit','Shallow',1,87),(90,'unit','Jalapeno Pepper',1,87),(91,'tbsp.','Curry Paste',1,87),(92,'tsp.','Brown Sugar',2,87),(93,'tsp.','Kosher Salt',0.75,87),(94,'unit','Salmon',4,87),(95,'cup','Rice',4,87),(112,'tbsp.','Olive Oil',5,111),(113,'unit','Cheese Tortellini Package',2,111),(114,'tsp.','Kosher Salt',1,111),(115,'tsp.','Black Pepper',2,111),(116,'cup','Water',1.5,111),(117,'cup','Kale',1,111),(118,'cup','Romano Cheese',1,111),(128,'cup','Soy Sauce',0.25,127),(129,'unit','Asian Pear',0.5,127),(130,'tbsp.','Rice Wine',2,127),(131,'tbsp.','Sugar',2,127),(132,'unit','Garlic',3,127),(133,'unit','Ribeye Steak',1.5,127),(134,'cup','Rice',2,127),(144,'tbsp.','Flour',2,143),(145,'tbsp.','Salt',0.5,143),(146,'unit','Chicken Cutlets',4,143),(147,'tbsp.','Olive Oil',3,143),(148,'unit','Shallot',2,143),(149,'cup','White Wine',0.25,143),(150,'tbsp.','Parmesan Cheese',2,143),(161,'tbsp.','Butter',4,160),(162,'unit','Garlic',1,160),(163,'tbsp.','Parsley',1,160),(164,'tbsp.','Lemon Juice',1,160),(165,'unit','Asparagus',1,160),(166,'unit','Shrimp',1,160),(167,'tsp.','Chili Powder',0.5,160),(168,'tsp.','Salt',1,160);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
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
