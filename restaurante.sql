-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',50);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `ID` bigint(20) NOT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `NUMERO` bigint(20) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardapio`
--

DROP TABLE IF EXISTS `cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardapio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardapio`
--

LOCK TABLES `cardapio` WRITE;
/*!40000 ALTER TABLE `cardapio` DISABLE KEYS */;
INSERT INTO `cardapio` VALUES (1,'Arroz comum'),(2,'Carne de boi ensopada'),(3,'Carne de porco ensopada'),(4,'Carne de boi assado'),(5,'Carne de porco assado');
/*!40000 ALTER TABLE `cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `ID` bigint(20) NOT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheques`
--

DROP TABLE IF EXISTS `cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheques` (
  `ID` bigint(20) NOT NULL,
  `BANCO_ID` bigint(20) DEFAULT NULL,
  `CATEGORIA_ID` bigint(20) DEFAULT NULL,
  `CPF_CNPJ` varchar(255) DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `EMITENTE` varchar(255) DEFAULT NULL,
  `NUMERO` bigint(20) DEFAULT NULL,
  `OBS` varchar(255) DEFAULT NULL,
  `SITUACAO` varchar(255) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `VALOR` float DEFAULT NULL,
  `VENCIMENTO` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheques`
--

LOCK TABLES `cheques` WRITE;
/*!40000 ALTER TABLE `cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `ID` bigint(20) NOT NULL,
  `BAIRRO` varchar(255) DEFAULT NULL,
  `CEP` varchar(255) DEFAULT NULL,
  `CIDADE` varchar(255) DEFAULT NULL,
  `CONTATO` varchar(255) DEFAULT NULL,
  `CPF_CNPJ` varchar(255) DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ENDERECO` varchar(255) DEFAULT NULL,
  `NOME_RAZAO` varchar(255) DEFAULT NULL,
  `SITE` varchar(255) DEFAULT NULL,
  `TELEFONE` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'SANTO ANDRÉ','29032267','vitória','','','2015-08-10','','TRAVESSA,SANTO ANDRÉ','WANDERLEI SILVA DO CARMO','','','Pessoa Física','ES','2015-08-10 21:53:07');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
  `id` int(11) NOT NULL,
  `mesa` varchar(50) NOT NULL,
  `status` enum('Livre','Ocupada') DEFAULT 'Livre',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'0','Livre','2015-09-08 10:08:10','2015-09-08 10:08:10'),(2,'0','Livre','2015-09-08 10:08:19','2015-09-08 10:08:19'),(3,'0','Livre','2015-09-08 10:08:22','2015-09-08 10:08:22'),(4,'0','Livre','2015-09-08 10:08:24','2015-09-08 10:08:24'),(5,'0','Livre','2015-09-08 10:08:27','2015-09-08 10:08:27'),(6,'0','Livre','2015-09-08 10:08:30','2015-09-08 10:08:30'),(7,'0','Livre','2015-09-08 10:08:35','2015-09-08 10:08:35'),(8,'0','Livre','2015-09-08 10:08:42','2015-09-08 10:08:42'),(9,'0','Livre','2015-09-08 10:08:45','2015-09-08 10:08:45'),(10,'0','Livre','2015-09-08 10:08:48','2015-09-08 10:08:48'),(11,'0','Livre','2015-09-08 10:09:38','2015-09-08 10:09:38'),(12,'0','Livre','2015-09-08 10:16:54','2015-09-08 10:16:54'),(13,'0','Livre','2015-09-08 10:25:01','2015-09-08 10:25:01'),(14,'0','Livre','2015-09-08 10:25:06','2015-09-08 10:25:06'),(15,'0','Livre','2015-09-08 10:25:10','2015-09-08 10:25:10'),(16,'0','Livre','2015-09-08 10:25:13','2015-09-08 10:25:13'),(17,'0','Livre','2015-09-08 10:25:18','2015-09-08 10:25:18'),(18,'0','Livre','2015-09-08 10:25:22','2015-09-08 10:25:22'),(19,'0','Livre','2015-09-08 10:25:25','2015-09-08 10:25:25'),(20,'0','Livre','2015-09-08 10:25:29','2015-09-08 10:25:29'),(21,'0','Livre','2015-09-08 10:25:32','2015-09-08 10:25:32'),(22,'0','Livre','2015-09-08 10:25:35','2015-09-08 10:25:35'),(23,'0','Livre','2015-09-08 10:25:38','2015-09-08 10:25:38'),(24,'0','Livre','2015-09-08 10:25:41','2015-09-08 10:25:41'),(25,'0','Livre','2015-09-08 10:25:45','2015-09-08 10:25:45'),(26,'0','Livre','2015-09-08 10:25:48','2015-09-08 10:25:48'),(27,'0','Livre','2015-09-08 10:25:52','2015-09-08 10:25:52'),(28,'0','Livre','2015-09-08 10:25:54','2015-09-08 10:25:54'),(29,'0','Livre','2015-09-08 10:25:58','2015-09-08 10:25:58'),(30,'0','Livre','2015-09-08 10:26:04','2015-09-08 10:26:04'),(31,'0','Livre','2015-09-08 10:26:12','2015-09-08 10:26:12'),(32,'0','Livre','2015-09-08 10:26:15','2015-09-08 10:26:15'),(33,'0','Livre','2015-09-08 10:26:18','2015-09-08 10:26:18'),(34,'0','Livre','2015-09-08 10:26:22','2015-09-08 10:26:22'),(35,'0','Livre','2015-09-08 10:26:26','2015-09-08 10:26:26'),(36,'0','Livre','2015-09-08 10:26:29','2015-09-08 10:26:29'),(37,'0','Livre','2015-09-08 10:26:32','2015-09-08 10:26:32'),(38,'0','Livre','2015-09-08 10:26:35','2015-09-08 10:26:35'),(39,'0','Livre','2015-09-08 10:26:39','2015-09-08 10:26:39'),(40,'0','Livre','2015-09-08 10:26:43','2015-09-08 10:26:43'),(41,'0','Livre','2015-09-08 10:26:46','2015-09-08 10:26:46'),(42,'0','Livre','2015-09-08 10:26:49','2015-09-08 10:26:49'),(43,'0','Livre','2015-09-08 10:26:51','2015-09-08 10:26:51'),(44,'0','Livre','2015-09-08 10:26:54','2015-09-08 10:26:54'),(45,'0','Livre','2015-09-08 10:26:57','2015-09-08 10:26:57'),(46,'0','Livre','2015-09-08 10:27:00','2015-09-08 10:27:00'),(47,'0','Livre','2015-09-08 10:27:03','2015-09-08 10:27:03'),(48,'0','Livre','2015-09-08 10:27:06','2015-09-08 10:27:06'),(49,'0','Livre','2015-09-08 10:27:09','2015-09-08 10:27:09'),(50,'0','Livre','2015-09-08 10:27:13','2015-09-08 10:27:13');
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comanda` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qtde` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas` (
  `ID` bigint(20) NOT NULL,
  `CATEGORIA_ID` bigint(20) DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `OBS` varchar(255) DEFAULT NULL,
  `SITUACAO` varchar(255) DEFAULT NULL,
  `UPDATE_AT` date DEFAULT NULL,
  `VALOR` float DEFAULT NULL,
  `VENCIMENTO` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas`
--

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `assunto` varchar(50) NOT NULL,
  `mensagem` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (1,'Maria das AcÃ¡cias','macacia@mol.com','3','Sugiro um dia de graÃ§a','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Wanderlei Silva do carmo','wander.silva@gmail.com','2','Reclamando para testes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Elisangela Gouveia','elis@gnla.com','3','Outros pedidos ','2015-09-06 09:51:43','2015-09-06 09:51:43'),(4,'JoÃ£o da Silva','jsilva@bol.com.br','1','Sugerindo algo.','2015-09-06 10:19:48','2015-09-06 10:19:48'),(5,'JoÃ£o da Silva','jsilva@bol.com.br','1','Sugerindo algo.','2015-09-06 10:19:58','2015-09-06 10:19:58'),(6,'JoÃ£o da Silva','jsilva@bol.com.br','1','Sugerindo algo.','2015-09-06 10:20:30','2015-09-06 10:20:30'),(7,'Mario Zagalo','mzagalo@email.com','2','Teste de reclamaÃ§Ã£o','2015-09-06 10:21:19','2015-09-06 10:21:19'),(8,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:24:58','2015-09-06 10:24:58'),(9,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:25:08','2015-09-06 10:25:08'),(10,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:25:16','2015-09-06 10:25:16'),(11,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:28:31','2015-09-06 10:28:31'),(12,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:28:35','2015-09-06 10:28:35'),(13,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:31:35','2015-09-06 10:31:35'),(14,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:33:18','2015-09-06 10:33:18'),(15,'Joaquim da Silveira','mariposa@lombigado.com','1','Sugerindo','2015-09-06 10:33:29','2015-09-06 10:33:29'),(16,'Geoconcia Marinelo','moreita@lolita.com','2','Isso Ã© um teste.','2015-09-06 10:34:05','2015-09-06 10:34:05'),(17,'Geoconcia Marinelo','moreita@lolita.com','2','Isso Ã© um teste.','2015-09-06 10:36:41','2015-09-06 10:36:41'),(18,'dafsfdasfasdf.','Emailafasfasdfasfassdf@algo.com','2','envie sua sdfsadfasmensagem aqui..','2015-09-06 10:37:12','2015-09-06 10:37:12'),(19,'dafsfdasfasdf.','Emailafasfasdfasfassdf@algo.com','2','envie sua sdfsadfasmensagem aqui..','2015-09-06 10:38:46','2015-09-06 10:38:46'),(20,'Antorio Maria','antorino@zefaino.com','1','mensagem teste...','2015-09-06 10:41:57','2015-09-06 10:41:57'),(21,'Espedito da Silva','expeditosilva@uol.com','3','Estamos aqui...','2015-09-06 10:53:29','2015-09-06 10:53:29'),(22,'dafsfdasfasdf.','Emailafasfasdfasfassdf@algo.com','2','envie sua sdfsadfasmensagem aqui..','2015-09-06 10:55:32','2015-09-06 10:55:32'),(23,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:56:07','2015-09-06 10:56:07'),(24,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:56:23','2015-09-06 10:56:23'),(25,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:57:12','2015-09-06 10:57:12'),(26,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:57:17','2015-09-06 10:57:17'),(27,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:57:23','2015-09-06 10:57:23'),(28,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 10:59:25','2015-09-06 10:59:25'),(29,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 11:00:12','2015-09-06 11:00:12'),(30,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 11:04:51','2015-09-06 11:04:51'),(31,'Ricardo Gouveia','rg@oo.com.br','3','Outro teste','2015-09-06 11:05:44','2015-09-06 11:05:44'),(32,'asfdsafsfsafsa','Emailafasfasdfasfassdf@algo.com','3','dafasdfsadfsfas','2015-09-06 11:06:33','2015-09-06 11:06:33'),(33,'asfdsafsfsafsa','Emailafasfasdfasfassdf@algo.com','3','dafasdfsadfsfas','2015-09-06 11:08:29','2015-09-06 11:08:29'),(34,'asfdsafsfsafsa','Emailafasfasdfasfassdf@algo.com','3','dafasdfsadfsfas','2015-09-06 11:08:35','2015-09-06 11:08:35'),(35,'asfdsafsfsafsa','Emailafasfasdfasfassdf@algo.com','3','dafasdfsadfsfas','2015-09-06 11:10:43','2015-09-06 11:10:43'),(36,'asfdsafsfsafsa','Emailafasfasdfasfassdf@algo.com','3','dafasdfsadfsfas','2015-09-06 11:11:22','2015-09-06 11:11:22'),(37,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:13:27','2015-09-06 11:13:27'),(38,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:15:38','2015-09-06 11:15:38'),(39,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:17:02','2015-09-06 11:17:02'),(40,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:17:53','2015-09-06 11:17:53'),(41,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:18:55','2015-09-06 11:18:55'),(42,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:19:57','2015-09-06 11:19:57'),(43,'rwtwertwetwerte','Emailafasfasdfasfassdf@algo.com','2','envie sua mensagem aqui.asdfasfasfasfas','2015-09-06 11:20:42','2015-09-06 11:20:42'),(44,'adsfsfasfsadf','asdfsafassdf@iol.coml','1','fadsfasfsadfsa','2015-09-06 11:21:07','2015-09-06 11:21:07'),(45,'adsfsfasfsadf','asdfsafassdf@iol.coml','1','fadsfasfsadfsa','2015-09-06 11:22:13','2015-09-06 11:22:13'),(46,'adsfsfasfsadf','asdfsafassdf@iol.coml','1','fadsfasfsadfsa','2015-09-06 11:22:19','2015-09-06 11:22:19'),(47,'adsfsfasfsadf','asdfsafassdf@iol.coml','1','fadsfasfsadfsa','2015-09-06 11:22:36','2015-09-06 11:22:36'),(48,'Seu nome aqui..adsfasfasdfsdafas','dfsadfdf@j.com.br','1','afdasfasdfsafsa','2015-09-06 11:23:03','2015-09-06 11:23:03'),(49,'Seu nome aqui..adsfasfasdfsdafas','dfsadfdf@j.com.br','1','afdasfasdfsafsa','2015-09-06 11:23:50','2015-09-06 11:23:50'),(50,'Seu nome dsfsadfasf...','asdfsafassdf@iol.coml','3','afasdfsfasdfsafsadfsad','2015-09-06 11:24:05','2015-09-06 11:24:05'),(51,'Antorio Maria','Emailafasfasdfasfassdf@algo.com','1','adfasdfass','2015-09-06 11:25:05','2015-09-06 11:25:05'),(52,'Testea','teste@testando.com.br','1','Testando','2015-09-06 17:13:11','2015-09-06 17:13:11'),(53,'Astolpho Artunes','astaoroo@tool.com.br','1','testando de novo','2015-09-06 17:15:50','2015-09-06 17:15:50'),(54,'Astolpho Artunes','astaoroo@tool.com.br','1','testando de novo','2015-09-06 17:18:18','2015-09-06 17:18:18'),(55,'Firmino da Silva','firmino@fifa.com','2','Mais um teste bacana','2015-09-06 17:25:12','2015-09-06 17:25:12'),(56,'Firmino da Silva','firmino@fifa.com','2','Mais um teste bacana','2015-09-06 17:25:47','2015-09-06 17:25:47'),(57,'Zequinha de Abreu','zeca@abreu.com.br','2','adfafasfdafafas','2015-09-06 17:29:05','2015-09-06 17:29:05'),(58,'Wanderlei Silva do Carmo','wander.silva@gmail.com','1','asdfasas','2015-09-08 02:10:42','2015-09-08 02:10:42'),(59,'Wanderlei Silva do Carmo','wander.silva@gmail.com','1','asdfasas','2015-09-08 02:11:30','2015-09-08 02:11:30'),(60,'Wanderlei Silva do Carmo','wander.silva@gmail.com','1','asdfasas','2015-09-08 02:12:42','2015-09-08 02:12:42'),(61,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:14:06','2015-09-08 02:14:06'),(62,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:14:49','2015-09-08 02:14:49'),(63,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:15:29','2015-09-08 02:15:29'),(64,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:16:00','2015-09-08 02:16:00'),(65,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:16:15','2015-09-08 02:16:15'),(66,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:16:28','2015-09-08 02:16:28'),(67,'Juarez Machado de Assis','jura@assis.br','1','asdfsafasf','2015-09-08 02:16:49','2015-09-08 02:16:49'),(68,'Outro cara pedindo comida','Emailafasfasdfasfassdf@algo.com','3','dfdasfas..','2015-09-08 02:17:40','2015-09-08 02:17:40'),(69,'Outro cara pedindo comida','Emailafasfasdfasfassdf@algo.com','3','dfdasfas..','2015-09-08 02:18:09','2015-09-08 02:18:09'),(70,'Outro cara pedindo comida','Emailafasfasdfasfassdf@algo.com','3','dfdasfas..','2015-09-08 02:18:47','2015-09-08 02:18:47'),(71,'Outro cara pedindo comida','Emailafasfasdfasfassdf@algo.com','3','dfdasfas..','2015-09-08 02:19:30','2015-09-08 02:19:30'),(72,'Outro cara pedindo comida','Emailafasfasdfasfassdf@algo.com','3','dfdasfas..','2015-09-08 02:28:48','2015-09-08 02:28:48'),(73,'Astrobaldo Antunes','josecastro@email.com','1','Minha sugestÃ£o..','2015-09-08 03:11:58','2015-09-08 03:11:58');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `ID` bigint(20) NOT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `PRODUTO_ID` bigint(20) DEFAULT NULL,
  `QTDEATUAL` int(11) DEFAULT NULL,
  `QTDEMAX` int(11) DEFAULT NULL,
  `QTDEMIN` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores` (
  `ID` bigint(20) NOT NULL,
  `BAIRRO` varchar(255) DEFAULT NULL,
  `CEP` varchar(255) DEFAULT NULL,
  `CIDADE` varchar(255) DEFAULT NULL,
  `CONTATO` varchar(255) DEFAULT NULL,
  `CPF_CNPJ` varchar(255) DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ENDERECO` varchar(255) DEFAULT NULL,
  `NOME_RAZAO` varchar(255) DEFAULT NULL,
  `SITE` varchar(255) DEFAULT NULL,
  `TELEFONE` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_consumo`
--

DROP TABLE IF EXISTS `itens_consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_consumo` (
  `ID` bigint(20) NOT NULL,
  `COMANDA` int(11) DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `MESA` int(11) DEFAULT NULL,
  `QTDE` float DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `PRODUTO_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_itens_consumo_PRODUTO_ID` (`PRODUTO_ID`),
  CONSTRAINT `FK_itens_consumo_PRODUTO_ID` FOREIGN KEY (`PRODUTO_ID`) REFERENCES `produtos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_consumo`
--

LOCK TABLES `itens_consumo` WRITE;
/*!40000 ALTER TABLE `itens_consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_entrega`
--

DROP TABLE IF EXISTS `pedido_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_entrega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `pedido` text,
  `data_entrega` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_entrega`
--

LOCK TABLES `pedido_entrega` WRITE;
/*!40000 ALTER TABLE `pedido_entrega` DISABLE KEYS */;
INSERT INTO `pedido_entrega` VALUES (1,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 pequena 5  1 refr coca-cola\r\n                        \r\n                    ',NULL,'2015-09-05 00:53:00','2015-09-05 00:53:00'),(2,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA 5  1 REFR COCA-COLA\r\n                        \r\n                    ',NULL,'2015-09-05 00:56:00','2015-09-05 00:56:00'),(3,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   1 REFR COCA-COLA\r\n                        \r\n                    ',NULL,'2015-09-05 01:02:00','2015-09-05 01:02:00'),(4,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   1 REFR COCA-COLA\r\n                        \r\n                    ',NULL,'2015-09-05 01:03:00','2015-09-05 01:03:00'),(5,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:09:00','2015-09-05 01:09:00'),(6,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:10:00','2015-09-05 01:10:00'),(7,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:11:00','2015-09-05 01:11:00'),(8,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:12:00','2015-09-05 01:12:00'),(9,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:13:00','2015-09-05 01:13:00'),(10,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE ARROZ COMUM, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  1 REFRIGERANTE COCA-COLA LITRO\r\n1 REFREGERANTE GUARANÃ¡ ANTARCTICA 600ML\r\n1 PORÃ§Ã£O DE SALADA\r\n                        \r\n                    ',NULL,'2015-09-05 01:13:00','2015-09-05 01:13:00'),(11,'maria da silva','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ENSOPADA, CARNE DE PORCO ASSADO 1 COCA LITRO\r\n',NULL,'2015-09-05 01:14:00','2015-09-05 01:14:00'),(12,'maria da silva','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ENSOPADA, CARNE DE PORCO ASSADO 1 COCA LITRO\r\n',NULL,'2015-09-05 01:14:00','2015-09-05 01:14:00'),(13,'Antonieta picareta','RUA MONTE DE OLIVEIRA, NÃšMERO  345\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  MEDIA CARNE DE BOI ASSADO 1 AGUA MINERAL COM GÃ¡S',NULL,'2015-09-05 01:15:00','2015-09-05 01:15:00'),(14,'Antonieta picareta','RUA MONTE DE OLIVEIRA, NÃšMERO  345\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  MEDIA CARNE DE BOI ASSADO 1 AGUA MINERAL COM GÃ¡S',NULL,'2015-09-05 01:17:00','2015-09-05 01:17:00'),(15,'Antonieta picareta','RUA MONTE DE OLIVEIRA, NÃšMERO  345\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  MEDIA CARNE DE BOI ASSADO 1 AGUA MINERAL COM GÃ¡S',NULL,'2015-09-05 01:18:00','2015-09-05 01:18:00'),(16,'Antonieta picareta','RUA MONTE DE OLIVEIRA, NÃšMERO  345\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  MEDIA CARNE DE BOI ASSADO 1 AGUA MINERAL COM GÃ¡S',NULL,'2015-09-05 01:19:00','2015-09-05 01:19:00'),(17,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:20:00','2015-09-05 01:20:00'),(18,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:22:00','2015-09-05 01:22:00'),(19,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:22:00','2015-09-05 01:22:00'),(20,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:26:00','2015-09-05 01:26:00'),(21,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:28:00','2015-09-05 01:28:00'),(22,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:29:00','2015-09-05 01:29:00'),(23,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:29:00','2015-09-05 01:29:00'),(24,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:30:00','2015-09-05 01:30:00'),(25,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:30:00','2015-09-05 01:30:00'),(26,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:30:00','2015-09-05 01:30:00'),(27,'Dilma predidenta','RUA BEIRA MAR, NÃšMERO  171\r\nBAIRRO: CONDUSA\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE BOI ASSADO 1 CERVEJA LITRAO SKOL',NULL,'2015-09-05 01:31:00','2015-09-05 01:31:00'),(28,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:32:00','2015-09-05 01:32:00'),(29,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:33:00','2015-09-05 01:33:00'),(30,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:34:00','2015-09-05 01:34:00'),(31,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:34:00','2015-09-05 01:34:00'),(32,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:35:00','2015-09-05 01:35:00'),(33,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:36:00','2015-09-05 01:36:00'),(34,'Silvana araujo','BECO DO SIRI, NÃšMERO  91\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  GRANDE CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO  \r\n                        \r\n                    QUALQUER COISA DOCE PARA COMER....',NULL,'2015-09-05 01:36:00','2015-09-05 01:36:00'),(35,'Wanderlei Silva do Carmo','\r\n                        ','1 MARMITEX  PEQUENA CARNE DE BOI ENSOPADA, CARNE DE PORCO ENSOPADA  LITRAO CERVEJA\r\n                        \r\n                    ',NULL,'2015-09-05 02:19:00','2015-09-05 02:19:00'),(36,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  \r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO  \r\n                        \r\n                    ',NULL,'2015-09-05 03:11:00','2015-09-05 03:11:00'),(37,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:20:00','2015-09-05 21:20:00'),(38,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:24:00','2015-09-05 21:24:00'),(39,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:25:00','2015-09-05 21:25:00'),(40,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:26:00','2015-09-05 21:26:00'),(41,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:28:00','2015-09-05 21:28:00'),(42,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:29:00','2015-09-05 21:29:00'),(43,'&lt;script&gt;alert(\'testando\');&lt;/script&gt;','TRAVESSA SANTO ANDRÃ‰, NÃšMERO                    &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA   \r\n                                          &lt;?PHP ECHO &quot;TESTE&quot; ?&gt;\r\n                    ',NULL,'2015-09-05 21:29:00','2015-09-05 21:29:00'),(44,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','1 MARMITEX  PEQUENA ARROZ COMUM, CARNE DE BOI ENSOPADA, CARNE DE PORCO ENSOPADA, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO  FDGSDFGDGSDFGSSD  &lt;XML&gt;&lt;/XML&gt;\r\n                        \r\n                    ',NULL,'2015-09-05 21:34:00','2015-09-05 21:34:00'),(45,' ?  echo ferrar tudo ? ','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES\r\n\r\n   Alert(\'Quebra tudo\')  /  ','1 MARMITEX  PEQUENA CARNE DE BOI ENSOPADA  \r\n                        \r\n               AFDAFSF  ?PHP ELETRON ? ',NULL,'2015-09-05 22:03:00','2015-09-05 22:03:00'),(46,'','',' MARMITEX    ',NULL,'2015-09-06 23:55:00','2015-09-06 23:55:00'),(47,'','',' MARMITEX    ',NULL,'2015-09-06 23:56:00','2015-09-06 23:56:00'),(48,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:38:00','2015-09-07 04:38:00'),(49,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:39:00','2015-09-07 04:39:00'),(50,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:39:00','2015-09-07 04:39:00'),(51,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:40:00','2015-09-07 04:40:00'),(52,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:40:00','2015-09-07 04:40:00'),(53,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX    TESTANDO',NULL,'2015-09-07 04:41:00','2015-09-07 04:41:00'),(54,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:41:00','2015-09-07 04:41:00'),(55,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:45:00','2015-09-07 04:45:00'),(56,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:47:00','2015-09-07 04:47:00'),(57,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:52:00','2015-09-07 04:52:00'),(58,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:54:00','2015-09-07 04:54:00'),(59,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:54:00','2015-09-07 04:54:00'),(60,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE ARROZ COMUM, CARNE DE BOI ASSADO, CARNE DE PORCO ASSADO SFGGFGDFG',NULL,'2015-09-07 04:55:00','2015-09-07 04:55:00'),(61,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 04:55:00','2015-09-07 04:55:00'),(62,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 04:56:00','2015-09-07 04:56:00'),(63,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:01:00','2015-09-07 05:01:00'),(64,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:01:00','2015-09-07 05:01:00'),(65,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:01:00','2015-09-07 05:01:00'),(66,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:02:00','2015-09-07 05:02:00'),(67,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:03:00','2015-09-07 05:03:00'),(68,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:04:00','2015-09-07 05:04:00'),(69,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:05:00','2015-09-07 05:05:00'),(70,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:06:00','2015-09-07 05:06:00'),(71,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:07:00','2015-09-07 05:07:00'),(72,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:08:00','2015-09-07 05:08:00'),(73,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:09:00','2015-09-07 05:09:00'),(74,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:11:00','2015-09-07 05:11:00'),(75,'Dilma predidenta','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA ARROZ COMUM ',NULL,'2015-09-07 05:11:00','2015-09-07 05:11:00'),(76,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:12:00','2015-09-07 05:12:00'),(77,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:13:00','2015-09-07 05:13:00'),(78,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:15:00','2015-09-07 05:15:00'),(79,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:17:00','2015-09-07 05:17:00'),(80,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:17:00','2015-09-07 05:17:00'),(81,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:18:00','2015-09-07 05:18:00'),(82,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:21:00','2015-09-07 05:21:00'),(83,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:22:00','2015-09-07 05:22:00'),(84,'Antonieta picareta','','2 MARMITEX  PEQUENA CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:22:00','2015-09-07 05:22:00'),(85,'Antonieta picareta','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  100\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  GRANDE CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:23:00','2015-09-07 05:23:00'),(86,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:24:00','2015-09-07 05:24:00'),(87,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:24:00','2015-09-07 05:24:00'),(88,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:27:00','2015-09-07 05:27:00'),(89,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:28:00','2015-09-07 05:28:00'),(90,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:29:00','2015-09-07 05:29:00'),(91,'Dilma predidenta','RUA MONTE DE OLIVEIRA, NÃšMERO  171\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES',' MARMITEX   CARNE DE BOI ENSOPADA ',NULL,'2015-09-07 05:30:00','2015-09-07 05:30:00'),(92,'','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:30:00','2015-09-07 05:30:00'),(93,'','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:31:00','2015-09-07 05:31:00'),(94,'','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:32:00','2015-09-07 05:32:00'),(95,'','BECO DO SIRI, NÃšMERO  100\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:32:00','2015-09-07 05:32:00'),(96,'','RUA MONTE DE OLIVEIRA, NÃšMERO  345\r\nBAIRRO: ILHA DAS CAIEIRAS\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  PEQUENA CARNE DE BOI ENSOPADA, CARNE DE PORCO ENSOPADA, CARNE DE PORCO ASSADO ',NULL,'2015-09-07 05:33:00','2015-09-07 05:33:00'),(97,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE BOI ASSADO ',NULL,'2015-09-08 02:08:00','2015-09-08 02:08:00'),(98,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE BOI ASSADO ',NULL,'2015-09-08 02:09:00','2015-09-08 02:09:00'),(99,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE BOI ASSADO ',NULL,'2015-09-08 02:09:00','2015-09-08 02:09:00'),(100,'Wanderlei Silva do Carmo','TRAVESSA SANTO ANDRÃ‰, NÃšMERO  91\r\nBAIRRO: SANTO ANDRÃ‰\r\nCIDADE: VITÃ“RIA/ ES','2 MARMITEX  MEDIA ARROZ COMUM, CARNE DE BOI ASSADO ',NULL,'2015-09-08 02:09:00','2015-09-08 02:09:00'),(101,'wanderlei silva do carmo','Buscando endereÃ§o..','2 MARMITEX  PEQUENA CARNE DE BOI ENSOPADA ',NULL,'2015-09-08 03:11:00','2015-09-08 03:11:00');
/*!40000 ALTER TABLE `pedido_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `ID` bigint(20) NOT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `FORNECEDOR_ID` bigint(20) DEFAULT NULL,
  `UNIDADE_ID` bigint(20) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `VALOR` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `ID` bigint(20) NOT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Wanderlei Silva do Carmo','wander.silva@gmail.com','12qwaszx',NULL,'2015-08-05 15:00:00','2015-08-27 14:45:20'),(2,'Maria Fernanda','mfernanda@gmail.com','',NULL,'2015-08-31 08:38:10','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08 11:30:23
