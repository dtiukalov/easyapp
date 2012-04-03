/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 6.0.0-alpha-community-nt-debug : Database - xumu
*********************************************************************
Server version : 6.0.0-alpha-community-nt-debug
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `xumu`;

USE `xumu`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `app_dict` */

DROP TABLE IF EXISTS `app_dict`;

CREATE TABLE `app_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_dict` */

insert  into `app_dict`(`id`,`key`,`value`,`type`,`pinyin`) values (1,'article.state.normal','普通','article.state','putong'),(2,'article.state.recommand','推荐','article.state','tuijian'),(3,'article.state.top','置顶','article.state','zhiding'),(4,'ascii','ACSII码','regex','acsii'),(5,'bookcar.state.false','未确认','bookcar.state','weiqueren'),(6,'bookcar.state.true','确认','bookcar.state','queren'),(7,'bookcar.type.bookcar','订车','bookcar.type','dingche'),(8,'bookcar.type.change','置换','bookcar.type','zhihuan'),(9,'bookcar.type.drive','试驾','bookcar.type','shijia'),(10,'boolean.false','否','boolean','fou'),(11,'boolean.true','是','boolean','shi'),(12,'car.dongfenghonda','东风本田','car','dongfengbentian'),(13,'car.dongfenghonda.civic','思域','car.dongfenghonda','siyu'),(14,'car.dongfenghonda.crv','CRV','car.dongfenghonda','crv'),(15,'car.dongfenghonda.crv.1','系列一','car.dongfenghonda.crv','xilieyi'),(16,'car.dongfenghonda.crv.2','系列二','car.dongfenghonda.crv','xilieer'),(17,'car.dongfenghonda.spirior','思铂睿','car.dongfenghonda','siborui'),(18,'car.dongfengnissan','东风尼桑','car','dongfengnisang'),(19,'car.yiqivw','一汽大众','car','yiqidazhong'),(20,'chinese','中文','regex','zhengwen'),(21,'column.type.decimal','decimal','column.type','decimal'),(22,'column.type.int','int','column.type','int'),(23,'column.type.varchar','varchar','column.type','varchar'),(24,'content.mode.more','多项','content.mode','duoxiang'),(25,'content.mode.none','空项','content.mode','kongxiang'),(26,'content.mode.one','单项','content.mode','danxiang'),(28,'decmal','浮点数','regex','fudianshu'),(29,'email','邮箱','regex','youxiang'),(30,'flow.node.approve','回退节点','flow.node','huituijiedian'),(31,'flow.node.create','创建节点','flow.node','chuangjianjiedian'),(32,'flow.node.process','过程节点','flow.node','guochengjiedian'),(33,'flow.node.realize','结束节点','flow.node','jieshujiedian'),(34,'form.type.creater','创建者','form.type','chuangjianzhe'),(35,'form.type.datebox','日期','form.type','riqi'),(36,'form.type.datetime','日期时间','form.type','riqishijian'),(37,'form.type.textarea','文本域','form.type','wenbenyu'),(38,'form.type.combox','单选框','form.type','danxuankuang'),(39,'id','标识','regex','biaoshi'),(40,'idcard','身份证','regex','shenfenzheng'),(41,'integer','整数','regex','zhengshu'),(42,'letter','字母','regex','zimu'),(43,'loginId','登录标识','regex','denglubiaoshi'),(44,'message.state.false','未回复','message.state','weihuifu'),(45,'message.state.true','已回复','message.state','yihuifu'),(46,'node.condition.auth','权限','node.condition.model','qanxian'),(47,'node.condition.auth.department','组织机构','node.condition.auth','bumen'),(48,'node.condition.auth.role','角色','node.condition.auth','juese'),(49,'node.condition.auth.user','用户','node.condition.auth','yonghu'),(50,'node.condition.workflow','工作流','node.condition.model','chuangjianzhe'),(51,'node.condition.creater.department','部门负责人','node.condition.creater','bumenfuzeren'),(52,'node.condition.creater.self','本人','node.condition.creater','zhuangjianzhe'),(53,'notempty','非空','regex','feikong'),(54,'number','数字','regex','shuzi'),(55,'phone','手机电话','regex','shouji'),(56,'picture','图片','regex','tupian'),(57,'qq','QQ号','regex','qq'),(58,'rar','压缩文件','regex','yasuowenjian'),(59,'tel','座机电话','regex','zuoji'),(60,'url','URL','regex','url'),(61,'visible.false','隐藏','visible','yinchang'),(62,'visible.true','显示','visible','xianshi'),(63,'zipcode','邮编','regex','youbian'),(64,'只读','只读','node.state','zhidu'),(65,'必填','必填','node.state','bitian'),(66,'选填','选填','node.state','xuantian'),(67,'隐藏','隐藏','node.state','yincang'),(68,'yes','同意','advise','tongyi'),(69,'no','不同意','advise','butongyi'),(70,'form.type.input','输入框','form.type','shurukuang'),(71,'node.condition.creater.department.people','同部门','node.condition.creater','tongbumen'),(75,'node.condition.creater','创建者','node.condition.workflow','chuangjianzhe'),(86,'申报','申报','sldb.state.type','shenbao'),(87,'初审','初审','sldb.state.type','chushen'),(88,'核对','核对','sldb.state.type','hedui'),(89,'驳回','驳回','sldb.state.type','bohui'),(90,'通过','通过','sldb.state.type','tongguo'),(91,'农村低保收入','农村低保收入','sldb.person.type','nongcundibaoshouru'),(92,'城镇低保收入','城镇低保收入','sldb.person.type','chegnzhendibaoshouru'),(93,'农村低保','农村低保','sldb.person.type','nongcundibao'),(94,'城镇低保','城镇低保','sldb.person.type','chengzhendibao'),(95,'女','女','gender','nv'),(96,'男','男','gender','nan'),(97,'是','是','easyboolean','shi'),(98,'否','否','easyboolean','fou'),(102,'非农','非农','sldb.hukou','none'),(103,'农业','农业','sldb.hukou','none'),(104,'其他','其他','sldb.home','none'),(105,'农转非家庭','农转非家庭','sldb.home','none'),(106,'因残致贫家庭','因残致贫家庭','sldb.home','none'),(107,'年老体弱家庭','年老体弱家庭','sldb.home','none'),(108,'子女就学（升学）困难家庭','子女就学（升学）困难家庭','sldb.home','none'),(109,'因灾致贫家庭','因灾致贫家庭','sldb.home','none'),(110,'因病致贫家庭','因病致贫家庭','sldb.home','none'),(111,'三无人员家庭','三无人员家庭','sldb.home','none'),(112,'丧偶','丧偶','sldb.marry','none'),(113,'离异','离异','sldb.marry','none'),(114,'未婚','未婚','sldb.marry','none'),(115,'已婚','已婚','sldb.marry','none'),(116,'完全劳动能力','完全劳动能力','sldb.workable','none'),(117,'部分劳动能力','部分劳动能力','sldb.workable','none'),(118,'无劳动能力','无劳动能力','sldb.workable','none'),(119,'其他','其他','sldb.idType','none'),(120,'孤儿','孤儿','sldb.idType','none'),(121,'大学在校生','大学在校生','sldb.idType','none'),(122,'高中在校生','高中在校生','sldb.idType','none'),(123,'中学在校生','中学在校生','sldb.idType','none'),(124,'小学在校生','小学在校生','sldb.idType','none'),(125,'无业','无业','sldb.idType','none'),(126,'退休','退休','sldb.idType','none'),(127,'在职','在职','sldb.idType','none'),(128,'其他特殊病种','其他特殊病种','sldb.ill','none'),(129,'红斑狼疮','红斑狼疮','sldb.ill','none'),(130,'腰间盘突出','腰间盘突出','sldb.ill','none'),(131,'股骨头坏死','股骨头坏死','sldb.ill','none'),(132,'气管炎','气管炎','sldb.ill','none'),(133,'哮喘','哮喘','sldb.ill','none'),(134,'精神病','精神病','sldb.ill','none'),(135,'肺结核','肺结核','sldb.ill','none'),(136,'白血病','白血病','sldb.ill','none'),(137,'类风湿疾病','类风湿疾病','sldb.ill','none'),(138,'糖尿病','糖尿病','sldb.ill','none'),(139,'重症肝病','重症肝病','sldb.ill','none'),(140,'脑血栓','脑血栓','sldb.ill','none'),(141,'脑出血','脑出血','sldb.ill','none'),(142,'心脏病','心脏病','sldb.ill','none'),(143,'肾功能衰竭','肾功能衰竭','sldb.ill','none'),(144,'癌症','癌症','sldb.ill','none'),(145,'其他残疾','其他残疾','sldb.deformity','none'),(146,'多重残疾','多重残疾','sldb.deformity','none'),(147,'精神残疾','精神残疾','sldb.deformity','none'),(148,'智力残疾','智力残疾','sldb.deformity','none'),(149,'肢体残疾','肢体残疾','sldb.deformity','none'),(150,'言语残疾','言语残疾','sldb.deformity','none'),(151,'听力残疾','听力残疾','sldb.deformity','none'),(152,'视力残疾','视力残疾','sldb.deformity','none'),(153,'一级','一级','sldb.deformityLevel','none'),(154,'二级','二级','sldb.deformityLevel','none'),(155,'三级','三级','sldb.deformityLevel','none'),(156,'四级','四级','sldb.deformityLevel','none'),(157,'五级','五级','sldb.deformityLevel','none'),(158,'其他','其他','sldb.companyType','none'),(159,'地方集体','地方集体','sldb.companyType','none'),(160,'地方国有','地方国有','sldb.companyType','none'),(161,'省直集体','省直集体','sldb.companyType','none'),(162,'省直国有','省直国有','sldb.companyType','none'),(163,'中直集体','中直集体','sldb.companyType','none'),(164,'中直国有','中直国有','sldb.companyType','none'),(165,'其他','其他','sldb.trade','none'),(166,'轻化','轻化','sldb.trade','none'),(167,'建筑','建筑','sldb.trade','none'),(168,'地矿','地矿','sldb.trade','none'),(169,'机械军工','机械军工','sldb.trade','none'),(170,'农垦','农垦','sldb.trade','none'),(171,'冶金','冶金','sldb.trade','none'),(172,'森工','森工','sldb.trade','none'),(173,'煤炭','煤炭','sldb.trade','none'),(174,'其他保险','其他保险','sldb.insurance','none'),(175,'商业保险','商业保险','sldb.insurance','none'),(176,'工伤保险','工伤保险','sldb.insurance','none'),(177,'生育保险','生育保险','sldb.insurance','none'),(178,'失业保险','失业保险','sldb.insurance','none'),(179,'医疗保险','医疗保险','sldb.insurance','none'),(180,'养老保险','养老保险','sldb.insurance','none'),(181,'否','否','sldb.insurance','none');

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `parentId` varchar(100) DEFAULT NULL,
  `sort` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('configuration.table','管理表','/app/system/easyform/table/show.jsp','configuration',41),('workflow','管理工作流','/app/workflow/info/show.jsp','configuration',42),('configuration.workflow.instance','管理工作流实例','/app/workflow/runtime/instance/show.jsp','configuration',43),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57);

/*Table structure for table `auth_organizations` */

DROP TABLE IF EXISTS `auth_organizations`;

CREATE TABLE `auth_organizations` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `responsible` varchar(50) DEFAULT '否',
  `parentId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_organizations` */

insert  into `auth_organizations`(`id`,`name`,`description`,`responsible`,`parentId`) values (3,'畜牧局','','否',NULL),(9,'人事副总','','否','3'),(11,'人事部长','','是','10'),(12,'人事部副部长','','否','10'),(13,'人事部助理','','否','10'),(14,'人事部成员','','否','10'),(16,'销售部长','','是','15'),(17,'管辖','','否',NULL),(18,'养殖户','','否','17');

/*Table structure for table `auth_re_organization_resource` */

DROP TABLE IF EXISTS `auth_re_organization_resource`;

CREATE TABLE `auth_re_organization_resource` (
  `organizationId` int(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL,
  PRIMARY KEY (`organizationId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_organization_resource` */

/*Table structure for table `auth_re_organization_user` */

DROP TABLE IF EXISTS `auth_re_organization_user`;

CREATE TABLE `auth_re_organization_user` (
  `organizationId` int(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  PRIMARY KEY (`organizationId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_organization_user` */

insert  into `auth_re_organization_user`(`organizationId`,`userId`) values (11,'zhangsan'),(12,'admin'),(16,'lisi'),(18,'wangqian');

/*Table structure for table `auth_re_role_resource` */

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` int(100) NOT NULL,
  `resourceId` varchar(100) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  PRIMARY KEY (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_role_resource` */

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values (1,'auth'),(1,'auth.change.password'),(1,'auth.organization'),(1,'auth.resource'),(1,'auth.role'),(1,'auth.user'),(1,'car'),(1,'car.admin.bookcar'),(1,'car.admin.newcar'),(1,'car.bookcar'),(1,'car.newcar'),(1,'configuration'),(1,'configuration.dict'),(1,'configuration.table'),(1,'configuration.workflow.instance'),(1,'website'),(1,'website.article'),(1,'website.content'),(1,'website.editcontent'),(1,'website.message'),(1,'workflow'),(2,'workstation'),(2,'workstation.done'),(2,'workstation.over'),(2,'workstation.tobe');

/*Table structure for table `auth_re_user_resource` */

DROP TABLE IF EXISTS `auth_re_user_resource`;

CREATE TABLE `auth_re_user_resource` (
  `userId` varchar(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_resource` */

insert  into `auth_re_user_resource`(`userId`,`resourceId`) values ('1','auth'),('1','auth.organization'),('1','auth.reportData'),('1','auth.reportView'),('1','auth.resource'),('1','auth.role'),('1','auth.user'),('1','configuration'),('1','configuration.dict'),('1','test'),('admin','testWorkflow'),('rongzhan','auth.change.password'),('rongzhan','car'),('rongzhan','car.admin.bookcar'),('rongzhan','car.admin.newcar'),('rongzhan','website'),('rongzhan','website.editcontent');

/*Table structure for table `auth_re_user_role` */

DROP TABLE IF EXISTS `auth_re_user_role`;

CREATE TABLE `auth_re_user_role` (
  `userId` varchar(100) CHARACTER SET gb2312 NOT NULL,
  `roleId` int(100) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_user_role` */

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin',1),('admin',2);

/*Table structure for table `auth_roles` */

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_roles` */

insert  into `auth_roles`(`id`,`name`,`description`) values (1,'超级管理员','拥有所有权限'),(2,'工作流','');

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

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','lueSGJZetyySpUndWjMBEg==','guyuzmq@gmail.com','18943630044'),('lisi','李四','lueSGJZetyySpUndWjMBEg==','11@11.11','13511111111'),('wangqian','王前','lueSGJZetyySpUndWjMBEg==','w@w.c','13596160570'),('zhangsan','张三','lueSGJZetyySpUndWjMBEg==','1111@11.11','13599999999');

/*Table structure for table `xm_farmer` */

DROP TABLE IF EXISTS `xm_farmer`;

CREATE TABLE `xm_farmer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `opId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xm_farmer` */

insert  into `xm_farmer`(`id`,`userId`,`userName`,`createTime`,`opId`) values (1,'wangqian','王前','2012-04-02 15:39:33','1333352371860_wangqian');

/*Table structure for table `xm_farmer_forage` */

DROP TABLE IF EXISTS `xm_farmer_forage`;

CREATE TABLE `xm_farmer_forage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opId` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xm_farmer_forage` */

/*Table structure for table `xm_farmer_pig` */

DROP TABLE IF EXISTS `xm_farmer_pig`;

CREATE TABLE `xm_farmer_pig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opId` varchar(100) DEFAULT NULL,
  `opType` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xm_farmer_pig` */

insert  into `xm_farmer_pig`(`id`,`opId`,`opType`,`type`,`num`,`price`,`total`,`userName`,`createTime`) values (1,'1333352371860_wangqian','新增','仔猪',11,'22.00','233.00','王前','2012-04-02 15:39:33'),(2,'1333352371860_wangqian','新增','育肥猪',2,'33.00','33.00','王前','2012-04-02 15:39:33');

/*Table structure for table `xm_farmer_spend` */

DROP TABLE IF EXISTS `xm_farmer_spend`;

CREATE TABLE `xm_farmer_spend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opId` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xm_farmer_spend` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
