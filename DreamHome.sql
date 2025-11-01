-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dreamhome
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchNo` varchar(4) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B002','56 Clover Dr','London','NW10 6EU'),('B003','163 Main St','Glasgow','G11 9QX'),('B004','32 Manse Rd','Bristol','BS99 1NZ'),('B005','22 Deer Rd','London','SW1 4EH'),('B007','16 Argyll St','Aberdeen','AB2 3SU');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `clientNo` varchar(4) NOT NULL,
  `fName` varchar(45) DEFAULT NULL,
  `lName` varchar(45) DEFAULT NULL,
  `telNo` varchar(45) DEFAULT NULL,
  `prefType` varchar(45) DEFAULT NULL,
  `maxRent` int DEFAULT NULL,
  PRIMARY KEY (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('CR56','Aline','Stewart','0141-357-7419','Flat',350),('CR62','Mary','Tregear','01224-501-050','Flat',600),('CR74','Mike','Ritchie','0141-334-5670','House',750),('CR76','John','Kay','0141-339-1233','Flat',425);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateowner`
--

DROP TABLE IF EXISTS `privateowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privateowner` (
  `ownerNo` varchar(4) NOT NULL,
  `fName` varchar(45) DEFAULT NULL,
  `lName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ownerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privateowner`
--

LOCK TABLES `privateowner` WRITE;
/*!40000 ALTER TABLE `privateowner` DISABLE KEYS */;
INSERT INTO `privateowner` VALUES ('CO40','Tina','Murphy','63b Church St, Bristol','0117-914-2720'),('CO46','Joe','Keogh','20 Barchester St, London','0207-825-4490'),('CO87','Carol','Farrel','6 Lawrence St, Glasgow','0141-496-6820'),('CO93','Tony','Shaw','12 The Rows, Glasgow','0141-335-8940');
/*!40000 ALTER TABLE `privateowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyforrent`
--

DROP TABLE IF EXISTS `propertyforrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyforrent` (
  `propertyNo` varchar(4) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `rooms` int DEFAULT NULL,
  `rent` int DEFAULT NULL,
  `ownerNo` varchar(4) DEFAULT NULL,
  `staffNo` varchar(4) DEFAULT NULL,
  `branchNo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`propertyNo`),
  KEY `fk_property_owner` (`ownerNo`),
  KEY `fk_property_staff` (`staffNo`),
  KEY `fk_property_branch` (`branchNo`),
  CONSTRAINT `fk_property_branch` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_property_owner` FOREIGN KEY (`ownerNo`) REFERENCES `privateowner` (`ownerNo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_property_staff` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyforrent`
--

LOCK TABLES `propertyforrent` WRITE;
/*!40000 ALTER TABLE `propertyforrent` DISABLE KEYS */;
INSERT INTO `propertyforrent` VALUES ('PA14','16 Holhead','Aberdeen','AB7 5SU','Flat',5,650,'CO40','SA15','B007'),('PG16','5 Mount St','Glasgow','G32','House',5,450,'CO93','SG5','B003'),('PG21','18 Dale Rd','Glasgow','G12','House',6,600,'CO87','SG37','B003'),('PG36','2 Manor Rd','Glasgow','G32','Flat',3,375,'CO93','SG14','B003'),('PG4','6 Lawrence St','Glasgow','G11','Flat',3,350,'CO87','SG37','B003'),('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');
/*!40000 ALTER TABLE `propertyforrent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `clientNo` varchar(4) NOT NULL,
  `branchNo` varchar(4) NOT NULL,
  `staffNo` varchar(4) NOT NULL,
  `dateJoined` date DEFAULT NULL,
  PRIMARY KEY (`clientNo`,`branchNo`),
  KEY `fk_reg_branch` (`branchNo`),
  KEY `fk_reg_staff` (`staffNo`),
  CONSTRAINT `fk_reg_branch` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reg_client` FOREIGN KEY (`clientNo`) REFERENCES `client` (`clientNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reg_staff` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('CR56','B003','SG14','2025-01-02'),('CR62','B007','SA15','2025-01-01'),('CR74','B003','SG5','2025-03-04'),('CR76','B003','SG37','2025-01-02');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffNo` varchar(4) NOT NULL,
  `fName` varchar(45) DEFAULT NULL,
  `lName` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `branchNo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `fk_staff_branch` (`branchNo`),
  CONSTRAINT `fk_staff_branch` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('SA15','Mary','Howe','Assistant','F','1970-07-19',9000,'B007'),('SG14','David','Ford','Supervisor','M','1963-03-24',18000,'B003'),('SG37','Ann','Beech','Assistant','F','1970-11-10',12000,'B003'),('SG5','Susan','Brand','Manager','F','1960-06-03',24000,'B003'),('SL21','John','White','Manager','M','1960-10-01',30000,'B005'),('SL41','Julie','Lee','Assistant','F','1965-06-13',9000,'B005');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewing`
--

DROP TABLE IF EXISTS `viewing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewing` (
  `propertyNo` varchar(4) NOT NULL,
  `clientNo` varchar(4) NOT NULL,
  `viewDate` date NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`propertyNo`,`clientNo`,`viewDate`),
  KEY `fk_viewing_client` (`clientNo`),
  CONSTRAINT `fk_viewing_client` FOREIGN KEY (`clientNo`) REFERENCES `client` (`clientNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_viewing_property` FOREIGN KEY (`propertyNo`) REFERENCES `propertyforrent` (`propertyNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewing`
--

LOCK TABLES `viewing` WRITE;
/*!40000 ALTER TABLE `viewing` DISABLE KEYS */;
INSERT INTO `viewing` VALUES ('PA14','CR56','2025-05-24','Too small'),('PA14','CR62','2025-05-14','Interested'),('PA14','CR76','2025-04-28','No dining room'),('PG36','CR76','2025-04-28','No dining room'),('PG4','CR56','2025-05-26',NULL);
/*!40000 ALTER TABLE `viewing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-01 17:16:30
