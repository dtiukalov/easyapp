/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.1.31-community : Database - app
*********************************************************************
Server version : 5.1.31-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `app`;

USE `app`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `app_dict` */

DROP TABLE IF EXISTS `app_dict`;

CREATE TABLE `app_dict` (
  `id` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_dict` */

insert  into `app_dict`(`id`,`value`,`type`,`pinyin`) values ('article.state.normal','普通','article.state','putong'),('article.state.recommand','推荐','article.state','tuijian'),('article.state.top','置顶','article.state','zhiding'),('content.mode.more','多项','content.mode','duoxiang'),('content.mode.none','空项','content.mode','kongxiang'),('content.mode.one','单项','content.mode','danxiang'),('visible.false','隐藏','visible','yinchang'),('visible.true','显示','visible','xianshi');

/*Table structure for table `app_dict_test` */

DROP TABLE IF EXISTS `app_dict_test`;

CREATE TABLE `app_dict_test` (
  `test1` varchar(20) DEFAULT NULL,
  `test2` varchar(20) DEFAULT NULL,
  `test3` varchar(20) DEFAULT NULL,
  `test4` varchar(20) DEFAULT NULL,
  `test1Name` varchar(20) DEFAULT NULL,
  `test3Name` varchar(20) DEFAULT NULL,
  `test2Name` varchar(20) DEFAULT NULL,
  `test4Name` varchar(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_dict_test` */

insert  into `app_dict_test`(`test1`,`test2`,`test3`,`test4`,`test1Name`,`test3Name`,`test2Name`,`test4Name`,`id`) values ('22','1','11','112','长春分公司','管理员','角色','分公司管理员',110);

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `parentId` varchar(100) DEFAULT NULL,
  `sort` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('website','管理网站','',NULL,8),('website.content','管理目录','/app/website/content/show.jsp','website',14),('website.article','管理文章','/app/website/article/show.jsp','website',32);

/*Table structure for table `auth_organizations` */

DROP TABLE IF EXISTS `auth_organizations`;

CREATE TABLE `auth_organizations` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parentId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_organizations` */

insert  into `auth_organizations`(`id`,`name`,`description`,`parentId`) values ('1','开发部','开发部1',''),('2','轻轨开发部','轻轨开发部','1'),('3','在线考试开发部','在线考试开发部','1'),('hr','人力资源部门','',NULL),('hr.some','东东','反反复复','hr');

/*Table structure for table `auth_re_organization_resource` */

DROP TABLE IF EXISTS `auth_re_organization_resource`;

CREATE TABLE `auth_re_organization_resource` (
  `organizationId` varchar(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL,
  PRIMARY KEY (`organizationId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_organization_resource` */

insert  into `auth_re_organization_resource`(`organizationId`,`resourceId`) values ('1','auth.resource'),('1','auth.role'),('1','auth.user');

/*Table structure for table `auth_re_organization_user` */

DROP TABLE IF EXISTS `auth_re_organization_user`;

CREATE TABLE `auth_re_organization_user` (
  `organizationId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  PRIMARY KEY (`organizationId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_organization_user` */

insert  into `auth_re_organization_user`(`organizationId`,`userId`) values ('1','1'),('1','admin'),('2','1'),('2','3'),('3','2'),('3','3');

/*Table structure for table `auth_re_role_resource` */

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` varchar(100) CHARACTER SET gb2312 NOT NULL,
  `resourceId` varchar(100) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  PRIMARY KEY (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_role_resource` */

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values ('super.admin','auth'),('super.admin','auth.organization'),('super.admin','auth.resource'),('super.admin','auth.role'),('super.admin','auth.user'),('super.admin','configuration'),('super.admin','configuration.dict'),('super.admin','test'),('super.admin','test.dict'),('super.admin','test.highcharts.basic'),('super.admin','test.highcharts.sameData'),('super.admin','test.report'),('super.admin','website'),('super.admin','website.article'),('super.admin','website.content');

/*Table structure for table `auth_re_user_resource` */

DROP TABLE IF EXISTS `auth_re_user_resource`;

CREATE TABLE `auth_re_user_resource` (
  `userId` varchar(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_resource` */

insert  into `auth_re_user_resource`(`userId`,`resourceId`) values ('1','auth'),('1','auth.organization'),('1','auth.reportData'),('1','auth.reportView'),('1','auth.resource'),('1','auth.role'),('1','auth.user'),('1','configuration'),('1','configuration.dict'),('1','test'),('1','test.dict'),('1','test.highcharts.basic'),('1','test.highcharts.sameData'),('1','test.report'),('2','auth'),('2','auth.organization'),('2','auth.resource'),('2','auth.role'),('23','test'),('3','auth'),('3','auth.reportData'),('3','auth.reportView'),('3','auth.role'),('3','auth.user');

/*Table structure for table `auth_re_user_role` */

DROP TABLE IF EXISTS `auth_re_user_role`;

CREATE TABLE `auth_re_user_role` (
  `userId` varchar(100) CHARACTER SET gb2312 NOT NULL,
  `roleId` varchar(100) CHARACTER SET gb2312 NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_role` */

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin','super.admin');

/*Table structure for table `auth_roles` */

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `Id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_roles` */

insert  into `auth_roles`(`Id`,`name`,`description`) values ('super.admin','超级管理员','拥有所有权限');

/*Table structure for table `auth_users` */

DROP TABLE IF EXISTS `auth_users`;

CREATE TABLE `auth_users` (
  `Id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_users` */

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','111111','','');

/*Table structure for table `report_data` */

DROP TABLE IF EXISTS `report_data`;

CREATE TABLE `report_data` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `sqlSrc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `report_data` */

insert  into `report_data`(`id`,`name`,`sqlSrc`) values ('1','test',NULL),('ede','e','edfdffdf'),('ere','ee','ererere');

/*Table structure for table `report_view` */

DROP TABLE IF EXISTS `report_view`;

CREATE TABLE `report_view` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `dataId` varchar(100) DEFAULT NULL,
  `col` varchar(500) DEFAULT NULL,
  `row` varchar(500) DEFAULT NULL,
  `chart` varchar(200) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `report_view` */

insert  into `report_view`(`id`,`name`,`title`,`dataId`,`col`,`row`,`chart`,`path`) values ('1','价格','价格标题','1','列','行',NULL,NULL),('3','种类1','苹果1','1','橘子1','香蕉1','test1',NULL);

/*Table structure for table `sz_reporttest` */

DROP TABLE IF EXISTS `sz_reporttest`;

CREATE TABLE `sz_reporttest` (
  `ID` int(11) NOT NULL COMMENT '用户ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '用户名称',
  `CARD` varchar(36) DEFAULT NULL COMMENT '用户身份证号',
  `CORP` varchar(100) DEFAULT NULL COMMENT '用户单位',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `BIRTH` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `EDU` varchar(40) DEFAULT NULL COMMENT '学历',
  `SPEC` varchar(100) DEFAULT NULL COMMENT '专业',
  `SKILL` varchar(200) DEFAULT NULL COMMENT '专业技能',
  `FORLEVEL` varchar(200) DEFAULT NULL COMMENT '外语水平',
  `EXPERIENCE` varchar(200) DEFAULT NULL COMMENT '主要社会经验',
  `HONOR` varchar(200) DEFAULT NULL COMMENT '个人荣誉',
  `APPRAISE` varchar(200) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sz_reporttest` */

insert  into `sz_reporttest`(`ID`,`NAME`,`CARD`,`CORP`,`SEX`,`TEL`,`BIRTH`,`EDU`,`SPEC`,`SKILL`,`FORLEVEL`,`EXPERIENCE`,`HONOR`,`APPRAISE`) values (1,'王佛儿','123456798','中土神州','男','111222333','1984-06-22','大学本科','微电子','C语言，离散数学，JAVA语言，数据结构，操作系统，系统结构，编译原理，数据库原理，计算机网络。','2002年通过国家大学英语四级考试， 2003年通过国家大学英语六级考试。 有较强的听说读写能力。','大一，大二参加社会实践活动，做过代课老师和家教。','热心公益事业，无偿献血200CC。大二获得“新鲜风采新鲜人”大赛优胜奖。','我是一个认真而严谨的人，勤奋而负有责任感，认准的事情很少会改变或气馁，做事深思熟虑，信守承诺并值得信赖。'),(2,'李药师','999888777','大乾皇朝','男','666555444333222111','1964-10-22','小学毕业','数据库','oracle，mysql，sqlserver','ocp，ocm','无','东方红','军道杀拳'),(3,'太泉伤','222555888','西狄边陲','男','666222444','1988-06-08','高中肄业','网络工程','网络分析，网络管理，网络游戏','日出东方','天天向上','一江春水向东流！','东边日出西边雨，道是无晴却有晴！');

/*Table structure for table `web_article` */

DROP TABLE IF EXISTS `web_article`;

CREATE TABLE `web_article` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `text` varchar(5000) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateName` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `operater` varchar(100) DEFAULT NULL,
  `operaterName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `web_article` */

insert  into `web_article`(`id`,`cid`,`title`,`text`,`type`,`typeName`,`state`,`stateName`,`count`,`createTime`,`operater`,`operaterName`) values (13,'rongzhan.about.speak','董事长致辞','大家吃好喝好，喝好吃好','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:38:58','admin','管理员'),(14,'rongzhan.about.introduce','集团介绍','这是一个集团介绍，介绍啥呢','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:40:00','admin','管理员'),(15,'rongzhan.about.glory','企业荣誉','企业老多荣誉了！\r\n真滴！11','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:41:09','admin','管理员'),(16,'rongzhan.about.structure','组织架构','什么组织呢？','article.state.normal','普通','visible.true','显示',0,'2011-09-27 03:16:34','admin','管理员');

/*Table structure for table `web_content` */

DROP TABLE IF EXISTS `web_content`;

CREATE TABLE `web_content` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `english` varchar(100) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `parentId` varchar(100) DEFAULT NULL,
  `sort` int(11) NOT NULL AUTO_INCREMENT,
  `hasShow` varchar(100) DEFAULT NULL,
  `hasShowName` varchar(100) DEFAULT NULL,
  `mode` varchar(100) DEFAULT 'content.mode.one',
  `modeName` varchar(100) DEFAULT '单一',
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `web_content` */

insert  into `web_content`(`id`,`name`,`english`,`path`,`parentId`,`sort`,`hasShow`,`hasShowName`,`mode`,`modeName`) values ('rongzhan','融展集团','','',NULL,1,'visible.true','显示','content.mode.none','空项'),('rongzhan.home','首页','Home','index.jsp','rongzhan',22,'visible.true','显示','content.mode.none','空项'),('rongzhan.about','集团介绍','About','about.jsp','rongzhan',23,'visible.true','显示','content.mode.none','空项'),('rongzhan.new','新闻中心','New','new.jsp','rongzhan',29,'visible.true','显示','content.mode.none','空项'),('rongzhan.service','集团服务','Services','service.jsp','rongzhan',30,'visible.true','显示','content.mode.none','空项'),('rongzhan.insurance','保险中心','Insurance','insurance.jsp','rongzhan',31,'visible.true','显示','content.mode.none','空项'),('rongzhan.loan','分期贷款','Loan','loan.jsp','rongzhan',32,'visible.true','显示','content.mode.none','空项'),('rongzhan.hr','人才招聘','HR','hr.jsp','rongzhan',33,'visible.true','显示','content.mode.none','空项'),('rongzhan.contact','联系我们','Contact','contact.jsp','rongzhan',34,'visible.true','显示','content.mode.none','空项'),('rongzhan.about.speak','董事长致辞','Speak','','rongzhan.about',35,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.introduce','集团介绍','Introduce','','rongzhan.about',36,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.course','发展历程','Course','','rongzhan.about',37,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.glory','企业荣誉','Glory','','rongzhan.about',38,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.structure','组织架构','Structur','','rongzhan.about',39,'visible.true','显示','content.mode.one','单项'),('rongzhan.new.enterprise','企业新闻','Enterprise','','rongzhan.new',40,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.car','行业新闻','Car','','rongzhan.new',41,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.sall','促销新闻','Sall','','rongzhan.new',42,'visible.true','显示','content.mode.more','多项'),('rongzhan.service.test','验车中心','Test','','rongzhan.service',43,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.rescue','24小时救援','Rescue','','rongzhan.service',44,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.special','特殊服务','Special','','rongzhan.service',45,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.member','会员服务','Memer','','rongzhan.service',46,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.book','在线预约','Book','','rongzhan.service',47,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.sall','保险销售','Sall','','rongzhan.insurance',48,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.indemnify','保险理赔','Indemnify','','rongzhan.insurance',49,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.toyota','丰田金融','Toyota','','rongzhan.loan',50,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.gm','通用金融','GM','','rongzhan.loan',51,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.fw','大众金融','FW','','rongzhan.loan',52,'visible.true','显示','content.mode.one','单项');

/*Table structure for table `web_message` */

DROP TABLE IF EXISTS `web_message`;

CREATE TABLE `web_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateName` varchar(100) DEFAULT NULL,
  `hasShow` varchar(10) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `sendText` varchar(500) DEFAULT NULL,
  `sendEmail` varchar(100) DEFAULT NULL,
  `sendPhone` varchar(100) DEFAULT NULL,
  `sendName` varchar(100) DEFAULT NULL,
  `receiveTime` datetime DEFAULT NULL,
  `receiveText` varchar(500) DEFAULT NULL,
  `receiveOperater` varchar(100) DEFAULT NULL,
  `receiveOperaterName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `web_message` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
