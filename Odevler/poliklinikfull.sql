CREATE DATABASE  IF NOT EXISTS `poliklinik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `poliklinik`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: poliklinik
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `doktor`
--

DROP TABLE IF EXISTS `doktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doktor` (
  `doktorid` int NOT NULL,
  `doktorad` varchar(30) DEFAULT NULL,
  `doktorsoyad` varchar(50) DEFAULT NULL,
  `poliklinikid` int DEFAULT NULL,
  PRIMARY KEY (`doktorid`),
  KEY `FK_poliklinik_doktor` (`poliklinikid`),
  CONSTRAINT `FK_poliklinik_doktor` FOREIGN KEY (`poliklinikid`) REFERENCES `poliklinik` (`poliklinikid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor`
--

LOCK TABLES `doktor` WRITE;
/*!40000 ALTER TABLE `doktor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasta`
--

DROP TABLE IF EXISTS `hasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasta` (
  `hastaid` int NOT NULL,
  `tckimlik` int DEFAULT NULL,
  `hastaad` varchar(30) DEFAULT NULL,
  `hastasoyad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hastaid`),
  UNIQUE KEY `tckimlik` (`tckimlik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasta`
--

LOCK TABLES `hasta` WRITE;
/*!40000 ALTER TABLE `hasta` DISABLE KEYS */;
/*!40000 ALTER TABLE `hasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hemsire`
--

DROP TABLE IF EXISTS `hemsire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hemsire` (
  `hemsireid` int NOT NULL,
  `hemsiread` varchar(30) DEFAULT NULL,
  `hemsiresoyad` varchar(50) DEFAULT NULL,
  `servisid` int DEFAULT NULL,
  PRIMARY KEY (`hemsireid`),
  KEY `FK_hemsire_servis` (`servisid`),
  CONSTRAINT `FK_hemsire_servis` FOREIGN KEY (`servisid`) REFERENCES `servis` (`servisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hemsire`
--

LOCK TABLES `hemsire` WRITE;
/*!40000 ALTER TABLE `hemsire` DISABLE KEYS */;
/*!40000 ALTER TABLE `hemsire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratuvar`
--

DROP TABLE IF EXISTS `laboratuvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratuvar` (
  `laboratuvarid` int NOT NULL,
  `laboratuvaradi` varchar(30) DEFAULT NULL,
  `konum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`laboratuvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratuvar`
--

LOCK TABLES `laboratuvar` WRITE;
/*!40000 ALTER TABLE `laboratuvar` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratuvar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muayene_olus`
--

DROP TABLE IF EXISTS `muayene_olus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muayene_olus` (
  `hastaid` int DEFAULT NULL,
  `poliklinikid` int DEFAULT NULL,
  KEY `FK_hasta_muayene` (`hastaid`),
  KEY `FK_poliklinik_muayene` (`poliklinikid`),
  CONSTRAINT `FK_hasta_muayene` FOREIGN KEY (`hastaid`) REFERENCES `hasta` (`hastaid`),
  CONSTRAINT `FK_poliklinik_muayene` FOREIGN KEY (`poliklinikid`) REFERENCES `poliklinik` (`poliklinikid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muayene_olus`
--

LOCK TABLES `muayene_olus` WRITE;
/*!40000 ALTER TABLE `muayene_olus` DISABLE KEYS */;
/*!40000 ALTER TABLE `muayene_olus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliklinik`
--

DROP TABLE IF EXISTS `poliklinik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poliklinik` (
  `kat` int DEFAULT NULL,
  `poliklinikid` int NOT NULL,
  `poliklinikadi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`poliklinikid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliklinik`
--

LOCK TABLES `poliklinik` WRITE;
/*!40000 ALTER TABLE `poliklinik` DISABLE KEYS */;
/*!40000 ALTER TABLE `poliklinik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servis`
--

DROP TABLE IF EXISTS `servis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servis` (
  `servisid` int NOT NULL,
  `servisadi` varchar(30) DEFAULT NULL,
  `poliklinikid` int DEFAULT NULL,
  PRIMARY KEY (`servisid`),
  KEY `FK_poliklinik_servis` (`poliklinikid`),
  CONSTRAINT `FK_poliklinik_servis` FOREIGN KEY (`poliklinikid`) REFERENCES `poliklinik` (`poliklinikid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servis`
--

LOCK TABLES `servis` WRITE;
/*!40000 ALTER TABLE `servis` DISABLE KEYS */;
/*!40000 ALTER TABLE `servis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tahlil`
--

DROP TABLE IF EXISTS `tahlil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tahlil` (
  `tahlilid` int NOT NULL,
  `tahlilad` varchar(30) DEFAULT NULL,
  `aciklama` varchar(50) DEFAULT NULL,
  `laboratuvarid` int DEFAULT NULL,
  PRIMARY KEY (`tahlilid`),
  KEY `FK_laboratuvar_tahlil` (`laboratuvarid`),
  CONSTRAINT `FK_laboratuvar_tahlil` FOREIGN KEY (`laboratuvarid`) REFERENCES `laboratuvar` (`laboratuvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahlil`
--

LOCK TABLES `tahlil` WRITE;
/*!40000 ALTER TABLE `tahlil` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahlil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tahlil_istek`
--

DROP TABLE IF EXISTS `tahlil_istek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tahlil_istek` (
  `hastaid` int DEFAULT NULL,
  `tahlilid` int DEFAULT NULL,
  `doktorid` int DEFAULT NULL,
  `hastaad` varchar(30) DEFAULT NULL,
  `tarih` date DEFAULT NULL,
  `saat` time DEFAULT NULL,
  KEY `FK_hasta_tahlil` (`hastaid`),
  KEY `FK_tahlil_tahlil` (`tahlilid`),
  KEY `FK_doktor_tahlil` (`doktorid`),
  CONSTRAINT `FK_doktor_tahlil` FOREIGN KEY (`doktorid`) REFERENCES `doktor` (`doktorid`),
  CONSTRAINT `FK_hasta_tahlil` FOREIGN KEY (`hastaid`) REFERENCES `hasta` (`hastaid`),
  CONSTRAINT `FK_tahlil_tahlil` FOREIGN KEY (`tahlilid`) REFERENCES `tahlil` (`tahlilid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tahlil_istek`
--

LOCK TABLES `tahlil_istek` WRITE;
/*!40000 ALTER TABLE `tahlil_istek` DISABLE KEYS */;
/*!40000 ALTER TABLE `tahlil_istek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-05 19:43:06
