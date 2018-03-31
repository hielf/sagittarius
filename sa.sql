-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: sagittarius_production
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$11$/ot7XHTC8Qbk06BSYT1e5unZychbwnboDcvaKyr/RQfmj2IKyZ1XK',NULL,NULL,'2018-03-28 07:37:20',8,'2018-03-31 09:27:28','2018-03-30 16:59:39','180.164.155.77','120.204.142.249','2018-03-26 20:25:22','2018-03-31 09:27:28');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2018-03-26 19:34:44','2018-03-26 19:34:44');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'上海','2018-03-26 20:25:20','2018-03-26 20:25:20',NULL),(2,'重庆','2018-03-27 03:37:48','2018-03-27 03:37:48','重庆'),(3,'武汉','2018-03-27 03:38:17','2018-03-27 03:38:17','武汉');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'沃尔玛','2018-03-28 10:33:19','2018-03-28 10:33:19'),(2,'家乐福','2018-03-28 10:33:19','2018-03-28 10:33:19'),(3,'乐购','2018-03-28 10:33:19','2018-03-28 10:33:19');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `in_num` int(11) DEFAULT NULL,
  `sell_num` int(11) DEFAULT NULL,
  `budget_num` int(11) DEFAULT NULL,
  `storage_num` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,14,1,1,23,12,NULL,12,'已审批','2018-03-30 07:29:11','2018-03-31 05:20:58'),(2,14,1,1,23,12,NULL,12,'否决','2018-03-30 07:30:00','2018-03-31 05:37:52'),(3,14,1,1,23,12,NULL,12,'已审批','2018-03-30 07:30:01','2018-03-31 05:36:49'),(4,14,5,2,10,20,NULL,30,'待审批','2018-03-30 07:33:05','2018-03-30 07:33:05'),(5,14,5,1,1,2,NULL,3,'待审批','2018-03-30 07:33:05','2018-03-30 07:33:05'),(6,14,7,1,2,3,NULL,1,'待审批','2018-03-30 08:39:03','2018-03-30 08:39:03'),(7,14,7,2,1,34,NULL,34,'待审批','2018-03-30 08:39:03','2018-03-30 08:39:03'),(8,14,7,2,33,22,NULL,11,'待审批','2018-03-30 08:46:49','2018-03-30 08:46:49'),(9,14,7,1,11,22,NULL,33,'待审批','2018-03-30 08:46:49','2018-03-30 08:46:49'),(10,14,7,2,15,16,NULL,17,'待审批','2018-03-30 08:50:47','2018-03-30 08:50:47'),(11,14,7,1,12,13,NULL,14,'待审批','2018-03-30 08:50:47','2018-03-30 08:50:47'),(12,14,7,2,12,33,NULL,111,'待审批','2018-03-30 09:01:14','2018-03-30 09:01:14'),(13,14,7,1,123,123,NULL,999,'待审批','2018-03-30 09:01:14','2018-03-30 09:01:14'),(14,24,7,1,100,80,NULL,20,'待审批','2018-03-30 17:07:38','2018-03-30 17:07:38'),(15,24,7,2,120,100,NULL,18,'待审批','2018-03-30 17:07:38','2018-03-30 17:07:38');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` text,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `send_to` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'洗护用品促销活动','QQ20120927-6.png','','2017-12-31 16:00:00','2018-12-31 16:00:00',NULL,NULL,'洗护用品促销活动洗护用品促销活动','已开始','2018-03-26 21:18:46','2018-03-28 07:41:36','tg'),(2,'洗护用品促销活动',NULL,'','2017-12-31 08:00:00','2018-12-31 08:00:00',NULL,NULL,'','结束','2018-03-30 06:03:22','2018-03-30 08:20:29','tg'),(3,'洗护用品促销活动',NULL,'微博API. 粉丝服务接口; 微博接口; 评论接口; 用户接口; 关系接口; 搜索接口; 短链接口; 公共服务接口; OAuth 2.0授权接口. 标识为 的接口为高级权限接口，需要申请才可以调用，申请方式请见高级接口申请. 标识为 的接口为需要单独向用户提出SCOPE授权请求的接口，用户单独授权后才可以调用，具体使用方法请见 ','2017-12-01 08:00:00','2017-12-31 08:00:00',NULL,NULL,'','结束','2018-03-30 06:03:49','2018-03-30 07:40:50','tg'),(4,'新浪微博','QQ20120927-3.png','新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一\r\n，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能\r\n\r\n，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能新浪微博（Weibo/Sina Weibo，官方名称为微博），是一个由新浪网推出，提供微博客的服务网站。用户可以通过网页、WAP页面、外部程序和手机短信或彩信等发布信息，并可上传图片和链接视频，实现即时分享。新浪微博可以直接在一条微博下面附加评论，也可以直接在一条微博里面发送图片、视频，新浪微博最先添加这两点功能','2014-01-01 16:00:00','2015-04-02 17:02:00',NULL,NULL,'','结束','2018-03-30 06:53:48','2018-03-30 08:20:18','tg'),(5,'发顺丰进口量','QQ20120927-6.png','首先,大家来看,死者心脏部位受到利器刺杀,伤口周围的皮肤是向内的,这和我们常规见到的受利器刺杀死亡的人大不相同,你们想,如果用匕首插入心脏,从外向内的力度虽然很大,但是因为匕首要离开人的身体,伤口周围的皮肤大部分都应该是向外的,起码有一部分是向外的,如果向内,只能有一种可能,匕首插入后没有拔出!但是从案发现场的\r\n首先,大家来看,死者心脏部位受到利器刺杀,伤口周围的皮肤是向内的,这和我们常规见到的受利器刺杀死亡的人大不相同,你们想,如果用匕首插入心脏,从外向内的力度虽然很大,但是因为匕首要离开人的身体,伤口周围的皮肤大部分都应该是向外的,起码有一部分是向外的,如果向内,只能有一种可能,匕首插入后没有拔出!但是从案发现场的\r\n首先,大家来看,死者心脏部位受到利器刺杀,伤口周围的皮肤是向内的,这和我们常规见到的受利器刺杀死亡的人大不相同,你们想,如果用匕首插入心脏,从外向内的力度虽然很大,但是因为匕首要离开人的身体,伤口周围的皮肤大部分都应该是向外的,起码有一部分是向外的,如果向内,只能有一种可能,匕首插入后没有拔出!但是从案发现场的','2014-01-31 17:01:00','2021-02-04 19:02:00',NULL,NULL,'','已开始','2018-03-30 07:32:49','2018-03-30 07:32:49','shelf'),(6,'rails 个 migrate','QQ20120927-9.png','2012年1月1日 - When you use a string column without an explicit limit, Rails will add an implicit :limit => 255 . But if you use text , you\'ll get whatever arbitrary length string type the database supports. PostgreSQL allows you to use a varchar column without a length but most databases use a separate type for that and Rails ...\r\n2012年1月1日 - When you use a string column without an explicit limit, Rails will add an implicit :limit => 255 . But if you use text , you\'ll get whatever arbitrary length string type the database supports. PostgreSQL allows you to use a varchar column without a length but most databases use a separate type for that and Rails ...\r\n\r\n2012年1月1日 - When you use a string column without an explicit limit, Rails will add an implicit :limit => 255 . But if you use text , you\'ll get whatever arbitrary length string type the database supports. PostgreSQL allows you to use a varchar column without a length but most databases use a separate type for that and Rails ...\r\n2012年1月1日 - When you use a string column without an explicit limit, Rails will add an implicit :limit => 255 . But if you use text , you\'ll get whatever arbitrary length string type the database supports. PostgreSQL allows you to use a varchar column without a length but most databases use a separate type for that and Rails ...','2014-03-01 17:00:00','2022-05-31 17:01:00',NULL,NULL,'','已开始','2018-03-30 07:33:40','2018-03-30 07:33:40','new'),(7,'促销活动 | 联合利华力士水润丝滑洗发水柔顺滋养留香洗头膏正品500ml*2套装','TB2x6zzfodnpuFjSZPhXXbChpXa___700459267.jpg','促销活动 | 联合利华力士水润丝滑洗发水柔顺滋养留香洗头膏正品500ml*2套装 \r\n盛大促销','2018-03-01 16:00:00','2018-03-09 16:00:00',NULL,NULL,'','已开始','2018-03-30 07:34:44','2018-03-31 10:38:03','project');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goods_on_event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,1,'奥妙','联合利华奥妙深层洁净洗衣液机手洗家庭装正品源自天然酵素16斤','TB2R1q4XuEJL1JjSZFGXXa6OXXa___700459267.jpg','2018-03-26 21:19:37','2018-03-31 10:30:34','89.90'),(2,1,'清扬','联合利华清扬樱花男女士洗发水露滋养留香去屑正品套装750ml*2','TB2bsUGdWLN8KJjSZFGXXbjrVXa___700459267.jpg','2018-03-26 21:20:35','2018-03-31 10:28:42','109'),(3,1,'金纺','联合利华金纺衣物护理防静电柔顺剂薰衣草持久留香家庭装正品4L*3','TB2XmqRi6ihSKJjy0FeXXbJtpXa___700459267.jpg','2018-03-31 10:32:50','2018-03-31 10:32:50','129.00'),(4,1,'力士','联合利华力士水润丝滑洗发水柔顺滋养留香洗头膏正品500ml*2套装',NULL,'2018-03-31 10:34:19','2018-03-31 10:34:19','65.90'),(5,1,'力士','联合利华力士水润丝滑洗发水柔顺滋养留香洗头膏正品500ml*2套装','TB2x6zzfodnpuFjSZPhXXbChpXa___700459267.jpg','2018-03-31 10:34:27','2018-03-31 10:34:27','65.90');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `photo_type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `serial_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_photos_on_user_id` (`user_id`),
  KEY `index_photos_on_event_id` (`event_id`),
  KEY `index_photos_on_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912161522296981',NULL,'2018-03-29 04:16:21','2018-03-29 04:27:33',2),(2,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912161522296981',NULL,'2018-03-29 04:16:21','2018-03-29 04:27:33',2),(3,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912161522297008',NULL,'2018-03-29 04:16:48','2018-03-29 04:27:33',3),(4,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912161522297008',NULL,'2018-03-29 04:16:48','2018-03-29 04:27:33',3),(5,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912161522297014',NULL,'2018-03-29 04:16:54','2018-03-29 04:27:33',4),(6,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912161522297014',NULL,'2018-03-29 04:16:54','2018-03-29 04:27:33',4),(7,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912161522297018',NULL,'2018-03-29 04:16:58','2018-03-29 04:27:33',5),(8,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912161522297018',NULL,'2018-03-29 04:16:58','2018-03-29 04:27:33',5),(9,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297023',NULL,'2018-03-29 04:17:03','2018-03-29 04:27:34',6),(10,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297023',NULL,'2018-03-29 04:17:03','2018-03-29 04:27:34',6),(11,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297033',NULL,'2018-03-29 04:17:13','2018-03-29 04:27:34',7),(12,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297033',NULL,'2018-03-29 04:17:13','2018-03-29 04:27:34',7),(13,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297040',NULL,'2018-03-29 04:17:20','2018-03-29 04:27:34',8),(14,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297040',NULL,'2018-03-29 04:17:20','2018-03-29 04:27:34',8),(15,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297045',NULL,'2018-03-29 04:17:25','2018-03-29 04:27:34',9),(16,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297045',NULL,'2018-03-29 04:17:25','2018-03-29 04:27:34',9),(17,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297062',NULL,'2018-03-29 04:17:42','2018-03-29 04:27:34',10),(18,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297062',NULL,'2018-03-29 04:17:42','2018-03-29 04:27:34',10),(19,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297066',NULL,'2018-03-29 04:17:46','2018-03-29 04:27:34',11),(20,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297066',NULL,'2018-03-29 04:17:46','2018-03-29 04:27:34',11),(21,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10101012018032912171522297070',NULL,'2018-03-29 04:17:50','2018-03-29 04:27:34',12),(22,19,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10101012018032912171522297070',NULL,'2018-03-29 04:17:50','2018-03-29 04:27:34',12),(23,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10022018032915401522309205',NULL,'2018-03-29 07:40:05','2018-03-29 07:40:05',13),(24,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10022018032915401522309205',NULL,'2018-03-29 07:40:05','2018-03-29 07:40:05',13),(25,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10022018032915401522309225',NULL,'2018-03-29 07:40:25','2018-03-29 07:40:25',14),(26,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10022018032915401522309225',NULL,'2018-03-29 07:40:25','2018-03-29 07:40:25',14),(27,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032915401522309247',NULL,'2018-03-29 07:40:47','2018-03-29 07:40:47',15),(28,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032915401522309247',NULL,'2018-03-29 07:40:47','2018-03-29 07:40:47',15),(29,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032915401522309250',NULL,'2018-03-29 07:40:50','2018-03-29 07:40:50',16),(30,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032915401522309250',NULL,'2018-03-29 07:40:50','2018-03-29 07:40:50',16),(31,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032915401522309253',NULL,'2018-03-29 07:40:53','2018-03-29 07:40:53',17),(32,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032915401522309253',NULL,'2018-03-29 07:40:53','2018-03-29 07:40:53',17),(33,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032916071522310841',NULL,'2018-03-29 08:07:21','2018-03-29 08:07:21',18),(34,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032916071522310841',NULL,'2018-03-29 08:07:21','2018-03-29 08:07:21',18),(35,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032916071522310853',NULL,'2018-03-29 08:07:33','2018-03-29 08:07:33',19),(36,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032916071522310853',NULL,'2018-03-29 08:07:33','2018-03-29 08:07:33',19),(37,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10052018032916071522310856',NULL,'2018-03-29 08:07:36','2018-03-29 08:07:36',20),(38,14,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10052018032916071522310856',NULL,'2018-03-29 08:07:36','2018-03-29 08:07:36',20),(39,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10022018032916081522310880',NULL,'2018-03-29 08:08:00','2018-03-29 08:08:00',21),(40,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10022018032916081522310880',NULL,'2018-03-29 08:08:00','2018-03-29 08:08:00',21),(41,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10022018032916081522310887',NULL,'2018-03-29 08:08:07','2018-03-29 08:08:07',22),(42,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10022018032916081522310887',NULL,'2018-03-29 08:08:07','2018-03-29 08:08:07',22),(43,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10022018032916081522310891',NULL,'2018-03-29 08:08:11','2018-03-29 08:08:11',23),(44,12,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10022018032916081522310891',NULL,'2018-03-29 08:08:11','2018-03-29 08:08:11',23),(45,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117211522488096',NULL,'2018-03-31 09:21:36','2018-03-31 09:21:36',24),(46,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117211522488096',NULL,'2018-03-31 09:21:36','2018-03-31 09:21:36',24),(47,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117211522488102',NULL,'2018-03-31 09:21:42','2018-03-31 09:21:42',25),(48,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117211522488102',NULL,'2018-03-31 09:21:42','2018-03-31 09:21:42',25),(49,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117211522488106',NULL,'2018-03-31 09:21:46','2018-03-31 09:21:46',26),(50,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117211522488106',NULL,'2018-03-31 09:21:46','2018-03-31 09:21:46',26),(51,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117211522488111',NULL,'2018-03-31 09:21:51','2018-03-31 09:21:51',27),(52,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117211522488111',NULL,'2018-03-31 09:21:51','2018-03-31 09:21:51',27),(53,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117221522488124',NULL,'2018-03-31 09:22:04','2018-03-31 09:22:04',28),(54,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117221522488124',NULL,'2018-03-31 09:22:04','2018-03-31 09:22:04',28),(55,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117231522488239',NULL,'2018-03-31 09:23:59','2018-03-31 09:23:59',29),(56,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117231522488239',NULL,'2018-03-31 09:23:59','2018-03-31 09:23:59',29),(57,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',1,'10002018033117241522488247',NULL,'2018-03-31 09:24:07','2018-03-31 09:24:07',30),(58,2,1,NULL,'http://p3tj4myt5.bkt.clouddn.com/o_1c65senao1h1s1lhbii4bp4107vu.jpg',2,'10002018033117241522488247',NULL,'2018-03-31 09:24:07','2018-03-31 09:24:07',30);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20171120151951'),('20171125114913'),('20180125053928'),('20180205030144'),('20180205030515'),('20180205030627'),('20180205233946'),('20180206113437'),('20180206114108'),('20180206120018'),('20180206120346'),('20180206120709'),('20180206184623'),('20180207155352'),('20180207155909'),('20180207161903'),('20180207171325'),('20180211091859'),('20180211161903'),('20180211204613'),('20180212060401'),('20180327075854'),('20180327082055'),('20180328050249'),('20180328072447'),('20180328102127'),('20180328102226'),('20180330061939'),('20180331074745');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'綦江九龙大道店',1,'2018-03-26 20:25:21','2018-03-26 20:25:21'),(2,'莲花南路店',1,'2018-03-27 05:46:09','2018-03-27 05:46:09'),(3,'春申路店',1,'2018-03-27 05:46:23','2018-03-27 05:46:23');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `state_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_user_id` (`user_id`),
  KEY `index_states_on_event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,19,1,'tg','待审批','动态动态',NULL,'2018-03-29 03:45:43','2018-03-29 03:45:43',NULL),(2,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:16:21','2018-03-29 04:16:21',NULL),(3,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:16:48','2018-03-29 04:16:48',NULL),(4,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:16:54','2018-03-29 04:16:54',NULL),(5,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:16:58','2018-03-29 04:16:58',NULL),(6,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:03','2018-03-29 04:17:03',NULL),(7,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:13','2018-03-29 04:17:13',NULL),(8,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:20','2018-03-29 04:17:20',NULL),(9,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:25','2018-03-29 04:17:25',NULL),(10,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:42','2018-03-29 04:17:42',NULL),(11,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:46','2018-03-29 04:17:46',NULL),(12,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 04:17:50','2018-03-29 04:17:50',NULL),(13,19,1,'tg','待审批','动态动态1',NULL,'2018-03-29 07:40:05','2018-03-29 07:40:05',NULL),(14,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 07:40:25','2018-03-29 07:40:25',NULL),(15,19,1,'tg','待审批','动态动态2',NULL,'2018-03-29 07:40:47','2018-03-29 07:40:47',NULL),(16,19,1,'tg','待审批','动态动态3',NULL,'2018-03-29 07:40:50','2018-03-29 07:40:50',NULL),(17,19,1,'tg','待审批','动态动态4',NULL,'2018-03-29 07:40:53','2018-03-29 07:40:53',NULL),(18,14,1,'tg','待审批','动态动态',NULL,'2018-03-29 08:07:21','2018-03-29 08:07:21',NULL),(19,14,1,'tg','待审批','动态动态1',NULL,'2018-03-29 08:07:33','2018-03-29 08:07:33',NULL),(20,14,1,'tg','待审批','动态动态2',NULL,'2018-03-29 08:07:36','2018-03-29 08:07:36',NULL),(21,12,1,'tg','否决','动态动态2','照片不清晰','2018-03-29 08:08:00','2018-03-31 10:01:38',NULL),(22,12,1,'tg','否决','动态动态fdsafdsa','照片拍摄不符合要求','2018-03-29 08:08:07','2018-03-31 10:01:21',NULL),(23,12,1,'tg','已审批','动态动态ggg',NULL,'2018-03-29 08:08:11','2018-03-31 10:01:18',NULL),(24,2,1,'tg','待审批','动态动态ggg',NULL,'2018-03-31 09:21:36','2018-03-31 09:21:36',NULL),(25,2,1,'tg','待审批','xxxx',NULL,'2018-03-31 09:21:42','2018-03-31 09:21:42',NULL),(26,2,1,'tg','待审批','bbbbb',NULL,'2018-03-31 09:21:46','2018-03-31 09:21:46',NULL),(27,2,1,'new','待审批','bbbbb',NULL,'2018-03-31 09:21:51','2018-03-31 09:21:51',NULL),(28,2,1,'tg','否决','今天真开心','照片拍摄不符合要求','2018-03-31 09:22:04','2018-03-31 09:52:57',NULL),(29,2,1,'tg','已审批','又发了一条',NULL,'2018-03-31 09:23:59','2018-03-31 09:52:53',NULL),(30,2,1,'new','待审批','也发了一条',NULL,'2018-03-31 09:24:07','2018-03-31 09:24:07',NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'4288','日化团队',2,'2018-03-26 20:25:21','2018-03-31 08:02:05');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'staff',
  `area_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `upper_user_id` int(11) DEFAULT NULL,
  `upper_user_phone` varchar(255) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(50) DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_ip` varchar(50) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `upper_user_name` varchar(255) DEFAULT NULL,
  `upper_client` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`),
  KEY `index_users_on_shop_id` (`shop_id`),
  KEY `index_users_on_area_id` (`area_id`),
  KEY `index_users_on_team_id` (`team_id`),
  KEY `index_users_on_access_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'9000','oDQVQ0azX0CykArKrvJgFUPbHFic','$2a$10$LdBS3UI7tlvGPwEst7V/HefrN1RDiNrb..weYJv5D/IkeWTppp0HG','18018559079','staff',1,1,NULL,'18000000000',1,'g6G36joPJj7jz90dK9OGUrxYS+r1T0rwj8A/eWKE7mgeEXICP3JOgPV+zy9UU8extjBe77yBx5hIh9BLmpgEPw==',142,'2018-03-31 09:56:23','223.166.216.110','2018-03-31 08:39:51','223.166.216.110',0,NULL,'2018-03-26 21:25:47','2018-03-31 09:56:23','test','已审批',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKabJxog9KM9clMquA1JiaOKibgSdq90JD2f7IWDf0Ngnnm5WKs6icsf37J2zNbfl5gdZalkVjlLcT9A/132',NULL),(2,'1000',NULL,'$2a$10$795lVBuU4xzuMo6RUyN6sO3FnU//xWD0q4zL84ydQ4yADrpsobPlS','18018559029','outworker',1,1,25,'18000000000',1,'DXZ7M34aYIfUX8raekO1SM0bbL0qUOtWA4NBB0QfRLOectUf9kTo0cUUt9CRHYOdou1vP6HDDpBUYwLAIWgh8w==',37,'2018-03-31 09:01:33','223.166.216.110','2018-03-31 08:59:53','223.166.216.110',0,NULL,'2018-03-26 21:26:27','2018-03-31 09:15:34','test','已审批',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(3,'3000',NULL,'$2a$10$6G0J9IFL6VTAnXT9QAG.WehYzqgrSdsjXzOfrvmWLps/aRJXQfaDG','18018559129','staff',1,NULL,NULL,'18000000000',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-27 05:49:06','2018-03-29 08:18:54','test','已审批','aabbcc',NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(4,'0001',NULL,'$2a$10$mFArLdZ3RxiQJ1l.TKLCsOKwGEfxpe85q4LWDtq2d4EZna7ODIMIO','13020112345','staff',1,NULL,NULL,NULL,NULL,'Dqk0KGdqFyX/gdJeoqcdz8n9uBnf0bDH24d8chadmdurMUEgxZrxR5OQQWXdM2d4hOtoAdAEpaxvJtxsuVHh8g==',7,'2018-03-28 06:53:09','58.32.3.115','2018-03-28 04:52:49','58.32.3.118',0,NULL,'2018-03-27 10:28:23','2018-03-29 08:18:54','lzx','待审批',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(5,'0002',NULL,'$2a$10$R9QfyC6NSswdbUKUMK6ouOoAsDXUUbn4o7aFAb8afGxmssY721Ohq','13020220222','staff',1,NULL,NULL,NULL,NULL,'5bhIxgVuYqWH8ViL0UQN/lzWVpkGyiYbS6icLpPKHhTXsG5OlSDBX2DKYhcwQg64tfwbu5BpOXWuZIjnn7E/tw==',1,'2018-03-27 10:33:38','58.32.3.115',NULL,NULL,0,NULL,'2018-03-27 10:33:07','2018-03-29 08:18:54','liuzx','待审批',NULL,'','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(6,'0003',NULL,'$2a$10$IgSLZn5FuHnBG3xMNSdn.ehmQBUiwLAyi5PSm6wTR7ck1SGX/fi32','13020220202','staff',1,NULL,NULL,NULL,NULL,'3Nn9wolmQpnyx35HGgDX9o6966yXdCfPZqO5iPRy6G+S+1lawnkvuzMn/HXGA/1wgUjQdvIJxgSV11GA7xklTA==',1,'2018-03-27 10:40:42','58.32.3.115',NULL,NULL,0,NULL,'2018-03-27 10:40:28','2018-03-29 08:18:54','lizx','待审批',NULL,'','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(7,'0004',NULL,'$2a$10$nasC5ALqG4OELtzosoYb9uhu1Apo3nvCeIWxNz7NTBFBkzrIWP2CG','13020220202','staff',1,NULL,NULL,NULL,NULL,'XtIsEaosx7HF/zQ3WmE9slGrNK+3ogRbDaZFhNN5yrTrfPy9pMedWU/9+Xa/SJfTWHr4GHYOfyO+Xn0/WMhb9g==',4,'2018-03-28 07:00:19','58.32.3.115','2018-03-27 10:43:44','58.32.3.118',0,NULL,'2018-03-27 10:42:05','2018-03-29 08:18:54','liuzx','待审批',NULL,'','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(8,'111111',NULL,'$2a$10$KovfKskrULqtz.c1N4SoeOkhukdMwjKQWdcAqo2IbwAxtKlFy8I/2','12345456451','staff',1,NULL,NULL,'12345654563',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-27 16:56:58','2018-03-29 08:18:54','jack','待审批','9000-test','綦江九龙大道店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(9,'123456',NULL,'$2a$10$z0LsA4aflKiBu7b/OzF/J.brHPeASGa2QB8MFv/fDokkpn3RHeFXW','13232323232','staff',1,NULL,NULL,'12323232322',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-27 16:58:12','2018-03-29 08:18:54','jack1','待审批','9000-test','綦江九龙大道店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(10,'123',NULL,'$2a$10$kqSoiq5ZVLVmCVdgLyo5MuaaBb.NtjtqJOnBOMKvCwlqr7hf9kU/C','13020220220','staff',2,NULL,NULL,'123',NULL,'74B+mx07NwX4qtYGiGm0y/PLAyNQc7OjoqdXg9U44orsk/J0zaKM9VNa+b2iBKrpn2JeFix1SKjNm/A+nxjG0Q==',1,'2018-03-28 01:33:37','58.32.3.115',NULL,NULL,0,NULL,'2018-03-28 01:33:30','2018-03-29 08:18:54','123','待审批','9000-test','綦江九龙大道店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(11,'1001',NULL,'$2a$10$D2NdtQLL8CkdBeIcaR2r/.yGMNOHa87a8X16mA5RdeGmiL0usO256','13022222222','outworker',NULL,1,4,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-28 04:49:50','2018-03-29 08:18:54','1','待审批',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(12,'1002',NULL,'$2a$10$9WsVbAj2Son2xP5/wgG.NO7WbwJk08cHkhOb6RrcOCowUnsVzFKji','13022222222','outworker',NULL,1,1,NULL,NULL,'MAlUSRTjjOwtyva1h3gthd5a5lS0rBarwVRxI8Jc6J1olh5PLyKq1VMDEnSIN69lB0aLhY6oTOQXMABFNX8Vxg==',12,'2018-03-30 05:33:58','58.32.3.115','2018-03-30 02:40:44','58.32.3.115',2,NULL,'2018-03-28 05:03:21','2018-03-31 01:11:07','liuzhaoxiang','已审批',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(13,'1004',NULL,'$2a$10$EYxIqkpMgTtIaFXNYNThBOEIM5SJQ9yxxFwrJ0MhJ7bPJ44pYx/j2','13022222222','outworker',NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-28 06:15:23','2018-03-29 08:18:54','123','审批否决',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(14,'1005','oDQVQ0ejzcBtKnBS_scwA7Dr-_3Y','$2a$10$WDVXPN0wKZ6kzqdCL.1DfuZMkpqCTYbYJDhzbaKP95C0XfrwlDS/i','13022222222','outworker',NULL,2,1,NULL,NULL,'tJTiyd9ED7ZqqwWrw9fRKgKPfHvYC28zhBtjTkwYl8xHyb4MA/84/KLRuoabXbYa377Ny1eF1S6pRqYpOUd5bw==',45,'2018-03-30 16:56:08','222.64.208.19','2018-03-30 10:29:24','58.32.3.115',0,NULL,'2018-03-28 06:27:12','2018-03-30 16:56:09','123','已审批',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLDDDYHUcPe8McQMLg9wH3QDZngfRDTUEGSL8qia8oiciaerKIcQRBSGvce3A9Enylc5WTgvcJpibIUyqw/132',NULL),(15,'12345',NULL,'$2a$10$O.QYP..Zzgd00QHu6HNN5u.sO8aP8O.qma4WxjVGOB9GtfWLOVUAy','13911116666','staff',1,NULL,NULL,'13644552786',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-28 07:31:19','2018-03-29 08:18:54','test','待审批','9000-test','莲花南路店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(16,'121212',NULL,'$2a$10$oHUYfa8UxaMTnBXfzjvmEuHND7OqtnzWCsJ2/La4LcuFezBa9Dpgm','15021175848','staff',1,NULL,NULL,'18821205026',NULL,NULL,0,NULL,NULL,NULL,NULL,1,NULL,'2018-03-28 09:26:39','2018-03-29 08:18:54','王俊凯','待审批','3000-test','春申路店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(17,'10101',NULL,'$2a$10$vN8u8j5VJGtcAoEPEpTH.ePiMI8gJn/Y/CoONqgt4.ikayA6A9I72','11111111111','staff',1,NULL,NULL,'11111111111',NULL,'VVhBVrLEQewNibdBubzPcXxQDQ5oAhYAmKCnTFjEFTjlIoieBXolYvFxD/iavNC5+gERbSfuyAeNH6AW/zWzuw==',5,'2018-03-29 10:38:12','223.104.210.78','2018-03-29 01:06:35','116.233.50.28',0,NULL,'2018-03-28 10:01:44','2018-03-29 10:38:12','销售一','待审批','3000-test','莲花南路店','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(18,'10011',NULL,'$2a$10$MWUbK3g8oz6.rlsaQ5zy6u2X0aqIjhvdXGM3YDU8WfLuefuzJffYe','13020111111','staff',1,NULL,NULL,'13033333333',NULL,'7ciQk/xkwa1o67HIlvTh4nOqqTYXCo7Vb+BmhhmYvCayRyW5ejkJbh8PK7lvD8nFqT7g9X+A154IY3HyOjSt4Q==',1,'2018-03-28 10:53:42','58.32.3.115',NULL,NULL,0,NULL,'2018-03-28 10:53:24','2018-03-29 08:18:54','123','待审批','9000-test',NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',2),(19,'1010101',NULL,'$2a$10$AG3HLbzgOhavShzvJkJQSugfb5erUbuEgcVc6MH5ZBILinbbu4Sv6','11111111111','outworker',NULL,2,17,NULL,NULL,'xHu0ucISoybI7TgLvjcTEPShrEHXxwP33c6EhgSD+gaUfxPCfZvkg3t9NnJiQe2lup95uyie5CrVyJYMJZyJkA==',8,'2018-03-29 07:56:28','58.32.3.118','2018-03-29 07:42:50','58.32.3.118',0,NULL,'2018-03-29 01:02:47','2018-03-29 08:18:54','促销一','已审批',NULL,NULL,'http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',NULL),(20,'909090','admin@example.com','$2a$10$MgA1c5g5mBc1lYbpH5fXTuQFfVgpS4bqfRB7JCELyP.QpfV00C1FK','18821205026','staff',1,NULL,NULL,'13919999999',NULL,'ZnNSHiNsJA3uamJ6nSR/tAD55yZJgT2b65AupgW08urSnPqLIoasJ2VkG8VjtzXnnlEjo3IlN8kmO/ixcrzvJA==',1,'2018-03-29 01:07:26','183.193.27.70',NULL,NULL,0,NULL,'2018-03-29 01:07:15','2018-03-31 06:44:17','张小凡','已审批','9000-test','','http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg',2),(21,'654321',NULL,'$2a$10$tmyL6m/GC7e3GzO8jcPFZOvPShfOs6qIEj9d3Lu/kdfQgXeF4PNE2','18821205026','staff',1,NULL,NULL,'13818888888',NULL,'QvyaaD+fyorB0fPKlr82VMSo98yg5ESK4HpLyqyCC4kP0V7Bu+W/KQ2E+HuksqsPUCVOIXteJHgC9y+BkzaZUg==',1,'2018-03-29 10:38:44','180.155.31.14',NULL,NULL,1,NULL,'2018-03-29 10:38:31','2018-03-30 16:56:41','all','待审批','9000-test',NULL,NULL,2),(22,'1009',NULL,'$2a$10$LmsZiu/lQ0ubgL8XygQkQ.ofGnzEOxJFSDxVAsB9at3ozo9DXsAna','13020112962','outworker',NULL,2,1,NULL,NULL,'rwnzcWx3SkgSCyAIjqo/ENQr6j1GOtu822RWoXuTmuCXXcBmBhHqqzdVv/a4fjjnqXPG76LV6+19TSf7PXxbNw==',1,'2018-03-30 03:05:27','58.32.3.115',NULL,NULL,0,NULL,'2018-03-30 03:04:54','2018-03-31 01:21:15','林志炫','已审批',NULL,NULL,NULL,NULL),(23,'12121212','oDQVQ0QL5RGdxrCd_D2cPZol39jE','$2a$10$PfMNZbGWxkDkFbsidLIwcuYNrowa3xZSd4ThtPIqcSjr0zLWU0W3.','13311700675','staff',1,NULL,NULL,'13919999999',NULL,'G9MtvyyWLhx35M0TeafSdwvQkV3NAEVoawK86o+6tsQaR9GtG+C/5MuR2G3zI8K0+Fa/KWUCrrRKZgT3MReIMw==',1,'2018-03-30 16:58:48','183.193.27.70',NULL,NULL,0,NULL,'2018-03-30 16:58:34','2018-03-30 16:58:53','roywl','待审批','9000-test',NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRJBkqhXIC3ZcOgjhVQrGEYH7LOLMeQPOkPyyIIJFXLh3m33TZUBqL6yIibsMJUibLZLgcB5ZyELxg/132',2),(24,'555555',NULL,'$2a$10$6VN39x3fNumDhYqHhbIce.NS2TGkAQsyiqYW4z54WaRESlCasVyYq','18821205026','outworker',NULL,3,23,NULL,NULL,'uhHNiClVwHRBvOonZtRF8r+TFUOpmTnruy3Pj0jNN547oDxJGi6+5OylY1qmfhI1HldHLYMm1GAsr5bNpyNSdg==',1,'2018-03-30 17:06:13','183.193.27.70',NULL,NULL,0,NULL,'2018-03-30 17:05:28','2018-03-30 17:06:13','一一','待审批',NULL,NULL,NULL,NULL),(25,'jack1992','admin@example.com','$2a$10$ZexU5z4muBW9Rcrpy3CqXuPP5301hjCfQp/TPPNMAr.OEYvrEQOcu','13162359917','staff',1,NULL,NULL,'13162359917',NULL,'AcewYHvcmbO7bjDA1ZFTDpOuYrmlBUgExTmugI74NoKeqGGKKsA7bPuUKrtdJfUXqETI0TzEKCO7L1VY14c9pw==',8,'2018-03-31 09:24:25','223.166.216.110','2018-03-31 09:10:58','223.166.216.110',0,NULL,'2018-03-31 06:44:20','2018-03-31 09:24:25','jack','已审批','9000-test','',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_events`
--

DROP TABLE IF EXISTS `users_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_events`
--

LOCK TABLES `users_events` WRITE;
/*!40000 ALTER TABLE `users_events` DISABLE KEYS */;
INSERT INTO `users_events` VALUES (1,1,1,'2018-03-29 02:23:47','2018-03-29 02:23:47'),(2,20,1,'2018-03-29 02:37:51','2018-03-29 02:37:51'),(3,19,1,'2018-03-29 04:18:48','2018-03-29 04:18:48'),(4,12,1,'2018-03-29 07:42:31','2018-03-29 07:42:31'),(5,14,1,'2018-03-29 07:45:57','2018-03-29 07:45:57'),(6,1,6,'2018-03-30 08:11:00','2018-03-30 08:11:00'),(7,14,7,'2018-03-30 08:45:55','2018-03-30 08:45:55'),(8,1,7,'2018-03-30 10:45:39','2018-03-30 10:45:39'),(9,14,6,'2018-03-30 16:57:11','2018-03-30 16:57:11'),(10,23,6,'2018-03-30 16:59:47','2018-03-30 16:59:47'),(11,23,1,'2018-03-30 17:01:36','2018-03-30 17:01:36'),(12,23,5,'2018-03-30 17:02:07','2018-03-30 17:02:07'),(13,23,7,'2018-03-30 17:02:21','2018-03-30 17:02:21'),(14,24,1,'2018-03-30 17:06:28','2018-03-30 17:06:28'),(15,24,7,'2018-03-30 17:07:50','2018-03-30 17:07:50'),(16,24,6,'2018-03-30 17:07:52','2018-03-30 17:07:52'),(17,2,1,'2018-03-31 01:12:09','2018-03-31 01:12:09'),(18,2,7,'2018-03-31 01:12:18','2018-03-31 01:12:18'),(19,25,1,'2018-03-31 06:50:32','2018-03-31 06:50:32'),(20,25,6,'2018-03-31 07:20:45','2018-03-31 07:20:45'),(21,1,5,'2018-03-31 08:42:15','2018-03-31 08:42:15'),(22,25,5,'2018-03-31 09:53:00','2018-03-31 09:53:00'),(23,25,7,'2018-03-31 09:55:35','2018-03-31 09:55:35');
/*!40000 ALTER TABLE `users_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_sessions`
--

DROP TABLE IF EXISTS `wechat_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `hash_store` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_wechat_sessions_on_openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_sessions`
--

LOCK TABLES `wechat_sessions` WRITE;
/*!40000 ALTER TABLE `wechat_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-31 18:40:02
