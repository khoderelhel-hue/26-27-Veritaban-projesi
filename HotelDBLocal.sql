CREATE DATABASE  IF NOT EXISTS `hoteldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hoteldb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hoteldb
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
-- Table structure for table `ek_hizmet`
--

DROP TABLE IF EXISTS `ek_hizmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ek_hizmet` (
  `Ek_hizmet_ID` int NOT NULL AUTO_INCREMENT,
  `Ek_hizmet_ad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Ek_hizmet_birim_fiyat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Ek_hizmet_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ek_hizmet`
--

LOCK TABLES `ek_hizmet` WRITE;
/*!40000 ALTER TABLE `ek_hizmet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ek_hizmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `islem_log`
--

DROP TABLE IF EXISTS `islem_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `islem_log` (
  `Islem_log_ID` int NOT NULL AUTO_INCREMENT,
  `Islem_log_tablo_adi` varchar(50) NOT NULL,
  `Islem_log_kayit_ID` int NOT NULL,
  `Islem_log_islem_turu` varchar(20) NOT NULL,
  `Islem_log_islem_zamani` datetime NOT NULL,
  `Islem_log_eski_veri` text,
  `Islem_log_yeni_veri` text,
  PRIMARY KEY (`Islem_log_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `islem_log`
--

LOCK TABLES `islem_log` WRITE;
/*!40000 ALTER TABLE `islem_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `islem_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konaklama`
--

DROP TABLE IF EXISTS `konaklama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konaklama` (
  `Konaklama_ID` int NOT NULL AUTO_INCREMENT,
  `Konaklama_gercek_giris_zamani` datetime NOT NULL,
  `Konaklama_gercek_cikis_zamani` datetime DEFAULT NULL,
  `Rezervasyon_ID` int NOT NULL,
  `checkin_Personel_ID` int NOT NULL,
  `checkout_Personel_ID` int DEFAULT NULL,
  PRIMARY KEY (`Konaklama_ID`),
  UNIQUE KEY `Rezervasyon_ID` (`Rezervasyon_ID`),
  KEY `FK_Konaklama_Checkin_Personel` (`checkin_Personel_ID`),
  KEY `FK_Konaklama_Checkout_Personel` (`checkout_Personel_ID`),
  CONSTRAINT `FK_Konaklama_Checkin_Personel` FOREIGN KEY (`checkin_Personel_ID`) REFERENCES `personel` (`Personel_ID`),
  CONSTRAINT `FK_Konaklama_Checkout_Personel` FOREIGN KEY (`checkout_Personel_ID`) REFERENCES `personel` (`Personel_ID`),
  CONSTRAINT `FK_Konaklama_Rezervasyon` FOREIGN KEY (`Rezervasyon_ID`) REFERENCES `rezervasyon` (`Rezervasyon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konaklama`
--

LOCK TABLES `konaklama` WRITE;
/*!40000 ALTER TABLE `konaklama` DISABLE KEYS */;
/*!40000 ALTER TABLE `konaklama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konaklama_hizmeti`
--

DROP TABLE IF EXISTS `konaklama_hizmeti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konaklama_hizmeti` (
  `Konaklama_hizmeti_ID` int NOT NULL AUTO_INCREMENT,
  `Konaklama_hizmeti_adet` int NOT NULL,
  `Konaklama_hizmeti_tarih` date NOT NULL,
  `Konaklama_ID` int NOT NULL,
  `Ek_hizmet_ID` int NOT NULL,
  PRIMARY KEY (`Konaklama_hizmeti_ID`),
  KEY `FK_Konaklama_hizmeti_Konaklama_ID` (`Konaklama_ID`),
  KEY `FK_Konaklama_hizmeti_Ek_hizmet_ID` (`Ek_hizmet_ID`),
  CONSTRAINT `FK_Konaklama_hizmeti_Ek_hizmet_ID` FOREIGN KEY (`Ek_hizmet_ID`) REFERENCES `ek_hizmet` (`Ek_hizmet_ID`),
  CONSTRAINT `FK_Konaklama_hizmeti_Konaklama_ID` FOREIGN KEY (`Konaklama_ID`) REFERENCES `konaklama` (`Konaklama_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konaklama_hizmeti`
--

LOCK TABLES `konaklama_hizmeti` WRITE;
/*!40000 ALTER TABLE `konaklama_hizmeti` DISABLE KEYS */;
/*!40000 ALTER TABLE `konaklama_hizmeti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanici` (
  `Kullanici_ID` int NOT NULL AUTO_INCREMENT,
  `Kullanici_adi` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Kullanici_sifre_hash` varchar(255) NOT NULL,
  `Kullanici_rol` varchar(30) NOT NULL,
  `Misafir_ID` int DEFAULT NULL,
  `Personel_ID` int DEFAULT NULL,
  PRIMARY KEY (`Kullanici_ID`),
  UNIQUE KEY `Kullanici_adi` (`Kullanici_adi`),
  UNIQUE KEY `Misafir_ID` (`Misafir_ID`),
  UNIQUE KEY `Personel_ID` (`Personel_ID`),
  CONSTRAINT `FK_Kullanici_Misafir` FOREIGN KEY (`Misafir_ID`) REFERENCES `misafir` (`Misafir_ID`),
  CONSTRAINT `FK_Kullanici_Personel` FOREIGN KEY (`Personel_ID`) REFERENCES `personel` (`Personel_ID`),
  CONSTRAINT `CHK_Kullanici_Bir_Profil` CHECK ((((`Misafir_ID` is not null) and (`Personel_ID` is null)) or ((`Misafir_ID` is null) and (`Personel_ID` is not null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misafir`
--

DROP TABLE IF EXISTS `misafir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misafir` (
  `Misafir_ID` int NOT NULL AUTO_INCREMENT,
  `Misafir_ad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Misafir_soyad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Misafir_tc_pasaport_no` varchar(20) NOT NULL,
  `Misafir_telefon` varchar(20) NOT NULL,
  `Misafir_eposta` varchar(150) NOT NULL,
  `Misafir_dogum_tarihi` date NOT NULL,
  PRIMARY KEY (`Misafir_ID`),
  UNIQUE KEY `Misafir_tc_pasaport_no` (`Misafir_tc_pasaport_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misafir`
--

LOCK TABLES `misafir` WRITE;
/*!40000 ALTER TABLE `misafir` DISABLE KEYS */;
/*!40000 ALTER TABLE `misafir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oda`
--

DROP TABLE IF EXISTS `oda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oda` (
  `Oda_ID` int NOT NULL AUTO_INCREMENT,
  `Oda_oda_numarasi` varchar(4) NOT NULL,
  `Oda_kat` int NOT NULL,
  `Oda_durum` enum('Bos','Dolu','Temizlikte','Bakimda') NOT NULL,
  `Oda_tipi_ID` int NOT NULL,
  PRIMARY KEY (`Oda_ID`),
  UNIQUE KEY `Oda_oda_numarasi` (`Oda_oda_numarasi`),
  KEY `FK_Oda_Oda_tipi_ID` (`Oda_tipi_ID`),
  CONSTRAINT `FK_Oda_Oda_tipi_ID` FOREIGN KEY (`Oda_tipi_ID`) REFERENCES `oda_tipi` (`Oda_tipi_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oda`
--

LOCK TABLES `oda` WRITE;
/*!40000 ALTER TABLE `oda` DISABLE KEYS */;
/*!40000 ALTER TABLE `oda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oda_tipi`
--

DROP TABLE IF EXISTS `oda_tipi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oda_tipi` (
  `Oda_tipi_ID` int NOT NULL AUTO_INCREMENT,
  `Oda_tipi_tip_ad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Oda_tipi_kapasite` int NOT NULL,
  `Oda_tipi_aciklama` text NOT NULL,
  `Oda_tipi_temel_fiyat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Oda_tipi_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oda_tipi`
--

LOCK TABLES `oda_tipi` WRITE;
/*!40000 ALTER TABLE `oda_tipi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oda_tipi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odeme`
--

DROP TABLE IF EXISTS `odeme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odeme` (
  `Odeme_ID` int NOT NULL AUTO_INCREMENT,
  `Odeme_tutar` decimal(10,2) NOT NULL,
  `Odeme_odeme_turu` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Odeme_tarihi` date NOT NULL,
  `Konaklama_ID` int NOT NULL,
  PRIMARY KEY (`Odeme_ID`),
  UNIQUE KEY `Konaklama_ID` (`Konaklama_ID`),
  CONSTRAINT `FK_Odeme_Konaklama_ID` FOREIGN KEY (`Konaklama_ID`) REFERENCES `konaklama` (`Konaklama_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odeme`
--

LOCK TABLES `odeme` WRITE;
/*!40000 ALTER TABLE `odeme` DISABLE KEYS */;
/*!40000 ALTER TABLE `odeme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `Personel_ID` int NOT NULL AUTO_INCREMENT,
  `Personel_ad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Personel_soyad` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Personel_gorev` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Personel_ise_giris_tarihi` date NOT NULL,
  PRIMARY KEY (`Personel_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervasyon`
--

DROP TABLE IF EXISTS `rezervasyon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervasyon` (
  `Rezervasyon_ID` int NOT NULL AUTO_INCREMENT,
  `Rezervasyon_kisi_sayisi` int NOT NULL,
  `Rezervasyon_durum` enum('Beklemede','Onaylandi','Iptal','tamamlandi') NOT NULL,
  `Rezervasyon_olusturma_tarihi` date NOT NULL,
  `Rezervasyon_planlanan_giris_tarihi` date NOT NULL,
  `Rezervasyon_planlanan_cikis_tarihi` date NOT NULL,
  `Misafir_ID` int NOT NULL,
  `Oda_ID` int NOT NULL,
  PRIMARY KEY (`Rezervasyon_ID`),
  KEY `FK_Rezervasyon_Misafir` (`Misafir_ID`),
  KEY `FK_Rezervasyon_Oda` (`Oda_ID`),
  CONSTRAINT `FK_Rezervasyon_Misafir` FOREIGN KEY (`Misafir_ID`) REFERENCES `misafir` (`Misafir_ID`),
  CONSTRAINT `FK_Rezervasyon_Oda` FOREIGN KEY (`Oda_ID`) REFERENCES `oda` (`Oda_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervasyon`
--

LOCK TABLES `rezervasyon` WRITE;
/*!40000 ALTER TABLE `rezervasyon` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezervasyon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sezon_fiyati`
--

DROP TABLE IF EXISTS `sezon_fiyati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sezon_fiyati` (
  `Sezon_fiyati_ID` int NOT NULL AUTO_INCREMENT,
  `Sezon_fiyati_baslangic_tarihi` date NOT NULL,
  `Sezon_fiyati_bitis_tarihi` date NOT NULL,
  `Sezon_fiyati_gecelik_fiyat` decimal(10,2) NOT NULL,
  `Oda_tipi_ID` int NOT NULL,
  PRIMARY KEY (`Sezon_fiyati_ID`),
  KEY `FK_Sezon_fiyati_Oda_tipi_ID` (`Oda_tipi_ID`),
  CONSTRAINT `FK_Sezon_fiyati_Oda_tipi_ID` FOREIGN KEY (`Oda_tipi_ID`) REFERENCES `oda_tipi` (`Oda_tipi_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sezon_fiyati`
--

LOCK TABLES `sezon_fiyati` WRITE;
/*!40000 ALTER TABLE `sezon_fiyati` DISABLE KEYS */;
/*!40000 ALTER TABLE `sezon_fiyati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temizlik_kaydi`
--

DROP TABLE IF EXISTS `temizlik_kaydi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temizlik_kaydi` (
  `Temizlik_kayit_ID` int NOT NULL AUTO_INCREMENT,
  `Temizlik_kayit_tarih` date NOT NULL,
  `Temizlik_kayit_durum` enum('Beklemede','Devam ediyor','Iptal','tamamlandi') NOT NULL,
  `Oda_ID` int NOT NULL,
  `Personel_ID` int NOT NULL,
  PRIMARY KEY (`Temizlik_kayit_ID`),
  KEY `FK_Temizlik_kaydi_Oda_ID` (`Oda_ID`),
  KEY `FK_Temizlik_kaydi_Personel_ID` (`Personel_ID`),
  CONSTRAINT `FK_Temizlik_kaydi_Oda_ID` FOREIGN KEY (`Oda_ID`) REFERENCES `oda` (`Oda_ID`),
  CONSTRAINT `FK_Temizlik_kaydi_Personel_ID` FOREIGN KEY (`Personel_ID`) REFERENCES `personel` (`Personel_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temizlik_kaydi`
--

LOCK TABLES `temizlik_kaydi` WRITE;
/*!40000 ALTER TABLE `temizlik_kaydi` DISABLE KEYS */;
/*!40000 ALTER TABLE `temizlik_kaydi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-05 22:04:04
