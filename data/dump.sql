-- MySQL dump 10.13  Distrib 8.3.0, for macos14 (x86_64)
--
-- Host: localhost    Database: testschedulingDB
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Current Database: `testschedulingDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testschedulingDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `testschedulingDB`;

--
-- Table structure for table `tbl_dates`
--

DROP TABLE IF EXISTS `tbl_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_dates` (
  `fld_dateid` int NOT NULL AUTO_INCREMENT,
  `fld_date` datetime NOT NULL,
  PRIMARY KEY (`fld_dateid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dates`
--

LOCK TABLES `tbl_dates` WRITE;
/*!40000 ALTER TABLE `tbl_dates` DISABLE KEYS */;
INSERT INTO `tbl_dates` VALUES (1,'2024-01-31 09:00:00'),(2,'2024-01-31 12:00:00'),(3,'2024-02-07 09:00:00'),(4,'2024-02-07 12:00:00');
/*!40000 ALTER TABLE `tbl_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_examinstances`
--

DROP TABLE IF EXISTS `tbl_examinstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_examinstances` (
  `fld_dateid` int NOT NULL,
  `fld_typeid` int NOT NULL,
  `fld_locationid` int NOT NULL,
  `fld_examid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fld_examid`),
  KEY `fld_dateid` (`fld_dateid`),
  KEY `fld_locationid` (`fld_locationid`),
  KEY `fld_typeid` (`fld_typeid`),
  CONSTRAINT `tbl_examinstances_ibfk_1` FOREIGN KEY (`fld_dateid`) REFERENCES `tbl_dates` (`fld_dateid`),
  CONSTRAINT `tbl_examinstances_ibfk_2` FOREIGN KEY (`fld_locationid`) REFERENCES `tbl_locations` (`fld_locationid`),
  CONSTRAINT `tbl_examinstances_ibfk_3` FOREIGN KEY (`fld_typeid`) REFERENCES `tbl_testtypes` (`fld_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_examinstances`
--

LOCK TABLES `tbl_examinstances` WRITE;
/*!40000 ALTER TABLE `tbl_examinstances` DISABLE KEYS */;
INSERT INTO `tbl_examinstances` VALUES (1,1,1,1),(1,1,2,2),(1,1,3,3),(2,1,1,4),(3,1,1,5),(4,1,1,6),(1,2,1,7),(1,2,2,8),(1,2,3,9),(2,2,1,10),(3,2,1,11),(4,2,1,12),(1,3,1,13),(1,3,2,14),(1,3,3,15),(2,3,1,16),(3,3,1,17),(4,3,1,18),(1,4,1,19),(1,4,2,20),(1,4,3,21),(2,4,1,22),(3,4,1,23),(4,4,1,24),(1,6,1,25),(1,6,2,26),(1,6,3,27),(2,6,1,28),(3,6,1,29),(4,6,1,30),(1,7,1,31),(1,7,2,32),(1,7,3,33),(2,7,1,34),(3,7,1,35),(4,7,1,36),(1,8,1,37),(1,8,2,38),(1,8,3,39),(2,8,1,40),(3,8,1,41),(4,8,1,42),(1,9,1,43),(1,9,2,44),(1,9,3,45),(2,9,1,46),(3,9,1,47),(4,9,1,48),(1,10,1,49),(1,10,2,50),(1,10,3,51),(2,10,1,52),(3,10,1,53),(4,10,1,54),(1,11,1,55),(1,11,2,56),(1,11,3,57),(2,11,1,58),(3,11,1,59),(4,11,1,60),(1,12,1,61),(1,12,2,62),(1,12,3,63),(2,12,1,64),(3,12,1,65),(4,12,1,66);
/*!40000 ALTER TABLE `tbl_examinstances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locations`
--

DROP TABLE IF EXISTS `tbl_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_locations` (
  `fld_locationid` int NOT NULL AUTO_INCREMENT,
  `fld_city` varchar(255) NOT NULL,
  `fld_state` varchar(50) NOT NULL,
  `fld_name` varchar(255) NOT NULL,
  `fld_zipcode` int NOT NULL,
  `fld_street` varchar(255) NOT NULL,
  PRIMARY KEY (`fld_locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locations`
--

LOCK TABLES `tbl_locations` WRITE;
/*!40000 ALTER TABLE `tbl_locations` DISABLE KEYS */;
INSERT INTO `tbl_locations` VALUES (1,'Kansas City','Missouri','KC Testing Center',64156,'1234 Main St'),(2,'Topeka','Kansas','Topeka Testing Center',66611,'1234 Topeka Blvd'),(3,'Homewood','Illinois','Homewood Testing Center',60430,'1234 State Rd');
/*!40000 ALTER TABLE `tbl_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_testtypes`
--

DROP TABLE IF EXISTS `tbl_testtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_testtypes` (
  `fld_typeid` int NOT NULL AUTO_INCREMENT,
  `fld_type` varchar(100) NOT NULL,
  `fld_description` text,
  PRIMARY KEY (`fld_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_testtypes`
--

LOCK TABLES `tbl_testtypes` WRITE;
/*!40000 ALTER TABLE `tbl_testtypes` DISABLE KEYS */;
INSERT INTO `tbl_testtypes` VALUES (1,'CPAT','National Testing Network provides convenient, professional administration of the Candidate Physical Abilities Test (CPAT) for firefighter candidates. Results are available for instant verification by any Network department.'),(2,'Firefighter Mile','National Testing Network provides convenient, professional administration of its proprietary firefighter physical\nability test, the Firefighter Mile, which serves as an alternative to the CPAT. Results are available for verification by any Network department or via a candidate printed letter. Each Firefighter Mile registration includes one orientation session which may last between 30 minutes and 1 hour.'),(3,'ORPAT','National Testing Network provides convenient, professional administration of the Oregon Physical Abilities Test (ORPAT) for law enforcement candidates. Results are available for verification by any Network department or via a candidate printed letter.'),(4,'Medic Mile','National Testing Network provides convenient, professional administration of its proprietary medic physical ability test, the Medic Mile. The Medic Mile is designed to assess the physical job requirements for EMTs and Paramedics. Results are available for verification by any NTN department or via a candidate printed letter. Each Medic Mile registration includes one orientation session which may last between 30 minutes and 1 hour.'),(6,'Law Enforcement - Frontline National','Take the Law Enforcement written exam!'),(7,'FireFighter - FireTEAM','Take the Firefighter written exam!'),(8,'Emergency Communications - ECOMM','Take the Emergency Communications written exam!'),(9,'Corrections - REACT','Take the Corrections written exam!'),(10,'Juvenile Corrections - IMPACT','Take the Juvenile Corrections written exam!'),(11,'EMT - MedicTEAM','Take the EMT written exam!'),(12,'Transit Operator - START','Take the START written exam!');
/*!40000 ALTER TABLE `tbl_testtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `fld_userfirstname` varchar(125) NOT NULL,
  `fld_userlastname` varchar(125) NOT NULL,
  `fld_useremail` varchar(125) NOT NULL,
  `fld_userpassword` varchar(25) NOT NULL,
  `fld_userid` int NOT NULL AUTO_INCREMENT,
  `fld_exam` int DEFAULT NULL,
  PRIMARY KEY (`fld_userid`),
  UNIQUE KEY `fld_useremail` (`fld_useremail`),
  KEY `fld_exam` (`fld_exam`),
  CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`fld_exam`) REFERENCES `tbl_examinstances` (`fld_examid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES ('Jason','Entgelmeier','jasonentgelmeier@duck.com','password1',1,56),('test','mctest','test@mctest.com','mctest',2,NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-27 20:08:48
