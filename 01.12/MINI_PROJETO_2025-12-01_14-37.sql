-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: MINI_PROJETO
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Current Database: `MINI_PROJETO`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MINI_PROJETO` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `MINI_PROJETO`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Cod_Cliente` int NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'11987654321','111.111.111-11','Maria Silva'),(2,'11912345678','222.222.222-22','João Souza'),(3,'11998765432','333.333.333-33','Carlos Ferreira'),(4,'11988887777','444.444.444-44','Ana Paula'),(5,'11955554444','555.555.555-55','Pedro Alvares');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executada`
--

DROP TABLE IF EXISTS `executada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executada` (
  `Cod_Mecanico` int DEFAULT NULL,
  `Cod_OS` int DEFAULT NULL,
  KEY `Cod_Mecanico` (`Cod_Mecanico`),
  CONSTRAINT `executada_ibfk_1` FOREIGN KEY (`Cod_Mecanico`) REFERENCES `mecanico` (`Cod_Mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executada`
--

LOCK TABLES `executada` WRITE;
/*!40000 ALTER TABLE `executada` DISABLE KEYS */;
/*!40000 ALTER TABLE `executada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `Cod_Mecanico` int NOT NULL,
  `Especialidade` varchar(50) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Motor','Ricardo'),(2,'Eletrica','Eduardo'),(3,'Injeção Eletrônica','Fernanda'),(4,'Freios','Carlos');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico` (
  `Status` varchar(20) DEFAULT NULL,
  `Observacao` varchar(100) DEFAULT NULL,
  `Data_Abertura` varchar(9) DEFAULT NULL,
  `Cod_OS` int NOT NULL,
  `Data_Fechamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `Cod_Peca` int NOT NULL,
  `Estoque` int DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Valor_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (10,70,'Oleo Sintético',70.00),(11,70,'Filtro de Ar',25.00),(12,400,'Pastilha Freio',250.00),(13,900,'Bateria 60A',450.00),(14,250,'Vela Ignição',20.00);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possui` (
  `Cod_Veiculo` int DEFAULT NULL,
  `Cod_Cliente` int DEFAULT NULL,
  KEY `Cod_Veiculo` (`Cod_Veiculo`),
  KEY `Cod_Cliente` (`Cod_Cliente`),
  CONSTRAINT `possui_ibfk_1` FOREIGN KEY (`Cod_Veiculo`) REFERENCES `veiculo` (`Cod_Veiculo`),
  CONSTRAINT `possui_ibfk_2` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebe`
--

DROP TABLE IF EXISTS `recebe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recebe` (
  `Cod_Veiculo` int DEFAULT NULL,
  `Cod_OS` int DEFAULT NULL,
  KEY `Cod_Veiculo` (`Cod_Veiculo`),
  KEY `Cod_OS` (`Cod_OS`),
  CONSTRAINT `recebe_ibfk_1` FOREIGN KEY (`Cod_Veiculo`) REFERENCES `veiculo` (`Cod_Veiculo`),
  CONSTRAINT `recebe_ibfk_2` FOREIGN KEY (`Cod_OS`) REFERENCES `ordem_servico` (`Cod_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebe`
--

LOCK TABLES `recebe` WRITE;
/*!40000 ALTER TABLE `recebe` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `Cod_Veiculo` int NOT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (100,50.00,'Serviço padrão de troca de óleo'),(101,80.00,'Verificação e troca de pastilhas'),(102,120.00,'Check-up completo do sistema elétrico'),(103,90.00,'Alinhamento e balanceamento');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tem`
--

DROP TABLE IF EXISTS `tem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tem` (
  `Cod_Veiculo` int DEFAULT NULL,
  `Cod_OS` int DEFAULT NULL,
  KEY `Cod_Veiculo` (`Cod_Veiculo`),
  KEY `Cod_OS` (`Cod_OS`),
  CONSTRAINT `tem_ibfk_1` FOREIGN KEY (`Cod_Veiculo`) REFERENCES `servico` (`Cod_Veiculo`),
  CONSTRAINT `tem_ibfk_2` FOREIGN KEY (`Cod_OS`) REFERENCES `ordem_servico` (`Cod_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tem`
--

LOCK TABLES `tem` WRITE;
/*!40000 ALTER TABLE `tem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usa`
--

DROP TABLE IF EXISTS `usa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usa` (
  `Cod_Peca` int DEFAULT NULL,
  `Cod_OS` int DEFAULT NULL,
  KEY `Cod_Peca` (`Cod_Peca`),
  KEY `Cod_OS` (`Cod_OS`),
  CONSTRAINT `usa_ibfk_1` FOREIGN KEY (`Cod_Peca`) REFERENCES `peca` (`Cod_Peca`),
  CONSTRAINT `usa_ibfk_2` FOREIGN KEY (`Cod_OS`) REFERENCES `ordem_servico` (`Cod_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usa`
--

LOCK TABLES `usa` WRITE;
/*!40000 ALTER TABLE `usa` DISABLE KEYS */;
/*!40000 ALTER TABLE `usa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `Cod_Veiculo` int NOT NULL,
  `Ano` int DEFAULT NULL,
  `Placa` varchar(10) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,2018,'AAA1111','Focus','Ford'),(2,2015,'BBB2222','Gol','Volkswagen'),(3,2019,'CCC3333','Fiesta','Ford'),(4,2010,'DDD4444','Palio','Fiat'),(5,2021,'EEE5555','Virtus','Volkswagen'),(6,2017,'FFF6666','Sandero','Renault');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'MINI_PROJETO'
--

--
-- Dumping routines for database 'MINI_PROJETO'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 14:37:56
