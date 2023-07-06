-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mydata2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'大学物理','test'),(2,'高等数学',NULL),(5,'计算机组成原理',NULL),(6,'软件工程',NULL),(7,'电路与电子学',NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `score` int DEFAULT NULL COMMENT '总分',
  `duration` int DEFAULT NULL COMMENT '时长',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (4,'高数2021试卷',NULL,120,2),(5,'test',NULL,110,2),(6,'gasgrsg',NULL,120,6);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_question`
--

DROP TABLE IF EXISTS `paper_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int DEFAULT NULL COMMENT '试卷id',
  `question_id` int DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_question`
--

LOCK TABLES `paper_question` WRITE;
/*!40000 ALTER TABLE `paper_question` DISABLE KEYS */;
INSERT INTO `paper_question` VALUES (46,1,17),(47,1,18),(48,1,19),(49,1,20),(50,1,25),(51,1,26),(52,1,31),(53,1,32),(54,3,22),(55,3,20),(56,3,19),(57,3,13),(58,3,27),(59,3,25),(60,3,26),(61,3,24),(62,3,15),(63,3,32),(71,5,18),(72,5,19),(73,5,1),(74,5,10),(75,5,5),(76,5,8),(77,5,11),(78,5,14),(79,5,6),(96,6,33),(97,4,1),(98,4,10),(99,4,4),(100,4,18),(101,4,5),(102,4,8),(103,4,11),(104,4,14),(105,4,34);
/*!40000 ALTER TABLE `paper_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` int DEFAULT NULL COMMENT '类型：1选择，2判断，3问答',
  `a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'a选项',
  `b` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'b选项',
  `c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'c选项',
  `d` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'd选项',
  `score` int DEFAULT NULL COMMENT '分数',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '解析',
  `user_id` int DEFAULT NULL COMMENT '出题人id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出题时间',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(2,'test',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',3),(3,'test',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',4),(4,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(5,'test',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',2),(6,'test',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',2),(7,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',3),(8,'test',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',2),(9,'test',3,NULL,NULL,NULL,NULL,10,'answer','empty',1,'2023-03-01 10:00:00',3),(10,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(11,'test',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',2),(12,'test',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(13,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(14,'testzdbdgb',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',2),(15,'test',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(17,'testsjfhjh',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(18,'testethwr',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(19,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(20,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(21,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(22,'test',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(23,'test',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(24,'test8',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(25,'test7',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(26,'test6',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(27,'test5',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(28,'test4',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(30,'test3',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(31,'test2',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(32,'test1',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(33,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(34,'dfadf',3,NULL,NULL,NULL,NULL,10,'asfbafb','afbfdabdb',1,'2023-07-06 01:14:03',2),(35,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(36,'test4',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-03-01 10:00:00',1),(37,'test3',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(38,'test2',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-03-01 10:00:00',1),(39,'test1',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(40,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(41,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(42,'dfadf',3,NULL,NULL,NULL,NULL,10,'asfbafb','afbfdabdb',1,'2023-07-06 01:14:03',2),(43,'test3',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(44,'test2',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(45,'test1',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(46,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(47,'dfadf',3,NULL,NULL,NULL,NULL,10,'asfbafb','afbfdabdb',1,'2023-07-06 01:14:03',2),(48,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(49,'test4',2,NULL,NULL,NULL,NULL,5,'是','empty',1,'2023-07-05 22:59:29',1),(50,'test3',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(51,'test2',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-05 22:59:29',1),(52,'test1',3,NULL,NULL,NULL,NULL,10,'x','empty',1,'2023-07-06 01:14:03',1),(53,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(54,'fasfgsag',2,NULL,NULL,NULL,NULL,5,'是','gvasrfgr',1,'2023-07-05 22:59:29',6),(55,'dfadf',3,NULL,NULL,NULL,NULL,10,'asfbafb','afbfdabdb',1,'2023-07-06 01:14:03',2),(56,'testsjfhjh',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(57,'testethwr',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(58,'testbdb',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',2),(59,'testgcm',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(60,'testgag',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1),(61,'testwgfrwg',1,'很好','非常好','超级好','无敌好',5,'D','empty',1,'2023-03-01 10:00:00',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL COMMENT '考试id',
  `user_id` int NOT NULL COMMENT '学生id',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_user_index` (`exam_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (1,1,3,'审核通过'),(8,3,3,'审核通过'),(10,2,3,'审核通过');
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'user','el-icon-user','icon'),(2,'house','el-icon-house','icon'),(3,'menu','el-icon-menu','icon'),(4,'s-custom','el-icon-s-custom','icon'),(5,'s-grid','el-icon-s-grid','icon'),(6,'document','el-icon-document','icon'),(7,'coffee','el-icon-coffee\r\n','icon'),(8,'s-marketing','el-icon-s-marketing','icon'),(9,'phone-outline','el-icon-phone-outline','icon'),(10,'platform-eleme','el-icon-platform-eleme','icon'),(11,'eleme','el-icon-eleme','icon'),(12,'delete-solid','el-icon-delete-solid','icon'),(13,'delete','el-icon-delete','icon'),(14,'s-tools','el-icon-s-tools','icon'),(15,'setting','el-icon-setting','icon'),(16,'user-solid','el-icon-user-solid','icon'),(17,'phone','el-icon-phone','icon'),(18,'more','el-icon-more','icon'),(19,'more-outline','el-icon-more-outline','icon'),(20,'star-on','el-icon-star-on','icon'),(21,'star-off','el-icon-star-off','icon'),(22,'s-goods','el-icon-s-goods','icon'),(23,'goods','el-icon-goods','icon'),(24,'warning','el-icon-warning','icon'),(25,'warning-outline','el-icon-warning-outline','icon'),(26,'question','el-icon-question','icon'),(27,'info','el-icon-info','icon'),(28,'remove','el-icon-remove','icon'),(29,'circle-plus','el-icon-circle-plus','icon'),(30,'success','el-icon-success','icon'),(31,'error','el-icon-error','icon'),(32,'zoom-in','el-icon-zoom-in','icon'),(33,'zoom-out','el-icon-zoom-out','icon'),(34,'remove-outline','el-icon-remove-outline','icon'),(35,'circle-plus-outline','el-icon-circle-plus-outline','icon'),(36,'circle-check','el-icon-circle-check','icon'),(37,'circle-close','el-icon-circle-close','icon'),(38,'s-help','el-icon-s-help','icon'),(39,'help','el-icon-help','icon'),(40,'minus','el-icon-minus','icon'),(41,'plus','el-icon-plus','icon'),(42,'check','el-icon-check','icon'),(43,'close','el-icon-close','icon'),(44,'picture','el-icon-picture','icon'),(45,'picture-outline','el-icon-picture-outline','icon'),(46,'picture-outline-round','el-icon-picture-outline-round','icon'),(47,'upload','el-icon-upload','icon'),(48,'upload2','el-icon-upload2','icon'),(49,'download','el-icon-download','icon'),(50,'camera-solid','el-icon-camera-solid','icon'),(51,'camera','el-icon-camera','icon'),(52,'video-camera-solid','el-icon-video-camera-solid','icon'),(53,'video-camera','el-icon-video-camera','icon'),(54,'message-solid','el-icon-message-solid','icon'),(55,'bell','el-icon-bell','icon'),(56,'s-cooperation','el-icon-s-cooperation','icon'),(57,'s-order','el-icon-s-order','icon'),(58,'s-platform','el-icon-s-platform','icon'),(59,'s-fold','el-icon-s-fold','icon'),(60,'s-unfold','el-icon-s-unfold','icon'),(61,'s-operation','el-icon-s-operation','icon'),(62,'s-promotion','el-icon-s-promotion','icon'),(63,'s-home','el-icon-s-home','icon'),(64,'s-release','el-icon-s-release','icon'),(65,'s-ticket','el-icon-s-ticket','icon'),(66,'s-management','el-icon-s-management','icon'),(67,'s-open','el-icon-s-open','icon'),(68,'s-shop','el-icon-s-shop','icon'),(69,'s-flag','el-icon-s-flag','icon'),(70,'s-comment','el-icon-s-comment','icon'),(71,'s-finance','el-icon-s-finance','icon'),(72,'s-claim','el-icon-s-claim','icon'),(73,'s-opportunity','el-icon-s-opportunity','icon'),(74,'s-data','el-icon-s-data','icon'),(75,'s-check','el-icon-s-check','icon'),(76,'share','el-icon-share','icon'),(77,'d-caret','el-icon-d-caret','icon'),(78,'caret-left','el-icon-caret-left','icon'),(79,'caret-right','el-icon-caret-right','icon'),(80,'caret-bottom','el-icon-caret-bottom','icon'),(81,'caret-top','el-icon-caret-top','icon'),(82,'bottom-left','el-icon-bottom-left','icon'),(83,'bottom-right','el-icon-bottom-right','icon'),(84,'back','el-icon-back','icon'),(85,'right','el-icon-right','icon'),(86,'bottom','el-icon-bottom','icon'),(87,'top','el-icon-top','icon'),(88,'top-left','el-icon-top-left','icon'),(89,'top-right','el-icon-top-right','icon'),(90,'arrow-left','el-icon-arrow-left','icon'),(91,'arrow-right','el-icon-arrow-right','icon'),(92,'arrow-down','el-icon-arrow-down','icon'),(93,'arrow-up','el-icon-arrow-up','icon'),(94,'d-arrow-left','el-icon-d-arrow-left','icon'),(95,'d-arrow-right','el-icon-d-arrow-right','icon'),(96,'video-pause','el-icon-video-pause','icon'),(97,'video-play','el-icon-video-play','icon'),(98,'refresh','el-icon-refresh','icon'),(99,'refresh-right','el-icon-refresh-right','icon'),(100,'refresh-left','el-icon-refresh-left','icon'),(101,'finished','el-icon-finished','icon'),(102,'sort','el-icon-sort','icon'),(103,'sort-up','el-icon-sort-up','icon'),(104,'sort-down','el-icon-sort-down','icon'),(105,'rank','el-icon-rank','icon'),(106,'loading','el-icon-loading','icon'),(107,'view','el-icon-view','icon'),(108,'c-scale-to-original','el-icon-c-scale-to-original','icon'),(109,'date','el-icon-date','icon'),(110,'edit','el-icon-edit','icon'),(111,'edit-outline','el-icon-edit-outline','icon'),(112,'folder','el-icon-folder','icon'),(113,'folder-opened','el-icon-folder-opened','icon'),(114,'folder-add','el-icon-folder-add','icon'),(115,'folder-remove','el-icon-folder-remove','icon'),(116,'folder-delete','el-icon-folder-delete','icon'),(117,'folder-checked','el-icon-folder-checked','icon'),(118,'tickets','el-icon-tickets','icon'),(119,'document-remove','el-icon-document-remove','icon'),(120,'document-delete','el-icon-document-delete','icon'),(121,'document-copy','el-icon-document-copy','icon'),(122,'document-checked','el-icon-document-checked','icon'),(123,'document-add','el-icon-document-add','icon'),(124,'printer','el-icon-printer','icon'),(125,'paperclip','el-icon-paperclip','icon'),(126,'takeaway-box','el-icon-takeaway-box','icon'),(127,'search','el-icon-search','icon'),(128,'monitor','el-icon-monitor','icon'),(129,'attract','el-icon-attract','icon'),(130,'mobile','el-icon-mobile','icon'),(131,'scissors','el-icon-scissors','icon'),(132,'umbrella','el-icon-umbrella','icon'),(133,'headset','el-icon-headset','icon'),(134,'brush','el-icon-brush','icon'),(135,'mouse','el-icon-mouse','icon'),(136,'coordinate','el-icon-coordinate','icon'),(137,'magic-stick','el-icon-magic-stick','icon'),(138,'reading','el-icon-reading','icon'),(139,'data-line','el-icon-data-line','icon'),(140,'data-board','el-icon-data-board','icon'),(141,'pie-chart','el-icon-pie-chart','icon'),(142,'data-analysis','el-icon-data-analysis','icon'),(143,'collection-tag','el-icon-collection-tag','icon'),(144,'film','el-icon-film','icon'),(145,'suitcase','el-icon-suitcase','icon'),(146,'suitcase-1','el-icon-suitcase-1','icon'),(147,'receiving','el-icon-receiving','icon'),(148,'collection','el-icon-collection','icon'),(149,'files','el-icon-files','icon'),(150,'notebook-1','el-icon-notebook-1','icon'),(151,'notebook-2','el-icon-notebook-2','icon'),(152,'toilet-paper','el-icon-toilet-paper','icon'),(153,'office-building','el-icon-office-building','icon'),(154,'school','el-icon-school','icon'),(155,'table-lamp','el-icon-table-lamp','icon'),(156,'no-smoking','el-icon-no-smoking','icon'),(157,'smoking','el-icon-smoking','icon'),(158,'shopping-cart-full','el-icon-shopping-cart-full','icon'),(159,'shopping-cart-1','el-icon-shopping-cart-1','icon'),(160,'shopping-cart-2','el-icon-shopping-cart-2','icon'),(161,'shopping-bag-1','el-icon-shopping-bag-1','icon'),(162,'shopping-bag-2','el-icon-shopping-bag-2','icon'),(163,'sold-out','el-icon-sold-out','icon'),(164,'sell','el-icon-sell','icon'),(165,'present','el-icon-present','icon'),(166,'box','el-icon-box','icon'),(167,'bank-card','el-icon-bank-card','icon'),(168,'money','el-icon-money','icon'),(169,'coin','el-icon-coin','icon'),(170,'wallet','el-icon-wallet','icon'),(171,'discount','el-icon-discount','icon'),(172,'price-tag','el-icon-price-tag','icon'),(173,'news','el-icon-news','icon'),(174,'guide','el-icon-guide','icon'),(175,'male','el-icon-male','icon'),(176,'female','el-icon-female','icon'),(177,'thumb','el-icon-thumb','icon'),(178,'cpu','el-icon-cpu','icon'),(179,'link','el-icon-link','icon'),(180,'connection','el-icon-connection','icon'),(181,'open','el-icon-open','icon'),(182,'turn-off','el-icon-turn-off','icon'),(183,'set-up','el-icon-set-up','icon'),(184,'chat-round','el-icon-chat-round','icon'),(185,'chat-line-round','el-icon-chat-line-round','icon'),(186,'chat-square','el-icon-chat-square','icon'),(187,'chat-dot-round','el-icon-chat-dot-round','icon'),(188,'chat-dot-square','el-icon-chat-dot-square','icon'),(189,'chat-line-square','el-icon-chat-line-square','icon'),(190,'message','el-icon-message','icon'),(191,'postcard','el-icon-postcard','icon'),(192,'position','el-icon-position','icon'),(193,'turn-off-microphone','el-icon-turn-off-microphone','icon'),(194,'microphone','el-icon-microphone','icon'),(195,'close-notification','el-icon-close-notification','icon'),(196,'bangzhu','el-icon-bangzhu','icon'),(197,'time','el-icon-time','icon'),(198,'odometer','el-icon-odometer','icon'),(199,'crop','el-icon-crop','icon'),(200,'aim','el-icon-aim','icon'),(201,'switch-button','el-icon-switch-button','icon'),(202,'full-screen','el-icon-full-screen','icon'),(203,'copy-document','el-icon-copy-document','icon'),(204,'mic','el-icon-mic','icon'),(205,'stopwatch','el-icon-stopwatch','icon'),(206,'medal-1','el-icon-medal-1','icon'),(207,'medal','el-icon-medal','icon'),(208,'trophy','el-icon-trophy','icon'),(209,'trophy-1','el-icon-trophy-1','icon'),(210,'first-aid-kit','el-icon-first-aid-kit','icon'),(211,'discover','el-icon-discover','icon'),(212,'place','el-icon-place','icon'),(213,'location','el-icon-location','icon'),(214,'location-outline','el-icon-location-outline','icon'),(215,'location-information','el-icon-location-information','icon'),(216,'add-location','el-icon-add-location','icon'),(217,'delete-location','el-icon-delete-location','icon'),(218,'map-location','el-icon-map-location','icon'),(219,'alarm-clock','el-icon-alarm-clock','icon'),(220,'timer','el-icon-timer','icon'),(221,'watch-1','el-icon-watch-1','icon'),(222,'watch','el-icon-watch','icon'),(223,'lock','el-icon-lock','icon'),(224,'unlock','el-icon-unlock','icon'),(225,'key','el-icon-key','icon'),(226,'service','el-icon-service','icon'),(227,'mobile-phone','el-icon-mobile-phone','icon'),(228,'bicycle','el-icon-bicycle','icon'),(229,'truck','el-icon-truck','icon'),(230,'ship','el-icon-ship','icon'),(231,'basketball','el-icon-basketball','icon'),(232,'football','el-icon-football','icon'),(233,'soccer','el-icon-soccer','icon'),(234,'baseball','el-icon-baseball','icon'),(235,'wind-power','el-icon-wind-power','icon'),(236,'light-rain','el-icon-light-rain','icon'),(237,'lightning','el-icon-lightning','icon'),(238,'heavy-rain','el-icon-heavy-rain','icon'),(239,'sunrise','el-icon-sunrise','icon'),(240,'sunrise-1','el-icon-sunrise-1','icon'),(241,'sunset','el-icon-sunset','icon'),(242,'sunny','el-icon-sunny','icon'),(243,'cloudy','el-icon-cloudy','icon'),(244,'partly-cloudy','el-icon-partly-cloudy','icon'),(245,'cloudy-and-sunny','el-icon-cloudy-and-sunny','icon'),(246,'moon','el-icon-moon','icon'),(247,'moon-night','el-icon-moon-night','icon'),(248,'dish','el-icon-dish','icon'),(249,'dish-1','el-icon-dish-1','icon'),(250,'food','el-icon-food','icon'),(251,'chicken','el-icon-chicken','icon'),(252,'fork-spoon','el-icon-fork-spoon','icon'),(253,'knife-fork','el-icon-knife-fork','icon'),(254,'burger','el-icon-burger','icon'),(255,'tableware','el-icon-tableware','icon'),(256,'sugar','el-icon-sugar','icon'),(257,'dessert','el-icon-dessert','icon'),(258,'ice-cream','el-icon-ice-cream','icon'),(259,'hot-water','el-icon-hot-water','icon'),(260,'water-cup','el-icon-water-cup','icon'),(261,'coffee-cup','el-icon-coffee-cup','icon'),(262,'cold-drink','el-icon-cold-drink','icon'),(263,'goblet','el-icon-goblet','icon'),(264,'goblet-full','el-icon-goblet-full','icon'),(265,'goblet-square','el-icon-goblet-square','icon'),(266,'goblet-square-full','el-icon-goblet-square-full','icon'),(267,'refrigerator','el-icon-refrigerator','icon'),(268,'grape','el-icon-grape','icon'),(269,'watermelon','el-icon-watermelon','icon'),(270,'cherry','el-icon-cherry','icon'),(271,'apple','el-icon-apple','icon'),(272,'pear','el-icon-pear','icon'),(273,'orange','el-icon-orange','icon'),(274,'ice-tea','el-icon-ice-tea','icon'),(275,'ice-drink','el-icon-ice-drink','icon'),(276,'milk-tea','el-icon-milk-tea','icon'),(277,'potato-strips','el-icon-potato-strips','icon'),(278,'lollipop','el-icon-lollipop','icon'),(279,'ice-cream-square','el-icon-ice-cream-square','icon'),(280,'ice-cream-round','el-icon-ice-cream-round','icon');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,'beer.jpg','jpg',12,'http://localhost:9090/file/42a7c98f96994ac896a525ffffb9f432.jpg','35977e7dc2159a734f3c81de460e4b8d',0,1);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (5,'用户管理','/user','el-icon-user',NULL,4,'User',301),(6,'角色管理','/role','el-icon-s-custom',NULL,4,'Role',302),(7,'菜单管理','/menu','el-icon-menu',NULL,4,'Menu',303),(8,'文件管理','/file','el-icon-document',NULL,4,'File',304),(10,'主页','/home','el-icon-house',NULL,NULL,'Home',0),(11,'题目管理','/question','el-icon-star-off',NULL,NULL,'Question',999),(12,'课程管理','/course','el-icon-menu',NULL,NULL,'Course',998),(14,'试卷管理','/paper','el-icon-document',NULL,NULL,'Paper',999);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','管理员','ROLE_ADMIN'),(2,'学生','普通用户','ROLE_USER'),(3,'老师','老师','ROLE_TEACHER');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,4),(1,5),(1,6),(1,7),(1,8),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,18),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,18);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','admin','管理员','admin@qq.com','','','2023-07-05 17:53:24','http://localhost:9090/file/a2d2da19bde9429c96d2e627b0f03a64.jpg','ROLE_ADMIN'),(2,'zhang','123','张张','zhang@qq.com','13677889900','南京','2023-07-05 17:55:33',NULL,'ROLE_USER'),(3,'wang','123','我是王五','wang@qq.com','13877668855','上海','2023-07-05 17:52:51','http://localhost:9090/file/42a7c98f96994ac896a525ffffb9f432.jpg','ROLE_USER'),(4,'huang','123','huang','huang@16..com','13699669988',NULL,'2023-07-05 17:51:34',NULL,'ROLE_TEACHER'),(5,'wuwu','123','wuwu','wu@163.com','13655889977',NULL,'2023-07-05 17:51:54',NULL,'ROLE_TEACHER'),(6,'syj','123','syj',NULL,NULL,NULL,'2023-07-05 17:50:54',NULL,'ROLE_USER'),(7,'test','123','test',NULL,NULL,NULL,'2023-07-05 19:18:13',NULL,'ROLE_USER');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydata2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06  3:53:27
