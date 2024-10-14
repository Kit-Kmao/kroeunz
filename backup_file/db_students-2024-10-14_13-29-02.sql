-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_students
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `tb_add_to_class`
--

DROP TABLE IF EXISTS `tb_add_to_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_add_to_class` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Stu_id` int(6) DEFAULT NULL,
  `Class_id` int(6) DEFAULT NULL,
  `Create_at` timestamp NULL DEFAULT NULL,
  `Update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `add_class` (`Class_id`),
  KEY `add-Stu` (`Stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_add_to_class`
--

LOCK TABLES `tb_add_to_class` WRITE;
/*!40000 ALTER TABLE `tb_add_to_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_add_to_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attendance`
--

DROP TABLE IF EXISTS `tb_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attendance` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Class_id` int(6) DEFAULT NULL,
  `Attendance` int(1) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Stu_id` int(6) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL,
  `Update_at` datetime(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Class_id` (`Class_id`),
  KEY `Stu_id` (`Stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attendance`
--

LOCK TABLES `tb_attendance` WRITE;
/*!40000 ALTER TABLE `tb_attendance` DISABLE KEYS */;
INSERT INTO `tb_attendance` VALUES (1,NULL,NULL,'2024-09-04',NULL,'2024-08-28 11:54:21.00000','2024-09-02 18:54:25.00000');
/*!40000 ALTER TABLE `tb_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_class`
--

DROP TABLE IF EXISTS `tb_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_class` (
  `ClassID` int(6) NOT NULL AUTO_INCREMENT,
  `Class_name` varchar(30) DEFAULT NULL,
  `Class_Type` varchar(1) DEFAULT NULL,
  `Teacher_id` int(6) DEFAULT NULL,
  `course_id` int(6) DEFAULT NULL,
  `Time_in` varchar(10) DEFAULT NULL,
  `Time_out` varchar(10) DEFAULT NULL,
  `Shift` varchar(15) DEFAULT NULL,
  `Start_class` date DEFAULT NULL,
  `End_class` date DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL,
  `Update_at` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ClassID`) USING BTREE,
  KEY `Teacher_id` (`Teacher_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tb_class_ibfk_1` FOREIGN KEY (`Teacher_id`) REFERENCES `tb_teacher` (`id`),
  CONSTRAINT `tb_class_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tb_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_class`
--

LOCK TABLES `tb_class` WRITE;
/*!40000 ALTER TABLE `tb_class` DISABLE KEYS */;
INSERT INTO `tb_class` VALUES (16,'A001',NULL,12,164,'7','9','PM',NULL,'2024-10-14',NULL,NULL,1),(17,'A002',NULL,13,165,'9','11','AM',NULL,'0000-00-00',NULL,NULL,1),(18,'A003',NULL,12,164,'7','9','PM',NULL,'2024-10-14',NULL,NULL,1);
/*!40000 ALTER TABLE `tb_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_course` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Course_name` varchar(50) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Sub_id` int(6) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  PRIMARY KEY (`id`),
  KEY `subjectFK` (`Sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (164,'Khmer full time','bg-success',1,'2024-10-14',NULL,NULL),(165,'English full time',NULL,2,'2024-10-14',NULL,NULL),(166,'HSK1',NULL,3,'2024-10-14',NULL,NULL);
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_final_score`
--

DROP TABLE IF EXISTS `tb_final_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_final_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Class_id` int(10) DEFAULT NULL,
  `Homework` double DEFAULT NULL,
  `Participation` double DEFAULT NULL,
  `Attendance` double DEFAULT NULL,
  `Final` double DEFAULT NULL,
  `Average` double DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Stu_id` int(10) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` datetime(5) DEFAULT NULL ON UPDATE current_timestamp(5),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_final_score`
--

LOCK TABLES `tb_final_score` WRITE;
/*!40000 ALTER TABLE `tb_final_score` DISABLE KEYS */;
INSERT INTO `tb_final_score` VALUES (1,NULL,60,60,70,69,69,'New','2024-09-02',NULL,'2024-10-11 08:53:18.22319','2024-10-11 15:53:18.22319');
/*!40000 ALTER TABLE `tb_final_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_login` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Teacher_id` int(6) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(8) DEFAULT NULL,
  `Role` enum('admin','user') DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` VALUES (1,NULL,'Chamroeun','1111','','2024-09-04'),(2,NULL,'Tii','2222','admin',NULL),(4,NULL,'Chet','3333','user',NULL),(5,NULL,'admin','admin','admin',NULL);
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mid_score`
--

DROP TABLE IF EXISTS `tb_mid_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mid_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Class_id` int(10) DEFAULT NULL,
  `Homework` double DEFAULT NULL,
  `Paticipantion` double DEFAULT NULL,
  `Attendance` double DEFAULT NULL,
  `Midterm` double DEFAULT NULL,
  `Average` double DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Stu_id` int(10) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` datetime(5) DEFAULT NULL ON UPDATE current_timestamp(5),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mid_score`
--

LOCK TABLES `tb_mid_score` WRITE;
/*!40000 ALTER TABLE `tb_mid_score` DISABLE KEYS */;
INSERT INTO `tb_mid_score` VALUES (1,NULL,79,50,59,79,79,'NEW','2024-09-04',NULL,'2024-09-04 11:49:08.00000','2024-09-04 18:49:11.00000');
/*!40000 ALTER TABLE `tb_mid_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_month_score`
--

DROP TABLE IF EXISTS `tb_month_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_month_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Class_id` int(10) DEFAULT NULL,
  `Homework` double DEFAULT NULL,
  `Paticipation` double DEFAULT NULL,
  `Attendance` double DEFAULT NULL,
  `Monthly` double DEFAULT NULL,
  `Average` double DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Stu_id` int(10) DEFAULT NULL,
  `Course_id` int(10) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL,
  `Update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_month_score`
--

LOCK TABLES `tb_month_score` WRITE;
/*!40000 ALTER TABLE `tb_month_score` DISABLE KEYS */;
INSERT INTO `tb_month_score` VALUES (1,NULL,60,70,50,60,68,'New','2024-08-29',NULL,NULL,'2024-09-03 11:48:27.00000','2024-09-01 18:48:32');
/*!40000 ALTER TABLE `tb_month_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_monthly`
--

DROP TABLE IF EXISTS `tb_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_monthly` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Class_id` int(6) DEFAULT NULL,
  `Course_id` int(6) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL,
  `Update_at` datetime(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classFK` (`Class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_monthly`
--

LOCK TABLES `tb_monthly` WRITE;
/*!40000 ALTER TABLE `tb_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sch-teacher`
--

DROP TABLE IF EXISTS `tb_sch-teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sch-teacher` (
  `SchID` int(6) NOT NULL AUTO_INCREMENT,
  `Teacher_id` int(10) DEFAULT NULL,
  `Time_in` datetime DEFAULT NULL,
  `Time_out` datetime DEFAULT NULL,
  `Start_class` date DEFAULT NULL,
  `End_class` date DEFAULT NULL,
  `Monday` varchar(255) DEFAULT NULL,
  `Tuesday` varchar(255) DEFAULT NULL,
  `Wednesday` varchar(255) DEFAULT NULL,
  `Thursday` varchar(255) DEFAULT NULL,
  `Friday` varchar(255) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` datetime(5) DEFAULT NULL ON UPDATE current_timestamp(5),
  PRIMARY KEY (`SchID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sch-teacher`
--

LOCK TABLES `tb_sch-teacher` WRITE;
/*!40000 ALTER TABLE `tb_sch-teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sch-teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sch_student`
--

DROP TABLE IF EXISTS `tb_sch_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sch_student` (
  `StuSch_id` int(6) NOT NULL AUTO_INCREMENT,
  `Class_id` int(6) DEFAULT NULL,
  `Time_in` time DEFAULT NULL,
  `Time_out` time DEFAULT NULL,
  `Start_class` date DEFAULT NULL,
  `End_Class` date DEFAULT NULL,
  `Monday` varchar(255) DEFAULT NULL,
  `Tuesday` varchar(255) DEFAULT NULL,
  `Wednesday` varchar(255) DEFAULT NULL,
  `Thursday` varchar(255) DEFAULT NULL,
  `Friday` varchar(255) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`StuSch_id`),
  KEY `ClassSCH` (`Class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sch_student`
--

LOCK TABLES `tb_sch_student` WRITE;
/*!40000 ALTER TABLE `tb_sch_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sch_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_student`
--

DROP TABLE IF EXISTS `tb_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_student` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `Stu_code` varchar(10) DEFAULT NULL,
  `En_name` varchar(50) DEFAULT NULL,
  `Kh_name` varchar(50) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Status` varbinary(20) DEFAULT 'Active',
  `Create_at` date DEFAULT NULL,
  `Update_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `Profile_img` varchar(255) DEFAULT NULL,
  `Dad_name` varchar(50) DEFAULT NULL,
  `Mom_name` varchar(50) DEFAULT NULL,
  `Dad_job` varchar(100) DEFAULT NULL,
  `Mom_job` varchar(100) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (27,'IT-2','Saran Chamroeun','សារ៉ាន ចំរើន','Male','2024-09-09','Phnom Penh','Active','2024-10-14','2024-10-14 14:57:14','pexels-katja-79053-592077.jpg','','','','','0967876525'),(87,'IT-1','CHHENG Vichet','ឆេង វិចិត្រ',NULL,'2000-12-29','Svay dong kom, Siem reap','Active',NULL,NULL,'photo_2024-04-07_16-17-10.jpg','','','','','017 723 463'),(88,'wdvz','dfbv','',NULL,'0000-00-00','','Deactive',NULL,NULL,'','','','','','');
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subject`
--

DROP TABLE IF EXISTS `tb_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subject` (
  `SubID` int(10) NOT NULL AUTO_INCREMENT,
  `Subject_name` varchar(50) DEFAULT NULL,
  `Color` varchar(40) DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL,
  `Update_at` datetime(5) DEFAULT NULL,
  PRIMARY KEY (`SubID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subject`
--

LOCK TABLES `tb_subject` WRITE;
/*!40000 ALTER TABLE `tb_subject` DISABLE KEYS */;
INSERT INTO `tb_subject` VALUES (1,'Khmer','bg-danger','2024-09-04 11:44:06.00000','2024-09-04 18:44:09.00000'),(2,'English','bg-warning','2024-09-03 11:45:10.00000','2024-09-04 18:45:15.00000'),(3,'Chinese VI','bg-success','2024-09-02 11:13:43.00000','2024-09-01 18:13:48.00000');
/*!40000 ALTER TABLE `tb_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teacher`
--

DROP TABLE IF EXISTS `tb_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teacher` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Profile_img` varchar(255) DEFAULT NULL,
  `En_name` varchar(50) DEFAULT NULL,
  `Kh_name` varchar(50) DEFAULT NULL,
  `Staff_code` varchar(20) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Position` varchar(30) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Nation` varchar(20) DEFAULT NULL,
  `Ethnicity` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Create_at` timestamp(5) NULL DEFAULT NULL ON UPDATE current_timestamp(5),
  `Update_at` datetime(5) DEFAULT NULL ON UPDATE current_timestamp(5),
  PRIMARY KEY (`id`),
  KEY `En_name` (`En_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (12,NULL,'Saran Chamroeuns','','T-1','Male',NULL,'0000-00-00','','','','','','',NULL,'2024-10-14 10:37:16.23984','2024-10-14 17:37:16.23984'),(13,NULL,'Chet','ចិត្រ','T-2','Female',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-14 10:37:21.70823','2024-10-14 17:37:21.70823');
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 18:29:03