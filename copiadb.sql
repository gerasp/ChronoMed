-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: mealtera.com    Database: chronomed
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.10.1

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
-- Table structure for table `Administrative`
--

DROP TABLE IF EXISTS `Administrative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrative` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `nif` varchar(255) NOT NULL DEFAULT '',
  `userAccountID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nif` (`nif`),
  KEY `userAccountID` (`userAccountID`),
  CONSTRAINT `Administrative_ibfk_1` FOREIGN KEY (`userAccountID`) REFERENCES `Useraccount` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrative`
--

LOCK TABLES `Administrative` WRITE;
/*!40000 ALTER TABLE `Administrative` DISABLE KEYS */;
INSERT INTO `Administrative` VALUES (3,'Administrativo','Administrado','47652919X',5);
/*!40000 ALTER TABLE `Administrative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTOR_PATIENT`
--

DROP TABLE IF EXISTS `DOCTOR_PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR_PATIENT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `doctorID` (`doctorID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `DOCTOR_PATIENT_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `Doctor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DOCTOR_PATIENT_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR_PATIENT`
--

LOCK TABLES `DOCTOR_PATIENT` WRITE;
/*!40000 ALTER TABLE `DOCTOR_PATIENT` DISABLE KEYS */;
INSERT INTO `DOCTOR_PATIENT` VALUES (1,2,2),(2,3,2),(3,2,10);
/*!40000 ALTER TABLE `DOCTOR_PATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `nif` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(255) NOT NULL DEFAULT '',
  `speciality` varchar(255) NOT NULL DEFAULT '',
  `boardNumber` varchar(255) NOT NULL DEFAULT '',
  `phoneNumber` varchar(255) NOT NULL DEFAULT '',
  `alternativePhoneNumber` varchar(255) DEFAULT '',
  `userAccountID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `boardNumber` (`boardNumber`),
  KEY `userAccountID` (`userAccountID`),
  CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`userAccountID`) REFERENCES `Useraccount` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (2,'Doctor','Doctorado','48745098Q','Masculino','Doctorólogo','24738826','6666666662','6000000002',7),(3,'Jonathan','Tullido Chupi','69696969T','Femenino','Informatico de Barrio','45787324','541476234','28465454',15);
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Healthcard`
--

DROP TABLE IF EXISTS `Healthcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Healthcard` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL DEFAULT '',
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `Healthcard_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Healthcard`
--

LOCK TABLES `Healthcard` WRITE;
/*!40000 ALTER TABLE `Healthcard` DISABLE KEYS */;
INSERT INTO `Healthcard` VALUES (1,'387738387',2),(2,'783873783',2),(3,'245246',3),(4,'24524624',3),(5,'357357',4),(6,'35735787',4),(7,'123102983512',10),(8,'12310298351',10);
/*!40000 ALTER TABLE `Healthcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicalconsultation`
--

DROP TABLE IF EXISTS `Medicalconsultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicalconsultation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `symptoms` text NOT NULL,
  `treatment` text NOT NULL,
  `recomendations` text NOT NULL,
  `examinations` text NOT NULL,
  `doctorID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `doctorID` (`doctorID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `Medicalconsultation_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `Doctor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Medicalconsultation_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicalconsultation`
--

LOCK TABLES `Medicalconsultation` WRITE;
/*!40000 ALTER TABLE `Medicalconsultation` DISABLE KEYS */;
INSERT INTO `Medicalconsultation` VALUES (1,'2017-01-12','dolor mucho dolor','pastillas','andar','sangre',2,2),(2,'2017-03-25','dolor mucho dolor','pastillas','andar','sangre',2,2),(3,'2017-03-13','dolor mucho dolor','pastillas','andar','sangre',2,2),(4,'2017-04-25','sida','cura de sida','no tener sida','prueba de sida',2,2),(5,'2017-04-25','no distingue entre la realidad y la ficción','palotes','no ir a los carnavales','martillazos en la cabeza',2,2),(6,'2017-04-25','Fiebre alta y tos','Ibuprofeno todos los dias','Reposo','Medicion de temperatura',2,2),(7,'2017-04-25','Fiebre alta y tos','Ibuprofeno todos los dias','Reposo','Medicion de temperatura',2,2),(8,'2017-05-04','duele mucho ','mucho amor','mucho amor','escáner',2,10),(9,'2017-05-04','asdf','asdfa','sdfadf','adsfasdf',2,10);
/*!40000 ALTER TABLE `Medicalconsultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicalhistory`
--

DROP TABLE IF EXISTS `Medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicalhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bloodType` varchar(255) NOT NULL,
  `familyHistory` text NOT NULL,
  `allergies` text NOT NULL,
  `pathologies` text NOT NULL,
  `surgeries` text NOT NULL,
  `others` text NOT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `patientID` (`patientID`),
  CONSTRAINT `Medicalhistory_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicalhistory`
--

LOCK TABLES `Medicalhistory` WRITE;
/*!40000 ALTER TABLE `Medicalhistory` DISABLE KEYS */;
INSERT INTO `Medicalhistory` VALUES (1,'Y','sida','latex','sida','operación de sida','tiene sida',2),(2,'a-','mucha enfermedad y miseria','acaros','hepatitis y mucha gripe','se operó de la nariz en el 2004','es feod',9),(4,'-','-','-','-','-','-',3),(5,'-','-','-','-','-','-',4),(6,'-','-','-','-','-','-',5),(7,'-','-','-','-','-','-',6),(8,'-','-','-','-','-','-',7),(9,'-','-','-','-','-','-',8),(10,'-A+','-','-','-','-','-',10);
/*!40000 ALTER TABLE `Medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `nif` varchar(255) NOT NULL DEFAULT '',
  `birthDate` date NOT NULL,
  `gender` varchar(255) NOT NULL DEFAULT '',
  `nationality` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `locality` varchar(255) NOT NULL DEFAULT '',
  `zipCode` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `phoneNumber` varchar(255) NOT NULL DEFAULT '',
  `alternativePhoneNumber` varchar(255) DEFAULT '',
  `userAccountID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nif` (`nif`),
  KEY `userAccountID` (`userAccountID`),
  CONSTRAINT `Patient_ibfk_1` FOREIGN KEY (`userAccountID`) REFERENCES `Useraccount` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (2,'Paciente','Impaciente','46985741V','1995-04-07','Femenino','Pacientés','C/ Paciencia Nº1','Pasiensia','350012','West Pasient','Pasienlandia','698745213','649784120vgg',6),(3,'Fulano','De tal Pascual','44444444X','2015-12-16','Masculino','España','Su casa','Gáldar','46531','Las Parma','Canarias','928645120','649875150',8),(4,'Bartolo','Caracolo','40000000P','2017-04-04','Masculino','Paña','Casita','Por casa','31508','Casalandia','Bartoland','928496465','641665165',9),(5,'Tolete','Caracolo','646846548','2017-04-15','Masculino','ag','hbsfr','dmsmg','3467','sfh','sfh','957357335','657375357',10),(6,'Falono','aepgojpo','33354363','2017-04-01','Masculino','d','adgadgadg','adgadbabd','3535','adbhsnj','snsfnmnsf','6986','48453',11),(7,'adsn','dfndn','543437','2017-04-09','Masculino','asbdad','dbabda','dabdab','42434','svsav','safsaf','3785378','3783783',12),(8,'vsavsa','savsav','4345354','2017-04-07','Masculino','sagsag','asgsa','sagasg','246426','asgsa','sagsag','47272575','527257',13),(9,'svavsa','svasva','3453543','2017-04-14','Masculino','ghvkmdg','safsaf','asgsaf','315135','sfasfsa','sfasfsa','362624','42624642',14),(10,'Pepe','Pepipo','61234109Q','2017-05-03','Masculino','ESPAÑA','Aasdfasfd','asdfasdf','09872','Las Palmas','España','8839393939','923843398237',16);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Useraccount`
--

DROP TABLE IF EXISTS `Useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Useraccount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Useraccount`
--

LOCK TABLES `Useraccount` WRITE;
/*!40000 ALTER TABLE `Useraccount` DISABLE KEYS */;
INSERT INTO `Useraccount` VALUES (5,'admin@admin.es','admin',1),(6,'paciente@paciente.es','paciente',1),(7,'medico@medico.es','medico',1),(8,'paciente2@paciente.es','?w4Bh4JL',1),(9,'bartolo@paciente.es','E5:ShDog',1),(10,'tolete@paciente.es','8hLEDYxe',1),(11,'falono@paciente.es','0o7F9EFT',1),(12,'lelo@paciente.es','JxDjRzgo',1),(13,'AAAAAAa@paciente.es','Cp!G02L8',1),(14,'aei@ou.eeees','wyVHVvk_',1),(15,'joni_chupi@tullido.com','0ndY:;rk',1),(16,'exam@com.mc','Yje.70kz',1);
/*!40000 ALTER TABLE `Useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `label` char(30) CHARACTER SET latin1 NOT NULL,
  `id` mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-31 23:22:42
