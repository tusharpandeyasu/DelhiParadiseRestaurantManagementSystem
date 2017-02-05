-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `cust_order_detail_table`
--
USE restaurant
DROP TABLE IF EXISTS `cust_order_detail_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_order_detail_table` (
  `order_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `order_detail_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order_detail_table`
--

LOCK TABLES `cust_order_detail_table` WRITE;
/*!40000 ALTER TABLE `cust_order_detail_table` DISABLE KEYS */;
INSERT INTO `cust_order_detail_table` VALUES (2,3,1),(2,4,1),(3,1,1),(3,3,1),(3,4,1),(4,1,1),(4,3,1),(4,5,1),(4,2,1),(4,4,1),(5,1,1),(5,2,1),(5,4,2),(6,1,1),(6,3,1),(6,4,1),(6,2,1),(7,1,1),(7,4,1),(8,3,1),(8,2,1),(9,1,1),(9,2,1),(8,1,1),(8,4,1),(8,4,1),(2,1,1),(2,3,1),(3,1,1),(3,3,1),(3,1,1),(3,2,1),(4,1,1),(4,2,1),(4,1,1),(4,2,1),(4,1,1),(4,5,1),(3,3,1),(3,1,1),(3,5,1),(2,1,1),(2,3,1),(2,5,1),(3,3,1),(3,5,1),(4,4,1),(4,5,1),(5,1,1),(5,5,1),(5,4,1),(5,5,1),(6,1,1),(7,1,1),(7,2,1),(8,1,1),(8,2,1),(9,1,1),(10,1,1),(11,1,1),(2,1,1),(2,2,1),(2,4,1),(2,5,1),(3,1,1),(3,5,1),(2,1,1),(2,4,1),(3,2,1),(3,5,1);
/*!40000 ALTER TABLE `cust_order_detail_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custorder_table`
--

DROP TABLE IF EXISTS `custorder_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custorder_table` (
  `order_state` int(11) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custorder_table`
--

LOCK TABLES `custorder_table` WRITE;
/*!40000 ALTER TABLE `custorder_table` DISABLE KEYS */;
INSERT INTO `custorder_table` VALUES (1,'2016-12-02 21:31',2,18),(1,'2016-12-02 21:31',3,25);
/*!40000 ALTER TABLE `custorder_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_table`
--

DROP TABLE IF EXISTS `menu_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_table` (
  `food_name` varchar(255) DEFAULT NULL,
  `food_description` varchar(255) DEFAULT NULL,
  `food_image_path` varchar(255) DEFAULT NULL,
  `food_type` int(11) DEFAULT NULL,
  `food_price` int(11) DEFAULT NULL,
  `cook` varchar(255) DEFAULT NULL,
  `drink_type` varchar(255) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_table`
--

LOCK TABLES `menu_table` WRITE;
/*!40000 ALTER TABLE `menu_table` DISABLE KEYS */;
INSERT INTO `menu_table` VALUES ('Panner Butter Masala','','1480737951952.jpe',1,10,'John',NULL,1),('Chicken Curry','','1480737976042.jpg',1,15,'Andrew',NULL,2),('Fish Curry','','1480737999203.jpg',1,12,'Mark',NULL,3),('Rum','','1480738054969.jpg',2,8,NULL,'Old Monk',4),('Whiskey','','1480738079727.png',2,10,NULL,'Officers Choice ',5),('Vegetable Mix','','',1,8,'Martin',NULL,6);
/*!40000 ALTER TABLE `menu_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_table`
--

DROP TABLE IF EXISTS `role_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_table` (
  `user_name` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_table`
--

LOCK TABLES `role_table` WRITE;
/*!40000 ALTER TABLE `role_table` DISABLE KEYS */;
INSERT INTO `role_table` VALUES ('tom','qwerty',1,1),('harry','qwerty',4,3),('gfghjg','qwerty',2,4),('Chris','qwerty1',3,5);
/*!40000 ALTER TABLE `role_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 21:44:53
