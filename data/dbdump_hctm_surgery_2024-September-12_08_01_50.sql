-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: hctm_surgery
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('73b56522feb7');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_day`
--

DROP TABLE IF EXISTS `blocked_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `day_id` (`day_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_blocked_day_id` (`id`),
  CONSTRAINT `blocked_day_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  CONSTRAINT `blocked_day_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_day`
--

LOCK TABLES `blocked_day` WRITE;
/*!40000 ALTER TABLE `blocked_day` DISABLE KEYS */;
INSERT INTO `blocked_day` VALUES (1,1,1);
/*!40000 ALTER TABLE `blocked_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_ot`
--

DROP TABLE IF EXISTS `blocked_ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_ot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ot_id` (`ot_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_blocked_ot_id` (`id`),
  CONSTRAINT `blocked_ot_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `blocked_ot_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_ot`
--

LOCK TABLES `blocked_ot` WRITE;
/*!40000 ALTER TABLE `blocked_ot` DISABLE KEYS */;
INSERT INTO `blocked_ot` VALUES (1,2,1);
/*!40000 ALTER TABLE `blocked_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clashing_groups`
--

DROP TABLE IF EXISTS `clashing_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clashing_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_clashing_groups_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clashing_groups`
--

LOCK TABLES `clashing_groups` WRITE;
/*!40000 ALTER TABLE `clashing_groups` DISABLE KEYS */;
INSERT INTO `clashing_groups` VALUES (1,'Clashing Group: 1 and 2');
/*!40000 ALTER TABLE `clashing_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `week_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_day_id` (`id`),
  KEY `week_id` (`week_id`),
  CONSTRAINT `day_ibfk_1` FOREIGN KEY (`week_id`) REFERENCES `week` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
INSERT INTO `day` VALUES (1,'Mon',1),(2,'Tue',1),(3,'Wed',1),(4,'Thu',1),(5,'Fri',1);
/*!40000 ALTER TABLE `day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `sub_specialty_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_specialty_id` (`sub_specialty_id`),
  KEY `ix_equipment_id` (`id`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Argon Plasma Coagulator',0,23),(2,'Arthroscopy monitor set',0,8),(3,'CONSTELLATION MACHINE',1,9),(4,'CRYO MESIN',1,9),(5,'Dermatom',0,8),(6,'Doopler',0,1),(7,'Drill',0,12),(8,'ECP MESIN',1,9),(9,'Elecrosurgical Unit',0,6),(10,'Endoscopy System',0,15),(11,'Flexible Reamer',0,6),(12,'High speed drill',0,8),(13,'II Machine',0,8),(14,'Lap Instrument Set',0,15),(15,'Laparoscopic System',0,15),(16,'Liver Retractor',0,23),(17,'MESIN LASER',1,9),(18,'Mesin RF',0,8),(19,'Microscope',0,6),(20,'Microscope (OPHTHALMOLOGY)',0,9),(21,'Monitor Mobile System',0,23),(22,'Nerve Monitoring',0,23),(23,'OR 1',4,23),(24,'PHACO HANDPIECE',6,9),(25,'PHACO MACHINE',3,9),(26,'RFA machine',0,1),(27,'SCD EXPRESS',2,23),(28,'Saw',0,8),(29,'Sholder Traction',0,8),(30,'TABLE OT',18,9),(31,'Telescope',0,23),(32,'Tourniquet',0,6),(33,'Traction table',0,6),(34,'Ultaround',0,3),(35,'Ultarsound',0,15),(36,'Ultrasonic Machine',0,15),(37,'Ultrasonic machine',0,2),(38,'Ultrasound',0,12),(39,'Utrasound machine',0,1);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_msp`
--

DROP TABLE IF EXISTS `equipment_msp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_msp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `ix_equipment_msp_id` (`id`),
  CONSTRAINT `equipment_msp_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_msp`
--

LOCK TABLES `equipment_msp` WRITE;
/*!40000 ALTER TABLE `equipment_msp` DISABLE KEYS */;
INSERT INTO `equipment_msp` VALUES (1,'Argon Plasma Coagulator',1,1),(2,'Arthroscopy Monitor Set',3,1),(3,'Constellation Machine',1,1),(4,'Cryo Mesin',1,1),(5,'Dermatom',1,1),(6,'Doppler',1,1),(7,'Drill',3,1),(8,'ECP Mesin',1,1),(9,'Electrosurgical Unit (ESU)',16,1),(10,'Flexible Reamer',2,1),(11,'High Speed Drill',3,1),(12,'II Machine',4,1),(13,'Lap Instrument Set',5,1),(14,'Laparoscopic System (Mobile)',2,1),(15,'Laser',1,1),(16,'Mesin RF',1,1),(17,'Microscope',4,1),(18,'Microscope (OPHTHALMOLOGY)',2,1),(19,'Nerve Monitoring',1,1),(20,'OR 1',4,1),(21,'Phaco Handpiece',6,1),(22,'Phaco Machine',3,1),(23,'SCD Express',2,1),(24,'Shoulder Traction',2,1),(25,'Table OT',18,1),(26,'Telescope',4,1),(27,'Torniquet',4,1),(28,'Traction Table',1,1),(29,'Ultrasonic Machine',1,1),(30,'Ultrasound',1,1);
/*!40000 ALTER TABLE `equipment_msp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_requirement`
--

DROP TABLE IF EXISTS `equipment_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_requirement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `equipment_requirement_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_id` (`equipment_id`),
  KEY `equipment_requirement_status_id` (`equipment_requirement_status_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_equipment_requirement_id` (`id`),
  CONSTRAINT `equipment_requirement_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `equipment_requirement_ibfk_2` FOREIGN KEY (`equipment_requirement_status_id`) REFERENCES `equipment_requirement_status` (`id`),
  CONSTRAINT `equipment_requirement_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_requirement`
--

LOCK TABLES `equipment_requirement` WRITE;
/*!40000 ALTER TABLE `equipment_requirement` DISABLE KEYS */;
INSERT INTO `equipment_requirement` VALUES (1,1,1,3);
/*!40000 ALTER TABLE `equipment_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_requirement_status`
--

DROP TABLE IF EXISTS `equipment_requirement_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_requirement_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `penalty_value` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_equipment_requirement_status_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_requirement_status`
--

LOCK TABLES `equipment_requirement_status` WRITE;
/*!40000 ALTER TABLE `equipment_requirement_status` DISABLE KEYS */;
INSERT INTO `equipment_requirement_status` VALUES (1,'Used by All Surgeries',3),(2,'Used by Most Surgeries',2),(3,'Used by Some Surgeries',1);
/*!40000 ALTER TABLE `equipment_requirement_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_ot`
--

DROP TABLE IF EXISTS `fixed_ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_ot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ot_id` (`ot_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_fixed_ot_id` (`id`),
  CONSTRAINT `fixed_ot_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `fixed_ot_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_ot`
--

LOCK TABLES `fixed_ot` WRITE;
/*!40000 ALTER TABLE `fixed_ot` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixed_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masterplan`
--

DROP TABLE IF EXISTS `masterplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masterplan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `objective_value` int NOT NULL,
  `created_at` datetime NOT NULL,
  `uploaded_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_masterplan_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterplan`
--

LOCK TABLES `masterplan` WRITE;
/*!40000 ALTER TABLE `masterplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `masterplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectives`
--

DROP TABLE IF EXISTS `objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `objectives` varchar(255) NOT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_objectives_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectives`
--

LOCK TABLES `objectives` WRITE;
/*!40000 ALTER TABLE `objectives` DISABLE KEYS */;
INSERT INTO `objectives` VALUES (1,'Preferred Slots Reward',10),(2,'Shared Equipment Penalty',20),(3,'Extra Equipment Quantity Reward',30),(4,'Same OT Reward',40),(5,'Consecutive Days Reward',50),(6,'Same Weekly Slot Reward',60),(7,'Clashing Subspecialties Penalty',70),(8,'Exceed Parallel Slot Penalty',80),(9,'Exceed Parallel Heavy Slot Penalty',90),(10,'Reserve Ultra Clean OT Reward',100);
/*!40000 ALTER TABLE `objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot`
--

DROP TABLE IF EXISTS `ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ot_type_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_ot_id` (`id`),
  KEY `ot_type_id` (`ot_type_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `ot_ibfk_1` FOREIGN KEY (`ot_type_id`) REFERENCES `ot_type` (`id`),
  CONSTRAINT `ot_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot`
--

LOCK TABLES `ot` WRITE;
/*!40000 ALTER TABLE `ot` DISABLE KEYS */;
INSERT INTO `ot` VALUES (1,'1',1,1),(2,'2',1,1),(3,'3',1,1),(4,'4',1,1),(5,'5',1,1),(6,'9',1,1),(7,'10',1,1),(8,'11',1,1),(9,'12',3,1),(10,'13',3,1),(11,'6',2,1),(12,'7',2,1),(13,'8',2,1);
/*!40000 ALTER TABLE `ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_assignment`
--

DROP TABLE IF EXISTS `ot_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mssp_id` int NOT NULL,
  `week_id` int NOT NULL,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `day_id` int NOT NULL,
  `is_require_anaes` tinyint(1) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_ot_assignment_id` (`id`),
  KEY `week_id` (`week_id`),
  KEY `mssp_id` (`mssp_id`),
  KEY `day_id` (`day_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ot_id` (`ot_id`),
  CONSTRAINT `ot_assignment_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  CONSTRAINT `ot_assignment_ibfk_2` FOREIGN KEY (`mssp_id`) REFERENCES `masterplan` (`id`),
  CONSTRAINT `ot_assignment_ibfk_3` FOREIGN KEY (`week_id`) REFERENCES `week` (`id`),
  CONSTRAINT `ot_assignment_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `ot_assignment_ibfk_5` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_assignment`
--

LOCK TABLES `ot_assignment` WRITE;
/*!40000 ALTER TABLE `ot_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_type`
--

DROP TABLE IF EXISTS `ot_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_ot_type_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_type`
--

LOCK TABLES `ot_type` WRITE;
/*!40000 ALTER TABLE `ot_type` DISABLE KEYS */;
INSERT INTO `ot_type` VALUES (1,'General'),(2,'UltraClean'),(3,'Fixed');
/*!40000 ALTER TABLE `ot_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferred_ot`
--

DROP TABLE IF EXISTS `preferred_ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferred_ot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ot_id` (`ot_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_preferred_ot_id` (`id`),
  CONSTRAINT `preferred_ot_ibfk_1` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`),
  CONSTRAINT `preferred_ot_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferred_ot`
--

LOCK TABLES `preferred_ot` WRITE;
/*!40000 ALTER TABLE `preferred_ot` DISABLE KEYS */;
INSERT INTO `preferred_ot` VALUES (1,1,1);
/*!40000 ALTER TABLE `preferred_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure_name`
--

DROP TABLE IF EXISTS `procedure_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sub_specialty_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_procedure_name_id` (`id`),
  KEY `sub_specialty_id` (`sub_specialty_id`),
  CONSTRAINT `procedure_name_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure_name`
--

LOCK TABLES `procedure_name` WRITE;
/*!40000 ALTER TABLE `procedure_name` DISABLE KEYS */;
INSERT INTO `procedure_name` VALUES (1,'PROCEDURE - ADVANCE TRAUMA',1),(2,'PROCEDURE - ARTHOPLASTY',2),(3,'PROCEDURE - BREAST',3),(4,'PROCEDURE - BREAST & ENDOCRINE',4),(5,'PROCEDURE - CARDIOTHORASIC',5),(6,'PROCEDURE - COLORECTAL',6),(7,'PROCEDURE - HANDS & MICROSURGERY',7),(8,'PROCEDURE - HEPATOBILIARY',8),(9,'PROCEDURE - MAXILOFACIAL',9),(10,'PROCEDURE - NEUROSURGERY',10),(11,'PROCEDURE - OPHTHALMOLOGY',11),(12,'PROCEDURE - ORTHO-ONCOLOGY',12),(13,'PROCEDURE - ORTHOPEDIC',13),(14,'PROCEDURE - OTORHINOLARINGOLOGY',14),(15,'PROCEDURE - PAEDIATRIC ORTHOPEDIC',15),(16,'PROCEDURE - PAEDIATRIC SURGERY',16),(17,'PROCEDURE - PLASTIC',17),(18,'PROCEDURE - SPINAL',18),(19,'PROCEDURE - SPORT',19),(20,'PROCEDURE - SURGERY',20),(21,'PROCEDURE - TRAUMA',21),(22,'PROCEDURE - UKMSC',22),(23,'PROCEDURE - UPPER GI MINIMALLY INVASIVE',23),(24,'PROCEDURE - UROLOGY',24),(25,'PROCEDURE - VASCULAR',25);
/*!40000 ALTER TABLE `procedure_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_results`
--

DROP TABLE IF EXISTS `schedule_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `run_id` varchar(255) NOT NULL,
  `mrn` text NOT NULL,
  `age` int NOT NULL,
  `week_id` int NOT NULL,
  `week_day` varchar(255) NOT NULL,
  `surgery_date` date NOT NULL,
  `type_of_surgery` text NOT NULL,
  `sub_specialty_desc` text NOT NULL,
  `specialty_id` text NOT NULL,
  `procedure_name` text NOT NULL,
  `surgery_duration` int NOT NULL,
  `phu_id` int NOT NULL,
  `phu_start_time` time NOT NULL,
  `phu_end_time` time NOT NULL,
  `ot_id` int NOT NULL,
  `ot_start_time` time NOT NULL,
  `ot_end_time` time NOT NULL,
  `surgeon_name` text NOT NULL,
  `post_op_id` int NOT NULL,
  `post_op_start_time` time NOT NULL,
  `post_op_end_time` time NOT NULL,
  `pacu_id` int NOT NULL,
  `pacu_start_time` time NOT NULL,
  `pacu_end_time` time NOT NULL,
  `icu_id` int NOT NULL,
  `icu_start_time` time NOT NULL,
  `icu_end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `icu_id` (`icu_id`),
  KEY `ot_id` (`ot_id`),
  KEY `pacu_id` (`pacu_id`),
  KEY `phu_id` (`phu_id`),
  KEY `post_op_id` (`post_op_id`),
  KEY `week_id` (`week_id`),
  KEY `ix_schedule_results_id` (`id`),
  CONSTRAINT `schedule_results_ibfk_1` FOREIGN KEY (`pacu_id`) REFERENCES `ot_assignment` (`unit_id`),
  CONSTRAINT `schedule_results_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `ot_assignment` (`ot_id`),
  CONSTRAINT `schedule_results_ibfk_3` FOREIGN KEY (`phu_id`) REFERENCES `ot_assignment` (`unit_id`),
  CONSTRAINT `schedule_results_ibfk_4` FOREIGN KEY (`post_op_id`) REFERENCES `ot_assignment` (`unit_id`),
  CONSTRAINT `schedule_results_ibfk_5` FOREIGN KEY (`icu_id`) REFERENCES `ot_assignment` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_results`
--

LOCK TABLES `schedule_results` WRITE;
/*!40000 ALTER TABLE `schedule_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_specialty_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'JENT'),(2,'JMAX'),(3,'JOFT'),(4,'JORT'),(5,'JSUR'),(6,'UKMSC');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_status_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Available'),(2,'Unavailable');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_specialties_clashing_groups`
--

DROP TABLE IF EXISTS `sub_specialties_clashing_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_specialties_clashing_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clashing_group_id` int NOT NULL,
  `sub_specialty_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clashing_group_id` (`clashing_group_id`),
  KEY `sub_specialty_id` (`sub_specialty_id`),
  KEY `ix_sub_specialties_clashing_groups_id` (`id`),
  CONSTRAINT `sub_specialties_clashing_groups_ibfk_1` FOREIGN KEY (`clashing_group_id`) REFERENCES `clashing_groups` (`id`),
  CONSTRAINT `sub_specialties_clashing_groups_ibfk_2` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_specialties_clashing_groups`
--

LOCK TABLES `sub_specialties_clashing_groups` WRITE;
/*!40000 ALTER TABLE `sub_specialties_clashing_groups` DISABLE KEYS */;
INSERT INTO `sub_specialties_clashing_groups` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sub_specialties_clashing_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_specialties_ot_types`
--

DROP TABLE IF EXISTS `sub_specialties_ot_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_specialties_ot_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_specialty_id` int NOT NULL,
  `ot_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ot_type_id` (`ot_type_id`),
  KEY `sub_specialty_id` (`sub_specialty_id`),
  KEY `ix_sub_specialties_ot_types_id` (`id`),
  CONSTRAINT `sub_specialties_ot_types_ibfk_1` FOREIGN KEY (`ot_type_id`) REFERENCES `ot_type` (`id`),
  CONSTRAINT `sub_specialties_ot_types_ibfk_2` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_specialties_ot_types`
--

LOCK TABLES `sub_specialties_ot_types` WRITE;
/*!40000 ALTER TABLE `sub_specialties_ot_types` DISABLE KEYS */;
INSERT INTO `sub_specialties_ot_types` VALUES (1,1,2);
/*!40000 ALTER TABLE `sub_specialties_ot_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_specialty`
--

DROP TABLE IF EXISTS `sub_specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `specialty_id` int NOT NULL,
  `color_hex` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_sub_specialty_id` (`id`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `sub_specialty_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_specialty`
--

LOCK TABLES `sub_specialty` WRITE;
/*!40000 ALTER TABLE `sub_specialty` DISABLE KEYS */;
INSERT INTO `sub_specialty` VALUES (1,'ADVANCE TRAUMA',4,'#FF0000'),(2,'ARTHOPLASTY',4,'#0000FF'),(3,'BREAST',5,'#FFC0CB'),(4,'BREAST & ENDOCRINE',5,'#FFB6C1'),(5,'CARDIOTHORASIC',5,'#8B0000'),(6,'COLORECTAL',5,'#008000'),(7,'HANDS & MICROSURGERY',4,'#90EE90'),(8,'HEPATOBILIARY',5,'#FFFF00'),(9,'MAXILOFACIAL',2,'#FFA500'),(10,'NEUROSURGERY',5,'#800080'),(11,'OPHTHALMOLOGY',3,'#ADD8E6'),(12,'ORTHO-ONCOLOGY',4,'#00008B'),(13,'ORTHOPEDIC',4,'#006400'),(14,'OTORHINOLARINGOLOGY',1,'#A52A2A'),(15,'PAEDIATRIC ORTHOPEDIC',4,'#FFFFE0'),(16,'PAEDIATRIC SURGERY',5,'#D8BFD8'),(17,'PLASTIC',5,'#00FFFF'),(18,'SPINAL',4,'#E0FFFF'),(19,'SPORT',4,'#FF00FF'),(20,'SURGERY',5,'#D3D3D3'),(21,'TRAUMA',4,'#A9A9A9'),(22,'UKMSC',6,'#D2B48C'),(23,'UPPER GI MINIMALLY INVASIVE',5,'#808000'),(24,'UROLOGY',5,'#008080'),(25,'VASCULAR',5,'#000080');
/*!40000 ALTER TABLE `sub_specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery`
--

DROP TABLE IF EXISTS `surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mrn` varchar(255) NOT NULL,
  `unit_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `estimated_duration` int NOT NULL,
  `procedure_name_id` int NOT NULL,
  `age` int NOT NULL,
  `gender_code` enum('P','L') NOT NULL,
  `surgeon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `procedure_name_id` (`procedure_name_id`),
  KEY `unit_id` (`unit_id`),
  KEY `ix_surgery_id` (`id`),
  CONSTRAINT `surgery_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `surgery_ibfk_2` FOREIGN KEY (`procedure_name_id`) REFERENCES `procedure_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery`
--

LOCK TABLES `surgery` WRITE;
/*!40000 ALTER TABLE `surgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_require_anaes` tinyint(1) NOT NULL,
  `max_slot_limit` int NOT NULL,
  `no_of_slots` int NOT NULL,
  `resource_requirement_id` int NOT NULL,
  `color_hex` varchar(7) NOT NULL,
  `sub_specialty_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_unit_id` (`id`),
  KEY `sub_specialty_id` (`sub_specialty_id`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'ADVANCE TRAUMA',1,4,4,1,'#2F4F4F',1),(2,'ARTHOPLASTY',1,2,2,1,'#00CED1',2),(3,'BREAST',1,2,0,1,'#FFC0CB',3),(4,'BREAST & ENDOCRINE',1,2,0,1,'#FF69B4',4),(5,'CARDIOTHORASIC',1,2,0,1,'#DC143C',5),(6,'COLORECTAL',1,2,0,1,'#FFD700',6),(7,'HANDS & MICROSURGERY',1,2,0,1,'#8A2BE2',7),(8,'HEPATOBILIARY',1,2,0,1,'#A52A2A',8),(9,'MAXILOFACIAL',1,2,0,1,'#5F9EA0',9),(10,'NEUROSURGERY',1,2,0,1,'#7FFF00',10),(11,'OPHTHALMOLOGY (LA)',0,2,0,2,'#D2691E',11),(12,'OPHTHALMOLOGY (GA)',1,2,0,1,'#FF7F50',11),(13,'ORTHO-ONCOLOGY',1,2,0,1,'#6495ED',12),(14,'ORTHOPEDIC',1,2,0,1,'#FFF8DC',13),(15,'OTORHINOLARINGOLOGY',1,2,0,1,'#DC143C',14),(16,'DC OTORHINOLARINGOLOGY (LA)',0,2,0,2,'#00FFFF',14),(17,'PAEDIATRIC ORTHOPEDIC',1,2,0,1,'#00008B',15),(18,'PAEDIATRIC SURGERY',1,2,0,1,'#008B8B',16),(19,'DC PAEDIATRIC SURGERY (LA)',0,2,0,2,'#B8860B',16),(20,'PLASTIC',1,1,0,1,'#A9A9A9',17),(21,'DC PLASTIC (LA)',0,1,0,2,'#006400',17),(22,'SPINAL',1,2,0,1,'#BDB76B',18),(23,'SPORT',1,2,0,1,'#8B008B',19),(24,'SURGERY',1,2,0,1,'#556B2F',20),(25,'TRAUMA',1,2,0,1,'#FF8C00',21),(26,'UKMSC',1,1,0,1,'#9932CC',22),(27,'UPPER GI MINIMALLY INVASIVE',1,2,0,1,'#8B0000',23),(28,'UROLOGY',1,2,0,1,'#E9967A',24),(29,'DC UROLOGY (LA)',0,2,0,2,'#8FBC8F',24),(30,'VASCULAR',1,1,0,1,'#483D8B',25);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `role` enum('super admin','admin','user') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `ix_user_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','$2b$12$I.2r0G8oLcijQQiE9okJ6.W56zcm4cTmMWXzGQeM7sflhd.8sidoe','admin','01',1,'admin'),(5,'user@gmail.com','$2b$12$mmV3Ky7b.kZydgOHFdauNu.w5/CH0MPh7qJi2QFSxuGO/PIDtHqai','user','01',1,'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week`
--

DROP TABLE IF EXISTS `week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `week` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_week_id` (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `week_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week`
--

LOCK TABLES `week` WRITE;
/*!40000 ALTER TABLE `week` DISABLE KEYS */;
INSERT INTO `week` VALUES (1,'Week 1',1),(2,'Week 2',2);
/*!40000 ALTER TABLE `week` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12  8:01:50
