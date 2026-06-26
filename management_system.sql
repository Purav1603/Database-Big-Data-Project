-- MySQL dump 10.13  Distrib 9.6.0, for macos14.8 (x86_64)
--
-- Host: localhost    Database: UNIVERSITY_MANAGEMENT_SYSTEM
-- ------------------------------------------------------
-- Server version	9.7.1

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '7ff12c8e-6b3e-11f1-bf32-68e33a79aefe:1-32';

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `COURSE_ID` int NOT NULL AUTO_INCREMENT,
  `COURSE_NAME` varchar(100) NOT NULL,
  `CREDITS` int DEFAULT '3',
  `DEPT_ID` int DEFAULT NULL,
  `INSTRUCTOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`COURSE_ID`),
  KEY `DEPT_ID` (`DEPT_ID`),
  KEY `INSTRUCTOR_ID` (`INSTRUCTOR_ID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `Departments` (`DEPT_ID`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`INSTRUCTOR_ID`) REFERENCES `Instructors` (`INSTRUCTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'GLOBAL BUSINESS ENVIRONMENT',10,3,1),(2,'DATABASES AND BIG DATA',10,1,4),(3,'CYBER SECURITY',10,2,5),(4,'MACROECONOMICS',10,4,2),(5,'SOFTWARE ENGINEERING',10,5,3);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `DEPT_ID` int NOT NULL AUTO_INCREMENT,
  `DEPT_NAME` varchar(100) NOT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `DEPT_NAME` (`DEPT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'DATA SCIENCE','BERLIN'),(2,'INFORMATION TECHNOLOGY','POTSDAM'),(3,'INTERNATIONAL BUSINESS','BERLIN'),(4,'ECONOMICS','POTSDAM'),(5,'ENGINEERING','BERLIN');
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrollments`
--

DROP TABLE IF EXISTS `Enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enrollments` (
  `ENROLLMENT_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int DEFAULT NULL,
  `COURSE_ID` int DEFAULT NULL,
  `ENROLLED_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ENROLLMENT_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `Students` (`STUDENT_ID`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `Courses` (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrollments`
--

LOCK TABLES `Enrollments` WRITE;
/*!40000 ALTER TABLE `Enrollments` DISABLE KEYS */;
INSERT INTO `Enrollments` VALUES (6,1,2,'2025-09-15 00:00:00'),(7,2,4,'2025-10-15 00:00:00'),(8,3,5,'2025-07-10 00:00:00'),(9,4,3,'2025-04-23 00:00:00');
/*!40000 ALTER TABLE `Enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `GRADE_ID` int NOT NULL AUTO_INCREMENT,
  `ENROLLMENT_ID` int DEFAULT NULL,
  `GRADE` int DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  UNIQUE KEY `ENROLLMENT_ID` (`ENROLLMENT_ID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`ENROLLMENT_ID`) REFERENCES `Enrollments` (`ENROLLMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES (11,6,87),(12,7,86),(13,8,62),(14,9,70);
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructors`
--

DROP TABLE IF EXISTS `Instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructors` (
  `INSTRUCTOR_ID` int NOT NULL AUTO_INCREMENT,
  `INSTRUCTOR_NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `DEPT_ID` int DEFAULT NULL,
  `HIRE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`INSTRUCTOR_ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  KEY `DEPT_ID` (`DEPT_ID`),
  CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `Departments` (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructors`
--

LOCK TABLES `Instructors` WRITE;
/*!40000 ALTER TABLE `Instructors` DISABLE KEYS */;
INSERT INTO `Instructors` VALUES (1,'KEVIN HART','kevinhart@gmail.com',3,'2018-07-06'),(2,'DAVE CHAPPELLE','davechappelle@hotmail.com',4,'2019-08-24'),(3,'GABRIEL IGLESIAS','gabrieliglesias@outlook.com',5,'2020-07-15'),(4,'CHRIS TUCKER','christucker@yahoo.com',1,'2017-08-31'),(5,'CHRIS ROCK','chrisrock@ICLOUD',2,'2021-02-07');
/*!40000 ALTER TABLE `Instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `STUDENT_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `STUDENT_EMAIL` varchar(255) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `COURSE` varchar(100) DEFAULT NULL,
  `BRANCH` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`),
  UNIQUE KEY `STUDENT_EMAIL` (`STUDENT_EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'PURAV SATISH','purav@gmail.com','2006-03-16','DATABASES AND BIG DATA','BERLIN','4900010020'),(2,'DUA LIPA','dualipa@gmail.com','1995-08-22','MACROECONOMICS','POTSDAM','4900010021'),(3,'ADAM SANDLER','adamsandler@gmail.com','1966-09-09','SOFTWARE ENGINEERING','BERLIN','4900010022'),(4,'TRAVIS SCOTT','travisscott@gmail.com','1991-04-30','CYBER SECURITY','POTSDAM','4900010023'),(5,'LEWIS HAMILTON','lewishamilton@gmail.com','1985-01-07','GLOBAL BUSINESS ENVIRONMENT','BERLIN','4900010024'),(7,'TAYLOR SWIFT','taylorswift@gmail.com','1989-12-13','CYBER SECURITY','BERLIN','4900010025');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-26 13:46:45
