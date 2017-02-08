﻿# Host: 127.0.0.1  (Version: 5.6.24)
# Date: 2017-02-08 15:07:57
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "content"
#

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(2) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `year` int(4) NOT NULL,
  `season` int(1) DEFAULT NULL,
  `month` int(2) NOT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1 行业动态 2品牌动态 3完美门店 4 精英战报 5 区域销售排行榜 6 门店销售排行榜 7经销商销售排行榜',
  `title` varchar(32) DEFAULT NULL,
  `sub_title` varchar(64) DEFAULT NULL,
  `image_name` varchar(64) DEFAULT NULL,
  `small_image_name` varchar(64) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "content"
#

INSERT INTO `content` VALUES (1,1,'2017/01/16',2017,1,1,1,'我的','味道','1','1',0),(2,1,'2017/01/16',2017,1,1,2,'type2','t2副标题','1','1',0),(3,1,'2017/01/16',2017,1,1,3,'type3','T3','1','1',0),(4,1,'2017/01/16',2017,1,1,4,'T4','T4ST','1','1',0),(5,2,'2017/01/16',2017,1,1,4,'t42','1','1','1',0),(6,1,'2017/01/17',2017,1,1,5,'1','1','1','1',0),(7,2,'2017/01/12',20178,1,1,5,'1','1','1','1',0);

#
# Structure for table "exam"
#

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(3) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `item_id` int(2) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `A` varchar(128) DEFAULT NULL,
  `B` varchar(128) DEFAULT NULL,
  `C` varchar(128) DEFAULT NULL,
  `D` varchar(128) DEFAULT NULL,
  `answer` varchar(1) DEFAULT NULL,
  `answer_context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "exam"
#

INSERT INTO `exam` VALUES (1,1,'营养素专题',1,'1.三大产能营养素中1克能提供9Kcal热量的是？','A.蛋白质','B.碳水化合物','C.脂肪','D.无','C','C.脂肪'),(2,1,NULL,2,'2.维生素D属于以下类型营养素？','A.脂溶性维生素','B.水溶性维生素','C.水溶性维生素','D.水溶性维生素','B','B.水溶性维生素'),(3,1,NULL,3,'3.以下关于婴幼儿肠道发育特点的描述错误的是？','A.食管短而窄，括约肌功能不完善','B．胃容量小，消化酶发育不成熟','C．肠壁薄，通透性高，健康肠道菌群尚在构建中','D．肠动力足，消化吸收好','A','A.食管短而窄，括约肌功能不完善'),(4,1,NULL,4,'4. 下列缓解宝宝便秘方法，描述正确的是?','A. 如果是喂养配方奶粉，在两顿奶之间适当喂宝宝些水','B. 膳食纤维摄入不足可能会引起宝宝便秘，添加益生元能帮助宝宝缓解便秘','C. 可以在宝宝两餐奶间或者洗澡前给宝宝做腹部按摩，促进肠蠕动','D. 以上全对','D','D. 以上全对'),(5,1,NULL,5,'5. 关于益生元的描述以下错误的是？','A．母乳中含有130多种低聚糖，包括低聚半乳糖GOS，所以母乳的宝宝吸收消化更好','B．益生菌是益生元的食物，饮食中摄入益生菌的生长，肠道内益生元显著增多','C. 低聚果糖是益生元的一种，来源于天然植物','D．益生元是可溶性膳食纤维，进入肠道不被人体吸收，但是能被肠道内有益菌利用，促进有益菌生长','C','C.低内聚');

#
# Structure for table "question_answer"
#

DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `context` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "question_answer"
#

INSERT INTO `question_answer` VALUES (1,1,'第一篇','weixin','2016-04-20 16:59:18','试试回车好使不好事\n<br>试试回车好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使不好事\nfsdf'),(2,1,'第一篇总结','ppt','2016-04-20 00:00:00','试试回车好使不好事\n<br>试试回车好使不好事\n\n\n111111');

#
# Structure for table "user_basic"
#

DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `user_nname` varchar(255) DEFAULT NULL,
  `user_type` varchar(1) DEFAULT '1' COMMENT '0:管理员; 1：店员； 2：店主； 3：销售； 4 ：经销商；',
  `password` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT '0' COMMENT '个人总积分',
  `autumn` int(11) DEFAULT '0' COMMENT '16第三季度积分',
  `winter` int(11) DEFAULT '0' COMMENT '16第四季度积分',
  `spring` int(11) DEFAULT '0' COMMENT '17年第一季度积分',
  `regist_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0为正常；1为黑名单',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "user_basic"
#

INSERT INTO `user_basic` VALUES (3,'13811111111','gladstone','1','e10adc3949ba59abbe56e057f20f883e',1063,540,120,70,'2017-02-08 15:04:12','黑龙江','哈尔滨','道里区',0),(22,'13811111112','gladstone2','1','e10adc3949ba59abbe56e057f20f883e',21,100,30,0,'2017-01-18 11:15:21',NULL,NULL,NULL,0),(23,'13811111113','gladstone3','1','b02f774f224e881e70f928d98bd11f0a',100,20,60,0,'2016-12-13 16:28:07',NULL,NULL,NULL,1),(29,'13811111119','gladstone9','1','b02f774f224e881e70f928d98bd11f0a',50,30,50,0,'2016-12-13 16:28:08','黑龙江','哈尔滨','道里区',0);

#
# Structure for table "user_record"
#

DROP TABLE IF EXISTS `user_record`;
CREATE TABLE `user_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `score` int(3) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

#
# Data for table "user_record"
#

INSERT INTO `user_record` VALUES (1,'13811111111','video',1,NULL,'2016-04-18',NULL),(2,'13811111111','video',2,NULL,'2016-04-18',NULL),(3,'13811111111','video',3,NULL,'2016-04-18',NULL),(4,'13811111111','video',1,NULL,'2016-04-19',NULL),(5,'13811111111','video',3,NULL,'2016-04-19',NULL),(13,'13811111111','video',1,NULL,'2016-04-20',NULL),(14,'13811111111','video',2,NULL,'2016-04-20',NULL),(15,'13811111111','video',3,NULL,'2016-04-20',NULL),(16,'13811111111','weixin',1,NULL,'2016-04-20',NULL),(17,'13811111111','weixin',2,NULL,'2016-04-20',NULL),(18,'13811111111','ppt',1,NULL,'2016-04-20',NULL),(19,'13811111111','video',1,NULL,'2016-04-21',NULL),(20,'13811111111','video',2,NULL,'2016-04-21',NULL),(21,'13811111111','ppt',1,NULL,'2016-04-21',NULL),(22,'13811111111','weixin',2,NULL,'2016-04-21',NULL),(23,'13811111111','weixin',1,NULL,'2016-04-21',NULL),(24,'13811111111','video',7,NULL,'2016-04-21',NULL),(25,'13811111111','video',1,NULL,'2016-04-22',NULL),(26,'13811111111','video',2,NULL,'2016-04-22',NULL),(27,'13811111111','video',5,NULL,'2016-04-22',NULL),(28,'13811111111','weixin',2,NULL,'2016-04-24',NULL),(29,'13811111111','weixin',1,NULL,'2016-04-24',NULL),(30,'13811111111','video',2,0,'2016-04-25',NULL),(32,'13811111111','exam',1,20,'2016-04-28',NULL),(33,'13811111111','video',1,0,'2016-05-10',NULL),(34,'13811111111','video',2,0,'2016-05-10',NULL),(35,'13811111111','video',1,0,'2016-06-16',NULL),(36,'13811111118','video',1,0,'2016-06-16',NULL),(37,'13811111111','video',6,0,'2016-06-16',NULL),(38,'13811111111','video',1,0,'2016-06-17',NULL),(39,'13811111111','video',2,0,'2016-06-17',6),(40,'13811111111','ppt',1,0,'2016-06-17',6),(41,'13811111111','weixin',1,0,'2016-06-17',6),(42,'13811111111','exam',1,0,'2016-06-17',6),(43,'13811111112','video',1,0,'2016-06-17',6),(44,'13811111119','video',1,0,'2016-06-17',6),(45,'13811111119','exam',1,20,'2016-06-17',6),(46,'13811111119','ppt',1,0,'2016-06-17',6),(47,'13811111119','weixin',1,0,'2016-06-17',6),(48,'13811111119','weixin',2,0,'2016-06-17',6),(49,'13811111111','ppt',1,0,'2016-07-18',7),(50,'13811111111','video',1,0,'2016-07-18',7),(51,'13811111111','weixin',2,0,'2016-07-18',7),(52,'13811111111','weixin',1,0,'2016-07-18',7),(53,'13811111111','ppt',1,0,'2016-07-19',7),(54,'13811111111','ppt',1,0,'2016-07-20',7),(55,'13811111111','ppt',1,0,'2016-07-21',7),(56,'13811111111','weixin',2,0,'2016-07-21',7),(57,'13811111111','ppt',1,0,'2016-07-22',7),(58,'13811111111','ppt',1,0,'2016-07-25',7),(59,'13811111111','weixin',2,0,'2016-07-25',7),(60,'13811111111','weixin',1,0,'2016-07-25',7),(61,'13811111111','video',2,0,'2016-07-25',7),(62,'13811111111','video',1,0,'2016-07-25',7),(63,'13811111111','exam',1,0,'2016-07-25',7),(64,'13811111111','ppt',1,0,'2016-07-26',7),(65,'13811111111','ppt',1,0,'2016-08-15',8),(66,'13811111111','weixin',2,0,'2016-08-15',8),(67,'13811111111','video',2,0,'2016-11-23',11),(68,'13811111111','ppt',1,0,'2016-11-23',11),(69,'13811111111','weixin',1,0,'2016-11-23',11),(70,'13811111111','weixin',2,0,'2016-11-23',11),(71,'13811111111','weixin',1,0,'2016-12-29',12),(72,'13811111111','exam',1,0,'2016-12-29',12),(73,'13811111111','video',1,0,'2016-12-29',12),(74,'13811111111','ppt',1,0,'2016-12-29',12),(75,'13811111111','weixin',2,0,'2016-12-29',12),(76,'13811111111','video',2,0,'2016-12-29',12),(77,'13811111111','weixin',1,0,'2017-01-03',1),(78,'13811111111','weixin',1,0,'2017-01-16',1),(79,'13811111111','exam',1,40,'2017-02-07',2),(80,'13811111111','video',1,0,'2017-02-07',2),(81,'13811111111','video',2,0,'2017-02-07',2),(82,'13811111111','video',1,0,'2017-02-08',2),(83,'13811111111','video',2,0,'2017-02-08',2);

#
# Structure for table "user_score_rank"
#

DROP TABLE IF EXISTS `user_score_rank`;
CREATE TABLE `user_score_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `year` int(4) NOT NULL,
  `season` int(1) DEFAULT '0',
  `month` int(2) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '每月积分',
  `total_score` int(11) DEFAULT '0' COMMENT '总积分',
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user_score_rank"
#


#
# Structure for table "user_score_record"
#

DROP TABLE IF EXISTS `user_score_record`;
CREATE TABLE `user_score_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `get_time` varchar(8) NOT NULL DEFAULT '',
  `year` int(4) NOT NULL,
  `season` int(1) NOT NULL,
  `month` int(2) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user_score_record"
#

INSERT INTO `user_score_record` VALUES (1,'13811111111','20170207',2017,1,2,10,'video'),(2,'13811111111','20170208',2017,1,2,10,'video');

#
# Structure for table "video_info"
#

DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(2) unsigned DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `video_id` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT 'youku',
  `summary` varchar(1024) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '2' COMMENT '0：为没上过 ；1为已上过 ；2：未来月份',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Data for table "video_info"
#

INSERT INTO `video_info` VALUES (1,1,'如何炼就宝妈心目中的母婴营养达人?','XMTU2NDA5NTIxMg==','youku','宝宝两天排一次便便，这样的排便频率是不是便秘了？\r\n宝宝每天都大便，但是便便都又干又硬，这是不是便秘呢？\r\n以前宝宝每天都拉便便的，现在几天没拉，这是便秘吗？ \r\n生活中妈妈们最关心的宝宝便秘问题，母婴营养达人们，你们会帮助妈妈们正确解答吗？\r\n如何判断宝宝是否真的便秘，怎样并获得有效的解决方案？\r\n   母婴营养达人们，让我们一起走进微课堂，了解形形色色的便秘。\r\n','2016-06-20 17:25:03',0),(2,2,'为什么说生命最初一千天决定宝宝的一生?','XMTU2NDA5Nzg5Ng==','youku','什么是益生元？\r\n   益生元、益生菌，一字之差有何不同？\r\n   益生元是如何在舒适肠道中发挥作用的？\r\n   益生元功能这么强大，饮食中怎样才能获得益生元？\r\n   很多配方粉中都添加了益生元，是不是都能发挥类似的作用呢？\r\n   9:1 GOS/FOS的配比为什么被称为黄金比例?\r\n','2016-06-27 17:35:31',0),(4,3,'为什么说母乳是妈妈送给宝宝最好的礼物?','','youku',NULL,'2016-07-16 17:01:18',2),(5,4,'为什么肠道舒适对于宝宝最为重要?','','youku',NULL,'2016-07-16 17:01:23',2),(6,6,'来自瑞士百年营养专家-力多精金装3','','youku','','2016-07-16 17:01:26',2),(7,7,'怎样判断能量是否超标?','','youku','','2016-08-16 17:01:27',2),(8,8,'奶粉罐上的牛磺酸有什么作用?','','youku',NULL,'2016-08-16 17:01:28',2),(9,9,'脂肪酸为什么能让宝宝聪明？','','youku',NULL,'2016-08-16 17:01:29',2),(10,10,'为什么有的人喝牛奶会拉肚子？',NULL,'youku',NULL,'2016-08-16 17:10:13',2),(11,11,'你真的认识膳食纤维吗？',NULL,'youku',NULL,'2016-09-16 17:10:40',2),(12,12,'益生元、益生菌傻傻分不清？',NULL,'youku',NULL,'2016-09-16 17:10:41',2),(13,13,'肠道舒适卫士~力多精金装3',NULL,'youku',NULL,'2016-09-16 17:10:42',2),(14,14,'吃奶粉的宝宝还要补钙吗？',NULL,'youku',NULL,'2016-09-16 17:10:43',2),(15,15,'宝宝指甲上的小白斑是怎么回事？',NULL,'youku',NULL,'2016-10-16 17:10:44',2),(16,16,'奶粉中含“胆碱”的作用是什么？',NULL,'youku',NULL,'2016-10-16 17:10:45',2),(17,17,'如何给宝宝喝水？',NULL,'youku',NULL,'2016-10-16 17:10:46',2),(18,18,'如何快速问出宝妈的需求？',NULL,'youku',NULL,'2016-10-16 17:10:46',2),(19,19,'宝宝为什么那么容易发生返流，呕吐和脹气？',NULL,'youku',NULL,'2016-11-16 17:10:48',2),(20,20,'便便自测，如何掌控宝宝的小肚肚（0-4月龄和1-2岁）',NULL,'youku',NULL,'2016-11-16 17:10:49',2),(21,21,'宝宝真的便秘了吗？',NULL,'youku',NULL,'2016-11-16 17:10:50',2),(22,22,'吃奶粉腹泻怎么办?',NULL,'youku',NULL,'2016-11-16 17:10:51',2),(24,23,'吐奶、溢奶怎么办？',NULL,'youku',NULL,'2016-12-16 17:10:53',2),(25,24,'宝宝为什么常常不明原因哭闹？',NULL,'youku',NULL,'2016-12-16 17:10:54',2),(26,25,'宝宝“上火”了，如何帮助宝妈“灭火”？',NULL,'youku',NULL,'2016-12-16 17:10:56',2),(27,26,'如何应对客户疑虑？',NULL,'youku',NULL,'2016-12-16 17:10:58',2),(28,5,'让理货员/妈妈都能充分理解肠道舒适对于宝宝的重要性',NULL,'youku',NULL,'2016-07-16 17:15:14',2);