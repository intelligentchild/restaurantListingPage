-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: restaurant_db
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Thalassa','Mapusa Goa','9850033537','images/z1.png','Amazing place for a sunset view and good food','5'),(2,'copperleaf','Chogm Road, Alto-Povorim, Penha de Franca, Goa','7558298641','images/z2.png','Amazing food. Each and every dishes tasted so perfect. ','4'),(3,'Amavi','Cottage Number 88, Behind The Art Chamber, Guaravaddo, Calangute, Goa','9545384156','images/z3.jpg','Cuisines Continental','5'),(4,'The Fishermans Wharf','Before The Leela, Mobor, Cavelossim, Goa','9011018866','images/z4.jpg','Cuisines Seafood, Goan, North Indian, Continental, Asian','4'),(5,'Purple Martini','Anjuna Beach, Anjuna, Goa','9871900995','images/z5.jpg','Cuisines Continental, Seafood, Italian, Mediterranean, North IndianCaravela','3'),(6,'Cafe and Bistro','27, 31st January Road, Panaji, Goa','8322237448','images/z6.jpg','Great Breakfasts. Menu includes Beverages, Cafe, Sandwich, Italian, Pizza, Goan, Salad','3'),(7,'Baba Au Rhum','1054, Sim Vaddo, Anjuna, Goa','9822866366','images/z7.jpg','Thin crust pizzas cooked in wooden ovens. Also popular for making breads, croissants and cakes','3'),(8,'Gunpowder','Anjuna Mapusa Road, Assagao, Goa Assagao','0832 2268083','images/z8.jpg','Cuisines South Indian','5'),(9,'Spice Traders','495/2, Vagator Beach Rd, Chapora, Goa 403509','8326718888','images/z9.jpg','Cuisines Thai, Chinese, Japanese, Sri Lankan, Vietnamese','5'),(10,'Kokni Kanteen','Near Mahalaxmi Temple, Dr. Dada Vaidya Road, Panaji, Goa','0832 2421972','images/z10.jpg','Cuisines Goan','4');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-18  6:15:56
