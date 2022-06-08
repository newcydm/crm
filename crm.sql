-- MySQL dump 10.13  Distrib 5.5.15, for Win64 (x86)
--
-- Host: localhost    Database: crm2001
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `tbl_activity`
--

DROP TABLE IF EXISTS `tbl_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_activity` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` char(10) DEFAULT NULL,
  `end_date` char(10) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity`
--

LOCK TABLES `tbl_activity` WRITE;
/*!40000 ALTER TABLE `tbl_activity` DISABLE KEYS */;
INSERT INTO `tbl_activity` VALUES ('06f5fc056eac41558a964f96daa7f27b','98fecbb7b87111eb947254e1ad709136','百度投放','2021-1-2','2010-06-09','2500','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2022-05-21 16:27:00','40f6cdea0bd34aceb77492a1656d9fb3'),('06f5fc056eac41558a964f96daa7f27c','7d895bf6b87111eb947254e1ad709136','市场宣传','2003-06-09','2010-06-09','456','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3'),('174ca327df004a96b84beea570aeee0d','06f5fc056eac41558a964f96daa7f27c','111','2022-05-10','2022-05-02','2000','..','2022-05-27 08:41:28','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL),('5a85ab8bfe1e4639adf838a643cbdf9f','7d895bf6b87111eb947254e1ad709136','产品促销','2020-03-08','2010-06-09','1111111','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-20 21:01:31','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53',NULL),('690e31ee52fb4e5d9dbfed7d919ad17e','7d895bf6b87111eb947254e1ad709136','市场竞投','2003-06-08','2010-06-09','123','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-20 20:39:23','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53',NULL),('6fd72459b104470fa1155e57029c4ec6','a71dcbfab87111eb947254e1ad709136','市场调研','2019-09-08','2010-06-09','2222','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53',NULL),('7d895bf6b87111eb947254e1ad709136','7d895bf6b87111eb947254e1ad709136','节日促销','2021-05-28','2021-09-25','12000','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53',NULL),('8b997bc544a943c88683f77db5892925','a71dcbfab87111eb947254e1ad709136','双11需求调查','2021-1-2','2021-6-9','2500.0','市场营销','2021-05-22 20:38:12','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL),('98fecbb7b87111eb947254e1ad709136','98fecbb7b87111eb947254e1ad709136','百度关键字竞争','2021-5-09','2021-6-09','2000','活动策划','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2020-8-09','40f6cdea0bd34aceb77492a1656d9fb3'),('a11d333d8b524327bbdeb8d40ca9a9c2','40f6cdea0bd34aceb77492a1656d9fb3','捡垃圾','2022-05-12','2022-05-28','2000','一起','2022-05-21 17:24:09','40f6cdea0bd34aceb77492a1656d9fb3','2022-05-22 15:08:57','40f6cdea0bd34aceb77492a1656d9fb3'),('a71dcbfab87111eb947254e1ad709133','a71dcbfab87111eb947254e1ad709136','头条投放','2021-6-9','2021-9-8','156000','不错','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-6-8','40f6cdea0bd34aceb77492a1656d9fb3'),('a71dcbfab87111eb947254e1ad709136','7d895bf6b87111eb947254e1ad709136','抖音宣传','2021-03-09','2021-05-09','1000','很好','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-5-06','40f6cdea0bd34aceb77492a1656d9fb3'),('bc622d2f36e7453ea0c69ef10cc58db4','a71dcbfab87111eb947254e1ad709136','搜索引擎营销','2010-06-09','2010-06-09','123','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-20 21:00:14','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL),('cf779b8551ec4950a793a3be34c997d2','a71dcbfab87111eb947254e1ad709136','电视广告','2021-05-16','2021-06-05','2222','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53','a71dcbfab87111eb947254e1ad709136'),('d9fa6dbcc104441abb897af05e9de546','a71dcbfab87111eb947254e1ad709136','新闻营销','2020-02-02','2010-06-09','123','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-20 21:08:15','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL),('de9d6f392b6d4055a87432b336f1d525','a71dcbfab87111eb947254e1ad709136','软文营销','2003-06-09','2010-06-09','2600.0','活动策划','2021-05-23 12:24:53','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-23 12:24:53',NULL),('f1bd2f51289f4de780122a32ba09c093','a71dcbfab87111eb947254e1ad709136','自媒体营销','2018-08-09','2010-06-09','123','		市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等','2021-05-20 20:57:41','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL);
/*!40000 ALTER TABLE `tbl_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_activity_remark`
--

DROP TABLE IF EXISTS `tbl_activity_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_activity_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity_remark`
--

LOCK TABLES `tbl_activity_remark` WRITE;
/*!40000 ALTER TABLE `tbl_activity_remark` DISABLE KEYS */;
INSERT INTO `tbl_activity_remark` VALUES ('275c518d25b3492e8143dcc6f4d73f8c','111','2022-05-22 15:26:26','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL,'0','690e31ee52fb4e5d9dbfed7d919ad17e'),('3c48a665d661448d8dc4acb16f012595','广医的张先生有意了解设备详情','2022-01-05','98fecbb7b87111eb947254e1ad709136',NULL,NULL,'0','a71dcbfab87111eb947254e1ad709133'),('7fb9b8927b874518bb4d2fdc922a02e4','你在干嘛','2022-05-22 16:07:22','40f6cdea0bd34aceb77492a1656d9fb3','2022-05-22 16:38:18','40f6cdea0bd34aceb77492a1656d9fb3','0','a11d333d8b524327bbdeb8d40ca9a9c2'),('97a7c3bc81bf4fcd805369ec98b154d6','很好玩','2022-05-21 19:44:35','40f6cdea0bd34aceb77492a1656d9fb3',NULL,NULL,'0','a71dcbfab87111eb947254e1ad709133'),('d4d4781f2047455eb8b077300daa5e35','后续联系王经理','2022-02-05','98fecbb7b87111eb947254e1ad709136',NULL,NULL,'0','a71dcbfab87111eb947254e1ad709133');
/*!40000 ALTER TABLE `tbl_activity_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clue`
--

DROP TABLE IF EXISTS `tbl_clue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_clue` (
  `id` char(32) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clue`
--

LOCK TABLES `tbl_clue` WRITE;
/*!40000 ALTER TABLE `tbl_clue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_clue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clue_activity_relation`
--

DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_clue_activity_relation` (
  `id` char(32) NOT NULL,
  `clue_id` char(32) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clue_activity_relation`
--

LOCK TABLES `tbl_clue_activity_relation` WRITE;
/*!40000 ALTER TABLE `tbl_clue_activity_relation` DISABLE KEYS */;
INSERT INTO `tbl_clue_activity_relation` VALUES ('2e5afadb95d6461d95ffe84597f9429b','5ee8db8d080241b2934ac4507865b9d6','a11d333d8b524327bbdeb8d40ca9a9c2'),('3c921f47835641fcbc38d8d2ce806f04','5ee8db8d080241b2934ac4507865b9d6','8b997bc544a943c88683f77db5892925'),('3f998bf6c6f04aba90e50401cbab40d2','c870a24863a7458584f5c6c6afa31c0f','a11d333d8b524327bbdeb8d40ca9a9c2'),('73e783a2e04e435dac544fa63e452e3b','5ee8db8d080241b2934ac4507865b9d6','6fd72459b104470fa1155e57029c4ec6'),('8f172a12900f40e3828f911004f9edd5','c870a24863a7458584f5c6c6afa31c0f','06f5fc056eac41558a964f96daa7f27b'),('c289bdcc85954261acb91320a6a82e80','33dace2293da4a87bdde77c1f863dc43','a11d333d8b524327bbdeb8d40ca9a9c2'),('e8eb5dc0b5624442ab9f38750f4116dc','5ee8db8d080241b2934ac4507865b9d6','7d895bf6b87111eb947254e1ad709136'),('eb9bf44cf6f7416994c78550239171b2','f27cbe78fe1345d7b8aa8ccc8d5bcfe3','a11d333d8b524327bbdeb8d40ca9a9c2'),('fa0861b8d6d542ed999ec41f164d2836','5ee8db8d080241b2934ac4507865b9d6','98fecbb7b87111eb947254e1ad709136'),('fe0b5586587d4442bb5c559ce210fb22','f27cbe78fe1345d7b8aa8ccc8d5bcfe3','06f5fc056eac41558a964f96daa7f27b');
/*!40000 ALTER TABLE `tbl_clue_activity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clue_remark`
--

DROP TABLE IF EXISTS `tbl_clue_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_clue_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `clue_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clue_remark`
--

LOCK TABLES `tbl_clue_remark` WRITE;
/*!40000 ALTER TABLE `tbl_clue_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_clue_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contacts`
--

DROP TABLE IF EXISTS `tbl_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contacts` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contacts`
--

LOCK TABLES `tbl_contacts` WRITE;
/*!40000 ALTER TABLE `tbl_contacts` DISABLE KEYS */;
INSERT INTO `tbl_contacts` VALUES ('240187db656c46b5b055ca0edee940c4','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','cf0076b116374e30aac6d823bec9f16e','张华明','59795c49896947e1ab61b7312bd0597c','','','经理','','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'','','2021-01-01',''),('41dab898a5c44040ae01f7c238cff57d','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','98bec8aa53f44037ae044d727f4bc19f','张小鹏','59795c49896947e1ab61b7312bd0597c','','','经理','','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'','','2021-01-01',''),('756001ffd25c4b8886223b887651d3d1','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','7ff803c6e66b4062b1b4207b5195b0a5','张小菲','59795c49896947e1ab61b7312bd0597c','','','经理','','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'','','2021-01-01',''),('7b376ed5adde43d7bdb19f9c2721cf93','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','7aa4aed55d994e7087cd7b4e2c505dec','王小波','59795c49896947e1ab61b7312bd0597c','wangxiaobo@163.com','13695686239','总经理','1980-09-06','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'很好的一个客户，信用度高','合作很愉快','2021-01-01','广州市天河区动力节点'),('8569e826766949d3a09c8f11b29148a3','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','ffa93a255c154115aad5683d5a1674d9','张华明','59795c49896947e1ab61b7312bd0597c','','','经理','','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'','','2021-01-01',''),('bcb826602de548618543cdef1cd7d5fe','7d895bf6b87111eb947254e1ad709136','ffa93a255c154115aad5683d5a1674d9','bcb826602de548618543cdef1cd7d5fe','张华明','59795c49896947e1ab61b7312bd0597c','','','经理','','7d895bf6b87111eb947254e1ad709136','2020-02-06',NULL,NULL,'','','2021-01-01','');
/*!40000 ALTER TABLE `tbl_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contacts_activity_relation`
--

DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contacts_activity_relation` (
  `id` char(32) NOT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contacts_activity_relation`
--

LOCK TABLES `tbl_contacts_activity_relation` WRITE;
/*!40000 ALTER TABLE `tbl_contacts_activity_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contacts_activity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contacts_remark`
--

DROP TABLE IF EXISTS `tbl_contacts_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contacts_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contacts_remark`
--

LOCK TABLES `tbl_contacts_remark` WRITE;
/*!40000 ALTER TABLE `tbl_contacts_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contacts_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES ('0','40f6cdea0bd34aceb77492a1656d9fb3','人民医院-上海',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL),('7ff803c6e66b4062b1b4207b5195b0a5','40f6cdea0bd34aceb77492a1656d9fb3','中山医院',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL),('98bec8aa53f44037ae044d727f4bc19f','40f6cdea0bd34aceb77492a1656d9fb3','中心医院-北京',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL),('bcb826602de548618543cdef1cd7d5fe','40f6cdea0bd34aceb77492a1656d9fb3','人民医院-广州',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL),('cf0076b116374e30aac6d823bec9f16e','40f6cdea0bd34aceb77492a1656d9fb3','中心医院-广州',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL),('ffa93a255c154115aad5683d5a1674d9','40f6cdea0bd34aceb77492a1656d9fb3','人民医院-北京',NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-11-11 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer_remark`
--

DROP TABLE IF EXISTS `tbl_customer_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer_remark`
--

LOCK TABLES `tbl_customer_remark` WRITE;
/*!40000 ALTER TABLE `tbl_customer_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_customer_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dic_type`
--

DROP TABLE IF EXISTS `tbl_dic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dic_type` (
  `code` varchar(255) NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dic_type`
--

LOCK TABLES `tbl_dic_type` WRITE;
/*!40000 ALTER TABLE `tbl_dic_type` DISABLE KEYS */;
INSERT INTO `tbl_dic_type` VALUES ('appellation','称呼',''),('clueState','线索状态',''),('returnPriority','回访优先级',''),('returnState','回访状态',''),('source','来源',''),('stage','阶段',''),('transactionType','交易类型','');
/*!40000 ALTER TABLE `tbl_dic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dic_value`
--

DROP TABLE IF EXISTS `tbl_dic_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dic_value` (
  `id` char(32) NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) DEFAULT NULL COMMENT '可以为空',
  `order_no` varchar(255) DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `type_code` varchar(255) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dic_value`
--

LOCK TABLES `tbl_dic_value` WRITE;
/*!40000 ALTER TABLE `tbl_dic_value` DISABLE KEYS */;
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55','虚假线索','虚假线索','4','clueState'),('0fe33840c6d84bf78df55d49b169a894','销售邮件','销售邮件','8','source'),('12302fd42bd349c1bb768b19600e6b20','交易会','交易会','11','source'),('1615f0bb3e604552a86cde9a2ad45bea','最高','最高','2','returnPriority'),('176039d2a90e4b1a81c5ab8707268636','教授','教授','5','appellation'),('1e0bd307e6ee425599327447f8387285','将来联系','将来联系','2','clueState'),('2173663b40b949ce928db92607b5fe57','丢失线索','丢失线索','5','clueState'),('2876690b7e744333b7f1867102f91153','未启动','未启动','1','returnState'),('29805c804dd94974b568cfc9017b2e4c','07成交','07成交','7','stage'),('310e6a49bd8a4962b3f95a1d92eb76f4','试图联系','试图联系','1','clueState'),('31539e7ed8c848fc913e1c2c93d76fd1','博士','博士','4','appellation'),('37ef211719134b009e10b7108194cf46','01资质审查','01资质审查','1','stage'),('391807b5324d4f16bd58c882750ee632','08丢失的线索','08丢失的线索','8','stage'),('3a39605d67da48f2a3ef52e19d243953','聊天','聊天','14','source'),('474ab93e2e114816abf3ffc596b19131','低','低','3','returnPriority'),('48512bfed26145d4a38d3616e2d2cf79','广告','广告','1','source'),('4d03a42898684135809d380597ed3268','合作伙伴研讨会','合作伙伴研讨会','9','source'),('59795c49896947e1ab61b7312bd0597c','先生','先生','1','appellation'),('5c6e9e10ca414bd499c07b886f86202a','高','高','1','returnPriority'),('67165c27076e4c8599f42de57850e39c','夫人','夫人','2','appellation'),('68a1b1e814d5497a999b8f1298ace62b','09因竞争丢失关闭','09因竞争丢失关闭','9','stage'),('6b86f215e69f4dbd8a2daa22efccf0cf','web调研','web调研','13','source'),('72f13af8f5d34134b5b3f42c5d477510','合作伙伴','合作伙伴','6','source'),('7c07db3146794c60bf975749952176df','未联系','未联系','6','clueState'),('86c56aca9eef49058145ec20d5466c17','内部研讨会','内部研讨会','10','source'),('9095bda1f9c34f098d5b92fb870eba17','进行中','进行中','3','returnState'),('954b410341e7433faa468d3c4f7cf0d2','已有业务','已有业务','1','transactionType'),('966170ead6fa481284b7d21f90364984','已联系','已联系','3','clueState'),('96b03f65dec748caa3f0b6284b19ef2f','推迟','推迟','2','returnState'),('97d1128f70294f0aac49e996ced28c8a','新业务','新业务','2','transactionType'),('9ca96290352c40688de6596596565c12','完成','完成','4','returnState'),('9e6d6e15232549af853e22e703f3e015','需要条件','需要条件','7','clueState'),('9ff57750fac04f15b10ce1bbb5bb8bab','02需求分析','02需求分析','2','stage'),('a70dc4b4523040c696f4421462be8b2f','等待某人','等待某人','5','returnState'),('a83e75ced129421dbf11fab1f05cf8b4','推销电话','推销电话','2','source'),('ab8472aab5de4ae9b388b2f1409441c1','常规','常规','5','returnPriority'),('ab8c2a3dc05f4e3dbc7a0405f721b040','05提案/报价','05提案/报价','5','stage'),('b924d911426f4bc5ae3876038bc7e0ad','web下载','web下载','12','source'),('c13ad8f9e2f74d5aa84697bb243be3bb','03价值建议','03价值建议','3','stage'),('c83c0be184bc40708fd7b361b6f36345','最低','最低','4','returnPriority'),('db867ea866bc44678ac20c8a4a8bfefb','员工介绍','员工介绍','3','source'),('e44be1d99158476e8e44778ed36f4355','04确定决策者','04确定决策者','4','stage'),('e5f383d2622b4fc0959f4fe131dafc80','女士','女士','3','appellation'),('e81577d9458f4e4192a44650a3a3692b','06谈判/复审','06谈判/复审','6','stage'),('fb65d7fdb9c6483db02713e6bc05dd19','在线商场','在线商场','5','source'),('fd677cc3b5d047d994e16f6ece4d3d45','公开媒介','公开媒介','7','source'),('ff802a03ccea4ded8731427055681d48','外部介绍','外部介绍','4','source');
/*!40000 ALTER TABLE `tbl_dic_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tran`
--

DROP TABLE IF EXISTS `tbl_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tran` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `expected_date` char(10) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tran`
--

LOCK TABLES `tbl_tran` WRITE;
/*!40000 ALTER TABLE `tbl_tran` DISABLE KEYS */;
INSERT INTO `tbl_tran` VALUES ('001fe571286f4eeaaf31c9ab59f224fc','40f6cdea0bd34aceb77492a1656d9fb3','6500','交易重试','2009-09-08','d76ec257f738409e9e458ea3a4cb4ccb','68a1b1e814d5497a999b8f1298ace62b','954b410341e7433faa468d3c4f7cf0d2','48512bfed26145d4a38d3616e2d2cf79','4b601e03b120407eac94cd11668513fe','e119bda7a567471d87888ef28f7083a0','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-26 16:21:35',NULL,NULL,'烦烦烦方法','烦烦烦','2011-09-08'),('0085ec609b61420fac94860ccf6309bf','40f6cdea0bd34aceb77492a1656d9fb3','5600','第一次购买','2021-09-08','00f8d48cc6384facabfb5caf900869a8','29805c804dd94974b568cfc9017b2e4c','954b410341e7433faa468d3c4f7cf0d2','86c56aca9eef49058145ec20d5466c17','31ae55adbb324364af50f33aaa906bec',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-05-26 16:09:11',NULL,NULL,'很好','和那好','2021-9-9'),('00cc28d187d64ed89248c07c110b8a03',NULL,NULL,NULL,NULL,'5f871dee7daa42cbaedc0ecdac34eaae','391807b5324d4f16bd58c882750ee632',NULL,NULL,NULL,NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-05-26 16:09:59',NULL,NULL,NULL,NULL,NULL),('2a6abe0c9a7f4b9c88fbf5aace442574','06f5fc056eac41558a964f96daa7f27c','3000','新名称','2020-09-27','407c5630feb44e8eba49dc7848314b22','391807b5324d4f16bd58c882750ee632','已有业务','广告','31ae55adbb324364af50f33aaa906bec','2939e47610454fb98d7410af16ec5005','李四','2020-09-27 22:39:00',NULL,NULL,'123','123','2020-09-27'),('33dace2293da4a87bdde77c1f863dc43',NULL,'5000','宋声莉','123',NULL,'e44be1d99158476e8e44778ed36f4355',NULL,NULL,'a11d333d8b524327bbdeb8d40ca9a9c2',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2022-05-27 10:00:49','2022-05-27 10:02:19',NULL,'.','.','2022-05-10'),('362c5b59156249e8b9e9a07c1af34f27','',NULL,'','','','','','','','','40f6cdea0bd34aceb77492a1656d9fb3','2022-05-24 19:32:11',NULL,NULL,'','',''),('53c47de10dec4f0a8cccad852c14da43','06f5fc056eac41558a964f96daa7f27c','111','111','2020-10-05','ec43928e18bb417a8ed5febe63c80ed5','68a1b1e814d5497a999b8f1298ace62b','已有业务','广告','31ae55adbb324364af50f33aaa906bec','2939e47610454fb98d7410af16ec5005','李四','2020-10-05 21:39:02',NULL,NULL,'111','111','2020-10-05'),('5ee8db8d080241b2934ac4507865b9d6',NULL,'1231','54131','1231231',NULL,'c13ad8f9e2f74d5aa84697bb243be3bb',NULL,NULL,'06f5fc056eac41558a964f96daa7f27b',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2022-05-23 17:28:04','2022-05-27 09:43:48',NULL,'。。。。','。。。。','1899-12-22'),('74ae280a9f0047afac0d8f920ddee5b8','40f6cdea0bd34aceb77492a1656d9fb3','100000000','有钱任性','2020-10-10','407c5630feb44e8eba49dc7848314b21','37ef211719134b009e10b7108194cf46','已有业务','内部研讨会','31ae55adbb324364af50f33aaa906bec','2939e47610454fb98d7410af16ec5005','李四','2020-09-24 17:26:56',NULL,NULL,'线索描述：有钱','联系纪要：任性','2020-10-10'),('80e929b5bb064b69bfe8042f82321d88','40f6cdea0bd34aceb77492a1656d9fb3','6666','lllll','2020-09-25','d0e3f67471cb4ae2a12fd7d60fdef34c','391807b5324d4f16bd58c882750ee632','','广告','4b601e03b120407eac94cd11668513fe','00f8d48cc6384facabfb5caf900869a8','李四','2020-09-25 22:46:51',NULL,NULL,'666','666','2020-10-10'),('9974c88e7a6b4314978467037259baba','06f5fc056eac41558a964f96daa7f27c','8000','交易02','2020-10-03','d61780c4c3cc451f8236259b248fbd46','68a1b1e814d5497a999b8f1298ace62b','已有业务','web调研','31ae55adbb324364af50f33aaa906bec','e119bda7a567471d87888ef28f7083a0','李四','2020-09-24 16:57:29',NULL,NULL,'111','联系纪要中','2020-09-30'),('9c3a982e74b345339ef73f57b6878096','06f5fc056eac41558a964f96daa7f27c','100000','交易123','2020-09-27','ec43928e18bb417a8ed5febe63c80ed5','68a1b1e814d5497a999b8f1298ace62b','新业务','广告','31ae55adbb324364af50f33aaa906bec','2939e47610454fb98d7410af16ec5005','李四','2020-09-27 22:41:41',NULL,NULL,'12','123','2020-09-27'),('9de94a9caf074cc7839534029c0e9529','40f6cdea0bd34aceb77492a1656d9fb3',NULL,'何运雷','2022-05-26','人民医院-广州','391807b5324d4f16bd58c882750ee632','954b410341e7433faa468d3c4f7cf0d2','4d03a42898684135809d380597ed3268','06f5fc056eac41558a964f96daa7f27b','240187db656c46b5b055ca0edee940c4','40f6cdea0bd34aceb77492a1656d9fb3','2022-05-24 19:29:39',NULL,NULL,'。。','..','2022-05-03'),('9fd3f3fb0f804e7fb8876102e302b450','06f5fc056eac41558a964f96daa7f27c','4589','AAAA','2021-05-01','4773e1ae93d64625acde4bafafe732db','68a1b1e814d5497a999b8f1298ace62b','954b410341e7433faa468d3c4f7cf0d2','86c56aca9eef49058145ec20d5466c17','31d63a3514564d51b6758f974c9fafcf','34046b48f12346e9ba43768914c99640','40f6cdea0bd34aceb77492a1656d9fb3','2021-05-09 14:55:37',NULL,NULL,'水水水水水水水水水水','水水水水水水水水水水水','2021-05-15'),('b98aaa782adb4f7aa9287c618bd9d328','06f5fc056eac41558a964f96daa7f27c','123','123啊啊啊啊','2020-10-05','0efcfaceb7d94611a94daa2027b2322b','29805c804dd94974b568cfc9017b2e4c','已有业务','内部研讨会','15a871e8b4e84b85a1069874fff33c02','2939e47610454fb98d7410af16ec5005','李四','2020-10-05 22:13:37','李四','2020-10-11 15:58:47','33621','665561','2020-11-02'),('c870a24863a7458584f5c6c6afa31c0f',NULL,'','','',NULL,'',NULL,NULL,'',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2022-05-22 18:36:54','2022-05-27 09:46:03',NULL,'1654531515143描述','1','2023-4-5'),('e6d809225a78443784ba8629d55d0599','40f6cdea0bd34aceb77492a1656d9fb3','5600','第一次购买','2021-09-08','00f8d48cc6384facabfb5caf900869a8','29805c804dd94974b568cfc9017b2e4c','954b410341e7433faa468d3c4f7cf0d2','86c56aca9eef49058145ec20d5466c17','31ae55adbb324364af50f33aaa906bec',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-05-26 16:09:40',NULL,NULL,'很好','和那好','2021-9-9'),('f27cbe78fe1345d7b8aa8ccc8d5bcfe3',NULL,'31','135','1351',NULL,'9ff57750fac04f15b10ce1bbb5bb8bab',NULL,NULL,'06f5fc056eac41558a964f96daa7f27b',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2022-05-22 17:57:54','2022-05-27 09:58:44',NULL,'.','。','2021-1-1'),('f40aeedc07b449f9ae4d46c9675b68bf','40f6cdea0bd34aceb77492a1656d9fb3','5600','BBB','2021-12-13','00f8d48cc6384facabfb5caf900869a8','e44be1d99158476e8e44778ed36f4355','954b410341e7433faa468d3c4f7cf0d2','48512bfed26145d4a38d3616e2d2cf79','15a871e8b4e84b85a1069874fff33c02',NULL,'40f6cdea0bd34aceb77492a1656d9fb3','2021-05-26 16:14:37',NULL,NULL,'sssss','ssss','2001-09-09');
/*!40000 ALTER TABLE `tbl_tran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tran_history`
--

DROP TABLE IF EXISTS `tbl_tran_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tran_history` (
  `id` char(32) NOT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `expected_date` char(10) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `tran_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tran_history`
--

LOCK TABLES `tbl_tran_history` WRITE;
/*!40000 ALTER TABLE `tbl_tran_history` DISABLE KEYS */;
INSERT INTO `tbl_tran_history` VALUES ('b9deff80947a4bb090db3866c44be258','e44be1d99158476e8e44778ed36f4355','4589','2021-05-01','2021-05-09 14:55:37','40f6cdea0bd34aceb77492a1656d9fb3','9fd3f3fb0f804e7fb8876102e302b450');
/*!40000 ALTER TABLE `tbl_tran_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tran_remark`
--

DROP TABLE IF EXISTS `tbl_tran_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tran_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `tran_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tran_remark`
--

LOCK TABLES `tbl_tran_remark` WRITE;
/*!40000 ALTER TABLE `tbl_tran_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tran_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL COMMENT 'uuid\r\n            ',
  `login_act` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `login_pwd` varchar(255) DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) DEFAULT NULL,
  `expire_time` char(19) DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lock_state` char(1) DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `dept_no` char(4) DEFAULT NULL,
  `allow_ips` varchar(255) DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c','ls','李四','e10adc3949ba59abbe56e057f20f883e','ls@163.com','2022-11-27 21:50:05','0','A001','192.168.1.1,0:0:0:0:0:0:0:1','2018-11-22 12:11:40','40f6cdea0bd34aceb77492a1656d9fb3','40f6cdea0bd34aceb77','40f6cdea0bd34aceb77492a1656d9fb3'),('40f6cdea0bd34aceb77492a1656d9fb3','zs','张三','e10adc3949ba59abbe56e057f20f883e','zs@qq.com','2022-11-30 23:50:55','1','A001','192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3','40f6cdea0bd34aceb77','40f6cdea0bd34aceb77492a1656d9fb3'),('7d895bf6b87111eb947254e1ad709136','zc','张晨','e10adc3949ba59abbe56e057f20f883e','zc@163.com','2022-11-27 21:50:05','1','A001','192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3'),('98fecbb7b87111eb947254e1ad709136','xd','晓东','e10adc3949ba59abbe56e057f20f883e','xd@163.com','2022-11-27 21:50:05','1','A001','192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3'),('a71dcbfab87111eb947254e1ad709136','bin','冰冰','e10adc3949ba59abbe56e057f20f883e','xd@163.com','2022-11-27 21:50:05','1','A001','192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3','2018-11-22 11:37:34','40f6cdea0bd34aceb77492a1656d9fb3');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 10:51:47
