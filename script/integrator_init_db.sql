-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: integrator
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001','skt','config/liquibase/changelog/00000000000000_initial_schema.xml','2019-12-17 23:31:43',1,'EXECUTED','7:0190cfdab2af4a6ae6fd1ff373a31302','createTable tableName=T_NOTIFICATION; createIndex indexName=idx_notification_workflow_id, tableName=T_NOTIFICATION; createIndex indexName=idx_notification_coordinator_id, tableName=T_NOTIFICATION; createIndex indexName=idx_notification_trigger_id,...','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000002','skt','config/liquibase/changelog/00000000000001_schema.xml','2019-12-17 23:31:43',2,'EXECUTED','7:ed45e96e4fe308b2bd326dfc09aa31fb','addColumn tableName=T_WORKFLOW; loadData tableName=T_COMMON_CODE','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000003','skt','config/liquibase/changelog/00000000000002_schema.xml','2019-12-17 23:31:43',3,'EXECUTED','7:bea917697bfe0b8886a3a76297da5bd4','modifyDataType columnName=coordinator_status, tableName=T_COORDINATOR','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000004','skt','config/liquibase/changelog/00000000000003_schema.xml','2019-12-17 23:31:43',4,'EXECUTED','7:9d5fa30030e810e36cba049cf9e37206','addColumn tableName=T_WORKFLOWSHARE','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000005','skt','config/liquibase/changelog/00000000000004_schema.xml','2019-12-17 23:31:43',5,'EXECUTED','7:9e19db2aa51c8f8f8afac09fbf78fa9d','dropColumn tableName=T_WORKFLOWSHARE; addColumn tableName=T_WORKFLOWSHARE','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000006','skt','config/liquibase/changelog/00000000000005_schema.xml','2019-12-17 23:31:43',6,'EXECUTED','7:7c57f249140511733ca05007bd0746e5','addColumn tableName=T_COMMON_CODE','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000007','skt','config/liquibase/changelog/00000000000006_schema.xml','2019-12-17 23:31:43',7,'EXECUTED','7:c2cd8542c5e3d3d95446b8e9495d4152','loadData tableName=T_COMMON_CODE','',NULL,'3.5.4',NULL,NULL,'6625502711'),('00000000000008','skt','config/liquibase/changelog/00000000000007_schema.xml','2019-12-17 23:31:43',8,'EXECUTED','7:37f835d0b7c99324300ac1cfdd10c651','createTable tableName=T_TRIGGER_ACTIONS; createIndex indexName=idx_trigger_id_action, tableName=T_TRIGGER_ACTIONS','Add T_TRIGGER_ACTIONS table',NULL,'3.5.4',NULL,NULL,'6625502711');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_BUNDLE`
--

DROP TABLE IF EXISTS `T_BUNDLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_BUNDLE` (
  `bundle_id` varchar(100) NOT NULL,
  `bundle_name` varchar(255) DEFAULT NULL,
  `bundle_description` varchar(255) DEFAULT NULL,
  `bundle_controls` varchar(255) DEFAULT NULL,
  `coordinator_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bundle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_BUNDLE`
--

LOCK TABLES `T_BUNDLE` WRITE;
/*!40000 ALTER TABLE `T_BUNDLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_BUNDLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_COMMON_CODE`
--

DROP TABLE IF EXISTS `T_COMMON_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_COMMON_CODE` (
  `category` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_COMMON_CODE`
--

LOCK TABLES `T_COMMON_CODE` WRITE;
/*!40000 ALTER TABLE `T_COMMON_CODE` DISABLE KEYS */;
INSERT INTO `T_COMMON_CODE` VALUES ('COM_0001','hadoop@localhost@10000@default@hadoop@none','hive1',1,NULL,'','2019-12-17 23:31:43','','2019-12-17 23:31:43'),('COM_0001','TITLEofCATEGORY',NULL,NULL,NULL,'admin','2019-12-17 23:31:43','admin','2019-12-17 23:31:43'),('COM_0002','mapred','mapred',2,NULL,'','2019-12-17 23:31:43','','2019-12-17 23:31:43'),('COM_0002','root','root',1,NULL,'','2019-12-17 23:31:43','','2019-12-17 23:31:43'),('COM_0002','TITLEofCATEGORY',NULL,NULL,NULL,'admin','2019-12-17 23:31:43','admin','2019-12-17 23:31:43');
/*!40000 ALTER TABLE `T_COMMON_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_COORDINATOR`
--

DROP TABLE IF EXISTS `T_COORDINATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_COORDINATOR` (
  `coordinator_id` varchar(100) NOT NULL,
  `coordinator_name` varchar(255) DEFAULT NULL,
  `coordinator_description` varchar(255) DEFAULT NULL,
  `coordinator_start` timestamp NULL DEFAULT NULL,
  `coordinator_end` timestamp NULL DEFAULT NULL,
  `coordinator_frequency` varchar(1000) DEFAULT NULL,
  `coordinator_timezone` varchar(20) DEFAULT NULL,
  `coordinator_controls` text,
  `coordinator_datasets` text,
  `coordinator_input_events` text,
  `coordinator_output_events` text,
  `coordinator_configurations` text,
  `coordinator_variables` text,
  `coordinator_sla_config` text,
  `coordinator_use_flag` varchar(5) DEFAULT NULL,
  `coordinator_status` varchar(50) DEFAULT NULL,
  `workflow_id` varchar(100) DEFAULT NULL,
  `bundle_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`coordinator_id`),
  KEY `idx_coordinator_workflow_id` (`workflow_id`),
  KEY `idx_coordinator_coordinator_status` (`coordinator_status`),
  KEY `idx_coordinator_bundle_id` (`bundle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_COORDINATOR`
--

LOCK TABLES `T_COORDINATOR` WRITE;
/*!40000 ALTER TABLE `T_COORDINATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_COORDINATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_COORDINATOR_ACTIONS`
--

DROP TABLE IF EXISTS `T_COORDINATOR_ACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_COORDINATOR_ACTIONS` (
  `coordinator_job_id` varchar(100) NOT NULL,
  `coordinator_action_id` bigint(20) unsigned NOT NULL,
  `nominal_time` timestamp NULL DEFAULT NULL,
  `action_started` timestamp NULL DEFAULT NULL,
  `action_ended` timestamp NULL DEFAULT NULL,
  `action_result` varchar(50) DEFAULT NULL,
  `job_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`coordinator_job_id`,`coordinator_action_id`),
  KEY `idx_coordinator_action_job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_COORDINATOR_ACTIONS`
--

LOCK TABLES `T_COORDINATOR_ACTIONS` WRITE;
/*!40000 ALTER TABLE `T_COORDINATOR_ACTIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_COORDINATOR_ACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_JOB`
--

DROP TABLE IF EXISTS `T_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_JOB` (
  `job_id` varchar(100) NOT NULL,
  `job_type` varchar(50) DEFAULT NULL,
  `job_result` varchar(50) DEFAULT NULL,
  `oozie_id` varchar(100) DEFAULT NULL,
  `variables` text,
  `workflow_id` varchar(100) DEFAULT NULL,
  `coordinator_id` varchar(100) DEFAULT NULL,
  `trigger_id` varchar(100) DEFAULT NULL,
  `job_starttime` timestamp NULL DEFAULT NULL,
  `job_endtime` timestamp NULL DEFAULT NULL,
  `job_duetime` int(11) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `idx_job_workflow_id` (`workflow_id`),
  KEY `idx_job_coordinator_id` (`coordinator_id`),
  KEY `idx_job_trigger_id` (`trigger_id`),
  KEY `idx_job_oozie_id` (`oozie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_JOB`
--

LOCK TABLES `T_JOB` WRITE;
/*!40000 ALTER TABLE `T_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_NOTIFICATION`
--

DROP TABLE IF EXISTS `T_NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_NOTIFICATION` (
  `notification_id` varchar(100) NOT NULL,
  `job_type` varchar(50) DEFAULT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `notification_from` varchar(255) DEFAULT NULL,
  `notification_to` text,
  `notification_body` text,
  `workflow_id` varchar(100) DEFAULT NULL,
  `coordinator_id` varchar(100) DEFAULT NULL,
  `trigger_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `idx_notification_workflow_id` (`workflow_id`),
  KEY `idx_notification_coordinator_id` (`coordinator_id`),
  KEY `idx_notification_trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_NOTIFICATION`
--

LOCK TABLES `T_NOTIFICATION` WRITE;
/*!40000 ALTER TABLE `T_NOTIFICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_NOTIFICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_TAG`
--

DROP TABLE IF EXISTS `T_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TAG` (
  `tag_id` varchar(100) NOT NULL,
  `tag_type` varchar(50) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `workflow_id` varchar(100) DEFAULT NULL,
  `coordinator_id` varchar(100) DEFAULT NULL,
  `trigger_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_TAG`
--

LOCK TABLES `T_TAG` WRITE;
/*!40000 ALTER TABLE `T_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_TASK`
--

DROP TABLE IF EXISTS `T_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TASK` (
  `task_id` varchar(100) NOT NULL,
  `task_type` varchar(50) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_description` varchar(255) DEFAULT NULL,
  `task_content` text,
  `task_use_flag` varchar(10) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_TASK`
--

LOCK TABLES `T_TASK` WRITE;
/*!40000 ALTER TABLE `T_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_TG_ACTIONS`
--

DROP TABLE IF EXISTS `T_TG_ACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TG_ACTIONS` (
  `tg_actions_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trigger_action` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tg_actions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_TG_ACTIONS`
--

LOCK TABLES `T_TG_ACTIONS` WRITE;
/*!40000 ALTER TABLE `T_TG_ACTIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_TG_ACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_TRIGGER`
--

DROP TABLE IF EXISTS `T_TRIGGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TRIGGER` (
  `trigger_id` varchar(100) NOT NULL,
  `trigger_name` varchar(255) DEFAULT NULL,
  `trigger_description` varchar(255) DEFAULT NULL,
  `trigger_use_flag` varchar(5) DEFAULT NULL,
  `trigger_status` varchar(10) DEFAULT NULL,
  `trigger_start` timestamp NULL DEFAULT NULL,
  `trigger_end` timestamp NULL DEFAULT NULL,
  `trigger_coordinator` varchar(255) DEFAULT NULL,
  `trigger_condition` varchar(100) DEFAULT NULL,
  `trigger_auth` varchar(255) DEFAULT NULL,
  `trigger_sla_config` text,
  `trigger_configurations` text,
  `trigger_variables` text,
  `workflow_id` varchar(100) DEFAULT NULL,
  `tag_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`trigger_id`),
  KEY `idx_trigger_workflow_id` (`workflow_id`),
  KEY `idx_trigger_coordinator` (`trigger_coordinator`),
  KEY `idx_trigger_condition` (`trigger_condition`),
  KEY `idx_trigger_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_TRIGGER`
--

LOCK TABLES `T_TRIGGER` WRITE;
/*!40000 ALTER TABLE `T_TRIGGER` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_TRIGGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_TRIGGER_ACTIONS`
--

DROP TABLE IF EXISTS `T_TRIGGER_ACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_TRIGGER_ACTIONS` (
  `trigger_id` varchar(100) NOT NULL,
  `trigger_action` bigint(20) unsigned NOT NULL,
  `nominal_time` timestamp NULL DEFAULT NULL,
  `action_started` timestamp NULL DEFAULT NULL,
  `action_ended` timestamp NULL DEFAULT NULL,
  `oozie_id` varchar(100) DEFAULT NULL,
  `caused_by` varchar(100) DEFAULT NULL,
  `caused_id` varchar(255) DEFAULT NULL,
  `job_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trigger_id`,`trigger_action`),
  KEY `idx_trigger_id_action` (`trigger_id`,`trigger_action`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_TRIGGER_ACTIONS`
--

LOCK TABLES `T_TRIGGER_ACTIONS` WRITE;
/*!40000 ALTER TABLE `T_TRIGGER_ACTIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_TRIGGER_ACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_WORKFLOW`
--

DROP TABLE IF EXISTS `T_WORKFLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_WORKFLOW` (
  `workflow_id` varchar(100) NOT NULL,
  `workflow_name` varchar(255) DEFAULT NULL,
  `workflow_description` varchar(255) DEFAULT NULL,
  `workflow_graph` text,
  `workflow_status` varchar(10) DEFAULT NULL,
  `workflow_use_flag` varchar(5) DEFAULT NULL,
  `workflow_variables` text,
  `workflow_alert_yn` varchar(1) DEFAULT NULL,
  `workflow_alert_type` varchar(1000) DEFAULT NULL,
  `workflow_alert_to` text,
  `trigger_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `workflow_account` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`),
  KEY `idx_workflow_trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_WORKFLOW`
--

LOCK TABLES `T_WORKFLOW` WRITE;
/*!40000 ALTER TABLE `T_WORKFLOW` DISABLE KEYS */;
INSERT INTO `T_WORKFLOW` VALUES ('3ce9b86f-f671-4d32-b592-8e6de41a7064','java_workflow','','[{\"id\":\"START\",\"drawType\":\"START\",\"xPos\":30,\"yPos\":100,\"data\":{},\"before\":[],\"after\":[\"JAVA_sr6mc999fynih3nzk3vpjm\"]},{\"id\":\"END\",\"drawType\":\"END\",\"xPos\":900,\"yPos\":100,\"data\":{},\"before\":[\"JAVA_sr6mc999fynih3nzk3vpjm\"],\"after\":[]},{\"id\":\"JAVA_sr6mc999fynih3nzk3vpjm\",\"drawType\":\"JAVA\",\"xPos\":418,\"yPos\":71,\"data\":{\"id\":\"JAVA_sr6mc999fynih3nzk3vpjm\",\"name\":\"JAVA_001\",\"desc\":\"\",\"mainClass\":\"HelloWorld.Main\",\"javaOption\":\"\",\"selectFile\":[{\"checked\":\"N\",\"path\":\"/user/metatron/integrator/sample/HelloWorld.jar\",\"name\":\"\"}],\"arg\":[{\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":false,\"workflowId\":\"3ce9b86f-f671-4d32-b592-8e6de41a7064\"},\"before\":[\"START\"],\"after\":[\"END\"],\"isError\":false}]','C','Y','[]','N','{\"jobStart\":\"N\",\"jobSucceed\":\"N\",\"jobFailed\":\"N\",\"jobShouldStart\":{\"check\":\"N\",\"name\":\"\",\"timeValue\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobShouldEnd\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobMaxDuration\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false}}','[{\"name\":\"\",\"showFl\":false,\"typeValue\":\"EMAIL\",\"typeName\":\"Email\"}]','','admin','2018-10-04 21:44:10',NULL,'admin','2018-10-04 21:52:55',NULL),('4bd00aeb-e5a4-4a60-8706-89c0dc751c79','all_task','','[{\"id\":\"START\",\"drawType\":\"START\",\"xPos\":30,\"yPos\":100,\"data\":{},\"before\":[],\"after\":[\"SQOOP_dzri3a5urrmzmgep6gnde\"]},{\"id\":\"END\",\"drawType\":\"END\",\"xPos\":1988.5,\"yPos\":133.5,\"data\":{},\"before\":[\"DRUID_ljsnpeezemaa1r7rkwx1h\"],\"after\":[]},{\"id\":\"SQOOP_dzri3a5urrmzmgep6gnde\",\"drawType\":\"SQOOP\",\"xPos\":193.75,\"yPos\":-3.75,\"data\":{\"id\":\"SQOOP_dzri3a5urrmzmgep6gnde\",\"name\":\"SQOOP_001\",\"desc\":\"\",\"command\":\"select\",\"arg\":[{\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"START\"],\"after\":[\"MR_sn1wm4ho2vqe2j7230o9go\"],\"isError\":true},{\"id\":\"MR_sn1wm4ho2vqe2j7230o9go\",\"drawType\":\"MR\",\"xPos\":342.5,\"yPos\":160,\"data\":{\"id\":\"MR_sn1wm4ho2vqe2j7230o9go\",\"name\":\"MR_002\",\"desc\":\"\",\"configClass\":\"\",\"selectFile\":[{\"checked\":\"N\",\"path\":\"\",\"name\":\"\"}],\"config\":[{\"name\":\"\",\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"SQOOP_dzri3a5urrmzmgep6gnde\"],\"after\":[\"EXEC_wrh9yrb2m8l6obv6ewr6dj\"],\"isError\":true},{\"id\":\"EXEC_wrh9yrb2m8l6obv6ewr6dj\",\"drawType\":\"EXEC\",\"xPos\":505.25,\"yPos\":-20.25,\"data\":{\"id\":\"EXEC_wrh9yrb2m8l6obv6ewr6dj\",\"name\":\"EXEC_003\",\"desc\":\"\",\"selectFile\":[{\"checked\":\"N\",\"path\":\"\",\"name\":\"\"}],\"arg\":[{\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"MR_sn1wm4ho2vqe2j7230o9go\"],\"after\":[\"JAVA_a43aehh9hhgvkuuluppk8\"],\"isError\":true},{\"id\":\"JAVA_a43aehh9hhgvkuuluppk8\",\"drawType\":\"JAVA\",\"xPos\":660,\"yPos\":168.25,\"data\":{\"id\":\"JAVA_a43aehh9hhgvkuuluppk8\",\"name\":\"JAVA_004\",\"desc\":\"\",\"mainClass\":\"\",\"javaOption\":\"\",\"selectFile\":[{\"checked\":\"N\",\"path\":\"\",\"name\":\"\"}],\"arg\":[{\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"EXEC_wrh9yrb2m8l6obv6ewr6dj\"],\"after\":[\"HIVE_fpxuxnukmmk1halstg6onj\"],\"isError\":true},{\"id\":\"HIVE_fpxuxnukmmk1halstg6onj\",\"drawType\":\"HIVE\",\"xPos\":828.75,\"yPos\":-28.75,\"data\":{\"id\":\"HIVE_fpxuxnukmmk1halstg6onj\",\"name\":\"HIVE_005\",\"desc\":\"\",\"hiveServer\":\"\",\"hiveServerName\":\"\",\"hqlType\":\"QUERY\",\"hqlPath\":\"\",\"hqlSql\":\"\",\"uploadPath\":\"\",\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true},\"before\":[\"JAVA_a43aehh9hhgvkuuluppk8\"],\"after\":[\"SSH_lrcy96zk2xum8fr6hxn7q\"],\"isError\":true},{\"id\":\"SSH_lrcy96zk2xum8fr6hxn7q\",\"drawType\":\"SSH\",\"xPos\":972,\"yPos\":188.5,\"data\":{\"id\":\"SSH_lrcy96zk2xum8fr6hxn7q\",\"name\":\"SSH_006\",\"desc\":\"\",\"sshId\":\"\",\"sshHost\":\"\",\"command\":\"\",\"arg\":[{\"value\":\"\"}],\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false},\"before\":[\"HIVE_fpxuxnukmmk1halstg6onj\"],\"after\":[\"WORKFLOW_orqlseymq4nnxdp1sj3f4n\"],\"isError\":true},{\"id\":\"WORKFLOW_orqlseymq4nnxdp1sj3f4n\",\"drawType\":\"WORKFLOW\",\"xPos\":1120.25,\"yPos\":-1.25,\"data\":{\"id\":\"WORKFLOW_orqlseymq4nnxdp1sj3f4n\",\"name\":\"WORKFLOW_007\",\"desc\":\"\",\"workflow\":\"\",\"config\":[{\"name\":\"\",\"value\":\"\"}],\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false},\"before\":[\"SSH_lrcy96zk2xum8fr6hxn7q\"],\"after\":[\"DISTCP_abvd8gs1am5rimlvqgutli\"],\"isError\":true},{\"id\":\"DISTCP_abvd8gs1am5rimlvqgutli\",\"drawType\":\"DISTCP\",\"xPos\":1301.25,\"yPos\":147.5,\"data\":{\"id\":\"DISTCP_abvd8gs1am5rimlvqgutli\",\"name\":\"DISTCP_008\",\"desc\":\"\",\"option\":[{\"value\":\"\"}],\"sourcePath\":\"\",\"targetPath\":\"\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"WORKFLOW_orqlseymq4nnxdp1sj3f4n\"],\"after\":[\"FS_ws4m4wyahhpcfy4povxm25\"],\"isError\":true},{\"id\":\"FS_ws4m4wyahhpcfy4povxm25\",\"drawType\":\"FS\",\"xPos\":1517.5,\"yPos\":-31.25,\"data\":{\"id\":\"FS_ws4m4wyahhpcfy4povxm25\",\"name\":\"FS_009\",\"desc\":\"\",\"hdfsList\":[{\"type\":\"DELETE\",\"mainPath\":\"\",\"subLine\":\"\",\"showFl\":false,\"prepareOpen\":false,\"isError\":true}],\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false},\"before\":[\"DISTCP_abvd8gs1am5rimlvqgutli\"],\"after\":[\"DRUID_ljsnpeezemaa1r7rkwx1h\"],\"isError\":true},{\"id\":\"DRUID_ljsnpeezemaa1r7rkwx1h\",\"drawType\":\"DRUID\",\"xPos\":1707.5,\"yPos\":150,\"data\":{\"id\":\"DRUID_ljsnpeezemaa1r7rkwx1h\",\"name\":\"DRUID_010\",\"desc\":\"\",\"dataSource\":\"\",\"format\":\"\",\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"isError\":true,\"workflowId\":\"4bd00aeb-e5a4-4a60-8706-89c0dc751c79\"},\"before\":[\"FS_ws4m4wyahhpcfy4povxm25\"],\"after\":[\"END\"],\"isError\":true}]','D','Y','N','N','{\"jobStart\":\"N\",\"jobSucceed\":\"N\",\"jobFailed\":\"N\",\"jobShouldStart\":{\"check\":\"N\",\"name\":\"\",\"timeValue\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobShouldEnd\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobMaxDuration\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false}}','[{\"name\":\"\",\"showFl\":false,\"typeValue\":\"EMAIL\",\"typeName\":\"Email\"}]','','admin','2018-10-04 21:38:15',NULL,'admin','2018-10-04 21:39:59',NULL),('99caea71-3c45-4f87-8996-c87216a1dfc2','sqoop_task','','[{\"id\":\"START\",\"drawType\":\"START\",\"xPos\":30,\"yPos\":100,\"data\":{},\"before\":[],\"after\":[\"SQOOP_m1dykkq7y2iztfwyvkhnn\"]},{\"id\":\"END\",\"drawType\":\"END\",\"xPos\":900,\"yPos\":100,\"data\":{},\"before\":[\"SQOOP_m1dykkq7y2iztfwyvkhnn\"],\"after\":[]},{\"id\":\"SQOOP_m1dykkq7y2iztfwyvkhnn\",\"drawType\":\"SQOOP\",\"xPos\":338,\"yPos\":83,\"data\":{\"id\":\"SQOOP_m1dykkq7y2iztfwyvkhnn\",\"name\":\"SQOOP_001\",\"desc\":\"\",\"command\":\"import\",\"arg\":[{\"value\":\"--connect jdbc:oracle:thin:@111.222.33.444:1521/SID\"},{\"value\":\"--username TMAP_MART\"},{\"value\":\"--password \'1234\'\"},{\"value\":\"--table TEST\"},{\"value\":\"--input-null-string \'\\\\\\\\N\'  \\\\ --export-dir /TEST/part_dt=20180\"},{\"value\":\" --input-null-non-string \'\\\\\\\\N\'\"},{\"value\":\"--fields-terminated-by \'\\\\t\'\"},{\"value\":\"--export-dir /TEST/EXPORT/part_dt=20180\"},{\"value\":\"\"}],\"deletePath\":[{\"path\":\"\"}],\"mkdirPath\":[{\"path\":\"\"}],\"prepareOpen\":false,\"workflowId\":\"99caea71-3c45-4f87-8996-c87216a1dfc2\",\"isError\":false},\"before\":[\"START\"],\"after\":[\"END\"],\"isError\":false}]','C','Y','N','N','{\"jobStart\":\"N\",\"jobSucceed\":\"N\",\"jobFailed\":\"N\",\"jobShouldStart\":{\"check\":\"N\",\"name\":\"\",\"timeValue\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobShouldEnd\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false},\"jobMaxDuration\":{\"check\":\"N\",\"name\":\"\",\"time\":\"M\",\"timeName\":\"Minutes\",\"showFl\":false}}','[{\"name\":\"\",\"showFl\":false,\"typeValue\":\"EMAIL\",\"typeName\":\"Email\"}]','','admin','2018-10-04 21:40:24',NULL,'admin','2018-10-04 21:42:29',NULL);
/*!40000 ALTER TABLE `T_WORKFLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_WORKFLOWSHARE`
--

DROP TABLE IF EXISTS `T_WORKFLOWSHARE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_WORKFLOWSHARE` (
  `share_id` varchar(100) NOT NULL,
  `share_type` varchar(50) DEFAULT NULL,
  `share_user_id` varchar(50) DEFAULT NULL,
  `workflow_id` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `idx_workflowshare_workflow_id` (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_WORKFLOWSHARE`
--

LOCK TABLES `T_WORKFLOWSHARE` WRITE;
/*!40000 ALTER TABLE `T_WORKFLOWSHARE` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_WORKFLOWSHARE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 23:33:04
