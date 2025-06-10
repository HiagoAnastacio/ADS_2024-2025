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
-- Table structure for table `auditoriausuario`
--

DROP TABLE IF EXISTS `auditoriausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoriausuario` (
  `idauditoriausuario` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `evento` varchar(45) DEFAULT NULL,
  `dataevento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idauditoriausuario`),
  KEY `fk_auditoria_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoriausuario`
--

LOCK TABLES `auditoriausuario` WRITE;
/*!40000 ALTER TABLE `auditoriausuario` DISABLE KEYS */;
INSERT INTO `auditoriausuario` VALUES (1,1,'Senha alterada pelo usuario','2024-10-09 10:59:55'),(2,1,'Senha alterada pelo usuario','2024-10-09 13:01:55');
/*!40000 ALTER TABLE `auditoriausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idendereco` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `cep` varchar(8) NOT NULL,
  `numero` int DEFAULT NULL,
  `semnumero` tinyint DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idendereco`),
  KEY `fk_endereco_usuario_idx` (`idusuario`),
  KEY `fk_endereco_ibge_idx` (`cep`),
  CONSTRAINT `fk_endereco_ibge` FOREIGN KEY (`cep`) REFERENCES `ibge` (`cep`),
  CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Endereços de cadastro e entrega dos usuários\nTabela revisada com a PRIMEIRA FORMA NORMAL (1FN)\n ATOMICIDADE E TIPOS BEM DEFINIDOS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,1,'01135766',50,NULL,NULL),(2,2,'01298127',250,NULL,'bloco 1 apto 34'),(3,3,'01514265',NULL,1,NULL),(4,4,'03154075',175,NULL,NULL),(5,5,'03934024',550,NULL,NULL),(6,7,'04577365',20045,NULL,'casa 2');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estúdios que desenvolveram os jogos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,'Mojang Studios',2009,'Suécia','mojang.com'),(2,'Rockstar Games',1998,'Estados Unidos','rockstargames.com'),(3,'EA Sports',1991,'Canadá','ea.com/ea-sports'),(4,'Valve',1996,'Estados Unidos','valvesoftware.com'),(5,'Epic Games',1991,'Estados Unidos','epicgames.com'),(6,'Santa Monica Studios',1999,'Estados Unidos','santamonicastudio.com'),(7,'Infinity Ward',2002,'Estados Unidos','infinityward.com'),(8,'Riot Games',2006,'Estados Unidos','riotgames.com'),(9,'Garena',2009,'Singapura','garena.sg'),(10,'Roblox Corporation',2004,'Estados Unidos','corp.roblox.com'),(11,'Supercell',2010,'Finlândia','supercell.com'),(12,'Re-logic',2011,'Estados Unidos','terraria.org'),(13,'Activision',1979,'Estados Unidos','activision.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generojogo`
--

LOCK TABLES `generojogo` WRITE;
/*!40000 ALTER TABLE `generojogo` DISABLE KEYS */;
INSERT INTO `generojogo` VALUES (1,'Aventura'),(2,'Multiplayer'),(3,'Criativo'),(4,'FPS'),(5,'Battle Royale');
/*!40000 ALTER TABLE `generojogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibge`
--

DROP TABLE IF EXISTS `ibge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ibge` (
  `cep` varchar(8) NOT NULL,
  `tipologradouro` varchar(20) NOT NULL,
  `nomelogradouro` varchar(200) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibge`
--

LOCK TABLES `ibge` WRITE;
/*!40000 ALTER TABLE `ibge` DISABLE KEYS */;
INSERT INTO `ibge` VALUES ('00357212','Avenida','Ap #259-883 Molestie Av.','Lubuskie','Londrina','PB'),('00541708','Rua','P.O. Caixa 603, 4420 Orci Street','Đắk Nông','Abaetetuba','RS'),('00865112','Rua','238-422 Diam. Rd.','Arizona','Ilhéus','PA'),('01081289','Rua','Ap #924-434 Rutrum. Avenue','Gelderland','Imperatriz','PE'),('01126438','Estrada','Ap #345-517 Donec Ave','Hessen','Itapipoca','SC'),('01135766','Rua','Ap #356-7538 Aliquet Road','Dōngběi','Rio Verde','PR'),('01283843','Estrada','P.O. Caixa 550, 9598 Nec, Av.','Gauteng','Canoas','GO'),('01298127','Estrada','P.O. Caixa 264, 2911 Nulla St.','Dōngběi','Paulista','PB'),('01440245','Avenida','450-7800 Nisl. St.','Coquimbo','Santarém','PR'),('01514265','Estrada','Ap #377-3565 Pellentesque Rd.','Tabasco','Vitória da Conquista','GO'),('01553353','Rua','514 Suspendisse St.','Gauteng','Lauro de Freitas','PA'),('01585522','Rua','Ap #790-6615 Enim. St.','Västra Götalands län','Goiânia','RJ'),('01661638','Estrada','Ap #383-5862 Imperdiet St.','Rivers','Jaboatão dos Guararapes','PR'),('01744758','Rua','3513 Et Rd.','Baja California','Jundiaí','CE'),('01874115','Avenida','209-6440 Nascetur Road','Oyo','Ribeirão das Neves','SP'),('01981701','Rua','3628 Vitae Ave','Astrakhan Oblast','Ilhéus','PR'),('02021458','Avenida','Ap #119-8375 Nulla Road','Dalarnas län','Cabo de Santo Agostinho','PR'),('02143125','Avenida','7728 Amet Avenue','Oost-Vlaanderen','Juazeiro','SC'),('02176129','Estrada','P.O. Caixa 622, 9691 Urna. Avenue','Friesland','Caruaru','CE'),('02214701','Estrada','Ap #196-7580 Donec Ave','Queensland','Novo Hamburgo','PA'),('02362287','Estrada','973-6987 Interdum. Av.','Hồ Chí Minh City','Anápolis','PR'),('02374418','Estrada','891-8718 Tellus. Av.','Henegouwen','Santa Maria','MG'),('02386786','Estrada','859 Elit, Rd.','Coahuila','Feira de Santana','PB'),('02438937','Rua','Ap #993-9565 Egestas. Avenue','Gelderland','Maracanaú','PA'),('02574886','Estrada','Ap #499-8965 Fringilla Street','Risaralda','Cascavel','CE'),('02683763','Estrada','631-2221 Mi, Avenue','Victoria','Itabuna','CE'),('03154075','Rua','674-1924 Sagittis St.','Katsina','Sete Lagoas','PA'),('03182326','Estrada','272-6584 Mi, St.','Kayseri','Ribeirão das Neves','SP'),('03229887','Rua','671-3029 Hymenaeos. Ave','Lorraine','Osasco','SP'),('03315781','Avenida','Ap #580-5029 Nec, Ave','Punjab','Petrolina','MA'),('03414459','Estrada','Ap #729-2321 Quisque Rd.','Gorontalo','Luziânia','SP'),('03536496','Estrada','327-6659 Feugiat St.','South Island','Novo Hamburgo','PA'),('03741017','Estrada','214-280 Eget Rd.','Tasmania','São Luís','BA'),('03787554','Rua','Ap #764-8814 Quis Ave','Leinster','Cajazeiras','PR'),('03934024','Avenida','Ap #775-3194 Pretium Avenue','Östergötlands län','Campinas','SP'),('04282058','Avenida','1986 Luctus Road','Southwestern Tagalog Region','São José','PR'),('04348436','Estrada','Ap #911-2092 Suspendisse Av.','Huáběi','Camaragibe','SP'),('04384303','Avenida','Ap #972-6818 Nunc Rd.','Papua','Piracicaba','CE'),('04397658','Rua','206-831 Sit Rd.','Waals-Brabant','Ribeirão Preto','PR'),('04421343','Rua','956-2907 Est Road','Western Visayas','Imperatriz','BA'),('04425296','Avenida','Ap #697-5016 Adipiscing. Rd.','Munster','Bacabal','PB'),('04577365','Rua','274-5507 Non, Street','Overijssel','Itapipoca','MA'),('04740521','Rua','Ap #244-2982 A Rd.','South Sulawesi','Pelotas','MA'),('04744408','Avenida','Ap #657-7023 Integer Street','North Region','Luziânia','CE'),('04776686','Avenida','9605 Enim. St.','West-Vlaanderen','Recife','CE'),('04786264','Rua','9910 Vulputate, Road','Pays de la Loire','Rio Verde','PA'),('04851219','Estrada','Ap #899-4001 Auctor St.','Puno','Crato','MA'),('04885050','Rua','Ap #267-4886 Arcu Rd.','Limón','Paulista','BA'),('05013617','Estrada','Ap #912-3480 Laoreet St.','Bahia','Niterói','SC'),('05849425','Avenida','641-8606 Ultrices Rd.','Northamptonshire','Cabo de Santo Agostinho','PR'),('06166827','Estrada','P.O. Caixa 807, 4060 Blandit Ave','Sucre','Paulista','CE'),('06181483','Avenida','558-7547 Lorem. Rd.','Ulster','Joinville','PE'),('06272112','Estrada','P.O. Caixa 120, 3498 Class Rd.','Bangsamoro','Anápolis','RJ'),('06385881','Estrada','Ap #160-3741 Sit Road','British Columbia','Salvador','PR'),('06458735','Avenida','616-1308 Dolor Rd.','Goiás','Canoas','PA'),('06514969','Rua','889-1541 At Street','Bremen','Camaragibe','RJ'),('06517153','Estrada','Ap #713-1631 Id Ave','Goa','São José','RJ'),('06542656','Rua','Ap #927-2756 Urna. St.','Van','Jaboatão dos Guararapes','PB'),('06548892','Estrada','7478 Tincidunt, Av.','Rio de Janeiro','Pelotas','BA'),('06750662','Avenida','Ap #731-4196 Tincidunt Av.','Vorarlberg','Rio Verde','RJ'),('06764622','Rua','Ap #630-4233 Aliquet, Ave','Renfrewshire','Caxias','MG'),('06831330','Avenida','Ap #430-591 Eget Ave','Troms og Finnmark','Criciúma','BA'),('06834415','Avenida','Ap #376-6850 Pharetra Avenue','Oslo','Feira de Santana','PE'),('07002774','Estrada','P.O. Caixa 441, 1708 Quisque Ave','La Libertad','Castanhal','PE'),('07078457','Rua','Ap #594-4690 Malesuada Street','Hải Dương','Ananindeua','MA'),('07183451','Estrada','6853 Et Road','North Island','Maranguape','CE'),('07317845','Avenida','845-5408 Odio. Street','Lima','Balsas','PR'),('07352731','Estrada','8246 Consequat Ave','Junín','Blumenau','GO'),('07407656','Estrada','Ap #829-5180 Dui. St.','Tasmania','Salvador','PA'),('07647581','Estrada','Ap #745-6595 Turpis Road','Antofagasta','Barra do Corda','SP'),('07715093','Estrada','Ap #601-286 Aenean St.','Minas Gerais','Feira de Santana','SP'),('07876312','Avenida','4173 Faucibus Rd.','Ulster','Rio de Janeiro','CE'),('07889343','Estrada','968-8453 Accumsan Road','Khyber Pakhtoonkhwa','Chapadinha','RS'),('07977846','Avenida','P.O. Caixa 279, 389 Sagittis. Av.','South Gyeongsang','Lauro de Freitas','PB'),('08064150','Estrada','Ap #319-1853 Duis Road','Luik','Carapicuíba','SP'),('08082003','Rua','Ap #872-8079 Sem Rd.','Xīnán','Guarulhos','PR'),('08110267','Avenida','574-1681 Convallis, Ave','West Kalimantan','Parauapebas','RJ'),('08157353','Rua','170-4152 Amet Avenue','Niedersachsen','Ribeirão Preto','MG'),('08432106','Estrada','692-2914 Netus Ave','Stockholms län','Caxias do Sul','SP'),('08484282','Rua','Ap #692-6952 Sem. Avenue','Pomorskie','Diadema','PE'),('08484621','Avenida','861-5151 Pretium Ave','Ulster','Cabo de Santo Agostinho','RJ'),('08507654','Estrada','742-2285 Felis, Av.','Oyo','Nova Iguaçu','PA'),('08598564','Estrada','P.O. Caixa 385, 7005 Neque. St.','FATA','Jundiaí','PB'),('08618451','Estrada','Ap #699-8374 Lacus Avenue','FATA','Maranguape','BA'),('08637333','Avenida','Ap #325-2609 Mauris Road','Kirovohrad oblast','Criciúma','MA'),('08754385','Avenida','1367 Lorem St.','Ontario','Caxias do Sul','SC'),('08803308','Estrada','Ap #182-8521 Tincidunt Ave','Zeeland','Caruaru','CE'),('08868804','Estrada','P.O. Caixa 469, 2184 Dolor Street','Bursa','Belo Horizonte','BA'),('08877317','Estrada','Ap #668-6728 Posuere Ave','Selkirkshire','Barra do Corda','PR'),('08942827','Estrada','3972 Dolor St.','Hessen','Caxias','SP'),('08948753','Estrada','Ap #884-2572 Aliquam Avenue','Munster','Aparecida de Goiânia','CE'),('09105982','Rua','Ap #222-3060 Nonummy Ave','Renfrewshire','Juazeiro','PB'),('09214112','Estrada','P.O. Caixa 964, 8508 Lorem Street','New South Wales','Fortaleza','PR'),('09285837','Avenida','Ap #819-6811 Eleifend St.','South Island','Camaçari','SP'),('09336571','Rua','P.O. Caixa 644, 8139 Elit, Avenue','Languedoc-Roussillon','Londrina','PA'),('09367826','Estrada','200-742 Nisl. St.','Oost-Vlaanderen','Montes Claros','SC'),('09638325','Avenida','475-4015 Quisque Road','Luik','Itabuna','SP'),('09657807','Rua','968-6715 Arcu. St.','South Island','Sousa','CE'),('09857327','Estrada','P.O. Caixa 411, 2787 Auctor Street','Lombardia','Valparaíso de Goiás','RS'),('09882371','Estrada','455-6790 Ante Road','Veracruz','São José dos Pinhais','CE');
/*!40000 ALTER TABLE `ibge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo` (
  `idjogo` int NOT NULL AUTO_INCREMENT,
  `titulojogo` varchar(45) NOT NULL,
  `classificacao` varchar(20) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idestudio` int NOT NULL,
  `idgenerojogo` int NOT NULL,
  `datalancamento` date DEFAULT NULL,
  `descricao` text,
  `plataforma` varchar(200) DEFAULT NULL COMMENT 'COLUNA DEVE PERMANECER DESNORMALIZADA',
  PRIMARY KEY (`idjogo`),
  KEY `fk_jogo_estudio_idx` (`idestudio`),
  KEY `fk_jogo_generojogo_idx` (`idgenerojogo`),
  CONSTRAINT `fk_jogo_estudio` FOREIGN KEY (`idestudio`) REFERENCES `estudio` (`idestudio`),
  CONSTRAINT `fk_jogo_generojogo` FOREIGN KEY (`idgenerojogo`) REFERENCES `generojogo` (`idgenerojogo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Títulos disponíveis na plataforma\nTabela revisada conforme a segunda forma normal (2FN)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'God of War 2','18',32.59,6,1,'2024-10-02','Kratos continua sua saga mitológica, enfrentando deuses e monstros em uma busca por vingança. Combate intenso e narrativa envolvente definem este clássico.','PS5'),(2,'FIFA 2024','Livre',279.99,3,2,'2024-10-02','Simulador de futebol realista com novas mecânicas e atualizações de clubes e seleções. Proporciona modos de jogo variados, incluindo partidas online e offline.','PC, PS5, XBox One'),(3,'Call Of Duty','16',179.99,13,4,'2024-10-02','Série de tiro em primeira pessoa focada em cenários de guerra moderna e histórica. Mistura campanhas solo, multiplayer competitivo e modos cooperativos.','PC, PS5, Xbox One'),(4,'Minecraft','Livre',89.99,1,3,'2024-10-02','Jogo de construção e sobrevivência em um mundo pixelado. Oferece liberdade total para explorar, minerar e criar estruturas únicas.','PC, Android, PS4'),(5,'League Of Legends','Livre',0.00,8,1,'2024-10-02','MOBA competitivo onde equipes de campeões lutam em arenas estratégicas. Requer trabalho em equipe e domínio de habilidades para destruir a base inimiga.','PC'),(6,'Free Fire','13',0.00,9,5,'2024-10-02','Battle royale para dispositivos móveis, onde 50 jogadores competem em um mapa para ser o último sobrevivente. Combates rápidos e gráficos otimizados.','PC, Android'),(7,'Valorant','13',0.00,8,4,'2024-10-02','FPS tático onde agentes com habilidades únicas competem em partidas 5x5. Mistura precisão e estratégias baseadas em habilidades.','PC'),(8,'Roblox','Livre',0.00,10,1,'2024-10-02','Plataforma de jogos que permite criar e explorar mundos gerados por usuários. Comunidade ativa e diversidade de minijogos atraem jogadores de todas as idades.','PS4, PC, Android'),(9,'Counter Strike','13',0.00,4,4,'2024-10-02','FPS clássico que coloca equipes de terroristas contra contra-terroristas. Cenários de resgate de reféns e desarmamento de bombas são seu diferencial.','PC'),(10,'Half Life 3','Livre',0.00,4,4,'2024-10-02','Sequência altamente esperada que expande a história de Gordon Freeman em um universo de ficção científica. Promete mecânicas inovadoras e narrativa imersiva.','PC'),(11,'Fortnite','Livre',0.00,5,5,'2024-10-02','Battle royale com construção de estruturas e partidas frenéticas. Estilo visual único e eventos sazonais o tornam popular entre jovens e adultos.','PC, PS5, XBox One, Android'),(12,'Brawl Stars','Livre',0.00,11,2,'2024-10-02','Jogo de combate 3x3 com personagens únicos em arenas dinâmicas. Modos variados e progressão por habilidades garantem diversão casual e competitiva.','Android'),(13,'Terraria','Livre',69.99,12,3,'2024-10-02','Jogo sandbox de aventura e exploração em 2D com elementos de construção. Combate contra chefes e coleta de recursos são os pilares da jogabilidade.','PC, Android');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relação de jogos de cada usuário';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogousuario`
--

LOCK TABLES `jogousuario` WRITE;
/*!40000 ALTER TABLE `jogousuario` DISABLE KEYS */;
INSERT INTO `jogousuario` VALUES (1,1,2),(2,2,5),(3,2,9),(4,3,4),(5,3,5),(6,3,12),(7,3,13),(8,4,1),(10,5,12),(11,8,2),(12,8,1);
/*!40000 ALTER TABLE `jogousuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jogousuario_bd` BEFORE DELETE ON `jogousuario` FOR EACH ROW BEGIN
	declare qtde_pagamentos int;
    
	select count(p.idjogousuario) into qtde_pagamentos
		from pagamento as p
		join jogousuario as ju on ju.idjogousuario = p.idjogousuario
		join jogo as j  on j.idjogo = ju.idjogo
        join usuario as u on u.idusuario = ju.idusuario
		where j.idjogo = old.idjogo and u.idusuario = ju.idusuario;
        
	if qtde_pagamentos > 0 then
		signal sqlstate '45000'
        set message_text = 'Não é possível excluir este registro, pois ele possui um pagamento registrado.';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `datahorapagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpagamento`),
  KEY `fk_pagamento_jogousuario_idx` (`idjogousuario`),
  CONSTRAINT `fk_pagamento_jogousuario` FOREIGN KEY (`idjogousuario`) REFERENCES `jogousuario` (`idjogousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra os pagamentos dos usuários pelos jogos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,279.99,'2024-09-30 14:00:00'),(4,2,0.00,'2024-09-30 14:00:00'),(5,3,0.00,'2024-09-30 14:00:00'),(6,4,89.99,'2024-09-30 14:00:00'),(7,5,0.00,'2024-09-30 14:00:00'),(8,6,0.00,'2024-09-30 14:00:00'),(9,7,69.99,'2024-09-30 14:00:00'),(10,8,32.59,'2024-09-30 14:00:00'),(11,10,0.00,'2024-09-30 14:00:00'),(12,11,279.99,'2024-09-30 14:00:00'),(13,12,29.33,'2024-09-30 14:00:00');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagamento_bi` BEFORE INSERT ON `pagamento` FOR EACH ROW BEGIN
	declare idade int;
	declare preco decimal(10,2);
    select timestampdiff(YEAR, u.datacadastro, current_timestamp) into idade
    from jogousuario as ju
    join usuario as u on u.idusuario = ju.idusuario
    where ju.idjogousuario = new.idjogousuario;
    select j.preco into preco
    from jogousuario as ju
    join jogo as j on j.idjogo = ju.idjogo
    where ju.idjogousuario = new.idjogousuario;
    if idade >= 1 then
		set new.valorpago = preco*0.9;
	else 
		set new.valorpago = preco;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `senha` varchar(64) NOT NULL COMMENT 'SHA-256 (64 caracteres)',
  `sexo` enum('M','F') NOT NULL,
  `datanascimento` date NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dados de login do usuário da plataforma.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'joaoroccella','joao.a@docente.senai.br','2024-09-27 16:05:19','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923ad96c93','M','1985-10-24'),(2,'dorneles','dorneles@gmail.com','2024-09-27 16:11:00','b8dc2c143be8994682b08461f46487e05874e59dd9ab65cf973e3a3c67a763aa','M','2008-04-21'),(3,'victor','victor@gmail.com','2022-09-27 02:11:00','6abb9da0b9c1fe2f244e51a19e4f517fe182da66dcde3b2fb768ee90605a575b','M','2007-10-26'),(4,'basiiilio','basilio@gmail.com','2023-09-27 04:11:00','5b697282df7a44230864437a0821d72986f8406b769c9a1797bad56e269ffb7a','M','2007-12-05'),(5,'mariana','mariana@gmail.com','2024-01-27 04:11:00','4654d793972c3b6a1d48fb0ab58d9cb0de46c3d33d605f9222c283dfaa12d420','F','2007-07-19'),(7,'mariana2','mariana2@gmail.com','2024-10-02 11:18:34','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','F','2007-07-19'),(8,'SS Client','hi1938@hotmail.com','2007-11-01 11:03:00','b7164d31127477b0ce1103bfff0dd51c41c9f9c0d47f4811a4c446048bcbd2d0','M','1965-11-25');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usuario_au` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
	IF NEW.senha <> OLD.senha THEN
		INSERT INTO auditoriausuario (idusuario, evento, dataevento) VALUES (NEW.idusuario, 'Senha alterada pelo usuario', current_timestamp());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_jogos_estudio`
--

DROP TABLE IF EXISTS `view_jogos_estudio`;
/*!50001 DROP VIEW IF EXISTS `view_jogos_estudio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_jogos_estudio` AS SELECT 
 1 AS `idestudio`,
 1 AS `nomeestudio`,
 1 AS `total_jogos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_jogos_genero`
--

DROP TABLE IF EXISTS `view_jogos_genero`;
/*!50001 DROP VIEW IF EXISTS `view_jogos_genero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_jogos_genero` AS SELECT 
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
 1 AS `total_jogos`*/;
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
-- Temporary view structure for view `view_total_pago_usuario`
--

DROP TABLE IF EXISTS `view_total_pago_usuario`;
/*!50001 DROP VIEW IF EXISTS `view_total_pago_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_pago_usuario` AS SELECT 
 1 AS `idusuario`,
 1 AS `nomeusuario`,
 1 AS `totalpago`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'multigame'
--

--
-- Dumping routines for database 'multigame'
--

--
-- Final view structure for view `view_jogos_estudio`
--

/*!50001 DROP VIEW IF EXISTS `view_jogos_estudio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jogos_estudio` AS select `e`.`idestudio` AS `idestudio`,`e`.`nomeestudio` AS `nomeestudio`,count(`j`.`idjogo`) AS `total_jogos` from (`estudio` `e` left join `jogo` `j` on((`j`.`idestudio` = `e`.`idestudio`))) group by `e`.`idestudio`,`e`.`nomeestudio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_jogos_genero`
--

/*!50001 DROP VIEW IF EXISTS `view_jogos_genero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jogos_genero` AS select `g`.`nomegenero` AS `nomegenero`,count(`j`.`titulojogo`) AS `total_jogos` from (`jogo` `j` left join `generojogo` `g` on((`g`.`idgenerojogo` = `j`.`idgenerojogo`))) group by `g`.`nomegenero` */;
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
/*!50001 VIEW `view_jogousuario_contagem` AS select `u`.`idusuario` AS `idusuario`,`u`.`username` AS `username`,count(`ju`.`idjogo`) AS `total_jogos` from (`usuario` `u` left join `jogousuario` `ju` on((`u`.`idusuario` = `ju`.`idusuario`))) group by `u`.`idusuario`,`u`.`username` */;
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
/*!50001 VIEW `view_total_pago_usuario` AS select `u`.`idusuario` AS `idusuario`,`u`.`username` AS `nomeusuario`,sum(`p`.`valorpago`) AS `totalpago` from ((`pagamento` `p` join `jogousuario` `ju` on((`p`.`idjogousuario` = `ju`.`idjogousuario`))) join `usuario` `u` on((`u`.`idusuario` = `ju`.`idusuario`))) group by `u`.`idusuario` */;
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

-- Dump completed on 2024-10-09 16:10:43
