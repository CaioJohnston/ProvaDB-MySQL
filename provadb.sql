CREATE DATABASE  IF NOT EXISTS `provadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `provadb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: provadb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Brasil',1),(2,'Brasil',1),(3,'Brasil',1),(4,'Brasil',1),(5,'Brasil',1),(6,'Brasil',19),(7,'Brasil',19),(8,'Brasil',19),(9,'Brasil',19),(10,'Brasil',19),(11,'Brasil',15),(12,'Brasil',15),(13,'Brasil',15),(14,'Brasil',15),(15,'Brasil',15),(16,'Brasil',5),(17,'Brasil',5),(18,'Brasil',5),(19,'Brasil',5),(20,'Brasil',5);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Educação Científica',15),(2,'Ciências da Saúde',19),(3,'Trânsito',19),(4,'Ciência da Computação',19),(5,'Biblioteconomia',15),(6,'Artes Visuais',15),(7,'Enfermagem',19),(8,'Design',19),(9,'Engenharia Ambiental',15),(10,'Engenharia Civil',15),(11,'Agronomia',1),(12,'Engenharia de Software',5),(13,'Moda',5),(14,'Pedagogia',5),(15,'Música',5),(16,'História',1),(17,'Física',1),(18,'Engenharia Sanitária',1),(19,'Teatro',5),(20,'Química',1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` int NOT NULL,
  `salary` float NOT NULL,
  `commission_pct` int NOT NULL,
  `department_id` int NOT NULL,
  `manager_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  KEY `job_id` (`job_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Caio','Johnston','caio@db.com','911112222','2020-01-01',7,10000,10,4,4),(2,'Pedro','Vitor','pedro@db.com','933334444','2021-07-02',7,5000,10,4,4),(3,'Ricardo','Vigliano','ricardo@db.com','955556666','2018-01-06',7,18000,10,4,4),(4,'Vinicius','Rayol','vinicius@db.com','977778888','2018-01-06',7,15000,10,4,4),(5,'Pedro','Girotto','girotto@cesupa.com','945670453','2013-05-24',1,13500,0,14,14),(6,'Marcos','Paulo','mp@cesupa.com','987875540','2013-04-14',1,15000,0,14,14),(7,'Blaze','Prazeres','bpraz@hotmail.com','922221111','2020-01-01',7,11000,1,4,4),(8,'Isaac','ElGrably','ehoisaac@gmail.com','955342652','2020-01-01',8,7000,3,15,15),(9,'Matue','Tuezin','tuetue@gmail.com','977776666','2021-04-10',8,5000,2,15,15),(10,'Luan','Davies','cadeira@gmail.com','988542652','2019-03-18',5,35000,5,8,8),(11,'Steve','Minecraft','infancia@db.com','976762222','2021-03-29',11,8800,7,7,7),(12,'Bolso','Lula','2turno@gmail.com','990987761','2022-10-30',15,4600,4,6,6),(13,'Lucifer','Morningstar','therealdevil@gmail.com','900986700','2015-07-07',1,15000,3,16,16),(14,'Chandler','Bing','bestoffriends@gmail.com','911124555','2017-08-13',2,5000,2,7,7),(15,'Babu','Santana','10dauniao@db.com','910101010','2020-01-10',13,5500,12,4,4),(16,'Marshall','Mathers','slimshady@gmail.com','987951100','2018-06-25',8,5000,1,15,15),(17,'Manoel','Caneta','canetaazul@db.com','972482652','2017-08-13',14,5000,5,4,4),(18,'Cassiopeia','DuCouteau','cassioloira@db.com','972543252','2020-01-10',9,8500,10,3,3),(19,'Joaquin','Phoenix','jokeractor@gmail.com','974487652','2018-06-25',5,45000,6,13,13),(20,'Alessandra','Natasha','ale@cesupa.com','912459087','2012-01-13',5,50000,0,14,14);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_history` (
  `employee_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_id` int NOT NULL,
  `department_id` int NOT NULL,
  KEY `employee_id` (`employee_id`),
  KEY `job_id` (`job_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `job_history_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `job_history_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (1,'2020-01-01','2030-12-31',7,4),(2,'2021-07-02','2030-12-31',7,4),(3,'2018-01-06','2030-12-31',7,4),(4,'2018-01-06','2020-12-31',7,4),(5,'2013-05-21','2025-12-31',1,14),(6,'2013-04-14','2025-12-31',1,14),(7,'2020-01-01','2030-12-31',7,4),(8,'2020-01-01','2030-12-31',8,15),(9,'2021-04-10','2030-12-31',8,15),(10,'2019-03-18','2030-12-31',5,8),(11,'2021-03-29','2030-12-31',11,7),(12,'2022-10-30','2030-12-31',15,6),(13,'2015-07-07','2025-12-31',1,16),(14,'2017-01-01','2025-12-31',2,7),(15,'2020-01-10','2030-12-31',13,4),(16,'2018-06-25','2030-12-31',8,15),(17,'2017-08-13','2025-12-31',14,4),(18,'2020-01-10','2030-12-31',9,3),(19,'2018-06-25','2030-12-31',5,13),(20,'2012-01-13','2025-12-31',5,14);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(35) NOT NULL,
  `min_salary` float NOT NULL,
  `max_salary` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Professor',5500,20000),(2,'Médico',15000,40000),(3,'Engenheiro Civil',10300,17000),(4,'Juiz',25000,70000),(5,'Diretor',20500,50000),(6,'Pedagogo',15000,30000),(7,'Programador',3000,20000),(8,'Cantor',2500,10000),(9,'Administrador',5500,20000),(10,'Contador',6650,16000),(11,'Enfermeiro',5600,20000),(12,'Cozinheiro',5500,20000),(13,'Técnico de Informática',2500,7000),(14,'Atendente de Telemarketing',4700,16000),(15,'Pintor',4600,12000),(16,'Eletricista',5500,24000),(17,'Encanador',5500,8800),(18,'Marceneiro',4800,12400),(19,'Jornalista',3500,12000),(20,'Odontologista',8500,20000);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(40) NOT NULL,
  `postal_code` varchar(12) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Alcindo Cacela','312','Belém','Pará',1),(2,'14 de Março','520','Belém','Pará',1),(3,'Duque de Caxias','896','Belém','Pará',1),(4,'Pedro Miranda','754','Belém','Pará',1),(5,'Generalíssimo','397','Belém','Pará',1),(6,'Augusta','112','São Paulo','São Paulo',19),(7,'Oscar Freire','276','São Paulo','São Paulo',19),(8,'9 de Julho','555','São Paulo','São Paulo',19),(9,'Avenida Paulista','232','São Paulo','São Paulo',19),(10,'25 de Março','876','São Paulo','São Paulo',19),(11,'Mem de Sá','222','Rio de Janeiro','Rio de Janeiro',15),(12,'Primeiro de Março','762','Rio de Janeiro','Rio de Janeiro',15),(13,'Rio Branco','685','Rio de Janeiro','Rio de Janeiro',15),(14,'Rodrigues Alves','562','Rio de Janeiro','Rio de Janeiro',15),(15,'Epitácio Pessoa','953','Rio de Janeiro','Rio de Janeiro',15),(16,'Beira Mar','771','Fortaleza','Ceara',5),(17,'Abolição','802','Fortaleza','Ceara',5),(18,'Sabino Pires','325','Fortaleza','Ceara',5),(19,'Dragão do Mar','672','Fortaleza','Ceara',5),(20,'Santos Dummont','903','Fortaleza','Ceara',5);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Pará'),(2,'Acre'),(3,'Amazonas'),(4,'Bahia'),(5,'Ceara'),(6,'Distrito Federal'),(7,'Espirito Santo'),(8,'Goiás'),(9,'Maranhão'),(10,'Mato Grosso'),(11,'Minas Gerais'),(12,'Paraíba'),(13,'Pernambuco'),(14,'Piauí'),(15,'Rio de Janeiro'),(16,'Rio Grande do Norte'),(17,'Rio Grande do Sul'),(18,'Santa Catarina'),(19,'São Paulo'),(20,'Sergipe');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05 19:58:51
