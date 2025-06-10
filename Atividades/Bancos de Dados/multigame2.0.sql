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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idendereco` int NOT NULL AUTO_INCREMENT,
  `cep` int NOT NULL,
  `idusuario` int NOT NULL,
  `semnumero` tinyint DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idendereco`),
  KEY `fk_endereco_ibgeendereco_idx` (`cep`),
  KEY `fk_endereco_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_endereco_ibgeendereco` FOREIGN KEY (`cep`) REFERENCES `ibge_endereco` (`cep`),
  CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,12901625,1,0,'244','Bloco A '),(2,12979927,1,0,'728',NULL),(3,91032327,2,0,'111',NULL),(4,92799240,3,0,'989','Bloco A Ap.2'),(5,93711188,4,1,'',NULL),(6,51519732,5,1,NULL,''),(7,52515252,5,0,'510','Bloco H');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,'Mojang',2009,'Suécia','www.mojang.com'),(2,'Rockstar',1998,'Estados Unidos','www.rockstar.com'),(3,'EA',1995,'Estados Unidos','www.eletronicarts.com'),(4,'Supercell',2007,'Finlandia','www.supercell.com'),(5,'Ubisoft',1999,'Estados Unidos','www.ubisoft.com'),(6,'Activision',2001,'Reino Unidos','www.activision.com'),(7,'Santa Monica Studios',2001,'Estados Unidos','www.santamonica.com');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generojogo`
--

DROP TABLE IF EXISTS `generojogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generojogo` (
  `idgenerojogo` int NOT NULL AUTO_INCREMENT,
  `nomegenero` varchar(20) NOT NULL,
  PRIMARY KEY (`idgenerojogo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generojogo`
--

LOCK TABLES `generojogo` WRITE;
/*!40000 ALTER TABLE `generojogo` DISABLE KEYS */;
INSERT INTO `generojogo` VALUES (1,'Aventura'),(2,'Ação'),(3,'Multiplayer'),(4,'Estratégia'),(5,'Criativo'),(6,'FPS'),(7,'Esporte');
/*!40000 ALTER TABLE `generojogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibge_endereco`
--

DROP TABLE IF EXISTS `ibge_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ibge_endereco` (
  `cep` int NOT NULL,
  `tipologradouro` varchar(20) NOT NULL,
  `nomelogradouro` varchar(255) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibge_endereco`
--

LOCK TABLES `ibge_endereco` WRITE;
/*!40000 ALTER TABLE `ibge_endereco` DISABLE KEYS */;
INSERT INTO `ibge_endereco` VALUES (12901625,'Avenida','P.O. Box 341, 9636 Suscipit Street','Bà Rịa–Vũng Tàu','Enns','SP'),(12979927,'Rua','P.O. Box 376, 1873 Mattis. St.','Cagayan Valley','Futrono','SP'),(13027321,'Avenida','2990 Nulla Av.','Mazowieckie','Gols','SP'),(13867547,'Estrada','P.O. Box 387, 6176 Lorem Avenue','Xīnán','Vijayawada','MG'),(14165046,'Avenida','253-5339 Fusce Road','Xīběi','Kamianets-Podilskyi','MG'),(15631470,'Avenida','848-7060 Ac, Road','New Brunswick','Belfast','SP'),(16306943,'Avenida','P.O. Box 331, 2986 Proin Av.','Northern Territory','Quesada','MG'),(16923205,'Estrada','470-8201 Euismod Rd.','South Island','Cao Lãnh','MG'),(18801938,'Rua','Ap #641-4939 Pellentesque Street','Xīnán','Vị Thanh','SP'),(20788612,'Estrada','Ap #245-2065 Curae Street','Basilicata','Belfast','RJ'),(21095614,'Avenida','274-3274 Auctor. Rd.','Hamburg','Merzig','MG'),(21752443,'Rua','P.O. Box 710, 9082 Duis Ave','Huádōng','Gangtok','MG'),(22044920,'Avenida','376-2308 Habitant Rd.','New South Wales','Peumo','SP'),(23074308,'Avenida','5047 Litora Av.','Zhōngnán','Borongan','RJ'),(23299865,'Rua','P.O. Box 701, 7962 Non St.','Castilla y León','Bergen','SP'),(23972173,'Avenida','302-644 Duis St.','Araucanía','Zirl','MG'),(25433276,'Rua','505-3864 Aliquam Road','Tây Ninh','Ramsey','SP'),(26970060,'Avenida','P.O. Box 221, 3472 Orci. Rd.','Osun','Geraldton-Greenough','SP'),(27623158,'Avenida','Ap #652-9695 Consequat Rd.','Central Visayas','Los Lagos','MG'),(29859729,'Rua','187-7921 Nascetur Ave','Maule','Ockelbo','MG'),(30170018,'Estrada','P.O. Box 618, 3361 Luctus St.','Quảng Trị','Ningxia','SP'),(31604061,'Rua','Ap #140-2097 Class Rd.','Warmińsko-mazurskie','Surigao City','RJ'),(31633711,'Rua','8903 Sociis Ave','Quebec','Burgos','RJ'),(32227156,'Rua','Ap #851-6524 Massa. St.','Marche','Ponte San Nicolò','MG'),(32784035,'Rua','154-7677 Rhoncus. Avenue','Pará','Berlin','SP'),(32844685,'Estrada','610-5470 Aliquet Road','Jeju','Vienna','RJ'),(33524845,'Avenida','1831 Faucibus Road','Bihar','Balfour','MG'),(33833471,'Estrada','899-2166 Feugiat Rd.','Trentino-Alto Adige','Jammu','SP'),(33870876,'Avenida','Ap #796-457 Scelerisque Rd.','Paraná','Orkanger','SP'),(34293649,'Rua','Ap #159-6130 Vulputate Ave','West Lothian','Saint-Dié-des-Vosges','RJ'),(35645347,'Estrada','Ap #834-2856 Sed Street','Connacht','Anglet','MG'),(36196307,'Avenida','Ap #638-8456 Aliquam Street','Herefordshire','Pocatello','MG'),(36701636,'Estrada','Ap #134-6475 Condimentum Street','FATA','Hamburg','RJ'),(36772107,'Estrada','P.O. Box 507, 4591 Molestie. Road','Lorraine','Kaluga','SP'),(38650953,'Avenida','Ap #235-805 Maecenas Street','Troms og Finnmark','Belfast','SP'),(39348779,'Avenida','808 Eget Road','North-East Region','Tianjin','MG'),(39669166,'Avenida','895-6958 Suspendisse St.','Mizoram','Vienna','RJ'),(41173984,'Estrada','193-3729 Sociis Street','Kent','Vegreville','MG'),(44348389,'Avenida','306-9306 Massa. St.','Rivers','Ostrowiec Świętokrzyski','RJ'),(45752699,'Avenida','Ap #534-7940 Non Street','Burgenland','Rewa','RJ'),(48829181,'Avenida','302-1358 Urna. Rd.','West Bengal','Cholet','SP'),(50476194,'Avenida','596 Lobortis Ave','Minas Gerais','Upplands Väsby','MG'),(50698611,'Rua','388 Lobortis Ave','Ulster','Almelo','RJ'),(51519732,'Rua','Ap #465-7380 Integer Rd.','Munster','Mariquina','SP'),(52515252,'Avenida','2903 Consectetuer St.','Atlántico','Spittal an der Drau','RJ'),(52935158,'Rua','488-8615 Nunc Road','Bangka Belitung Islands','Santander','SP'),(54305037,'Estrada','Ap #212-2326 Quis, St.','Munster','Cherkasy','RJ'),(55717788,'Estrada','Ap #538-6242 Mi Road','Antwerpen','Bedok','MG'),(56672608,'Rua','Ap #104-4720 Nunc Rd.','Viken','Nelspruit','MG'),(56901272,'Estrada','Ap #742-8119 Tellus St.','Cagayan Valley','Watson Lake','MG'),(57591018,'Avenida','P.O. Box 496, 9016 Non Ave','Flintshire','Lincoln','RJ'),(58026566,'Estrada','888-3485 Vitae Avenue','Lambayeque','Cauayan','MG'),(58538478,'Avenida','225-5902 Dignissim. Road','Tamil Nadu','Bismil','MG'),(60802877,'Avenida','717-3290 Aenean Road','Rio de Janeiro','Shanxi','SP'),(60835869,'Avenida','Ap #114-2539 Ligula. Ave','North Island','Calapan','MG'),(61297217,'Rua','P.O. Box 234, 5099 Non, Street','Central Visayas','Göksun','SP'),(61680690,'Avenida','Ap #583-1619 Blandit Rd.','Jharkhand','Culiacán','MG'),(63915277,'Avenida','Ap #581-8157 Lectus. Avenue','Bihar','Imst','SP'),(64081498,'Rua','760-7745 Imperdiet Rd.','Ulster','Araban','SP'),(64468399,'Avenida','973-4966 Id, St.','Huáběi','Jaén','SP'),(64555427,'Avenida','4865 Elit, St.','North Island','Jiutepec','MG'),(67289692,'Avenida','1833 Mi Av.','Australian Capital Territory','Göttingen','SP'),(67460310,'Avenida','616-7473 Et Rd.','Bạc Liêu','Weyburn','RJ'),(69276245,'Avenida','P.O. Box 730, 298 Natoque St.','Şanlıurfa','Cardedu','SP'),(69802672,'Estrada','P.O. Box 461, 305 Ante Ave','Limpopo','Durham','RJ'),(70398001,'Estrada','9323 Eget, Road','Alaska','Bogotá','MG'),(70424080,'Estrada','6159 Semper Av.','Emilia-Romagna','Surabaya','SP'),(70859291,'Estrada','2249 Dolor St.','Nizhny Novgorod Oblast','Sakhalin','SP'),(70956864,'Estrada','5782 Elit, Street','Limpopo','Borås','MG'),(71658805,'Estrada','272-9210 Natoque Ave','Lambayeque','Chapadinha','SP'),(73515628,'Rua','Ap #398-872 Bibendum Av.','Idaho','Oslo','SP'),(73900233,'Rua','7406 Enim Ave','Jeju','Tranås','MG'),(74735166,'Rua','464-2829 Nulla Rd.','Gauteng','Pagadian','SP'),(75278664,'Rua','6261 At St.','Antwerpen','Kingussie','RJ'),(75459861,'Estrada','536-8994 Egestas Rd.','Lipetsk Oblast','Palu','MG'),(75695226,'Rua','7480 Lectus. Rd.','Noord Brabant','Chernihiv','RJ'),(75765650,'Estrada','Ap #182-8608 Et Rd.','Punjab','Smila','MG'),(76273439,'Rua','9439 Ridiculus Road','Atacama','Elektrostal','SP'),(76409613,'Estrada','Ap #503-2838 Ligula. Rd.','Leinster','Moss','MG'),(76901504,'Estrada','955-716 Fermentum Avenue','Friesland','Traiskirchen','MG'),(76972891,'Rua','879-4783 Mauris Rd.','Florida','Zapopan','RJ'),(77372518,'Estrada','Ap #757-8986 Mauris, Ave','Goiás','Lamitan','MG'),(78061960,'Avenida','Ap #848-8044 Eget, St.','Diyarbakır','Tailles','MG'),(78263895,'Rua','Ap #770-4790 Pellentesque, Ave','Saratov Oblast','Quảng Ngãi','SP'),(80198128,'Estrada','Ap #399-5652 Vel, Street','Lambayeque','Orange','MG'),(83053053,'Rua','977-6393 Tristique St.','Guerrero','Rhemes-Notre-Dame','SP'),(84074012,'Estrada','9426 Montes, Av.','Zaporizhzhia oblast','Zaragoza','MG'),(85234224,'Estrada','Ap #603-717 Et Road','Aydın','Pica','MG'),(86143136,'Estrada','887-9173 Lorem, Street','Kentucky','Alness','RJ'),(87125920,'Estrada','428-2552 Massa. Avenue','Sverdlovsk Oblast','Pero','SP'),(87294337,'Rua','Ap #415-1814 Augue. St.','Kurgan Oblast','San Costantino Calabro','RJ'),(91032327,'Avenida','Ap #832-7154 Ligula Av.','Balochistan','Bollnäs','MG'),(92799240,'Avenida','Ap #803-9371 Commodo Road','FATA','Santander de Quilichao','RJ'),(93711188,'Rua','Ap #953-2268 Nunc St.','Warmińsko-mazurskie','Beijing','RJ'),(94334461,'Estrada','Ap #717-2005 Nullam Rd.','Khyber Pakhtoonkhwa','Gorzów Wielkopolski','MG'),(95514752,'Rua','Ap #228-8040 Parturient Road','Lubelskie','Mora','SP'),(97121038,'Rua','P.O. Box 892, 2198 Magna Rd.','Zaporizhzhia oblast','Horten','MG'),(98765725,'Estrada','Ap #912-1681 Bibendum Road','Västra Götalands län','Canela','RJ'),(99217675,'Avenida','P.O. Box 976, 715 Cursus Ave','Limpopo','Kapiti','SP'),(99745453,'Estrada','173-6411 Felis Road','Bali','Khmelnytskyi','RJ');
/*!40000 ALTER TABLE `ibge_endereco` ENABLE KEYS */;
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
  `titulojogo` varchar(45) NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idestudio` int NOT NULL,
  `idgenerojogo` int NOT NULL,
  `datalancamento` date DEFAULT NULL,
  `descricao` text,
  `plataforma` varchar(200) DEFAULT NULL COMMENT 'Coluna Desnormalizada',
  PRIMARY KEY (`idjogo`),
  KEY `fk_jogo_estudio_idx` (`idestudio`),
  KEY `fk_jogo_generojogo_idx` (`idgenerojogo`),
  CONSTRAINT `fk_jogo_estudio` FOREIGN KEY (`idestudio`) REFERENCES `estudio` (`idestudio`),
  CONSTRAINT `fk_jogo_generojogo` FOREIGN KEY (`idgenerojogo`) REFERENCES `generojogo` (`idgenerojogo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Titulos disponíveis na plataforma \nTabela revisada conforme a Segunda Forma Normal  (2fn)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'18','God of War',0.00,7,1,'2005-10-12','','Ps Pc'),(2,'Livre','FIFA 23',0.00,3,7,'2005-10-12',NULL,'Pc Ps Xbox'),(3,'16','Call of Duty: Vanguard',0.00,6,6,'2005-10-12',NULL,'Pc Ps Xbox'),(4,'Livre','Clash Royale',0.00,4,4,'2005-10-12',NULL,'IOS Android'),(5,'Livre','Brawl Stars',0.00,4,3,'2005-10-12',NULL,'IOS Android'),(6,'16','For Honor',0.00,5,2,'2005-10-12',NULL,'Ps4 PC'),(7,'Livre','Minecraft',0.00,1,5,'2005-10-12',NULL,'Pc Ps Xbox'),(8,'18','Far Cry 6',0.00,5,1,'2005-10-12',NULL,'Pc Ps Xbox');
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
INSERT INTO `jogousuario` VALUES (1,1,2),(2,2,5),(3,2,7),(4,3,4),(5,3,2),(6,3,7),(7,3,1);
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
  `idjogousuario` int NOT NULL,
  `valorpago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `datahorapagmento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpagamento`),
  KEY `fk_pagamento_jogousuario_idx` (`idjogousuario`),
  CONSTRAINT `fk_pagamento_jogousuario` FOREIGN KEY (`idjogousuario`) REFERENCES `jogousuario` (`idjogousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,359.00,'2024-10-02 15:27:48'),(2,2,0.00,'2024-10-02 15:27:48'),(3,3,99.90,'2024-10-02 15:27:48'),(4,4,0.00,'2024-10-02 15:27:48'),(5,5,359.00,'2024-10-02 15:27:48'),(6,6,99.90,'2024-10-02 15:27:48'),(7,7,36.79,'2024-10-02 15:27:48');
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
-- Temporary view structure for view `view_genero_jogo`
--

DROP TABLE IF EXISTS `view_genero_jogo`;
/*!50001 DROP VIEW IF EXISTS `view_genero_jogo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_genero_jogo` AS SELECT 
 1 AS `nomegenero`,
 1 AS `total_jogos`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `view_total_jogo`
--

DROP TABLE IF EXISTS `view_total_jogo`;
/*!50001 DROP VIEW IF EXISTS `view_total_jogo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_jogo` AS SELECT 
 1 AS `idestudio`,
 1 AS `nomeestudio`,
 1 AS `total_jogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_pago_usuario`
--

DROP TABLE IF EXISTS `view_total_pago_usuario`;
/*!50001 DROP VIEW IF EXISTS `view_total_pago_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_pago_usuario` AS SELECT 
 1 AS `idusuario`,
 1 AS `username`,
 1 AS `total_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'multigame'
--

--
-- Dumping routines for database 'multigame'
--

--
-- Final view structure for view `view_genero_jogo`
--

/*!50001 DROP VIEW IF EXISTS `view_genero_jogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_genero_jogo` AS select `g`.`nomegenero` AS `nomegenero`,count(`j`.`titulojogo`) AS `total_jogos` from (`jogo` `j` left join `generojogo` `g` on((`g`.`idgenerojogo` = `j`.`idgenerojogo`))) group by `g`.`nomegenero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

--
-- Final view structure for view `view_total_jogo`
--

/*!50001 DROP VIEW IF EXISTS `view_total_jogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_jogo` AS select `e`.`idestudio` AS `idestudio`,`e`.`nomeestudio` AS `nomeestudio`,count(ifnull(`j`.`idestudio`,0)) AS `total_jogo` from (`estudio` `e` join `jogo` `j` on((`j`.`idestudio` = `e`.`idestudio`))) group by `e`.`idestudio`,`e`.`nomeestudio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_pago_usuario`
--

/*!50001 DROP VIEW IF EXISTS `view_total_pago_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_pago_usuario` AS select `u`.`idusuario` AS `idusuario`,`u`.`username` AS `username`,sum(ifnull(`p`.`valorpago`,0.00)) AS `total_pago` from (`usuario` `u` left join `pagamento` `p` on((`p`.`idpagamento` = `u`.`idusuario`))) group by `u`.`idusuario`,`u`.`username` */;
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

-- Dump completed on 2024-10-04 16:26:07
