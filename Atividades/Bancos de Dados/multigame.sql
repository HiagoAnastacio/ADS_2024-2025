CREATE DATABASE  IF NOT EXISTS `multigame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `multigame`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: multigame
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudio` (
  `idestudio` int NOT NULL AUTO_INCREMENT,
  `nomeestudio` varchar(40) NOT NULL,
  `anofundacao` year NOT NULL,
  `paissede` varchar(40) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idestudio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,'Mojang',2009,'Suécia','www.mojang.com'),(2,'Rockstar',1998,'Estados Unidos','www.rockstar.com'),(3,'EA',1995,'Estados Unidos','www.eletronicarts.com'),(4,'Supercell',2007,'Finlandia','www.supercell.com'),(5,'Ubisoft',1999,'Estados Unidos','www.ubisoft.com'),(6,'Activision',2001,'Reino Unido','www.activision.com');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo` (
  `idjogo` int NOT NULL AUTO_INCREMENT,
  `classificacao` varchar(45) DEFAULT NULL,
  `titulojogo` varchar(20) NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idestudio` int NOT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `datalancamento` date DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`idjogo`),
  KEY `fk_jogo_estudio_idx` (`idestudio`),
  CONSTRAINT `fk_jogo_estudio` FOREIGN KEY (`idestudio`) REFERENCES `estudio` (`idestudio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'18','God of War',0.00,1,'Ação',NULL,NULL),(2,'Livre','FIFA 23',0.00,1,'Esporte',NULL,NULL),(3,'16','Call of Duty',0.00,1,NULL,NULL,NULL),(4,'Livre','Clash Royale',0.00,1,NULL,NULL,NULL),(5,'Livre','Brawl Stars',0.00,1,NULL,NULL,NULL),(6,'16','For Honor',0.00,1,NULL,NULL,NULL),(7,'Livre','Minecraft',0.00,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogousuario`
--

DROP TABLE IF EXISTS `jogousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogousuario` (
  `idjogousuario` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idjogo` int NOT NULL,
  PRIMARY KEY (`idjogousuario`),
  KEY `fk_jogousuario_usuario_idx` (`idusuario`),
  KEY `fk_jogousuario_jogo_idx` (`idjogo`),
  CONSTRAINT `fk_jogousuario_jogo` FOREIGN KEY (`idjogo`) REFERENCES `jogo` (`idjogo`),
  CONSTRAINT `fk_jogousuario_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogousuario`
--

LOCK TABLES `jogousuario` WRITE;
/*!40000 ALTER TABLE `jogousuario` DISABLE KEYS */;
INSERT INTO `jogousuario` VALUES (1,1,2),(2,1,7),(3,1,6),(4,2,1),(5,3,1),(6,4,5),(7,4,7);
/*!40000 ALTER TABLE `jogousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idpagamento` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idjogo` int NOT NULL,
  `valorpago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `datahorapagmento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpagamento`),
  KEY `fk_pagamento_usuario_idx` (`idusuario`),
  KEY `fk_pagamento_jogo_idx` (`idjogo`),
  CONSTRAINT `fk_pagamento_jogo` FOREIGN KEY (`idjogo`) REFERENCES `jogo` (`idjogo`),
  CONSTRAINT `fk_pagamento_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,2,359.00,'2024-10-02 15:27:48'),(2,2,5,0.00,'2024-10-02 15:27:48'),(3,2,7,99.90,'2024-10-02 15:27:48'),(4,3,4,0.00,'2024-10-02 15:27:48'),(5,3,2,359.00,'2024-10-02 15:27:48'),(6,3,7,99.90,'2024-10-02 15:27:48'),(7,3,1,36.79,'2024-10-02 15:27:48'),(8,4,1,36.79,'2024-10-02 15:27:48');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `email` varchar(200) NOT NULL,
  `datacadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `senha` varchar(64) NOT NULL COMMENT 'SHA-256(64 Caracteres)',
  `sexo` enum('M','F') NOT NULL,
  `datanascimento` date NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dados de login dos usuário da plataforma.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'IIII','IIIII.III@gmail.com','2024-09-27 16:23:18','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','M','1945-09-11'),(2,'Santos','....@gmail.com','2012-09-17 09:11:58','5b697282df7a44230864437a0821d72986f8406b769c9a1797bad56e269ffb7a','M','2007-08-09'),(3,'SS Client','1944@gmail.com','1987-09-17 21:11:58','6eac02c2ab0dc9378be87d5d04da2fd747fb2340dad4977778defee7da92f657','M','2007-08-09'),(4,'Ben Birland','EpicSax@gmail.com','2025-09-17 22:11:58','c13166b0d04e14c712e7487422144f221d7fe2f520c305a4084a0da5a21b9f13','M','2007-08-09'),(5,'Hiago','hiagoanastacios@gmail','2024-09-17 22:11:58','c13166b0d04e14c712e7487422144f221d7fe2f520c305a4084a0da5a21b9f13','M','2007-08-09');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_jogousuario_contagem`
--

DROP TABLE IF EXISTS `view_jogousuario_contagem`;
/*!50001 DROP VIEW IF EXISTS `view_jogousuario_contagem`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_jogousuario_contagem` AS SELECT 
 1 AS `idusuario`,
 1 AS `username`,
 1 AS `total_jogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_jogousuario_detalhes`
--

DROP TABLE IF EXISTS `view_jogousuario_detalhes`;
/*!50001 DROP VIEW IF EXISTS `view_jogousuario_detalhes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_jogousuario_detalhes` AS SELECT 
 1 AS `idusuario`,
 1 AS `username`,
 1 AS `idjogo`,
 1 AS `titulojogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'multigame'
--

--
-- Dumping routines for database 'multigame'
--

--
-- Final view structure for view `view_jogousuario_contagem`
--

/*!50001 DROP VIEW IF EXISTS `view_jogousuario_contagem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jogousuario_contagem` AS select `u`.`idusuario` AS `idusuario`,`u`.`username` AS `username`,count(`ju`.`idjogo`) AS `total_jogo` from (`usuario` `u` left join `jogousuario` `ju` on((`u`.`idusuario` = `ju`.`idusuario`))) group by `ju`.`idusuario`,`u`.`username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_jogousuario_detalhes`
--

/*!50001 DROP VIEW IF EXISTS `view_jogousuario_detalhes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jogousuario_detalhes` AS select `u`.`idusuario` AS `idusuario`,`u`.`username` AS `username`,`j`.`idjogo` AS `idjogo`,`j`.`titulojogo` AS `titulojogo` from ((`jogousuario` `ju` join `usuario` `u` on((`u`.`idusuario` = `ju`.`idusuario`))) join `jogo` `j` on((`j`.`idjogo` = `ju`.`idjogo`))) */;
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

-- Dump completed on 2024-10-02 16:21:38
