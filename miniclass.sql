# Host: 127.0.0.1  (Version 5.6.24)
# Date: 2017-02-20 14:57:39
# Generator: MySQL-Front 6.0  (Build 1.32)

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
  `title` varchar(64) DEFAULT NULL COMMENT '主标题',
  `sub_title` varchar(64) DEFAULT NULL COMMENT '子标题',
  `image_name` varchar(64) DEFAULT NULL COMMENT '与item相同',
  `small_image_name` varchar(64) DEFAULT NULL COMMENT '与item相同',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "content"
#

INSERT INTO `content` VALUES (1,1,'',2017,1,1,1,'精彩内容 敬请期待','味道','1','1',0),(2,1,'',2017,1,1,2,'精彩内容 敬请期待','t2副标题','1','1',0),(3,1,'2017/01/16',2017,1,1,3,'type3','T3','1','1',0),(6,1,'2017/01/17',2017,1,1,6,'第一季度门店销售榜','1','1','1',0),(7,2,'2017/01/12',20178,1,1,5,'第一季度区域销售排行榜','1','1','1',0),(9,1,'2017/02/18',2017,1,2,7,'第一季度经销商销售排行榜','1','1','1',0),(10,1,NULL,2017,1,2,4,'精彩内容 敬请期待','1','1','1',0);

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
  `star` int(1) DEFAULT NULL COMMENT '难度星',
  `type` int(1) DEFAULT NULL COMMENT '1 课前 2课后',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "exam"
#

INSERT INTO `exam` VALUES (1,1,'营养素专题',1,'1.三大产能营养素中1克能提供9Kcal热量的是？','A.蛋白质','B.碳水化合物','C.脂肪','D.无','C','C.脂肪',5,1),(2,1,NULL,2,'2.维生素D属于以下类型营养素？','A.脂溶性维生素','B.水溶性维生素','C.水溶性维生素','D.水溶性维生素','B','B.水溶性维生素',5,1),(3,1,NULL,3,'3.以下关于婴幼儿肠道发育特点的描述错误的是？','A.食管短而窄，括约肌功能不完善','B．胃容量小，消化酶发育不成熟','C．肠壁薄，通透性高，健康肠道菌群尚在构建中','D．肠动力足，消化吸收好','A','A.食管短而窄，括约肌功能不完善',5,1),(4,1,NULL,4,'4. 下列缓解宝宝便秘方法，描述正确的是?','A. 如果是喂养配方奶粉，在两顿奶之间适当喂宝宝些水','B. 膳食纤维摄入不足可能会引起宝宝便秘，添加益生元能帮助宝宝缓解便秘','C. 可以在宝宝两餐奶间或者洗澡前给宝宝做腹部按摩，促进肠蠕动','D. 以上全对','D','D. 以上全对',5,1),(5,1,NULL,5,'5. 关于益生元的描述以下错误的是？','A．母乳中含有130多种低聚糖，包括低聚半乳糖GOS，所以母乳的宝宝吸收消化更好','B．益生菌是益生元的食物，饮食中摄入益生菌的生长，肠道内益生元显著增多','C. 低聚果糖是益生元的一种，来源于天然植物','D．益生元是可溶性膳食纤维，进入肠道不被人体吸收，但是能被肠道内有益菌利用，促进有益菌生长','C','C.低内聚',5,1),(6,2,'222',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1),(7,1,'1111',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2),(8,2,'222',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2);

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

INSERT INTO `question_answer` VALUES (1,1,'3月微信答疑','weixin','2017-02-10 16:52:43','试试回车好使不好事\n<br>试试回车好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使不好事\nfsdf'),(2,1,'第一篇总结','ppt','2016-04-20 00:00:00','试试回车好使不好事\n<br>试试回车好使不好事\n\n\n111111');

#
# Structure for table "user_basic"
#

DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `user_nname` varchar(255) NOT NULL DEFAULT '',
  `user_type` varchar(1) NOT NULL DEFAULT '1' COMMENT '0:管理员; 1：店员； 2：店主； 3：销售； 4 ：经销商；',
  `password` varchar(255) NOT NULL DEFAULT '',
  `regist_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0为正常；1为黑名单',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "user_basic"
#

INSERT INTO `user_basic` VALUES (3,'13811111111','gladstone','1','e10adc3949ba59abbe56e057f20f883e','2017-02-20 14:44:32','黑龙江','哈尔滨','道里区',NULL,0),(22,'13811111112','gladstone2','2','e10adc3949ba59abbe56e057f20f883e','2017-02-16 12:47:05','北京','东城区',NULL,NULL,0),(23,'13811111113','gladstone3','3','b02f774f224e881e70f928d98bd11f0a','2017-02-18 10:49:45','北京','朝阳区',NULL,NULL,0),(24,'13811111114','dealer','4','e10adc3949ba59abbe56e057f20f883e','2017-02-16 12:51:32',NULL,NULL,NULL,NULL,0),(31,'13811111115','巴巴','4','e10adc3949ba59abbe56e057f20f883e','2017-02-20 11:55:05',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

#
# Data for table "user_record"
#

INSERT INTO `user_record` VALUES (91,'13811111111','video',2,0,'2017-02-09',2),(92,'13811111111','weixin',1,0,'2017-02-10',2),(94,'13811111111','exam',1,20,'2017-02-10',2),(95,'13811111111','video',1,0,'2017-02-10',2),(96,'13811111111','video',7,0,'2017-02-10',2),(97,'13811111111','weixin',1,0,'2017-02-11',2),(98,'13811111111','video',2,0,'2017-02-12',2),(99,'13811111111','video',3,0,'2017-02-12',2),(100,'13811111111','weixin',1,0,'2017-02-12',2),(101,'13811111111','video',1,0,'2017-02-16',2),(102,'13811111111','video',1,0,'2017-02-18',2);

#
# Structure for table "user_score_rank"
#

DROP TABLE IF EXISTS `user_score_rank`;
CREATE TABLE `user_score_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `year` int(4) DEFAULT '0',
  `season` int(1) DEFAULT '0',
  `month` int(2) DEFAULT '0',
  `score` int(11) DEFAULT '0' COMMENT '每月积分',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总积分',
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user_score_rank"
#

INSERT INTO `user_score_rank` VALUES (2,'13811111111',0,0,0,0,116),(3,'13811111112',0,0,0,0,64),(4,'13811111113',0,0,0,0,50);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "user_score_record"
#

INSERT INTO `user_score_record` VALUES (10,'13811111111','20170209',2017,1,2,10,'video'),(11,'13811111111','20170210',2017,1,2,2,'weixin'),(12,'13811111111','20170210',2017,1,2,10,'exam'),(13,'13811111111','20170210',2017,1,2,10,'exam'),(14,'13811111111','20170210',2017,1,2,10,'video'),(15,'13811111111','20170210',2017,1,2,10,'video'),(16,'13811111111','20170211',2017,1,2,2,'weixin'),(17,'13811111111','20170212',2017,1,2,10,'video'),(18,'13811111111','20170212',2017,1,2,10,'video'),(19,'13811111111','20170212',2017,1,2,2,'weixin'),(20,'13811111111','20170216',2017,1,2,10,'video'),(21,'13811111111','20170218',2017,1,2,10,'video');

#
# Structure for table "video_info"
#

DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(2) unsigned DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `video_id` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT '1' COMMENT '1 学员  2 店主',
  `summary` varchar(1024) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '3' COMMENT '0：本月之前所有课程 ；1为本月已上过 ；2本月未上；3：未来月份',
  `writer` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Data for table "video_info"
#

INSERT INTO `video_info` VALUES (1,1,'为什么说生命最初一千天决定宝宝的一生?',2,'XMjUxNDU3ODAwMA==','1','想要了解宝宝发育的关键时期，想要掌握科学喂养宝宝的方法，让妈妈更信赖吗？快来参加本期课程＂为什么说生命最初一千天决定宝宝一生的健康？＂吧！ ','2017-03-15 17:25:03',1,'abc'),(2,2,'为什么说母乳是妈妈送给宝宝最好的礼物?',2,'XMTU2NDA5Nzg5Ng==','1','母乳喂养就是好，健康成长好宝宝．想用“母乳喂养”的科学知识捕获顾客“妈妈”们的心？快来参加本期课程“为什么说母乳是妈妈送给宝宝最好的礼物？”','2017-03-22 17:35:31',2,'12'),(4,3,'你知道力多精金装3新配方给宝宝带来的好处吗？',2,'XMTU2NDA5Nzg5Ng==','1','宝宝营养要全面，肠道舒适是关键．本期课程让我们共同走近“力多精金装3”，让您更深度的了解百年雀巢以及一流的研发团队为中国宝宝量身定制的新配方奶粉给宝宝带来的好处。','2017-03-29 17:01:18',2,'ad'),(5,4,'如何满足宝宝的“能量”需求？',2,'XMTU2NDA5Nzg5Ng==','1','想听关于”能量“的专业解读？想了解宝宝的能量需求规律？ 让我们看看“如何满足宝宝的‘能量’需求”，帮助妈妈助力宝宝成长。','2017-04-05 17:01:23',2,'a'),(6,6,'怎样与不同风格的人沟通',2,'XMTU2NDA5Nzg5Ng==','2','','2016-07-16 17:01:26',3,'ad'),(7,7,'怎样判断能量是否超标?',2,'XMTU2NDA5Nzg5Ng==','1','','2016-08-16 17:01:27',3,'asd'),(8,8,'奶粉罐上的牛磺酸有什么作用?',2,'XMTU2NDA5Nzg5Ng==','1',NULL,'2016-08-16 17:01:28',3,'asd'),(9,9,'脂肪酸为什么能让宝宝聪明？',NULL,'','1',NULL,'2016-08-16 17:01:29',3,NULL),(10,10,'为什么有的人喝牛奶会拉肚子？',NULL,NULL,'1',NULL,'2016-08-16 17:10:13',3,NULL),(11,11,'你真的认识膳食纤维吗？',NULL,NULL,'1',NULL,'2016-09-16 17:10:40',3,NULL),(12,12,'益生元、益生菌傻傻分不清？',NULL,NULL,'1',NULL,'2016-09-16 17:10:41',3,NULL),(13,13,'肠道舒适卫士~力多精金装3',NULL,NULL,'1',NULL,'2016-09-16 17:10:42',3,NULL),(14,14,'吃奶粉的宝宝还要补钙吗？',NULL,NULL,'1',NULL,'2016-09-16 17:10:43',3,NULL),(15,15,'宝宝指甲上的小白斑是怎么回事？',NULL,NULL,'1',NULL,'2016-10-16 17:10:44',3,NULL),(16,16,'奶粉中含“胆碱”的作用是什么？',NULL,NULL,'1',NULL,'2016-10-16 17:10:45',3,NULL),(17,17,'如何给宝宝喝水？',NULL,NULL,'1',NULL,'2016-10-16 17:10:46',3,NULL),(18,18,'如何快速问出宝妈的需求？',NULL,NULL,'1',NULL,'2016-10-16 17:10:46',3,NULL),(19,19,'宝宝为什么那么容易发生返流，呕吐和脹气？',NULL,NULL,'1',NULL,'2016-11-16 17:10:48',3,NULL),(20,20,'便便自测，如何掌控宝宝的小肚肚（0-4月龄和1-2岁）',NULL,NULL,'1',NULL,'2016-11-16 17:10:49',3,NULL),(21,21,'宝宝真的便秘了吗？',NULL,NULL,'1',NULL,'2016-11-16 17:10:50',3,NULL),(22,22,'吃奶粉腹泻怎么办?',NULL,NULL,'1',NULL,'2016-11-16 17:10:51',3,NULL),(24,23,'吐奶、溢奶怎么办？',NULL,NULL,'1',NULL,'2016-12-16 17:10:53',3,NULL),(25,24,'宝宝为什么常常不明原因哭闹？',NULL,NULL,'1',NULL,'2016-12-16 17:10:54',3,NULL),(26,25,'宝宝“上火”了，如何帮助宝妈“灭火”？',NULL,NULL,'1',NULL,'2016-12-16 17:10:56',3,NULL),(27,26,'如何应对客户疑虑？',NULL,NULL,'1',NULL,'2016-12-16 17:10:58',3,NULL),(28,5,'让理货员/妈妈都能充分理解肠道舒适对于宝宝的重要性',NULL,NULL,'1',NULL,'2016-07-16 17:15:14',3,NULL);
