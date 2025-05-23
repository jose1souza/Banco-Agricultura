CREATE DATABASE  IF NOT EXISTS `agricultura` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `agricultura`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agricultura
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (2,'Vaca',500);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacao_insumo`
--

DROP TABLE IF EXISTS `aplicacao_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicacao_insumo` (
  `id_aplicacao_insumo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_insumo_fk` bigint(20) NOT NULL,
  `id_cultivo_fk` bigint(20) NOT NULL,
  `data_aplicacao` datetime DEFAULT NULL,
  `dosagem` decimal(10,2) DEFAULT NULL,
  `custo_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_aplicacao_insumo`),
  KEY `fk_insumo_has_cultivo_cultivo1_idx` (`id_cultivo_fk`),
  KEY `fk_insumo_has_cultivo_insumo1_idx` (`id_insumo_fk`),
  CONSTRAINT `fk_insumo_has_cultivo_cultivo1` FOREIGN KEY (`id_cultivo_fk`) REFERENCES `cultivo` (`id_cultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_has_cultivo_insumo1` FOREIGN KEY (`id_insumo_fk`) REFERENCES `insumo` (`id_insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacao_insumo`
--

LOCK TABLES `aplicacao_insumo` WRITE;
/*!40000 ALTER TABLE `aplicacao_insumo` DISABLE KEYS */;
INSERT INTO `aplicacao_insumo` VALUES (2,2,2,'2024-11-12 09:00:00',75.00,187.50);
/*!40000 ALTER TABLE `aplicacao_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade_agricola`
--

DROP TABLE IF EXISTS `atividade_agricola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atividade_agricola` (
  `id_atividade_agricola` bigint(20) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `horas_trabalhadas` decimal(10,2) DEFAULT NULL,
  `id_funcionario_fk` bigint(20) NOT NULL,
  `id_cultivo_fk` bigint(20) NOT NULL,
  `id_maquina_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_atividade_agricola`),
  KEY `fk_atividadeagricola_funcionario1_idx` (`id_funcionario_fk`),
  KEY `fk_atividade_agricola_cultivo1_idx` (`id_cultivo_fk`),
  KEY `fk_atividade_agricola_maquinario1_idx` (`id_maquina_fk`),
  CONSTRAINT `fk_atividade_agricola_cultivo1` FOREIGN KEY (`id_cultivo_fk`) REFERENCES `cultivo` (`id_cultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividade_agricola_maquinario1` FOREIGN KEY (`id_maquina_fk`) REFERENCES `maquinario` (`id_maquina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividadeagricola_funcionario1` FOREIGN KEY (`id_funcionario_fk`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade_agricola`
--

LOCK TABLES `atividade_agricola` WRITE;
/*!40000 ALTER TABLE `atividade_agricola` DISABLE KEYS */;
INSERT INTO `atividade_agricola` VALUES (2,'Pulverização','2024-11-15',5.00,2,2,2);
/*!40000 ALTER TABLE `atividade_agricola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivo`
--

DROP TABLE IF EXISTS `cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultivo` (
  `id_cultivo` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_plantio` date DEFAULT NULL,
  `data_colheita` date DEFAULT NULL,
  `producao` decimal(10,2) DEFAULT NULL,
  `id_talhao_fk` bigint(20) NOT NULL,
  `id_cultura_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cultivo`),
  KEY `fk_cultivo_talhao1_idx` (`id_talhao_fk`),
  KEY `fk_cultivo_cultura1_idx` (`id_cultura_fk`),
  CONSTRAINT `fk_cultivo_cultura1` FOREIGN KEY (`id_cultura_fk`) REFERENCES `cultura` (`id_cultura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cultivo_talhao1` FOREIGN KEY (`id_talhao_fk`) REFERENCES `talhao` (`id_talhao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivo`
--

LOCK TABLES `cultivo` WRITE;
/*!40000 ALTER TABLE `cultivo` DISABLE KEYS */;
INSERT INTO `cultivo` VALUES (2,'2024-11-10','2025-02-20',10000.00,2,2),(7,'2024-10-01','2025-01-15',10000.00,9,3),(8,'2024-11-10','2025-02-20',8500.50,10,4),(9,'2024-09-01','2025-01-10',12000.00,11,5),(10,'2024-12-01','2025-04-10',15000.00,12,6);
/*!40000 ALTER TABLE `cultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultura`
--

DROP TABLE IF EXISTS `cultura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultura` (
  `id_cultura` bigint(20) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cultura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultura`
--

LOCK TABLES `cultura` WRITE;
/*!40000 ALTER TABLE `cultura` DISABLE KEYS */;
INSERT INTO `cultura` VALUES (2,'Feijão'),(3,'Milho'),(4,'Soja'),(5,'Café'),(6,'Trigo');
/*!40000 ALTER TABLE `cultura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fazenda`
--

DROP TABLE IF EXISTS `fazenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fazenda` (
  `id_fazenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `tamanho_ha` decimal(10,2) DEFAULT NULL,
  `id_produtor_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_fazenda`),
  KEY `fk_fazenda_produtor_idx` (`id_produtor_fk`),
  CONSTRAINT `fk_fazenda_produtor` FOREIGN KEY (`id_produtor_fk`) REFERENCES `produtor` (`id_produtor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fazenda`
--

LOCK TABLES `fazenda` WRITE;
/*!40000 ALTER TABLE `fazenda` DISABLE KEYS */;
INSERT INTO `fazenda` VALUES (2,'Fazenda São João','Zona Rural, Alfenas',200.50,2),(17,'Fazenda São João','Zona Rural, Alfenas',200.50,2),(18,'Fazenda São Miguel','Zona Rural, Alfenas',400.50,6),(19,'Fazenda São Sebastião','Zona Rural, Machado',100.50,7),(20,'Fazenda São Jorge','Zona Rural, Machado',600.50,8),(21,'Fazenda Dom Pedro','Zona Rural, Cruzilia',900.50,6),(22,'Fazenda Joaquim Alves','Zona Rural, Divinopólis',800.50,7),(23,'Fazenda Pernanbucana','Zona Rural, Varginha',300.50,8);
/*!40000 ALTER TABLE `fazenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario_hora` decimal(10,2) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `id_fazenda_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_funcionario_fazenda1_idx` (`id_fazenda_fk`),
  CONSTRAINT `fk_funcionario_fazenda1` FOREIGN KEY (`id_fazenda_fk`) REFERENCES `fazenda` (`id_fazenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (2,'Ana Luísa','Engenheira Agrônoma',35.75,'ana@gmail.com',2),(3,'João Pedro','Operador de Colheitadeira',20.00,'joao@gmail.com',17),(4,'Mariana Souza','Técnica de Irrigação',30.00,'mariana@gmail.com',20),(5,'Luiz Henrique','Mecânico',25.00,'luiz@gmail.com',18);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `custo_unitario` decimal(10,2) DEFAULT NULL,
  `unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (2,'Agrotóxico','Glifosato',5.00,'litro');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leiturasensorial`
--

DROP TABLE IF EXISTS `leiturasensorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leiturasensorial` (
  `id_leitura` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_dado` varchar(50) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_talhao_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_leitura`),
  KEY `fk_leiturasensorial_talhao1_idx` (`id_talhao_fk`),
  CONSTRAINT `fk_leiturasensorial_talhao1` FOREIGN KEY (`id_talhao_fk`) REFERENCES `talhao` (`id_talhao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leiturasensorial`
--

LOCK TABLES `leiturasensorial` WRITE;
/*!40000 ALTER TABLE `leiturasensorial` DISABLE KEYS */;
INSERT INTO `leiturasensorial` VALUES (2,'2025-04-30 23:31:58','pH Solo',9.00,2);
/*!40000 ALTER TABLE `leiturasensorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinario`
--

DROP TABLE IF EXISTS `maquinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinario` (
  `id_maquina` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `valor_hora` decimal(10,2) DEFAULT NULL,
  `id_fazenda_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_maquina`),
  KEY `fk_maquinario_fazenda1_idx` (`id_fazenda_fk`),
  CONSTRAINT `fk_maquinario_fazenda1` FOREIGN KEY (`id_fazenda_fk`) REFERENCES `fazenda` (`id_fazenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinario`
--

LOCK TABLES `maquinario` WRITE;
/*!40000 ALTER TABLE `maquinario` DISABLE KEYS */;
INSERT INTO `maquinario` VALUES (2,'Pulverizador','Jacto Advance 2000','2023-05-20',100.00,2),(3,'Colheitadeira','Case IH 9230','2022-08-15',200.00,2),(4,'Trator','Massey Ferguson 6714','2021-06-25',150.00,2),(5,'Pulverizador','STARA Pulver','2023-01-10',90.00,2),(12,'Colheitadeira','Case IH 9230','2022-08-15',200.00,17),(13,'Trator','Massey Ferguson 6714','2021-06-25',150.00,17),(14,'Pulverizador','STARA Pulver','2023-01-10',90.00,20),(15,'Colheitadeira','Case IH 9230','2022-08-15',200.00,18),(16,'Trator','Massey Ferguson 6714','2021-06-25',150.00,18),(17,'Pulverizador','STARA Pulver','2023-01-10',90.00,18);
/*!40000 ALTER TABLE `maquinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtor`
--

DROP TABLE IF EXISTS `produtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtor` (
  `id_produtor` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_produtor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtor`
--

LOCK TABLES `produtor` WRITE;
/*!40000 ALTER TABLE `produtor` DISABLE KEYS */;
INSERT INTO `produtor` VALUES (2,'Maria','987.654.321-00','(35)99712-8784','maria@gmail.com','Demétrio'),(6,'João','123.789.456-00','(35)99713-1615','Joaogabriel@gmail.com','Gabriel'),(7,'Alisson','123.654.789-00','(35)99724-1419','Alisson@gmail.com','Fernandes'),(8,'Maria','987.321.456-00','(35)99712-8894','MariaJoaquina@gmail.com','Joaquina');
/*!40000 ALTER TABLE `produtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talhao`
--

DROP TABLE IF EXISTS `talhao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talhao` (
  `id_talhao` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `tipo_solo` varchar(50) DEFAULT NULL,
  `id_fazenda_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_talhao`),
  KEY `fk_talhao_fazenda1_idx` (`id_fazenda_fk`),
  CONSTRAINT `fk_talhao_fazenda1` FOREIGN KEY (`id_fazenda_fk`) REFERENCES `fazenda` (`id_fazenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talhao`
--

LOCK TABLES `talhao` WRITE;
/*!40000 ALTER TABLE `talhao` DISABLE KEYS */;
INSERT INTO `talhao` VALUES (2,'Talhão 3','Arenoso',2),(6,'Talhão 1','Argiloso',17),(7,'Talhão 2','Argiloso',18),(8,'Talhão 3','Árido',19),(9,'Talhão 4','Árido',20),(10,'Talhão 5','Úmido',21),(11,'Talhão 6','Úmido',22),(12,'Talhão 7','Argiloso',23);
/*!40000 ALTER TABLE `talhao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_producao`
--

DROP TABLE IF EXISTS `venda_producao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_producao` (
  `id_venda_producao` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_venda` date DEFAULT NULL,
  `quantidade` decimal(10,2) DEFAULT NULL,
  `receita_total` decimal(10,2) DEFAULT NULL,
  `id_cultivo_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id_venda_producao`),
  KEY `fk_vendaproducao_cultivo1_idx` (`id_cultivo_fk`),
  CONSTRAINT `fk_vendaproducao_cultivo1` FOREIGN KEY (`id_cultivo_fk`) REFERENCES `cultivo` (`id_cultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_producao`
--

LOCK TABLES `venda_producao` WRITE;
/*!40000 ALTER TABLE `venda_producao` DISABLE KEYS */;
INSERT INTO `venda_producao` VALUES (2,'2025-03-10',8000.00,50000.00,2);
/*!40000 ALTER TABLE `venda_producao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_funcionario_fazenda`
--

DROP TABLE IF EXISTS `vw_funcionario_fazenda`;
/*!50001 DROP VIEW IF EXISTS `vw_funcionario_fazenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_funcionario_fazenda` AS SELECT 
 1 AS `Nome do Talhão`,
 1 AS `Tipo de Solo`,
 1 AS `Nome da Fazenda`,
 1 AS `Nome do Funcionário`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gasto_maquina`
--

DROP TABLE IF EXISTS `vw_gasto_maquina`;
/*!50001 DROP VIEW IF EXISTS `vw_gasto_maquina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gasto_maquina` AS SELECT 
 1 AS `Tipo da máquina`,
 1 AS `Modelo da máquina`,
 1 AS `Valor Total Gasto`,
 1 AS `Nome da Fazenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_maquina_fazenda`
--

DROP TABLE IF EXISTS `vw_maquina_fazenda`;
/*!50001 DROP VIEW IF EXISTS `vw_maquina_fazenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_maquina_fazenda` AS SELECT 
 1 AS `Nome da Fazenda`,
 1 AS `Tipo da máquina`,
 1 AS `Modelo da máquina`,
 1 AS `Valor por Hora da Máquina`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_producao_total_fazenda`
--

DROP TABLE IF EXISTS `vw_producao_total_fazenda`;
/*!50001 DROP VIEW IF EXISTS `vw_producao_total_fazenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_producao_total_fazenda` AS SELECT 
 1 AS `Nome da Fazenda`,
 1 AS `Total de Produção`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_resumo_cultivos`
--

DROP TABLE IF EXISTS `vw_resumo_cultivos`;
/*!50001 DROP VIEW IF EXISTS `vw_resumo_cultivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resumo_cultivos` AS SELECT 
 1 AS `Nome da Fazenda`,
 1 AS `Nome do talhão`,
 1 AS `Data de plantio`,
 1 AS `Data de Colheita`,
 1 AS `Produção`,
 1 AS `Nome da Cultura`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'agricultura'
--

--
-- Final view structure for view `vw_funcionario_fazenda`
--

/*!50001 DROP VIEW IF EXISTS `vw_funcionario_fazenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_funcionario_fazenda` AS select `t`.`nome` AS `Nome do Talhão`,`t`.`tipo_solo` AS `Tipo de Solo`,`fa`.`nome` AS `Nome da Fazenda`,`f`.`nome` AS `Nome do Funcionário` from ((`talhao` `t` join `fazenda` `fa` on(`fa`.`id_fazenda` = `t`.`id_fazenda_fk`)) join `funcionario` `f` on(`f`.`id_fazenda_fk` = `fa`.`id_fazenda`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gasto_maquina`
--

/*!50001 DROP VIEW IF EXISTS `vw_gasto_maquina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gasto_maquina` AS select `m`.`tipo` AS `Tipo da máquina`,`m`.`modelo` AS `Modelo da máquina`,sum(`m`.`valor_hora`) AS `Valor Total Gasto`,`fa`.`nome` AS `Nome da Fazenda` from (`maquinario` `m` join `fazenda` `fa` on(`fa`.`id_fazenda` = `m`.`id_fazenda_fk`)) group by `m`.`tipo`,`m`.`modelo`,`fa`.`nome` order by sum(`m`.`valor_hora`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_maquina_fazenda`
--

/*!50001 DROP VIEW IF EXISTS `vw_maquina_fazenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_maquina_fazenda` AS select `fa`.`nome` AS `Nome da Fazenda`,`m`.`tipo` AS `Tipo da máquina`,`m`.`modelo` AS `Modelo da máquina`,`m`.`valor_hora` AS `Valor por Hora da Máquina` from (`maquinario` `m` join `fazenda` `fa` on(`fa`.`id_fazenda` = `m`.`id_fazenda_fk`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_producao_total_fazenda`
--

/*!50001 DROP VIEW IF EXISTS `vw_producao_total_fazenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_producao_total_fazenda` AS select `f`.`nome` AS `Nome da Fazenda`,sum(`cultivo`.`producao`) AS `Total de Produção` from ((`fazenda` `f` join `talhao` `t` on(`f`.`id_fazenda` = `t`.`id_fazenda_fk`)) join `cultivo` on(`cultivo`.`id_talhao_fk` = `t`.`id_talhao`)) group by `f`.`id_fazenda` order by sum(`cultivo`.`producao`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_resumo_cultivos`
--

/*!50001 DROP VIEW IF EXISTS `vw_resumo_cultivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resumo_cultivos` AS select `f`.`nome` AS `Nome da Fazenda`,`t`.`nome` AS `Nome do talhão`,`cultivo`.`data_plantio` AS `Data de plantio`,`cultivo`.`data_colheita` AS `Data de Colheita`,`cultivo`.`producao` AS `Produção`,`cultura`.`nome` AS `Nome da Cultura` from (((`fazenda` `f` join `talhao` `t` on(`f`.`id_fazenda` = `t`.`id_fazenda_fk`)) join `cultivo` on(`cultivo`.`id_talhao_fk` = `t`.`id_talhao`)) join `cultura` on(`cultura`.`id_cultura` = `cultivo`.`id_cultura_fk`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 22:57:19
