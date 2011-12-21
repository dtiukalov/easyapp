# SQL Manager 2007 for MySQL 4.4.0.5
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : rongzhan


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `rongzhan`;

CREATE DATABASE `rongzhan`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `rongzhan`;

#
# Structure for the `app_dict` table : 
#

DROP TABLE IF EXISTS `app_dict`;

CREATE TABLE `app_dict` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `value` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `pinyin` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=196 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `app_form_item` table : 
#

DROP TABLE IF EXISTS `app_form_item`;

CREATE TABLE `app_form_item` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `showName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `defaultValue` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL,
  `tableId` INTEGER(11) DEFAULT NULL,
  `required` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `requiredName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `readonly` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `readonlyName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `hidden` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `hiddenName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `min` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `max` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `regex` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `regexName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `focusTip` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `func` VARCHAR(2000) COLLATE utf8_general_ci DEFAULT NULL,
  `dict` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `typeName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `render` VARCHAR(2000) COLLATE utf8_general_ci DEFAULT NULL,
  `formType` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=71 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `app_queryform_item` table : 
#

DROP TABLE IF EXISTS `app_queryform_item`;

CREATE TABLE `app_queryform_item` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `showName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `tableId` INTEGER(11) DEFAULT NULL,
  `condition` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `conditionName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `hidden` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `hiddenName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `sort` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `sortName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `width` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `format` VARCHAR(2000) COLLATE utf8_general_ci DEFAULT NULL,
  `dict` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `typeName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=27 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `app_resources` table : 
#

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `sort` INTEGER(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sort`)
)ENGINE=InnoDB
AUTO_INCREMENT=67 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `app_table` table : 
#

DROP TABLE IF EXISTS `app_table`;

CREATE TABLE `app_table` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `showName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=11 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `app_table_column` table : 
#

DROP TABLE IF EXISTS `app_table_column`;

CREATE TABLE `app_table_column` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `showName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `tableId` INTEGER(11) DEFAULT NULL,
  `type` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `typeName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `length` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  `defaultValue` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=46 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_organizations` table : 
#

DROP TABLE IF EXISTS `auth_organizations`;

CREATE TABLE `auth_organizations` (
  `id` INTEGER(100) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL,
  `responsible` VARCHAR(50) COLLATE utf8_general_ci DEFAULT '否',
  `parentId` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=17 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_re_organization_resource` table : 
#

DROP TABLE IF EXISTS `auth_re_organization_resource`;

CREATE TABLE `auth_re_organization_resource` (
  `organizationId` INTEGER(100) NOT NULL,
  `resourceId` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`organizationId`, `resourceId`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_re_organization_user` table : 
#

DROP TABLE IF EXISTS `auth_re_organization_user`;

CREATE TABLE `auth_re_organization_user` (
  `organizationId` INTEGER(100) NOT NULL,
  `userId` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`organizationId`, `userId`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_re_role_resource` table : 
#

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` INTEGER(100) NOT NULL,
  `resourceId` VARCHAR(100) COLLATE gb2312_chinese_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`roleId`, `resourceId`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_re_user_resource` table : 
#

DROP TABLE IF EXISTS `auth_re_user_resource`;

CREATE TABLE `auth_re_user_resource` (
  `userId` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `resourceId` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`, `resourceId`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_re_user_role` table : 
#

DROP TABLE IF EXISTS `auth_re_user_role`;

CREATE TABLE `auth_re_user_role` (
  `userId` VARCHAR(100) COLLATE gb2312_chinese_ci NOT NULL DEFAULT '',
  `roleId` INTEGER(100) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_roles` table : 
#

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `id` INTEGER(100) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=5 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `auth_users` table : 
#

DROP TABLE IF EXISTS `auth_users`;

CREATE TABLE `auth_users` (
  `Id` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `phone` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id` (`Id`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `car_bookcar` table : 
#

DROP TABLE IF EXISTS `car_bookcar`;

CREATE TABLE `car_bookcar` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `cid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `brand` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `brandName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `model` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `modelName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `series` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `seriesName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `license` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `phone` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `typeName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `text` VARCHAR(1000) COLLATE utf8_general_ci DEFAULT NULL,
  `bookTime` VARCHAR(30) COLLATE utf8_general_ci DEFAULT NULL,
  `createTime` DATETIME DEFAULT NULL,
  `state` VARCHAR(100) COLLATE utf8_general_ci DEFAULT 'bookcar.state.false',
  `stateName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT '未确认',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=25 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `car_newcar` table : 
#

DROP TABLE IF EXISTS `car_newcar`;

CREATE TABLE `car_newcar` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `cid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `brand` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `brandName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `model` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `modelName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `series` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `seriesName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `image` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `price` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `realPrice` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `gift` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `saller` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=10 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `web_article` table : 
#

DROP TABLE IF EXISTS `web_article`;

CREATE TABLE `web_article` (
  `id` INTEGER(100) NOT NULL AUTO_INCREMENT,
  `cid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `title` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `text` VARCHAR(10000) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `typeName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `state` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `stateName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `count` INTEGER(11) DEFAULT '0',
  `createTime` DATETIME DEFAULT NULL,
  `operater` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `operaterName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=106 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `web_content` table : 
#

DROP TABLE IF EXISTS `web_content`;

CREATE TABLE `web_content` (
  `id` VARCHAR(100) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `english` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `path` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `sort` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `hasShow` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `hasShowName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `mode` VARCHAR(100) COLLATE utf8_general_ci DEFAULT 'content.mode.one',
  `modeName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT '单一',
  PRIMARY KEY (`sort`)
)ENGINE=InnoDB
AUTO_INCREMENT=323 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Structure for the `web_message` table : 
#

DROP TABLE IF EXISTS `web_message`;

CREATE TABLE `web_message` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `cid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `state` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `stateName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `hasShow` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `hasShowName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `sendTime` DATETIME DEFAULT NULL,
  `sendText` VARCHAR(1000) COLLATE utf8_general_ci DEFAULT NULL,
  `sendEmail` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `sendPhone` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `sendName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `receiveTime` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `receiveText` VARCHAR(1000) COLLATE utf8_general_ci DEFAULT NULL,
  `receiveOperater` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `receiveOperaterName` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL,
  `type` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT=16 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 10240 kB';

#
# Data for the `app_dict` table  (LIMIT 0,500)
#

INSERT INTO `app_dict` (`id`, `key`, `value`, `type`, `pinyin`) VALUES 
  (1,'article.state.normal','普通','article.state','putong'),
  (2,'article.state.recommand','推荐','article.state','tuijian'),
  (3,'article.state.top','置顶','article.state','zhiding'),
  (4,'ascii','ACSII码','regex','acsii'),
  (5,'bookcar.state.false','未确认','bookcar.state','weiqueren'),
  (6,'bookcar.state.true','确认','bookcar.state','queren'),
  (7,'bookcar.type.bookcar','订车','bookcar.type','dingche'),
  (8,'bookcar.type.change','置换','bookcar.type','zhihuan'),
  (9,'bookcar.type.drive','试驾','bookcar.type','shijia'),
  (10,'boolean.false','否','boolean','fou'),
  (11,'boolean.true','是','boolean','shi'),
  (12,'car.dongfenghonda','东风本田','car','dongfengbentian'),
  (13,'car.dongfenghonda.civic','思域','car.dongfenghonda','siyu'),
  (14,'car.dongfenghonda.crv','CRV','car.dongfenghonda','crv'),
  (15,'car.dongfenghonda.crv.1','系列一','car.dongfenghonda.crv','xilieyi'),
  (16,'car.dongfenghonda.crv.2','系列二','car.dongfenghonda.crv','xilieer'),
  (17,'car.dongfenghonda.spirior','思铂睿','car.dongfenghonda','siborui'),
  (18,'car.dongfengnissan','东风尼桑','car','dongfengnisang'),
  (19,'car.yiqivw','一汽大众','car','yiqidazhong'),
  (20,'chinese','中文','regex','zhengwen'),
  (21,'column.type.decimal','decimal','column.type','decimal'),
  (22,'column.type.int','int','column.type','int'),
  (23,'column.type.varchar','varchar','column.type','varchar'),
  (24,'content.mode.more','多项','content.mode','duoxiang'),
  (25,'content.mode.none','空项','content.mode','kongxiang'),
  (26,'content.mode.one','单项','content.mode','danxiang'),
  (28,'decmal','浮点数','regex','fudianshu'),
  (29,'email','邮箱','regex','youxiang'),
  (30,'flow.node.approve','回退节点','flow.node','huituijiedian'),
  (31,'flow.node.create','创建节点','flow.node','chuangjianjiedian'),
  (32,'flow.node.process','过程节点','flow.node','guochengjiedian'),
  (33,'flow.node.realize','结束节点','flow.node','jieshujiedian'),
  (34,'form.type.creater','创建者','form.type','chuangjianzhe'),
  (35,'form.type.datebox','日期','form.type','riqi'),
  (36,'form.type.datetime','日期时间','form.type','riqishijian'),
  (37,'form.type.textarea','文本域','form.type','wenbenyu'),
  (38,'form.type.combox','单选框','form.type','danxuankuang'),
  (39,'id','标识','regex','biaoshi'),
  (40,'idcard','身份证','regex','shenfenzheng'),
  (41,'integer','整数','regex','zhengshu'),
  (42,'letter','字母','regex','zimu'),
  (43,'loginId','登录标识','regex','denglubiaoshi'),
  (44,'message.state.false','未回复','message.state','weihuifu'),
  (45,'message.state.true','已回复','message.state','yihuifu'),
  (46,'node.condition.auth','权限','node.condition.model','qanxian'),
  (47,'node.condition.auth.department','组织机构','node.condition.auth','bumen'),
  (48,'node.condition.auth.role','角色','node.condition.auth','juese'),
  (49,'node.condition.auth.user','用户','node.condition.auth','yonghu'),
  (50,'node.condition.workflow','工作流','node.condition.model','chuangjianzhe'),
  (51,'node.condition.creater.department','部门负责人','node.condition.creater','bumenfuzeren'),
  (52,'node.condition.creater.self','本人','node.condition.creater','zhuangjianzhe'),
  (53,'notempty','非空','regex','feikong'),
  (54,'number','数字','regex','shuzi'),
  (55,'phone','手机电话','regex','shouji'),
  (56,'picture','图片','regex','tupian'),
  (57,'qq','QQ号','regex','qq'),
  (58,'rar','压缩文件','regex','yasuowenjian'),
  (59,'tel','座机电话','regex','zuoji'),
  (60,'url','URL','regex','url'),
  (61,'visible.false','隐藏','visible','yinchang'),
  (62,'visible.true','显示','visible','xianshi'),
  (63,'zipcode','邮编','regex','youbian'),
  (64,'只读','只读','node.state','zhidu'),
  (65,'必填','必填','node.state','bitian'),
  (66,'选填','选填','node.state','xuantian'),
  (67,'隐藏','隐藏','node.state','yincang'),
  (68,'yes','同意','advise','tongyi'),
  (69,'no','不同意','advise','butongyi'),
  (70,'form.type.input','输入框','form.type','shurukuang'),
  (71,'node.condition.creater.department.people','同部门','node.condition.creater','tongbumen'),
  (75,'node.condition.creater','创建者','node.condition.workflow','chuangjianzhe'),
  (86,'申报','申报','sldb.state.type','shenbao'),
  (87,'初审','初审','sldb.state.type','chushen'),
  (88,'核对','核对','sldb.state.type','hedui'),
  (89,'驳回','驳回','sldb.state.type','bohui'),
  (90,'通过','通过','sldb.state.type','tongguo'),
  (91,'农村低保收入','农村低保收入','sldb.person.type','nongcundibaoshouru'),
  (92,'城镇低保收入','城镇低保收入','sldb.person.type','chegnzhendibaoshouru'),
  (93,'农村低保','农村低保','sldb.person.type','nongcundibao'),
  (94,'城镇低保','城镇低保','sldb.person.type','chengzhendibao'),
  (95,'女','女','gender','nv'),
  (96,'男','男','gender','nan'),
  (97,'是','是','easyboolean','shi'),
  (98,'否','否','easyboolean','fou'),
  (102,'非农','非农','sldb.hukou','none'),
  (103,'农业','农业','sldb.hukou','none'),
  (104,'其他','其他','sldb.home','none'),
  (105,'农转非家庭','农转非家庭','sldb.home','none'),
  (106,'因残致贫家庭','因残致贫家庭','sldb.home','none'),
  (107,'年老体弱家庭','年老体弱家庭','sldb.home','none'),
  (108,'子女就学（升学）困难家庭','子女就学（升学）困难家庭','sldb.home','none'),
  (109,'因灾致贫家庭','因灾致贫家庭','sldb.home','none'),
  (110,'因病致贫家庭','因病致贫家庭','sldb.home','none'),
  (111,'三无人员家庭','三无人员家庭','sldb.home','none'),
  (112,'丧偶','丧偶','sldb.marry','none'),
  (113,'离异','离异','sldb.marry','none'),
  (114,'未婚','未婚','sldb.marry','none'),
  (115,'已婚','已婚','sldb.marry','none'),
  (116,'完全劳动能力','完全劳动能力','sldb.workable','none'),
  (117,'部分劳动能力','部分劳动能力','sldb.workable','none'),
  (118,'无劳动能力','无劳动能力','sldb.workable','none'),
  (119,'其他','其他','sldb.idType','none'),
  (120,'孤儿','孤儿','sldb.idType','none'),
  (121,'大学在校生','大学在校生','sldb.idType','none'),
  (122,'高中在校生','高中在校生','sldb.idType','none'),
  (123,'中学在校生','中学在校生','sldb.idType','none'),
  (124,'小学在校生','小学在校生','sldb.idType','none'),
  (125,'无业','无业','sldb.idType','none'),
  (126,'退休','退休','sldb.idType','none'),
  (127,'在职','在职','sldb.idType','none'),
  (128,'其他特殊病种','其他特殊病种','sldb.ill','none'),
  (129,'红斑狼疮','红斑狼疮','sldb.ill','none'),
  (130,'腰间盘突出','腰间盘突出','sldb.ill','none'),
  (131,'股骨头坏死','股骨头坏死','sldb.ill','none'),
  (132,'气管炎','气管炎','sldb.ill','none'),
  (133,'哮喘','哮喘','sldb.ill','none'),
  (134,'精神病','精神病','sldb.ill','none'),
  (135,'肺结核','肺结核','sldb.ill','none'),
  (136,'白血病','白血病','sldb.ill','none'),
  (137,'类风湿疾病','类风湿疾病','sldb.ill','none'),
  (138,'糖尿病','糖尿病','sldb.ill','none'),
  (139,'重症肝病','重症肝病','sldb.ill','none'),
  (140,'脑血栓','脑血栓','sldb.ill','none'),
  (141,'脑出血','脑出血','sldb.ill','none'),
  (142,'心脏病','心脏病','sldb.ill','none'),
  (143,'肾功能衰竭','肾功能衰竭','sldb.ill','none'),
  (144,'癌症','癌症','sldb.ill','none'),
  (145,'其他残疾','其他残疾','sldb.deformity','none'),
  (146,'多重残疾','多重残疾','sldb.deformity','none'),
  (147,'精神残疾','精神残疾','sldb.deformity','none'),
  (148,'智力残疾','智力残疾','sldb.deformity','none'),
  (149,'肢体残疾','肢体残疾','sldb.deformity','none'),
  (150,'言语残疾','言语残疾','sldb.deformity','none'),
  (151,'听力残疾','听力残疾','sldb.deformity','none'),
  (152,'视力残疾','视力残疾','sldb.deformity','none'),
  (153,'一级','一级','sldb.deformityLevel','none'),
  (154,'二级','二级','sldb.deformityLevel','none'),
  (155,'三级','三级','sldb.deformityLevel','none'),
  (156,'四级','四级','sldb.deformityLevel','none'),
  (157,'五级','五级','sldb.deformityLevel','none'),
  (158,'其他','其他','sldb.companyType','none'),
  (159,'地方集体','地方集体','sldb.companyType','none'),
  (160,'地方国有','地方国有','sldb.companyType','none'),
  (161,'省直集体','省直集体','sldb.companyType','none'),
  (162,'省直国有','省直国有','sldb.companyType','none'),
  (163,'中直集体','中直集体','sldb.companyType','none'),
  (164,'中直国有','中直国有','sldb.companyType','none'),
  (165,'其他','其他','sldb.trade','none'),
  (166,'轻化','轻化','sldb.trade','none'),
  (167,'建筑','建筑','sldb.trade','none'),
  (168,'地矿','地矿','sldb.trade','none'),
  (169,'机械军工','机械军工','sldb.trade','none'),
  (170,'农垦','农垦','sldb.trade','none'),
  (171,'冶金','冶金','sldb.trade','none'),
  (172,'森工','森工','sldb.trade','none'),
  (173,'煤炭','煤炭','sldb.trade','none'),
  (174,'其他保险','其他保险','sldb.insurance','none'),
  (175,'商业保险','商业保险','sldb.insurance','none'),
  (176,'工伤保险','工伤保险','sldb.insurance','none'),
  (177,'生育保险','生育保险','sldb.insurance','none'),
  (178,'失业保险','失业保险','sldb.insurance','none'),
  (179,'医疗保险','医疗保险','sldb.insurance','none'),
  (180,'养老保险','养老保险','sldb.insurance','none'),
  (181,'否','否','sldb.insurance','none'),
  (182,'car.dongfengnissan.gtr','GT-R','car.dongfengnissan','GTR'),
  (183,'car.dongfengnissan.tianlai','天籁','car.dongfengnissan','tianlai'),
  (184,'car.dongfengnissan.xuanyi','轩逸','car.dongfengnissan','xuanyi'),
  (185,'car.dongfengnissan.qijun','奇骏','car.dongfengnissan','qijun'),
  (186,'car.dongfengnissan.xiaoke','逍客','car.dongfengnissan','xiaoke'),
  (187,'car.dongfengnissan.yida','颐达','car.dongfengnissan','yida'),
  (188,'car.dongfengnissan.qida','骐达','car.dongfengnissan','qida'),
  (189,'car.dongfengnissan.liwei','骊威','car.dongfengnissan','liwei'),
  (190,'car.dongfengnissan.yangguang','阳光','car.dongfengnissan','yangguang'),
  (191,'car.dongfengnissan.machi','玛驰','car.dongfengnissan','machi'),
  (192,'car.dongfengnissan.gtr.1','系列一','car.dongfengnissan.gtr','xilieyi'),
  (193,'bookcar.type.repair','维修','bookcar.type','weixiu'),
  (194,'bookcar.type.maintain','保养','bookcar.type','baoyang'),
  (195,'car.dongfengnissan.machi.1','系列一','car.dongfengnissan.machi','xilieyi');
COMMIT;

#
# Data for the `app_form_item` table  (LIMIT 0,500)
#

INSERT INTO `app_form_item` (`id`, `name`, `showName`, `defaultValue`, `tableId`, `required`, `requiredName`, `readonly`, `readonlyName`, `hidden`, `hiddenName`, `min`, `max`, `regex`, `regexName`, `focusTip`, `func`, `dict`, `type`, `typeName`, `render`, `formType`) VALUES 
  (16,'vvv','vvv','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (17,'name','名称','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (18,'age','年龄','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (40,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (41,'phone','电话','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (42,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (43,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(''#used'').combobox({\r\n\tonSelect : function(record){\r\n\t       $(''#usedName'').val(record.text);\r\n        }\r\n});','add'),
  (44,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (45,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),
  (46,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),
  (54,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),
  (55,'phone','电话','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),
  (56,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),
  (57,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(''#used'').combobox({\r\n\tonSelect : function(record){\r\n\t       $(''#usedName'').val(record.text);\r\n        }\r\n});','edit'),
  (58,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),
  (59,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),
  (60,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','51','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit'),
  (61,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),
  (62,'date','日期','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','日期','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),
  (63,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),
  (68,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),
  (69,'date','日期','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','日期','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),
  (70,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit');
COMMIT;

#
# Data for the `app_queryform_item` table  (LIMIT 0,500)
#

INSERT INTO `app_queryform_item` (`id`, `name`, `showName`, `tableId`, `condition`, `conditionName`, `hidden`, `hiddenName`, `sort`, `sortName`, `width`, `format`, `dict`, `type`, `typeName`) VALUES 
  (3,'age','年龄',7,'boolean.true','是','visible.true','显示','boolean.true','是','100','','car','form.type.input','输入框'),
  (9,'vvv','vvv',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','','form.type.textarea','文本域'),
  (10,'name','名称',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','boolean','form.type.combox','单选框'),
  (12,'name','名称',9,'boolean.true','是','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),
  (13,'phone','电话',9,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','form.type.input','输入框'),
  (14,'email','邮箱',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),
  (15,'used','有效',9,'boolean.true','是','visible.false','隐藏','boolean.true','是','50','','boolean','form.type.combox','单选框'),
  (16,'usedName','是否有效',9,'boolean.false','否','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),
  (18,'birthday','生日',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.datebox','日期'),
  (19,'desc','描述',9,'boolean.false','否','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),
  (22,'name','姓名',10,'boolean.true','是','visible.true','显示','boolean.true','是','101','','','form.type.input','输入框'),
  (23,'date','日期',10,'boolean.true','是','visible.true','显示','boolean.true','是','152','','','form.type.datebox','日期'),
  (25,'phone','电话',10,'boolean.true','是','visible.true','显示','boolean.true','是','150','return value;','','form.type.input','输入框'),
  (26,'test_age','年龄',27,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','input','输入框');
COMMIT;

#
# Data for the `app_resources` table  (LIMIT 0,500)
#

INSERT INTO `app_resources` (`id`, `name`, `path`, `parentId`, `sort`) VALUES 
  ('auth','管理权限',NULL,NULL,1),
  ('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),
  ('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),
  ('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),
  ('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),
  ('configuration','管理基础配置','',NULL,6),
  ('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),
  ('website','管理网站','',NULL,8),
  ('website.content','管理目录','/app/website/content/show.jsp','website',14),
  ('website.article','管理文章','/app/website/article/show.jsp','website',32),
  ('website.message','管理消息','/app/website/message/show.jsp','website',33),
  ('car','管理汽车','',NULL,34),
  ('website.editcontent','管理融展集团网站','/app/website/admin/main.jsp?cid=rongzhan','website',35),
  ('car.newcar','管理新车','/app/car/newcar/show.jsp','car',37),
  ('car.bookcar','管理预约','/app/car/bookcar/show.jsp','car',38),
  ('car.admin.bookcar','管理车辆预约','/app/car/admin/bookcarShow.jsp?cid=rongzhan','car',39),
  ('car.admin.newcar','管理新车信息','/app/car/admin/newcarShow.jsp?cid=rongzhan','car',40),
  ('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57),
  ('website.changchunfuiru','管理吉林瑞合网站','/app/website/admin/main.jsp?cid=ruihe','website',59),
  ('website.xingsheng','管理绥化兴盛网站','/app/website/admin/main.jsp?cid=xingsheng','website',62),
  ('website.xinyu','管理通话鑫宇网站','/app/website/admin/main.jsp?cid=xinyu','website',63),
  ('website.xingbang','管理哈尔冰兴邦网站','/app/website/admin/main.jsp?cid=xingbang','website',64),
  ('website.suixin','管理绥化绥鑫网站','/app/website/admin/main.jsp?cid=suixin','website',65),
  ('website.rongsheng','管理通话融晟网站','/app/website/admin/main.jsp?cid=rongsheng','website',66);
COMMIT;

#
# Data for the `app_table` table  (LIMIT 0,500)
#

INSERT INTO `app_table` (`id`, `name`, `showName`) VALUES 
  (9,'test_ust','测试用户'),
  (10,'test_abc','ABC');
COMMIT;

#
# Data for the `app_table_column` table  (LIMIT 0,500)
#

INSERT INTO `app_table_column` (`id`, `name`, `showName`, `tableId`, `type`, `typeName`, `length`, `defaultValue`) VALUES 
  (12,'age','年龄',7,'column.type.varchar','varchar','50','5'),
  (13,'name','名称',7,'column.type.varchar','varchar','50','11'),
  (14,'name','名称',8,'column.type.varchar','varchar','50',''),
  (15,'age','年龄',8,'column.type.varchar','varchar','50',''),
  (16,'ss','ss',8,'column.type.varchar','varchar','50',''),
  (17,'vvv','vvv',7,'column.type.varchar','varchar','50','1'),
  (18,'name','名称',9,'column.type.varchar','varchar','50',''),
  (19,'phone','电话',9,'column.type.varchar','varchar','50',''),
  (20,'email','邮箱',9,'column.type.varchar','varchar','50',''),
  (21,'used','有效',9,'column.type.varchar','varchar','50','boolean.true'),
  (22,'desc','描述',9,'column.type.varchar','varchar','50',''),
  (23,'birthday','生日',9,'column.type.varchar','varchar','50',''),
  (24,'usedName','是否有效',9,'column.type.varchar','varchar','50','是'),
  (25,'name','姓名',10,'column.type.varchar','varchar','50',''),
  (26,'date','日期',10,'column.type.varchar','varchar','50',''),
  (27,'phone','电话',10,'column.type.varchar','varchar','50',''),
  (45,'testCol','测试列',1,'column.type.varchar','varchar','50','无');
COMMIT;

#
# Data for the `auth_organizations` table  (LIMIT 0,500)
#

INSERT INTO `auth_organizations` (`id`, `name`, `description`, `responsible`, `parentId`) VALUES 
  (3,'长春巾航科技有限公司','','否',NULL),
  (4,'董事长','','否','3'),
  (5,'总经理','','是','3'),
  (6,'销售副总','','否','3'),
  (7,'售后副总','','否','3'),
  (8,'财务副总','','否','3'),
  (9,'人事副总','','否','3'),
  (10,'人事部','','否','3'),
  (11,'人事部长','','是','10'),
  (12,'人事部副部长','','否','10'),
  (13,'人事部助理','','否','10'),
  (14,'人事部成员','','否','10'),
  (15,'销售部','','否','3'),
  (16,'销售部长','','是','15');
COMMIT;

#
# Data for the `auth_re_organization_user` table  (LIMIT 0,500)
#

INSERT INTO `auth_re_organization_user` (`organizationId`, `userId`) VALUES 
  (11,'zhangsan'),
  (12,'admin'),
  (16,'lisi');
COMMIT;

#
# Data for the `auth_re_role_resource` table  (LIMIT 0,500)
#

INSERT INTO `auth_re_role_resource` (`roleId`, `resourceId`) VALUES 
  (1,'auth'),
  (1,'auth.change.password'),
  (1,'auth.organization'),
  (1,'auth.resource'),
  (1,'auth.role'),
  (1,'auth.user'),
  (1,'car'),
  (1,'car.admin.bookcar'),
  (1,'car.admin.newcar'),
  (1,'car.bookcar'),
  (1,'car.newcar'),
  (1,'configuration'),
  (1,'configuration.dict'),
  (1,'configuration.table'),
  (1,'configuration.workflow.instance'),
  (1,'website'),
  (1,'website.article'),
  (1,'website.content'),
  (1,'website.editcontent'),
  (1,'website.message'),
  (1,'workflow'),
  (4,'car'),
  (4,'car.admin.bookcar'),
  (4,'car.admin.newcar'),
  (4,'car.bookcar'),
  (4,'car.newcar'),
  (4,'website'),
  (4,'website.article'),
  (4,'website.changchunfuiru'),
  (4,'website.content'),
  (4,'website.editcontent'),
  (4,'website.message'),
  (4,'website.rongsheng'),
  (4,'website.suixin'),
  (4,'website.xingbang'),
  (4,'website.xingsheng'),
  (4,'website.xinyu');
COMMIT;

#
# Data for the `auth_re_user_resource` table  (LIMIT 0,500)
#

INSERT INTO `auth_re_user_resource` (`userId`, `resourceId`) VALUES 
  ('1','auth'),
  ('1','auth.organization'),
  ('1','auth.reportData'),
  ('1','auth.reportView'),
  ('1','auth.resource'),
  ('1','auth.role'),
  ('1','auth.user'),
  ('1','configuration'),
  ('1','configuration.dict'),
  ('1','test'),
  ('admin','testWorkflow'),
  ('rongzhan','auth.change.password'),
  ('rongzhan','car'),
  ('rongzhan','car.admin.bookcar'),
  ('rongzhan','car.admin.newcar'),
  ('rongzhan','website'),
  ('rongzhan','website.editcontent');
COMMIT;

#
# Data for the `auth_re_user_role` table  (LIMIT 0,500)
#

INSERT INTO `auth_re_user_role` (`userId`, `roleId`) VALUES 
  ('admin',1),
  ('admin',4),
  ('rongzhan',4);
COMMIT;

#
# Data for the `auth_roles` table  (LIMIT 0,500)
#

INSERT INTO `auth_roles` (`id`, `name`, `description`) VALUES 
  (1,'超级管理员','拥有所有权限'),
  (4,'荣展集团','');
COMMIT;

#
# Data for the `auth_users` table  (LIMIT 0,500)
#

INSERT INTO `auth_users` (`Id`, `name`, `password`, `email`, `phone`) VALUES 
  ('admin','管理员','lueSGJZetyySpUndWjMBEg==','guyuzmq@gmail.com','18943630044'),
  ('rongzhan','融展集团','0N495lkCGCREg87rx9tGew==','11@11.cc','13597878687');
COMMIT;

#
# Data for the `car_bookcar` table  (LIMIT 0,500)
#

INSERT INTO `car_bookcar` (`id`, `cid`, `brand`, `brandName`, `model`, `modelName`, `series`, `seriesName`, `license`, `phone`, `type`, `typeName`, `text`, `bookTime`, `createTime`, `state`, `stateName`) VALUES 
  (6,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','123123','13596160570','bookcar.type.drive','试驾','123123123','2011-10-02 20:44:46','2011-10-02 12:44:29','bookcar.state.true','确认'),
  (7,'rongzhan.about','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.2','系列二','1231234','13596160504','bookcar.type.bookcar','试驾','adfsfa4','2011-10-24 20:56:51','2011-10-02 12:56:27','bookcar.state.true','确认'),
  (8,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.2','系列二','123','13596160570','bookcar.type.drive','试驾','','2011-11-07 11:50:04','2011-11-06 03:49:16','bookcar.state.true','确认'),
  (9,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','245','18911111111','bookcar.type.change','置换','fdgsdfgsd','2011-12-19 19:33:20','2011-12-19 19:32:08','bookcar.state.false','未确认'),
  (10,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','2435','13544444444','bookcar.type.bookcar','订车','asdfadsf','2011-12-19 19:34:30','2011-12-19 19:33:43','bookcar.state.false','未确认'),
  (11,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','245','13545567876','bookcar.type.drive','试驾','asdrgfafgsa','2011-12-19 19:35:14','2011-12-19 19:34:36','bookcar.state.false','未确认'),
  (12,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','','13400009876','bookcar.type.drive','试驾','arg撒大大十多个','','2011-12-20 07:31:13','bookcar.state.false','未确认'),
  (13,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','','13466667777','bookcar.type.drive','试驾','arga撒旦法个 ','','2011-12-20 07:58:18','bookcar.state.false','未确认'),
  (14,'ruihe','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','','3456','bookcar.type.change','置换','网上热个晚上大概','','2011-12-20 07:58:18','bookcar.state.false','未确认'),
  (15,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.machi','玛驰','car.dongfengnissan.machi.1','系列一','','13944445555','bookcar.type.drive','试驾','阿斯蒂芬','','2011-12-20 14:50:34','bookcar.state.false','未确认'),
  (16,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.qida','骐达','','','','13455555555','bookcar.type.repair','维修','维修','','2011-12-20 14:54:09','bookcar.state.false','未确认'),
  (17,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.gtr','GT-R','car.dongfengnissan.gtr.1','系列一','','13688887678','bookcar.type.maintain','保养','保养','','2011-12-20 14:54:31','bookcar.state.false','未确认'),
  (18,'ruihe','car.dongfengnissan','东风尼桑','','','','','','13666668797','bookcar.type.bookcar','订车','订车','','2011-12-20 14:54:50','bookcar.state.false','未确认'),
  (19,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.machi','玛驰','car.dongfengnissan.machi.1','系列一','','112354','','','二锅头','','2011-12-20 14:58:28','bookcar.state.false','未确认'),
  (20,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.machi','玛驰','','','','5678','bookcar.type.drive','试驾','uiol','','2011-12-20 15:00:07','bookcar.state.false','未确认'),
  (21,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.qida','骐达','','','','78','bookcar.type.drive','试驾','合理','','2011-12-20 15:00:28','bookcar.state.false','未确认'),
  (22,'xingbang','car.dongfengnissan','东风尼桑','car.dongfengnissan.gtr','GT-R','car.dongfengnissan.gtr.1','系列一','','2345324111','bookcar.type.drive','试驾','asdfasdf','','2011-12-21 13:57:56','bookcar.state.false','未确认'),
  (23,'xingbang','car.dongfengnissan','东风尼桑','car.dongfengnissan.machi','玛驰','car.dongfengnissan.machi.1','系列一','','234','bookcar.type.repair','维修','wiwiwiw','','2011-12-21 14:02:52','bookcar.state.false','未确认'),
  (24,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.gtr','GT-R','car.dongfengnissan.gtr.1','系列一','','44','bookcar.type.drive','试驾','444','','2011-12-21 14:21:41','bookcar.state.false','未确认');
COMMIT;

#
# Data for the `car_newcar` table  (LIMIT 0,500)
#

INSERT INTO `car_newcar` (`id`, `cid`, `brand`, `brandName`, `model`, `modelName`, `series`, `seriesName`, `image`, `price`, `realPrice`, `gift`, `saller`) VALUES 
  (2,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/rongzhan/attached/appCar/20111219/20111219095253_61.jpg','22.1','20.2','尴尬',''),
  (3,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','20','18','尴尬5',NULL),
  (5,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','23','21','fffss方法','张三:18943630044'),
  (8,'rongzhan.about','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/rongzhan/attached/appCar/20111219/20111219095118_518.jpg','21','10','123213','13123555666'),
  (9,'ruihe','car.dongfengnissan','东风尼桑','car.dongfengnissan.gtr','GT-R','car.dongfengnissan.gtr.1','系列一','/rongzhan/attached/appCar/20111220/20111220101943_253.jpg','23','22','','');
COMMIT;

#
# Data for the `web_article` table  (LIMIT 0,500)
#

INSERT INTO `web_article` (`id`, `cid`, `title`, `text`, `type`, `typeName`, `state`, `stateName`, `count`, `createTime`, `operater`, `operaterName`) VALUES 
  (13,'rongzhan.about.speak','董事长致辞','<span style=\"line-height:2;\"></span> \r\n<p>\r\n\t<span style=\"font-size:14px;\"><span style=\"font-family:SimSun;\"></span></span><span style=\"line-height:1;\">&nbsp;</span><span style=\"font-size:14px;\"><span style=\"font-family:SimSun;\"><span style=\"line-height:1;\">&nbsp;&nbsp;&nbsp;</span><span style=\"line-height:2;\">&nbsp;</span><span style=\"line-height:2;font-size:14px;\">融展是事业的港湾，我们把员工作为公司的服务对象，为员工的学习 、 工作、发展提供服务，努力为员工创造良好的工作环境，建造良好的事业发展平台,使您的知识技能、聪明才智得以施展，事业理想得以实现。</span></span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;font-size:14px;\"><span style=\"line-height:2;font-family:SimSun;font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;融展是温馨的家园。进入融展您会体会到瑞孚这个大家庭的温暖，以人为本的管理使员工感受到在制度约束下的亲情管理，团结互助的团队精神使您体会到大家的互助关心、相互帮助的同事亲情。我们是融展的员工，我们是伙伴，是亲人，我们共同拥有融展这个温暖的大家庭。</span></span> \r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n\t<span style=\"font-size:14px;\"><span style=\"line-height:2;font-family:SimSun;font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height:2;font-family:SimSun;font-size:14px;\">融展是成长的课堂。这是一个学习型的企业，是一个不断提高、学习、成长的团队。我们一直十分重视员工的提高培训。我们珍视每个员工的才能和智慧，关注着每个员工能力和素质的提高。我们为员工创造良好的学习氛围，提供培训提高的机会。您的能力、技能、品德修养将在工作和学习中得到锻炼和提高。融展在学习中起步，员工在学习中提高。</span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;font-size:14px;\">&nbsp;</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:38:58','admin','管理员'),
  (14,'rongzhan.about.introduce','集团介绍','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size:14px;line-height:2;font-family:simsun;\">吉林省融展投资（集团）有限公司成立于2010年，注册资本1亿元人民币，是一家以汽车销售和汽车维修服务为主业的综合性集团型企业，自成立以来先后取得英菲尼迪、上海大众、一汽丰田、东风日产、长安福特、广州丰田、广州本田、上海通用、北京现代、东风本田、一汽商用车、上海双龙、一汽大众、比亚迪、一汽奥迪、一汽奔腾、奇瑞等国内数家汽车知名品牌的代理权，年销量在吉林省居于同行业前三强，在东北三省位居于前十强。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;font-family:simsun;\">&nbsp;&nbsp;&nbsp;&nbsp;为分散经营风险，开拓新的利润增长点，公司还涉足二手车交易、汽车租赁、汽车超市、进出口贸易等行业并已初见成效。公司的短期目标是在3-5年内将吉林融展集团发展成为东北最具竞争力的汽车超级综合分销商。远期目标是成为具有相当的品牌知名度和规模经济效应、有能力参与全国市场竞争力的国际化汽车销售服务企业。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;font-family:simsun;\">&nbsp;&nbsp;&nbsp;&nbsp;回顾企业发展之路，凭借融展集团员工的不懈努力，以及社会各界朋友、领导的关爱和支持，企业得以长足发展，如今蔚成大观。集团在2010年被中国汽车行业流通协会评为“百强企业”称号，并且旗下部分企业已是中国企业联合会会员单位，同行业同品牌中的佼佼者。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;font-family:simsun;\">&nbsp;</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:40:00','admin','管理员'),
  (15,'rongzhan.about.glory','企业荣誉','<img alt=\"\" src=\"/easyapp/attached/image/20111014/20111014063720_910.bmp\" />企业老多荣誉了！真滴！111eee','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:41:09','admin','管理员'),
  (16,'rongzhan.about.structure','组织架构','&nbsp;<img alt=\"\" src=\"/rongzhan/attached/image/20111212/20111212123404_62.jpg\" />&nbsp;','article.state.normal','普通','visible.true','显示',0,'2011-09-27 03:16:34','admin','管理员'),
  (17,'rongzhan.about.course','发展历程','','article.state.normal','普通','visible.false','隐藏',0,'2011-09-28 08:02:01','admin','管理员'),
  (21,'rongzhan.insurance.sall','保险销售','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;北京运通集团保险销售部合作保险公司如下:太平洋保险、人保保险、平安保险。</span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\">&nbsp;</span>\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:17','admin','管理员'),
  (22,'rongzhan.service.rescue','24小时救援','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团提供客户市内24小时免费救援（限融展集团品牌车型）。</span>\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:24','admin','管理员'),
  (23,'rongzhan.service.member','会员服务','<div>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;\r\n</div>\r\n<div align=\"center\">\r\n\t<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团将为您提供免费午餐和洗浴。（限融展集团客户，每车2人次/天）。</span>\r\n</div>\r\n<div align=\"center\">\r\n\t<span style=\"font-size:14px;\">&nbsp;</span>\r\n</div>\r\n<div>\r\n\t&nbsp;\r\n</div>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:49','admin','管理员'),
  (24,'rongzhan.insurance.indemnify','保险理赔','<p>\r\n\t&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;&nbsp;<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;吉林融展集团是人保、平安、太平洋等保险公司的定损中心。</span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;融展集团保险理赔热线：0431-85126301。</span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span>\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:09:01','admin','管理员'),
  (25,'rongzhan.service.book','在线预约','<img alt=\"\" src=\"http://maps.googleapis.com/maps/api/staticmap?center=43.88088320219475%2C125.24943320629882&amp;zoom=15&amp;size=558x360&amp;maptype=roadmap&amp;markers=43.88088320219475%2C125.24943320629882&amp;language=zh_CN&amp;sensor=false\" /><img alt=\"\" src=\"/easyapp/attached/image/20111011/20111011023626_650.bmp\" /><embed src=\"/easyapp/attached/media/20111002/20111002035431_773.jpg\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /> \r\n<p>\r\n\tasfasf\r\n</p>\r\n<p>\r\n\tasdfasdf\r\n</p>\r\n<p>\r\n\tasfdsadf\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n\tZXZX\r\n</p>\r\n<p>\r\n\tasfasfd\r\n</p>\r\n<p>\r\n\tasfasf\r\n</p>\r\n<p>\r\n\tasdfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:07','admin','管理员'),
  (26,'rongzhan.service.special','特殊服务','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<div align=\"center\">\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:14px;\">吉林融展集团将为您提供免费午餐和洗浴。（限融展集团客户，每车2人次/天）</span>\r\n</div>\r\n<div>\r\n\t&nbsp;\r\n</div>\r\n<div>\r\n\t&nbsp;\r\n</div>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:20','admin','管理员'),
  (27,'rongzhan.service.test','验车中心','<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">吉林融展集团可以为您提供全套的新车验车服务，如有不明请咨询：</span> \r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">验车中心电话：0431-85126301</span> \r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:12:19','admin','管理员'),
  (43,'rongzhan.loan.toyota','丰田金融','<p align=\"center\">\r\n\t&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">贷款说明</span><span style=\"font-size:14px;line-height:2;\">&nbsp;</span>\r\n</p>\r\n<p align=\"left\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。</span>\r\n</p>\r\n<p align=\"left\">\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 11:40:50','admin','管理员'),
  (44,'rongzhan.loan.gm','通用金融','<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">贷款说明</span><span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p align=\"left\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。</span> \r\n</p>\r\n<strong></strong> \r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.recommand','推荐','visible.true','显示',0,'2011-09-28 11:41:11','admin','管理员'),
  (47,'rongzhan','融展集团','ggggaaa','article.state.normal','普通','visible.true','显示',0,'2011-09-28 13:32:39','admin','管理员'),
  (51,'rongzhan.loan.fw','大众金融','<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">贷款说明</span><span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p align=\"left\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。</span> \r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:13:36','admin','管理员'),
  (53,'rongzhan.hr','人才招聘','<span style=\"font-size:14px;line-height:2;\">&nbsp;一、4S店总经理</span> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">工作职责：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1、根据汽车投资公司总部战略部署，制定4S店战略规划，设定4S店发展目标，保障4S店业务的有效发展。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2、根据汽车投资公司总部设定的业务目标，制定4S店年度预算及年度工作计划并保障完成。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3、根据汽车投资公司总部设定的业务目标，领导业务团队充分发挥部门工作效率，完成公司业务目标</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">4、与汽车投资公司总部进行高效沟通，汇报4S店运行情况，为公司的决策提供有效的信息支持。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">5、根据4S店情况，制定4S店的各项制度，有力领导4S店团队高效工作，及时完成利润指标。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">6、根据4S店业务发展需要，合理计划4S店的公共关系维护，主机厂上午洽谈的项目运作，组织相关经济协议、合同签订工作，确保市场份额增长。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">7、根据业务发展规划，拓展和汽车销售相关的新业务，如汽车服务、二手车销售等，实现新业务的有效提升。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">8、对4S店进行运营成本控制、对4S店各部门实行考核和监督，确保运营成本得到有效控制。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">9、4S店团队建设和培训。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">任职要求：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1.经营管理、汽车营销类大专以上学历；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2.五年以上4S店总经理或主机厂相关工作经验。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3.较强的授课、演讲和市场分析能力，有梁红的社会关系。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">4.年龄30岁以上，能适应出差。</span> \r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">二、4S店人力资源经理</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">工作职责：</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">1、建立建全公司人力资源和行政管理制度，并监督各项制度的执行。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">2、确定年度人力编制，根据年度需求组织开展人员招聘。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">3、负责制订绩效考核制度，定期组织员工进行考核。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">4、制订年度培训计划，组织各部门开展培训，组织对培训效果技能考核鉴定。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">5、制定合理的薪酬方案。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">6、负责劳动合同的签订和管理工作，代表公司解决劳动诉讼。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">7、负责组织企业活动、建设企业文化。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">8、完成上级交办的其它工作。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">任职要求：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1、人力资源、行政管理相关专业，本科以上学历，30岁以上，3年以上汽贸行业同岗位工作经验；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2、具备较丰富的人力资源工作与专业知识，熟悉劳动法律、法规并能够熟练应用,人力资源管理师中级职称；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3、具有较强的计划、组织、协调能力和出色的人际交能力。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">三、4S店财务经理</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">工作职责：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1、全面负责4S店财务部的日常管理工作及各类报表的编制，组织和协调财务部的日常会计核算工作，保证会计核算流程正常运转；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2、组织制定财务方面的管理制度及有关规定，并监督执行；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3、负责编制及组织实施4S店财务预算；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">4、负责资金、资产的管理工作，并及时为集团财务部长及4S店总经理提供财务分析报告</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">6、负责店内融资工作，保证店内经营资金的正常运转；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">7、监控可能会对公司造成的经济损失的重大经济活动；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">8、负责与当地的其它机构（银行、税务等）保持良好的关系；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">9、协助集团财务部长开展财务部与内外的沟通与协调工作；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">10、负责4S店财务部团队的建设与人员管理。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">任职要求：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1、财务管理相关专业，本科以上学历，30岁以上，3年以上汽贸行业同岗位工作经验；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2、熟悉会计法、经济法、税法等相关的政策、法律、法规；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3、具有较强的组织、沟通、分析、控制能力；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">4、熟练使用用友/金额财务软件。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">四、薪酬绩效经理</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">工作职责：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">1、根据公司总体战略规划，建立、完善公司内部的薪酬、绩效体系；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">2、负责组织实施公司内部的绩效管理、薪酬福利管理工作；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">3、负责指导和监管公司各部门的绩效管理，薪酬福利相关工作；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">4、本科及以上学历，相关专业毕业；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">5、五年以上薪酬、绩效考核相关工作经验，精通KPI、BSC、360°、MBO等考核工具和方法，并有成功案例；能独立策划绩效考核及部门激励方案，流程；</span> \r\n</p>\r\n<span style=\"font-size:14px;line-height:2;\">6、曾就任于企业管理顾问公司并执行过人力资源绩效方面的项目</span>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:01','admin','管理员'),
  (54,'rongzhan.contact','联系我们','<p>\r\n\t<span style=\"font-size:12px;line-height:2;\"><span style=\"font-size:14px;\">吉林省融展投资（集团）有限公司</span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：长春市高力汽贸城C区6栋201/202室</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：0431-85126301&nbsp;&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">传真：0431-85126301&nbsp;&nbsp;&nbsp;</span> \r\n</p>\r\n<hr />\r\n<span style=\"font-size:14px;line-height:2;\">下属公司：</span> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">东风日产：</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><span style=\"font-size:14px;font-family:宋体;\">吉林市瑞合汽车贸易有限公司</span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"><span style=\"font-size:14px;\">地址：</span><span style=\"font-size:14px;font-family:宋体;\">吉林市越北区越山路</span><span style=\"font-size:14px;font-family:''Times New Roman'',''serif'';\">235</span><span style=\"font-size:14px;font-family:宋体;\">号</span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"><span style=\"font-size:14px;\">电话：</span><span style=\"font-size:14px;\">0432-62718999</span></span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">&nbsp;</span><span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">绥化东风日产融展绥鑫专营店</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">地址：西二环路香格里拉凤凰城对面</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">销售热线：0455-8283555/8175458</span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"></span><span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">东风日产哈尔滨瑞孚东日专营店</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：哈尔滨市道里区机场路18号</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：400-698-1006</span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"></span><span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">哈尔滨融展兴邦汽车销售专营店</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：哈尔滨市道外区先锋路3号</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：0451-82453111/82411100</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">英菲尼迪</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">吉林省融展兴盛汽车销售服务有限公司</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：吉林省长春市西新区长沈路3999号</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：0431-81971888/0431-85971555</span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"></span><span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">一汽大众</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">通化鑫宇汽车销售有限公司</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：新胜北路2355号</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：0435-3620866/3620799</span> \r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\"></span><span style=\"font-size:14px;\">&nbsp;</span><span style=\"font-size:14px;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">通用别克</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">哈尔滨瑞孚汽车销售服务有限公司</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：哈尔滨道里区机场路18号（二手车市场对面）</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">电话：0451- 84315499/84312499</span> \r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;</span>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:06','admin','管理员'),
  (61,'rongzhan.new.car','本田8月全球产量下跌9% 中国逆向增长18%','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 本田汽车近日公布其8月全球产量同比下跌9.3%，连续7个月维持下降趋势。</span> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;今年8月，本田全球总产量为261,524辆。日本国内产量同比下降17.2%至56,356辆。最大生产国美国产量略有上升，同比增长6.1%至90,538辆，但整个北美区域依然同比下跌5.0%至109,397辆。产出增长最快的国家之一为中国，8月产量55,567辆，增幅高达17.7%，带动本田在亚洲（除日本）产量上升3.6%至82,727辆。跌幅最明显的是欧洲区域，4,814辆的产量较2010年同期减少了52.5%。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;前8个月累计产量下滑明显。全球总产量1,770,967辆，低于去年同期水平26.3%；日本国内产量393,638辆，同比滑落39.1%；日本以外产量1,377,329辆，同比下降21.7%。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;尽管本田未公布全球及其他区域销量数据，不过表示8月在日本国内销量34,267辆较去年同比重挫47.3%，迄今已连续12个月下行。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:45:22','admin','管理员'),
  (65,'rongzhan.new.enterprise','9月28日东风日产绥化融展绥鑫专营店盛大开业','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;由吉林省融展投资（集团）有限公司投资建立的、功能完备的东风日产4S店——绥化融展绥鑫专营店即将落成，并将于近9月28日正式对外营业。东风日产专营店的成立，将为消费者提供全方位的汽车销售及汽车售后服务，方便消费者家门口买车保养。</span> \r\n</p>\r\n<a href=\"http://www.pcauto.com.cn/images/html/viewpic_pcauto.htm?http://img0.pcauto.com.cn/pcauto/1109/07/1632288_001.jpg&amp;channel=2622\" target=\"_blank\"></a> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><img alt=\"\" src=\"/rongzhan/attached/image/20111212/20111212125132_974.jpg\" /></span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;为庆祝东风日产绥化融展绥鑫专营店开业，即日起在店内订购东风日产任意一款车型（楼兰除外）的客户，均享有大幅优惠，最高优惠达30000元；小编还得之东风日产首款豪华跑车型SUV车型——楼兰目前已全面接受预定。欢迎感兴趣的朋友致电0455-8283555/8411333。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;融展集团是集整车展示销售、维修服务、零件供应和信息咨询服务位一体的东风日产汽车4S服务中心。集团现已由一家单一东风日产品牌的4S店，发展成为拥有11家，主营：东风日产 东风日产启辰,</span><a href=\"http://price.pcauto.com.cn/brand.jsp?bid=28\" target=\"_blank\"><span style=\"font-size:14px;line-height:2;\">英菲尼迪</span></a><span style=\"font-size:14px;line-height:2;\">、</span><a href=\"http://price.pcauto.com.cn/brand.jsp?bid=1\" target=\"_blank\"><span style=\"font-size:14px;line-height:2;\">一汽奥迪</span></a><span style=\"font-size:14px;line-height:2;\">、</span><a href=\"http://price.pcauto.com.cn/brand.jsp?bid=2\" target=\"_blank\"><span style=\"font-size:14px;line-height:2;\">一汽大众</span></a><span style=\"font-size:14px;line-height:2;\">、上海通用，</span><a href=\"http://price.pcauto.com.cn/brand.jsp?bid=147\" target=\"_blank\"><span style=\"font-size:14px;line-height:2;\">东风本田</span></a><span style=\"font-size:14px;line-height:2;\">、丰田品牌的汽车4S专业服务企业集团。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;据张秉华总经理介绍，融展绥鑫专营店是东风日产乘用车公司指定的A级</span><a href=\"http://4s.pcauto.com.cn/\" target=\"_blank\"><span style=\"font-size:14px;line-height:2;\">经销商</span></a><span style=\"font-size:14px;line-height:2;\">，提供原厂纯正配件供应，采用专用维修设备，是集东风日产汽车销售服务、维修服务、配件供应、信息反馈、二手车置换、按揭服务于一体的专营店；即日起在本店订车、购车的客户，东风日产全系车型的均有优惠，价格8.28-37.18不等。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;专营店预计9月下旬正式开业，在一万多平方米的占地面积中，宽阔的客户停车区、明亮现代的汽车展示厅、设备一流的维修车间、温馨舒适的客户休息区和豪华的客户活动中心等功能区。——东风日产绥化融展绥鑫专营店欢迎您的莅临!</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>经销商：绥化东风日产融展绥鑫专营店</strong></span><br />\r\n<span style=\"font-size:14px;line-height:2;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：西二环路香格里拉凤凰城对面</strong></span><br />\r\n<span style=\"font-size:14px;line-height:2;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 销售热线：0455-8283555&nbsp; 8175458</strong></span> \r\n</p>\r\n<!--{13167463066562}-->\r\n<p>\r\n\t<span style=\"line-height:2;\">&nbsp;</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:31:24','admin','管理员'),
  (66,'rongzhan.new.sall','东风日产哈尔滨年底团购会火热报名中','<p style=\"clear:both;padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px auto 20px;width:564px;text-indent:2em;padding-top:0px;\">\r\n\t<p>\r\n\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;不造车，只造精彩生活。东风日产不断创造精彩，快速达至300万台销量新高，再创年80万台销量佳绩，腾龙迎新岁，感恩 “赢•新•汇”，到店、购车、服务、换车全程有豪礼，邀你畅赢精彩。</span></span> \r\n\t</p>\r\n\t<p>\r\n\t\t&nbsp;\r\n\t</p>\r\n\t<p style=\"clear:both;padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px auto 20px;width:564px;text-indent:2em;padding-top:0px;\">\r\n\t\t<p>\r\n\t\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\"><img class=\"imgborder\" style=\"border-right:#dee3e7 1px solid;padding-right:5px;border-top:#dee3e7 1px solid;display:block;padding-left:5px;padding-bottom:5px;margin:0px auto 5px;border-left:#dee3e7 1px solid;padding-top:5px;border-bottom:#dee3e7 1px solid;background-color:#ffffff;background-origin:initial;background-clip:initial;\" alt=\"\" src=\"http://img2.bitautoimg.com/autoalbum//files/20080416/012/200804161158215312_31653_514x341__m1.jpg\" border=\"1\" /></span></span> \r\n\t\t</p>\r\n\t\t<p>\r\n\t\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;东风日产“赢•新•汇”融展东日专营店2011年最后一次抄底团购会开始报名了。</span></span>\r\n\t\t</p>\r\n\t\t<p>\r\n\t\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp; <strong>报名热线：84348888 843577777</strong></span></span> \r\n\t\t</p>\r\n\t\t<p>\r\n\t\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;销售电话：400-698-1006</strong></span></span> \r\n\t\t</p>\r\n\t\t<p>\r\n\t\t\t<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;店面地址：哈尔滨市道里区机场路18号</strong></span></span> \r\n\t\t</p>\r\n<script type=\"text/javascript\">function getVoteStation(type) { if(type==-1) { gid(\"beforeVote\").innerHTML=\"\"; return; } else if(type==1) { if(gid(\"beforeVote\")) { var str = gid(\"beforeVote\").innerHTML; gid(\"beforeVote\").innerHTML=\"\"; gid(\"afterVote\").innerHTML = str; } } }</script>\r\n<!--buy car area--><!--buy car area-->\r\n\t\t<p class=\"buycar\">\r\n\t\t\t&nbsp;\r\n\t\t</p>\r\n<!--PRINT area-->','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:59:12','admin','管理员'),
  (68,'rongzhan.new.car','通用与日产联手研究开发电动车技术','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2011年9月30日，通用电气与日产汽车宣布签署合作协议，将共同研究开发电动车技术。</span> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;在日产汽车位于美国密歇根州Farmington Hills的北美技术中心，通用电气与日产宣布签署了一项有效期两年的合作协议，着眼于共同研究开发电动车技术，加速电动车基础设施改进步伐，并刺激电动车销售增长。研究的焦点在于：日产聆风一类电动车的充电操作，将对家庭及企业电力系统和公用电网产生怎样的影响。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;通用电气全球研发总监Mark Little在日产北美技术中心出席了媒体发布会，其表示：“我们将并肩协作，通过推广电动车应用让世界更加美好。”两家公司之前就曾经达成电动车方面的合作，2010年4月，双方签署一项为期三年的协议，共同开发电动车充电装置。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;日产汽车当前正在向市场销售聆风电动车，今年到目前为止总销量已经突破7千辆。作为日产的新能源车主打产品，聆风与通用汽车的沃蓝达增程式电动车等插电式混合动力车形成了竞争关系。</span> \r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 13:12:12','admin','管理员'),
  (69,'rongzhan.loan.11','放松放松的','<p>\r\n\tasdfasdf\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\tasdfasfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-10-10 03:36:47','admin','管理员'),
  (72,'test.home','测试','一个测试','article.state.top','置顶','visible.true','可见',0,'2011-11-17 09:56:58','admin','管理员'),
  (73,'ruihe.about.introduce','企业介绍','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:14px;line-height:2;\">吉林市瑞合汽车贸易有限公司隶属于吉林省融展投资集团子公司，公司坐落于吉林市船营区越山路235号，占地面积8161.26平方米，建筑面积3371.84平方米，注册资金500万元.是吉林地区东风日产乘用车公司授权特许经销商，主要经营东风日产品牌：楼兰、全新天籁、奇骏、逍客、轩逸、新阳光、TIIDA骐达、玛驰等车型。是一家集汽车销售、维修服务、零配件供应、信息反馈四位一体的经营东风日产品牌4S专营店。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司按照东风日产乘用车公司的标准建设有现代化的汽车维修车间，具有齐全先进NISSAN专用检测电脑、四位定位仪、大梁矫正仪、环保型烤漆房等高级维修设备。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们拥有一支优秀的销售服务团队和技术精湛的维修服务队伍。公司的性质为股份有限公司，设有七大主要部门，售后服务部、销售部（包括精品部、二手车部、金融部）、市场部、客户运营中心、财务部、综合部、运营部，公司共有员工80余人，具有厂家认证证书的人员达到80%以上。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 多元化服务组合，一站式服务! “用户至上，信誉第一”服务宗旨是我们在汽车市场口碑。为客户提供差异化的优质服务。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我店位于吉林市著名的汽车产业园，地理位置十分优越，交通便利，日均交通流量20万人次，同时该路已规划成快速路，交通便利发达。沿线道路有近12家汽车4S专营店，公司除依托交通的便利、借助优秀的企业文化，促进管理水平和经济效益的全面提升。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 宽敞明亮、景致宜人的展示大厅给每位顾客带来舒适和温馨，包括：销售办公区、维修接待区、结算处、洽谈区、VIP会员休息区、新车交接区以及新车展示区等，使顾客在每个角落都能体味到“贴心”的人性化设计，并为客户提供24小时免费救援服务，融展瑞合专营店为车主提供更周到的快捷便利的服务。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 吉林市瑞合汽车贸易有限公司全体员工恪守客户第一、服务至上的原则，竭诚为广大客户提供一流的服务。</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:20:58','admin','管理员'),
  (74,'ruihe.sall.new','新车报价','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:15','rongzhan','融展集团'),
  (75,'ruihe.sall.offsall','优惠促销','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">2011年，是东风日产崭新的一年，我们以超越同行的速度达成300万台销量，创造了东风日产奇迹。这一切都离不开广大车主的信赖和支持，是您成就了东风日产在行业及市场越来越好的口碑。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">为回馈广大车主对东风日产的厚爱，现东风日产瑞孚店联合绽放网在长春市景阳大路3862号（11高西行1500米87中斜对面）特推出“瑞孚岁末温暖奉送，共庆日产年度盛会——全系团购会第二季”活动。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月3</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日-12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月31</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">瑞孚岁末温暖奉送——雪地胎团购</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">购邓禄普冬季轮胎，买三赠一！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">限量50套，先到先得！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月10</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日下午一点&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">给你的爱车许个愿</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">追求时尚生活的你面对爱车，是精心装饰？还是倍加呵护？</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">为你的爱车许个愿，让心愿变成现实，让爱车炫动色彩，彰显个性！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月17</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日下午一点&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">瑞孚岁末温暖奉送——全系团购会第二季</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">东风日产全系车型岁末特惠！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">现场签到得精美礼品一份！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">购车绽放网即送时尚家电一台！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">现场参与互动活动还有机会赢取其他高价值礼品！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">精彩活动抢先报！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享一：看车买车，岁末特惠！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享二：非常试驾，礼遇随行！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享三：有奖竞猜，优智生活！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享四：微博互动，好礼相送！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享五：车品竞拍，超值享受！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享六：茶艺表演，品质服务！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">品牌的保障，品质的服务！东风日产瑞孚店给您不一样的感受！请在2011年12月16日前登陆绽放网进行报名，即可参与本次活动。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:18','admin','管理员'),
  (76,'ruihe.sall.special','特色服务','<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">店内为</span><span style=\"font-size:14px;line-height:2;\">客户提供</span><span style=\"font-size:14px;line-height:2;\">宽敞舒适的休息大厅、宽带、</span><span style=\"font-size:14px;line-height:2;\">免费</span><span style=\"font-size:14px;line-height:2;\">咖啡等服务。</span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:19','admin','管理员'),
  (77,'ruihe.online.enquire','资讯客服','','article.state.normal','普通','visible.true','显示',0,'2011-12-02 22:54:44','admin','管理员'),
  (78,'ruihe.book.drive','试乘预约','','article.state.normal','普通','visible.true','显示',0,'2011-12-04 00:18:49','admin','管理员'),
  (79,'rongzhan.new.car','中汽协：全年汽车出口有望超80万辆 ','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;据中国汽车工业协会预测，今年全年出口汽车有望超过80万辆，创出历史新高。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;商务部机电和科技产业司副司长支陆逊接受媒体采访时表示，汽车是世界贸易中排名第一的货物贸易，约占全球货物贸易总额的10%。德国、日本、韩国等汽车生产大国出口量占全部产量的比重分别为75%、65%和50%，甚至巴西都达20%以上。我国去年全部汽车出口量是58万辆，约占整个产量的3%左右。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 15:59:39','admin','管理员'),
  (80,'rongzhan.new.car','今年缺陷汽车占据乘用车销量近两成','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;国家质检总局近日披露，今年前三季度，中国汽车召回事件达到67起，共计召回缺陷汽车174.56万辆，占同期乘用车销量的比例高达16.57%。而去年全年，中国汽车仅召回117万辆，占同期乘用车销量的8.5%</span>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:01:10','admin','管理员'),
  (81,'rongzhan.new.car','汽车将按排量征车船税','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;在近日召开的国务院常务会议上，包括《中华人民共和国车船税法实施条例(草案)》在内的四项条例获得审议并原则通过。从此次审议的车船税法细节来看，将汽车按排量分为7档征税;政府部门强化了通过征税来调整汽车产品消费结构的方式，乘用车车船税将按排量分档征收，排量越大需缴纳的额度越高。</span>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:01:59','admin','管理员'),
  (82,'rongzhan.new.car','东风1.1亿收购东风渝安','<span style=\"font-size:14px;line-height:2;font-family:SimSun;\">&nbsp;&nbsp;&nbsp; 上周，东风汽车公司旗下香港上市公司东风汽车集团股份有限公司（00489.HK）发布公告称，拟以109545400元收购东风小康全资拥有的东风渝安所有股权。同时，东风渝安同意偿还股东东风小康140454600元股东借款。东风集团股份公告显示，以2011年6月30日为评估基准日的资产评估报告，东风渝安评估价值为259855300元。</span>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:02:53','admin','管理员'),
  (83,'rongzhan.new.car','未来中国动力电池市场价值约3000亿','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在日前举办的加2011中国太阳能产业高层论坛上洋泰能源董事长黄友权表示，未来的中国市场动力电池市场价值大约在3000亿人民币，日韩方面已经开始产业化固体电解质钒动力电池。同时在储能领域必然存在多种电池技术共存的局面，不会有一种技术垄断整个市场的局面出现。</span>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:03:33','admin','管理员'),
  (84,'rongzhan.new.enterprise','骄然天成非同凡响 英菲尼迪闪耀长春','<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;（2011年12月6日，长春）今天，作为红牛F1车队官方合作伙伴，<a class=\"t_link\" href=\"http://product.cheshi.com/brand_112/\" target=\"_blank\"><span style=\"color:#333;\">英菲尼迪</span></a>旗下的第44家特许经销店——<a class=\"t_link\" href=\"http://news.cheshi.com/cckj/200901/89778.shtml\" target=\"_blank\"><span style=\"color:#333;\">长</span></a>春融展英菲尼迪璀璨开业，英菲尼迪中国事业总部总经理吕征宇先生及长春融展英菲尼迪各级领导出席了盛大的开业庆典，并与众多嘉宾齐聚一堂，共同见证了这一盛事。\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p style=\"text-align:center;\">\r\n\t<a title=\"骄然天成非同凡响 英菲尼迪闪耀长春\" href=\"http://news.cheshi.com/picbrowser/20111207/462792_2167056.shtml\" target=\"_blank\"><img alt=\"骄然天成非同凡响 英菲尼迪闪耀长春\" src=\"http://img1.cheshi-img.com/201112/462792/4edf1bf92dc98_500.jpg\" border=\"0\" /></a>\r\n</p>\r\n<p style=\"text-align:center;\">\r\n\t长春融展英菲尼迪经销店外观\r\n</p>\r\n<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;长春融展英菲尼迪坐落于长春<a class=\"t_link\" href=\"http://www.cheshi.com/\" target=\"_blank\"><span style=\"color:#333;\">汽车</span></a>产业开发区，严格按照英菲尼迪全球统一的零售环境设计标准（IREDI）建设而成。店内完美秉承了英菲尼迪“致情致盛，完美体验”（Total Ownership ExperienceTM）的客户服务理念，不仅倾情打造至臻一流的硬件设施，而且拥有舒适尊雅的服务环境，以及彰显时尚艺韵的设计风格，使当代豪华的生活品味同“灵感、优雅、力量”的品牌精髓巧然融为一体。经销店整体宛如艺术殿堂，展示区中精粹集合了英菲尼迪款款惊艳之作——奢华全尺寸<a class=\"t_link\" href=\"http://product.cheshi.com/SUV/\" target=\"_blank\"><span style=\"color:#333;\">SUV</span></a> QX56、跑<a class=\"t_link\" href=\"http://product.cheshi.com/\" target=\"_blank\"><span style=\"color:#333;\">车型</span></a>SUV FX系列、<a class=\"t_link\" href=\"http://product.cheshi.com/paoche/\" target=\"_blank\"><span style=\"color:#333;\">跑车</span></a>型Crossover EX系列、高端豪华轿车<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_950/\" target=\"_blank\"><span style=\"color:#333;\">英菲尼迪M</span></a>系列和运动型豪华座驾G系列，全方位展现英菲尼迪车型奢华与优雅、动感与时尚的完美气质。\r\n</p>\r\n<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;开业仪式上，英菲尼迪中国事业总部总经理吕征宇先生表示：“长春融展英菲尼迪作为英菲尼迪品牌大家庭中新的一员，将为东北地区的<a class=\"t_link\" href=\"http://product.cheshi.com/haohuache/\" target=\"_blank\"><span style=\"color:#333;\">豪华车</span></a>消费者营造一个意境卓然的豪华新体验。如同每一家英菲尼迪的经销店一样，在这个充满艺术与时尚气息的展厅内，不但完美展示了英菲尼迪全系灵感座驾，更通过尊崇贴心的服务，悉心传递出英菲尼迪独有的“致情致盛 完美体验”的客户服务理念。长春融展英菲尼迪的建立，标志着英菲尼迪对中国吉林地区的<a class=\"t_link\" href=\"http://news.cheshi.com/cckj/200901/89780.shtml\" target=\"_blank\"><span style=\"color:#333;\">高</span></a>度重视与信心，以及对东北市场战略引擎的再度加速。同时，长春融展英菲尼迪也为品牌与周边地区的豪华车消费者架起了更为畅通的桥梁，使他们能够更加深入、直接地感受到英菲尼迪‘灵感、优雅、力量’的品牌精髓。”\r\n</p>\r\n<p>\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;自2007年进入中国以来，伴随着全系车型的登陆，英菲尼迪受到了越来越多中国消费者的关注与青睐，在短短4年间，品牌以锐不可当之势在中国豪华车市场占据了重要地位。2010年，英菲尼迪在中国的销量达到了11,513台，增幅高达137.3%，以骄人的成绩享誉业界。2011年，英菲尼迪继续保持着强劲的增长势头，不仅销售数字节节攀升，完备精准的营销策略和别出心裁的体验式市场活动令品牌更加深入人心。其中，与红牛F1车队的激情合作令广大消费者充分感受到英菲尼迪隽雅澎湃的<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_523/\" target=\"_blank\"><span style=\"color:#333;\">无限</span></a>力量；而充满驾乘乐趣的2011“G系极风之旅”大型赛道体验活动和“驾•享新境”2011英菲尼迪M全国<a class=\"t_link\" href=\"http://news.cheshi.com/sjpc/morelist_1.shtml\" target=\"_blank\"><span style=\"color:#333;\">试驾</span></a>会也让更多消费者亲身体验到英菲尼迪旗下优秀产品的卓越魅力。\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p style=\"text-align:center;\">\r\n\t<a title=\"骄然天成非同凡响 英菲尼迪闪耀长春\" href=\"http://news.cheshi.com/picbrowser/20111207/462792_2167059.shtml\" target=\"_blank\"><img alt=\"骄然天成非同凡响 英菲尼迪闪耀长春\" src=\"http://img2.cheshi-img.com/201112/462792/4edf1bfc836a4_500.jpg\" border=\"0\" /></a>\r\n</p>\r\n<p style=\"text-align:center;\">\r\n\t长春融展英菲尼迪开业庆典 现场嘉宾合影\r\n</p>\r\n<p>\r\n\t英菲尼迪始终倡导用灵动超凡的产品设计演绎奢华独到的生活态度，用悉心尊贵的客户服务表达全情体验的消费主张。新晋亮相的长春融展英菲尼迪不仅为消费者提供尊崇、愉悦的购车环境，更带给消费者英菲尼迪品牌文化的独特感受，打造出灵感与艺术完美融合的新坐标。预计截止今年年底，英菲尼迪将在中国开设超过50家特许经销店，并致力于为中国消费者提供“致情致盛，完美体验”的客户关怀理念。以全新<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_274/\" target=\"_blank\"><span style=\"color:#333;\">挑战者</span></a>形象破界而行的英菲尼迪，必将为更多豪华车消费者带来前所未有的豪华新体验。\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.top','置顶','visible.true','显示',0,'2011-12-09 16:13:47','admin','管理员'),
  (85,'rongzhan.new.enterprise','汽车节能补贴10月取消','<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日前，一条“汽车产品补贴政策门槛提高，小排量汽车节能惠民补贴将于9月底取消”的消息在网上传得沸沸扬扬。有消息称，2010年6月起执行的汽车节能惠民补贴，9月底将被取消。还有一种说法是，汽车节能补贴政策不会全部取消，但是补贴门槛将提高，享受补贴的车型每百公里油耗门槛将由6.9升提升至6.3升。</span><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size:14px;line-height:2;\">东风日产融展东日4S店，9月19日接到厂家文件称：9月16日，发改委，工信部和财政部联合发布《关于调整节能汽车推广补贴政策的通知》，先行 的补贴政策将执行到2011年9月30号，2011年10月1日起将实施新的节能汽车油耗标准，油耗门槛整体提高8%。东风日产原轩逸1.6 排量的手动档车型、阳光手动挡车型 、骐达手动挡车型将于10月1日起退出节能补贴范围，而旗下新骐达1.6排量CVT车型，阳光1.5排量车型补贴金额仍为3000元/台。</span><br />','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:25:43','admin','管理员'),
  (86,'rongzhan.new.sall','瑞孚岁末温暖奉送 共庆日产年度盛会','<p>\r\n\t2011年，是东风日产崭新的一年，我们以超越同行的速度达成300万台销量，创造了东风日产奇迹。这一切都离不开广大车主的信赖和支持，是您成就了东风日产在行业及市场越来越好的口碑。\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t为回馈广大车主对东风日产的厚爱，现东风日产瑞孚店联合绽放网在长春市景阳大路3862号（11高西行1500米87中斜对面）特推出“瑞孚岁末温暖奉送，共庆日产年度盛会——全系团购会第二季”活动。\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t<strong>12</strong><strong>月3</strong><strong>日-12</strong><strong>月31</strong><strong>日&nbsp;&nbsp;&nbsp; </strong><strong>瑞孚岁末温暖奉送——雪地胎团购</strong>\r\n</p>\r\n<p>\r\n\t购邓禄普冬季轮胎，买三赠一！\r\n</p>\r\n<p>\r\n\t限量50套，先到先得！\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t<strong>12</strong><strong>月10</strong><strong>日下午一点&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>给你的爱车许个愿</strong>\r\n</p>\r\n<p>\r\n\t追求时尚生活的你面对爱车，是精心装饰？还是倍加呵护？\r\n</p>\r\n<p>\r\n\t为你的爱车许个愿，让心愿变成现实，让爱车炫动色彩，彰显个性！\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t<strong>12</strong><strong>月17</strong><strong>日下午一点&nbsp;&nbsp;&nbsp; </strong><strong>瑞孚岁末温暖奉送——全系团购会第二季</strong>\r\n</p>\r\n<p>\r\n\t东风日产全系车型岁末特惠！\r\n</p>\r\n<p>\r\n\t现场签到得精美礼品一份！\r\n</p>\r\n<p>\r\n\t购车绽放网即送时尚家电一台！\r\n</p>\r\n<p>\r\n\t现场参与互动活动还有机会赢取其他高价值礼品！\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t精彩活动抢先报！\r\n</p>\r\n<p>\r\n\t尊享一：看车买车，岁末特惠！\r\n</p>\r\n<p>\r\n\t尊享二：非常试驾，礼遇随行！\r\n</p>\r\n<p>\r\n\t尊享三：有奖竞猜，优智生活！\r\n</p>\r\n<p>\r\n\t尊享四：微博互动，好礼相送！\r\n</p>\r\n<p>\r\n\t尊享五：车品竞拍，超值享受！\r\n</p>\r\n<p>\r\n\t尊享六：茶艺表演，品质服务！\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>\r\n<p>\r\n\t品牌的保障，品质的服务！东风日产瑞孚店给您不一样的感受！请在2011年12月16日前登陆绽放网进行报名，即可参与本次活动。\r\n</p>\r\n<p>\r\n\t<img style=\"width:540px;height:186px;\" src=\"http://image.bitauto.com/dealer/news/50002200/f715b12b-dddb-4f2b-a5ad-cff60de091c1.jpg\" />\r\n</p>\r\n<div id=\"afterVote\">\r\n</div>\r\n<script type=\"text/javascript\">function getVoteStation(type) { if(type==-1) { gid(\"beforeVote\").innerHTML=\"\"; return; } else if(type==1) { if(gid(\"beforeVote\")) { var str = gid(\"beforeVote\").innerHTML; gid(\"beforeVote\").innerHTML=\"\"; gid(\"afterVote\").innerHTML = str; } } } </script>\r\n<!--buy car area-->\r\n<div class=\"buycar\">\r\n\t<ul>\r\n\t\t<li>\r\n\t\t\t<label>销售电话：</label><span class=\"tel400\">400-666-9466</span> \r\n\t\t\t<li>\r\n\t\t\t\t<label>联系电话：</label><span><img alt=\"联系电话\" src=\"http://dealer.bitauto.com/membersite/Common/Control/DealerInfoImg.ashx?op=get&amp;dealerid=50002200&amp;type=tel&amp;size=14\" /></span> \r\n\t\t\t\t<li>\r\n\t\t\t\t\t<label>店面地址：</label><span>长春市景阳大路3862号（11高西行1500米87中斜对面）</span> \r\n\t\t\t\t</li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t\t</div>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:51:49','admin','管理员'),
  (87,'rongzhan.new.sall','福特新嘉年华惠民补贴即将倒计时!','<p>\r\n\t&nbsp;<span style=\"font-size:14px;line-height:2;\">今年开始，福特新嘉华被例入国家惠民补贴车型，这一利好消息出台后使新嘉年华销售势头更火爆，并且新嘉华同时享受购置税按7.5%征收。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;日前，国家发改委产业协调司相关负责人明确表示：随着国内汽车消费刚性需求与潜力逐渐提升，明年购置税优惠政策肯定会取消。那么以10万元左右的1.6以下排量汽车来说，仅购置税部分2011年比2010年多支付2300多元。同时，惠民补贴3000元的惠民政策即将到期，也就是说2011年购新嘉年华要比2010年多花5300多元钱。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;现吉林隆孚为了更好的为购车者服务，把更多的利益让给广大客户。在2010年12月31日前购车的客户不仅享受惠民补贴与购置税优惠政策，还会有现金5000优惠与精美礼包赠送。先到先得，心动不如行动。还等什么？机不可失，失不再来。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 新嘉年华将会是你明智的选择。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>&nbsp;联系地址：长春市景阳大路3520号</strong></span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>&nbsp;联系电话：0431-87993222</strong></span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:59:56','admin','管理员'),
  (88,'rongzhan.new.sall','[长春]英菲尼迪FX35 享最高优惠7.3万元!','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;近日，编辑从长春地区英菲尼迪经销商了解到，目前购买英菲尼迪FX35车型，最高可享7.3万元现金优惠，店内有部分现车。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><img alt=\"\" src=\"/rongzhan/attached/image/20111212/20111212131140_84.jpg\" /></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"></span><span style=\"font-size:14px;line-height:2;\"></span><span style=\"font-size:14px;line-height:2;\">&nbsp;英菲尼迪FX车型的前脸看起来更运动，更现代。外观上的变化包括前挡泥板，带有英菲尼迪FX35大标识的双拱形格栅，L型的HID双氙头大灯及一体化的雾灯。大灯部分与保险杠、发动机盖、水箱框架等周围的接缝非常匀称，大灯与发动机盖之间有橡胶垫保证了整体密封性。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;英菲尼迪的心脏是一颗荣获世界十佳发动机称号的引擎。英菲尼迪FX35的发动机排量为3.5升，在数据方面，这台发动机在CVTCS连续可变汽门正时的辅助下，6800转/分时可输出307马力（226Kw），4800转/分时爆发出350牛米的最大扭矩。更高端车型英菲尼迪FX50车型则配备的是5.0升V8发动机。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;编辑点评：FX系列作为英菲尼迪旗下高端SUV车型，与宝马X5、奥迪Q7及奔驰ML等车型为同级别，价格相仿而品牌知名度，及车型外型上的认可度，并不是每人都能接受的，现FX最高可享7.3万元的现金优惠，关注此车型的网友不妨致电经销商或到店详谈选购。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 17:03:04','admin','管理员'),
  (89,'rongzhan.about.culture','企业文化','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>企业精神：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;诚心、敬业、开拓、创新</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>企业定位：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;立足汽车行业，纵向不断深入拓展，横向涉猎相关行业。以汽车销售为核心业务，以汽车维修及增值服务为拓展业务，以与汽车相关的商贸服务为延伸业务，致力于成为东北乃至全国最具竞争力的汽车超级综合分销商。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>经营理念：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以客户为中心，追求高品质服务，不断提升企业的核心竞争力，以诚信、敬业、开拓、创新的企业精神，稳步前进，厚积薄发，让员工和企业共同实现最大价值。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>客户观：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户满意度第一永远是企业第一目标，客户是企业的战略资源，是企业的无形资本，是集团经营管理的核心。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>服务观：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金牌品质、诚信服务</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\"><strong>服务理念：</strong></span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户和企业的双赢</span>\r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 19:44:58','admin','管理员'),
  (90,'ruihe.about.glory','公司荣誉','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;吉林瑞孚汽车集团有限公司</span><span style=\"font-size:14px;line-height:2;\">先后荣获“超级汽车营销集团”、“十佳汽车营销企业”、“重合同、守信用”三A企业、“全国优秀汽车经销商”等三十多项各类荣誉及奖项。</span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:10:44','admin','管理员'),
  (91,'ruihe.about.form','公司形象','<p align=\"center\">\r\n\t<img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213144116_732.jpg\" /><span style=\"font-size:14px;\"><strong></strong></span> \r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\"><strong><span style=\"font-size:12px;\"><strong>吉林瑞合店面形象</strong></span><span style=\"font-size:14px;\"><strong>&nbsp;</strong></span>&nbsp;</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\"><img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213144301_427.jpg\" /></span> \r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;\"></span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:12px;\"><strong>吉林瑞合展厅</strong></span><span style=\"font-size:14px;\"><strong>&nbsp;</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213144543_150.jpg\" /> \r\n</p>\r\n<p align=\"center\">\r\n\t<strong><span style=\"font-size:12px;\">吉林瑞合车间</span></strong> \r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213144905_700.jpg\" />\r\n</p>\r\n<p align=\"center\">\r\n\t<strong>&nbsp;吉林瑞合服务顾问</strong>\r\n</p>\r\n<p align=\"center\">\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:17:14','admin','管理员'),
  (92,'ruihe.about.contact','联系方式','<span style=\"font-size:14px;line-height:2;\">吉林市瑞合汽车贸易有限公司</span> \r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">地址：吉林市船营区越山路235号</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">销售热线：0432-62718999、62718666</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">24小时救援电话：0432-62717999</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">客户投诉热线：0432-62719666</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:18:53','admin','管理员'),
  (93,'ruihe.new.company','天籁首推“预分配”系统，消费过程全透明受市场追捧','<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">最新销量数据显示，在竞争激烈的中高级车市场，东风日产天籁</span><span style=\"font-size:12pt;line-height:2;\">10</span><span style=\"font-size:12pt;line-height:2;\">月销量</span><span style=\"font-size:12pt;line-height:2;\">13,460</span><span style=\"font-size:12pt;line-height:2;\">台，</span><span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">年累计销量</span><span style=\"font-size:12pt;line-height:2;\">125,145</span><span style=\"font-size:12pt;line-height:2;\">台，依然稳居中高级车市场前十月销量第一。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;color:black;line-height:2;\">据了解，为了更快速、准确地为消费者提供车辆，东风日产推出了天籁“预分配”系统。该系统可以让订车的消费者，在零库存的情况下提前</span><span style=\"font-size:12pt;color:black;line-height:2;\">1</span><span style=\"font-size:12pt;color:black;line-height:2;\">个月知道自己何时可以提车，同时得知所订车辆从生产线下线一直到交到自己手中的全过程。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">该系统目前运行稳定，受到了消费者的广泛认可。</span> \r\n</div>\r\n<div style=\"line-height:150%;\">\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</div>\r\n<div style=\"line-height:150%;text-align:center;\" align=\"center\">\r\n\t<b><span style=\"font-size:12pt;line-height:2;\">车辆预分配系统，订车提车全程透明</span></b> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">自己的订的车，不知道什么时候能提车。在车市，这一直是消费者普遍遇到的问题。许多消费者提前数月订车，总是被告知没有车，尤其是供不应求的热门车型。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">“我们要改变这样的情况，要把知情权完整还给消费者。消费者可以非常确切的了解，可以什么时候去提车，这个系统极大提升了消费透明度。”东风日产销售部相关人士说。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">据了解，受限于产能不足，以及消费者对天籁需求火爆，天籁长期处于供不应求的状态，而生产天籁的东风日产襄阳工厂一直为零库存。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">“每个消费者买车，都希望尽快提到车，也希望了解自己的车从工厂下线到自己手中，到底需要多长时间。这是我们研发预分配系统的出发点。”东风日产市场销售总部副总部长杨嵩说。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:150%;\"><span style=\"line-height:2;\">“预分配”系统，就是把</span><span style=\"color:black;line-height:2;\">生产线上还没生产出来的天籁新车编号分配</span><span style=\"line-height:2;\">给专营店。消费者可以在专营店通过该系统，提前一个月知道自己可以何时提车。与此同时，东风日产各专营店通过电脑系统也会得知天籁的实时状况，包括运输司机的名字与电话号码、目前所处的状态及节点等。这个系统在满足专营店需求的同时，极大提升了消费透明度。</span></span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">市场人士分析，一部车的成功，是在产品力基础上的综合体系能力体现。天籁除了强大的产品竞争力以外，在不断提升消费者满意度方面所做的努力，也遥遥领先市场的平均水平。“预分配”系统就是典型例证，该系统改变了车辆消费不透明的局面，将知情权还给消费者，体现了对消费者的尊重。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</div>\r\n<div style=\"line-height:150%;text-align:center;\" align=\"center\">\r\n\t<b><span style=\"font-size:12pt;line-height:2;\">实力说话，造就王者地位</span></b> \r\n</div>\r\n<div style=\"text-indent:23.25pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">10</span><span style=\"font-size:12pt;line-height:2;\">月份，天籁奇迹还在延续。</span><span style=\"font-size:12pt;line-height:2;\">1-10</span><span style=\"font-size:12pt;line-height:2;\">月份，凭借</span><span style=\"font-size:12pt;line-height:2;\">125,145</span><span style=\"font-size:12pt;line-height:2;\">辆的销量，天籁依然稳居中高级车销量第一。</span> \r\n</div>\r\n<div style=\"text-indent:23.25pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">受多重因素影响，</span><span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">年成为中高级车市场重新洗牌的重要一年。众多汽车厂家争相涌入，中高级车市再次成为国内汽车市场走势的风向标。尽管面临着市场饱和、油价上涨等不利因素，且该细分区隔的竞争由于新晋车型的加入更为激烈，但天籁不为所动，依然以较大幅度领跑全年冠军争夺战。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">业内人士分析，纵观三年来，像天籁这般迅速成为市场主流之选的车型，别无他家；之所以天籁有较大机会打破雅凯垄断局面、成为新的王者，是因为其产品力经受住了市场的检验。</span> \r\n</div>\r\n<div style=\"text-indent:23.25pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">而据调查显示，对中高级车的消费者而言，技术性和体验性的东西已成为他们购车时最为看重的因素。正因为此，融技术与舒适于一身的天籁，已成为最受消费者青睐的中高级车型。</span> \r\n</div>\r\n<div style=\"text-indent:23.25pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">VQ</span><span style=\"font-size:12pt;line-height:2;\">发动机</span><span style=\"font-size:12pt;line-height:2;\">+CVT</span><span style=\"font-size:12pt;line-height:2;\">铂金动力组合、</span><span style=\"font-size:12pt;line-height:2;\">BOSE</span><span style=\"font-size:12pt;line-height:2;\">音响、全景天窗、三重减震系统等诸多人性化科技，带来的豪华舒适与领先技术，是打动消费者的核心所在。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">再加上“</span><span style=\"font-size:12pt;line-height:2;\">CARWINGS</span><span style=\"font-size:12pt;line-height:2;\">智行</span><span style=\"font-size:12pt;line-height:2;\">+</span><span style=\"font-size:12pt;line-height:2;\">”智能全方位行车服务系统的配备，迎合了消费者对智能汽车生活的要求。</span><span style=\"font-size:12pt;line-height:2;\">其提供的“一站式”信息顾问、“二维”环保专家、“三重”安防系统三大服务，</span><span style=\"font-size:12pt;line-height:2;\">让消费者获得了更便捷无忧的移动体验</span><span style=\"font-size:12pt;line-height:2;\">。</span> \r\n</div>\r\n<p>\r\n\t<span style=\"font-size:12pt;line-height:2;\">“</span><span style=\"font-size:12pt;line-height:2;\">我们的目标很简单，无论市场环境如何改变、挑战者实力如何，天籁始终是消费者最好的选择，更是毋庸置疑的市场领袖。我们坚信，天籁将继续保持强劲的增长势头，引领中高级车市场的潮流。</span><span style=\"font-size:12pt;line-height:2;\">”杨嵩说。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:23:05','admin','管理员'),
  (94,'ruihe.new.company','IQS佳绩揭示高品质，阳光“银十”热力不褪','<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">近日，</span><span style=\"font-size:12pt;line-height:2;\">J.D. Power</span><span style=\"font-size:12pt;line-height:2;\">公司发布了</span><span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">年中国新车质量研究报告（</span><span style=\"font-size:12pt;line-height:2;\">IQS</span><span style=\"font-size:12pt;line-height:2;\">），去年</span><span style=\"font-size:12pt;line-height:2;\">12</span><span style=\"font-size:12pt;line-height:2;\">月上市的阳光取得了足样本成绩，取得了同级所有车型中最好的</span><span style=\"font-size:12pt;line-height:2;\">69PP100</span><span style=\"font-size:12pt;line-height:2;\">得分成绩。虽然因其是在合格交车期内新上市，不参与排名，但阳光的高品质由此可见一斑。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">最新数据显示，东风日产</span><span style=\"font-size:12pt;line-height:2;\">SUNNY</span><span style=\"font-size:12pt;line-height:2;\">阳光</span><span style=\"font-size:12pt;line-height:2;\">10</span><span style=\"font-size:12pt;line-height:2;\">月再创佳绩，销量达</span><span style=\"font-size:12pt;line-height:2;\">12,129</span><span style=\"font-size:12pt;line-height:2;\">台。尽管今年“银十”这一传统销售旺季的热力大不如前，阳光依然为中级车市场带来了“秋日暖阳”。</span> \r\n</div>\r\n<div style=\"line-height:150%;\">\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</div>\r\n<div style=\"line-height:150%;text-align:center;\" align=\"center\">\r\n\t<b><span style=\"font-size:12pt;line-height:2;\">品质助力，阳光剑指车市“长销”中级车</span></b> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">J.D. Power</span><span style=\"font-size:12pt;line-height:2;\">亚太公司中国新车质量研究（</span><span style=\"font-size:12pt;line-height:2;\">IQS</span><span style=\"font-size:12pt;line-height:2;\">）以研究衡量新车车主购车后</span><span style=\"font-size:12pt;line-height:2;\">2-6</span><span style=\"font-size:12pt;line-height:2;\">个月内经历的问题，比将新车质量问题明确划分为两大类：设计质量和生产质量（包括产品缺陷和故障）。新车质量的综合得分以每百辆车的问题数（</span><span style=\"font-size:12pt;line-height:2;\">PP100</span><span style=\"font-size:12pt;line-height:2;\">）来衡量，分数越低表明问题发生率越低，质量也越好。阳光虽因在</span><span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">年的合格交车期内新上市而不参与排名，但其依然取得了足样本成绩，并以</span><span style=\"font-size:12pt;line-height:2;\">69PP100</span><span style=\"font-size:12pt;line-height:2;\">的得分是同级所有车型中最佳的，不禁让人眼前一亮。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">对此，</span><span style=\"font-size:12pt;line-height:2;\">东风日产市场销售副总部长杨嵩表示：“阳光今年以中级车市的‘黑马’之势赢得了消费者关注，成为车市最畅销的中级车之一。本次在</span><span style=\"font-size:12pt;line-height:2;\">IQS</span><span style=\"font-size:12pt;line-height:2;\">中取得好成绩，证实了阳光的品质备受消费者认可，已具备成为中级车市场‘长销’车型的实力。”</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">说到阳光从“快热”到“长销”的成功之道，有人认为，阳光上市之初的热销是建立于低价之上的，更是有人表示“阳光快热的原因就是打价格战”。对此，</span><span style=\"font-size:12pt;line-height:2;\">杨嵩解释：“阳光在产品设计之初就一如既往地坚持品质路线，也针对</span><span style=\"font-size:12pt;line-height:2;\">外观、空间、油耗和价格这些商品定位的关键因素进行了深入研究</span><span style=\"font-size:12pt;line-height:2;\">。同时坚持了全球领先的日产生产方式，在制造方面为阳光的生产质量提供了有力保障。其实总结来说这是高性价比的体现，反应出来就是消费者对阳光高品质的口碑，同时也是阳光‘热销’乃至‘长销’的秘诀。”</span> \r\n</div>\r\n<div style=\"line-height:150%;\">\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</div>\r\n<div style=\"line-height:150%;text-align:center;\" align=\"center\">\r\n\t<b><span style=\"font-size:12pt;line-height:2;\">“技术派”阳光无惧车市“冰点”</span></b> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">金秋十月，往年“银十”的盛况并未如期而至，取而代之的则是优惠政策退出引致的车市“冰点”。</span><span style=\"font-size:12pt;line-height:2;\">10</span><span style=\"font-size:12pt;line-height:2;\">月汽车产销量分别为</span><span style=\"font-size:12pt;line-height:2;\">157.02</span><span style=\"font-size:12pt;line-height:2;\">万辆和</span><span style=\"font-size:12pt;line-height:2;\">152.48</span><span style=\"font-size:12pt;line-height:2;\">万辆，环比分别下降</span><span style=\"font-size:12pt;line-height:2;\">1.99%</span><span style=\"font-size:12pt;line-height:2;\">和</span><span style=\"font-size:12pt;line-height:2;\">7.37%</span><span style=\"font-size:12pt;line-height:2;\">，与去年同期相比，在产量增长</span><span style=\"font-size:12pt;line-height:2;\">1.72%</span><span style=\"font-size:12pt;line-height:2;\">的同时，销量却同比下降</span><span style=\"font-size:12pt;line-height:2;\">1.07%</span><span style=\"font-size:12pt;line-height:2;\">，销售遇冷状况明显。</span><span style=\"font-size:12pt;line-height:2;\">1.6L</span><span style=\"font-size:12pt;line-height:2;\">以下车型受政策退出所累，降幅首当其冲，</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"color:#333333;line-height:2;\">1</span><span style=\"font-size:12pt;line-height:2;\">0</span><span style=\"font-size:12pt;line-height:2;\">月</span><span style=\"font-size:12pt;line-height:2;\">19</span><span style=\"font-size:12pt;line-height:2;\">日，备受关注的“</span><span style=\"font-size:12pt;line-height:150%;\"><a title=\"\" href=\"http://www.bitauto.com/zhuanti/news/jienengbt2/\" target=\"_blank\"><span style=\"color:windowtext;line-height:2;text-decoration:none;text-underline:none;\">节能</span></a></span><span style=\"font-size:12pt;line-height:2;\">产品惠民工程”</span><span style=\"font-size:12pt;line-height:150%;\"><a title=\"\" href=\"http://www.bitauto.com/zhuanti/news/jienengbt2/\" target=\"_blank\"><span style=\"color:windowtext;line-height:2;text-decoration:none;text-underline:none;\">节能汽车</span></a></span><span style=\"font-size:12pt;line-height:2;\">推广目录（第七批）正式公布。该目录自</span><span style=\"font-size:12pt;line-height:2;\">10</span><span style=\"font-size:12pt;line-height:2;\">月</span><span style=\"font-size:12pt;line-height:2;\">1</span><span style=\"font-size:12pt;line-height:2;\">日起开始实施，同时前六批目录予以废止。首批符合新政的目录共计</span><span style=\"font-size:12pt;line-height:2;\">26</span><span style=\"font-size:12pt;line-height:2;\">款车型</span><span style=\"font-size:12pt;line-height:2;\">49</span><span style=\"font-size:12pt;line-height:2;\">个型号。据统计，此举会造成超过七成车型不能再享受节能补贴。就在各汽车厂商纷纷估算节能优惠政策退出所造成的损失时，阳光凭借其百公里仅</span><span style=\"font-size:12pt;line-height:2;\">5.8L</span><span style=\"font-size:12pt;line-height:2;\">的综合工况油耗继续享受</span><span style=\"font-size:12pt;line-height:2;\">3000</span><span style=\"font-size:12pt;line-height:2;\">元节能补贴，其市场竞争力不言而喻。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">业内专家指出，阳光之所以能在优惠政策退出的情况下继续保持强大的竞争力，离不开其“技术派”背景所带来的产品力优势。的确，阳光作为中级车市场“技术派”的代表，一直以其先进的节油技术、高科技的越级配置及超强的性价比，赢得了市场与消费者的认可。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">说到节能、环保方面的领先科技，就不得不提到阳光搭载的</span><span style=\"font-size:12pt;line-height:2;\">1.5L HR15DE</span><span style=\"font-size:12pt;line-height:2;\">发动机和全新智能</span><span style=\"font-size:12pt;line-height:2;\">XTRONIC CVT</span><span style=\"font-size:12pt;line-height:2;\">无级变速器。前者配置了双</span><span style=\"font-size:12pt;line-height:2;\">C-VTC</span><span style=\"font-size:12pt;line-height:2;\">连续可变气门正时智能控制系统及燃油双喷射系统，提高燃烧的稳定性的同时也有助于提高燃烧效率；后者则首次应用了子行星齿轮，辅以</span><span style=\"font-size:12pt;line-height:2;\">ASC</span><span style=\"font-size:12pt;line-height:2;\">智能逻辑控制系统、平顺起动助力系统、超低摩擦结构设计和</span><span style=\"font-size:12pt;line-height:2;\">CVT</span><span style=\"font-size:12pt;line-height:2;\">温度优化控制等领先技术，在提高驾驶平顺性的同时也降低油耗，大大提高了燃油经济性。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">而在其它方面，阳光的表现一样出色。无论是大气沉稳的外观，宽敞舒适的</span><span style=\"font-size:12pt;line-height:2;\">636mm</span><span style=\"font-size:12pt;line-height:2;\">最大后排腿部空间，还是包含了一键启动、电动天窗、双模式后排出风系统等人性化配置。加上</span><span style=\"font-size:12pt;line-height:2;\">8.28-11.28</span><span style=\"font-size:12pt;line-height:2;\">万元的极高性价比，可见阳光逆势热销不无道理。</span> \r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</div>\r\n<p>\r\n\t<span style=\"font-size:12pt;line-height:2;\">“踏准消费者需求节奏、把握技术升级潮流的阳光已经在上市近一年的时间了取得了让人刮目相看的成绩。至于是否能成为一直畅销的经典车型，车本身的质量的后续稳定表现和口碑的积累相当重要，</span><span style=\"font-size:12pt;line-height:2;\">IQS</span><span style=\"font-size:12pt;line-height:2;\">成绩和节油目录的入选无疑是其转变‘长销’的有力支持。阳光的后续表现仍非常值得期待。”这位业内专家评论到。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:25:13','admin','管理员'),
  (95,'ruihe.new.offsall','瑞孚冬季送温暖 冬季服务月','<ul>\r\n\t<li>\r\n\t\t<span style=\"font-size:14px;line-height:2;\">促销方案：</span> \r\n\t</li>\r\n</ul>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">1. 免费享受暖风系统、启动系统、行驶系统专项检测。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">2. 轮胎促销月：</span> \r\n</p>\r\n<ul>\r\n\t<li>\r\n\t\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; 更换普通轮胎赠送价值180元的轮胎养护剂一瓶（送完为止）。</span> \r\n\t\t<li>\r\n\t\t\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; 更换雪地胎赠送价值1250元的灯具保护剂一瓶（送完为止）。</span> \r\n\t\t</li>\r\n\t\t\t</ul>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">3. &nbsp;更换电瓶送价值260元的密封胶条保护剂一瓶（送完为止）。</span> \r\n\t\t\t</p>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">4.&nbsp; 凡进店参加三大系统免费检测车辆均赠送冬季玻璃水一瓶（送完为止）。</span> \r\n\t\t\t</p>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">5.&nbsp; 购买机油套餐：增送价值300元的柏油沥青去除剂一瓶，限额100名。</span> \r\n\t\t\t</p>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">6.&nbsp; 购买XT系列机油套餐（四桶机油）：可获赠价值188元的发动机线路保护剂一瓶，限额20名。</span> \r\n\t\t\t</p>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">7.&nbsp; 进店首、二保客户当日办理会员入会均有日产原厂精美礼品增送，限额100名。</span> \r\n\t\t\t</p>\r\n\t\t\t<p>\r\n\t\t\t\t<span style=\"font-size:14px;line-height:2;\">备注：本次活动只针对常规养护和维修车辆（事故车除外）。</span> \r\n\t\t\t</p>\r\n\t\t\t<ul>\r\n\t\t\t\t<li>\r\n\t\t\t\t\t<span style=\"font-size:14px;line-height:2;\">促销时间</span> \r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<span style=\"font-size:14px;line-height:2;\">12月1日至12月31日</span> \r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t\t</ul>\r\n\t\t\t\t\t\t<p style=\"margin-left:21pt;\">\r\n\t\t\t\t\t\t\t<span style=\"font-size:14px;line-height:2;\">本活动最终解释权归长春瑞孚所有</span> \r\n\t\t\t\t\t\t</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:26:51','admin','管理员'),
  (96,'ruihe.new.offsall','瑞孚岁末温暖奉送 共庆日产年度盛会','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">2011年，是东风日产崭新的一年，我们以超越同行的速度达成300万台销量，创造了东风日产奇迹。这一切都离不开广大车主的信赖和支持，是您成就了东风日产在行业及市场越来越好的口碑。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">为回馈广大车主对东风日产的厚爱，现东风日产瑞孚店联合绽放网在长春市景阳大路3862号（11高西行1500米87中斜对面）特推出“瑞孚岁末温暖奉送，共庆日产年度盛会——全系团购会第二季”活动。</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月3</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日-12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月31</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">瑞孚岁末温暖奉送——雪地胎团购</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">购邓禄普冬季轮胎，买三赠一！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">限量50套，先到先得！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月10</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日下午一点&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">给你的爱车许个愿</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">追求时尚生活的你面对爱车，是精心装饰？还是倍加呵护？</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">为你的爱车许个愿，让心愿变成现实，让爱车炫动色彩，彰显个性！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<strong><span style=\"font-size:14px;line-height:2;\">12</span></strong><strong><span style=\"font-size:14px;line-height:2;\">月17</span></strong><strong><span style=\"font-size:14px;line-height:2;\">日下午一点&nbsp;&nbsp;&nbsp; </span></strong><strong><span style=\"font-size:14px;line-height:2;\">瑞孚岁末温暖奉送——全系团购会第二季</span></strong> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">东风日产全系车型岁末特惠！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">现场签到得精美礼品一份！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">购车绽放网即送时尚家电一台！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">现场参与互动活动还有机会赢取其他高价值礼品！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">精彩活动抢先报！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享一：看车买车，岁末特惠！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享二：非常试驾，礼遇随行！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享三：有奖竞猜，优智生活！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享四：微博互动，好礼相送！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享五：车品竞拍，超值享受！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">尊享六：茶艺表演，品质服务！</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">品牌的保障，品质的服务！东风日产瑞孚店给您不一样的感受！请在2011年12月16日前登陆绽放网进行报名，即可参与本次活动。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:27:57','admin','管理员'),
  (97,'ruihe.new.car','智酷全能 自信跨越','<div style=\"margin:12pt 0cm 0pt;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">11</span><span style=\"font-size:14px;color:black;line-height:2;\">月18日，对于那些钟爱全能SUV的车友来说是个不同寻常的日子，因为备受关注的东风日产新奇骏终于在“千呼万唤”之中揭开了神秘面纱。全新的“智酷全能城市SUV”形象让人不禁对其跃跃欲试。到底，东风日产新奇骏有何全新变化？让我们一探究竟。</span> \r\n</div>\r\n<div style=\"margin:12pt 0cm 0pt;text-indent:21.3pt;\">\r\n\t<b><span style=\"font-size:14px;color:black;line-height:2;\">都市型男，新奇骏里外全面升级</span></b> \r\n</div>\r\n<div style=\"margin:12pt 0cm 0pt;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">新奇骏依然棱角分明地保持着酷帅的“体型”，</span><span style=\"font-size:14px;color:black;line-height:2;\">旧款前进气格栅上的一刀切式设计被更加美观的弧线所代替，基于X元素全新设计的前脸线条更加流畅、整体感明显增强；流线立体造型的灯光组合，更添都市风尚。虽然外观并不像其他SUV那般流线圆润，但是其独树一帜的硬朗风格倒是给新奇骏增添了些许都市型男的范儿。</span> \r\n</div>\r\n<div style=\"margin:12pt 0cm 0pt;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">不仅如此，新奇骏车型内部及细节的处理更是给人以惊喜。在内饰设计方面，</span><span style=\"font-size:14px;color:black;line-height:2;\">日产向来非常重视人性化设计，这点在新奇骏身上也得以完美体现。车内储物格随处可见，细节之处尽显贴心；新奇骏的座椅、中控台及智能仪表盘都进行了全新的设计，高质感的双色内饰与人性化便利的功能设计实现了完美结合，在增添个性之余更显大气稳重。坐在车内，开启拥有广阔视野的超大型开阔天窗，可以感受到前所未有的采光效果，驾乘空间无比通透。</span> \r\n</div>\r\n<div style=\"margin:12pt 0cm 0pt;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">不过，作为一款SUV车型，新奇骏的操控性和通过性才是更值得关注的。接下来，让我们看看新奇骏能给出怎么的答案。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.3pt;\">\r\n\t<b><span style=\"font-size:14px;color:black;line-height:2;\">畅通无阻，城市与郊外自由切换</span></b> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;line-height:20pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">新奇骏采用日产经典QR25发动机，配合新一代XTRONIC CVT无级变速器，不仅动力充沛、潜力十足，而且启动和加速过程毫无顿挫感和动力间断，堪称随心所欲。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">全新升级的智能全模式四驱4×4-i，可以在2WD、AUTO、LOCK三种驱动模式下轻松切换。面对崎岖山路和坑洼积水等复杂路况时，只要开启AUTO模式，系统便能自动对油门踏板的角度、发动机的转速和扭矩输出进行监控，同时在前轮出现打滑时，发动机扭矩会自动输出至后轮，瞬间提高整体通过性，轻松越过各种障碍。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">继逍客之后，新奇骏也装备了AVM全景式监控影像系统。无论在城市道路还是户外崎岖山路，新奇骏搭载的AVM全景式监控影像系统都可以让你全方位了解车辆四周的路面环境。AVM全景式监控影像系统通过四个超广角摄像头，能将合成的车辆周围环境鸟瞰图传递到中控台车载电脑上，在经过障碍物较多的路面时，通过鸟瞰图能精准判断车与路面障碍物的距离并及时躲避，而转弯倒车时，依靠后视镜下方的倒车摄像头，可让倒车动作变得十分顺畅。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">AVM</span><span style=\"font-size:14px;color:black;line-height:2;\">的摄像头切换功能在复杂道路行驶中能够起到很大作用，而在泊车中，360度环视影像功能则更能发挥作用，让驾驶获得直观的位置感受，可以不看车外，全凭观察屏幕就可以做到揉库和泊位停车。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">作为一款城市SUV车型，新奇骏不仅保持了舒适性、人性化配置和优秀的越野通过性等产品优势，更增加了智能化全新配置AVM全景式监控影像系统，让新奇骏“技术之王”的称号更加名副其实。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.3pt;\">\r\n\t<b><span style=\"font-size:14px;line-height:2;\">“CARWINGS</span></b><b><span style=\"font-size:14px;line-height:2;\">智行</span><sup><span style=\"font-size:14px;line-height:2;\">+</span></sup></b><b><span style=\"font-size:14px;line-height:2;\">”，</span></b><b><span style=\"font-size:14px;color:black;line-height:2;\">开启智酷全能新风潮</span></b> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">除了外观内饰以及通过性能的卓越表现，新奇骏让我们更加惊喜和兴奋的是，标配了与</span><span style=\"font-size:14px;color:black;line-height:2;\">东风日产旗舰车型新天籁同级的</span><span style=\"color:black;line-height:150%;\"><span style=\"font-size:14px;line-height:2;\">“CARWINGS智行</span><sup><span style=\"font-size:14px;line-height:2;\">+</span></sup><span style=\"font-size:14px;line-height:2;\">”智能全方位行车服务</span></span><span style=\"font-size:14px;color:black;line-height:2;\">系统，这在众多同级城市SUV车型中是不具备的。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">配合强有力的后台支持，</span><span style=\"color:black;\"><span style=\"font-size:14px;line-height:2;\">“CARWINGS智行</span><sup><span style=\"font-size:14px;line-height:2;\">+</span></sup><span style=\"font-size:14px;line-height:2;\">”系统</span></span><span style=\"font-size:14px;color:black;line-height:2;\">在为消费者提供车况实时检测、遇险自动救助和车辆入侵警报等“三重”安防服务的同时，还通过信息同步的用户专属平台，让车主完成即时交流和沟通，满足车主投诉咨询和预约维修等需求。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;line-height:20pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">如果拨通了CARWINGS服务中心，话务员能很快的帮助设定目的地，经过简单操作后，目的地就被下载到了导航屏幕上，整个过程轻松快捷，免除了以往设定导航信息时需要停车操作的不便。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;line-height:20pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">同时，为了增加车辆的防盗性和保护消费者财产安全，新奇骏配备了</span><span style=\"font-size:14px;color:black;line-height:2;\">入侵警报功能</span><span style=\"font-size:14px;color:black;line-height:2;\">。在车辆熄火、锁好之后，如果有人从车内拉开车门，此时，车辆迅速发出警报声，同时CARWINGS服务中心会发来提示短信，随后再以电话形式向车主通报车辆入侵的情况。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;line-height:20pt;\">\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">如果在接到车辆入侵通知后，车主无法及时赶到造成车辆失踪，CARWINGS服务中心还可以为警方定位车辆或追踪车辆位置。如果车辆遭遇拖吊，车载智能感应装置会自动联系CARWINGS服务中心，服务顾问会立刻以电话和短信方式告知用户车辆的具体位置，帮助车主尽快找回车辆。</span> \r\n</div>\r\n<div style=\"margin:6pt 0cm;text-indent:21.2pt;line-height:20pt;\">\r\n\t<span style=\"color:black;\"><span style=\"font-size:14px;line-height:2;\">此外，CARWINGS还具备商旅资讯服务，通过点击屏幕上资讯频道的相应分类新闻按钮，很快当天的各类新闻便下载完成，自动语音播报。同时，CARWINGS还提供酒店预订等便捷服务，对于希望拥有高品质管家式服务的车主而言，无疑是一项非常实用的功能。可以看出，“CARWINGS智行</span><sup><span style=\"font-size:14px;line-height:2;\">+</span></sup><span style=\"font-size:14px;line-height:2;\">”不仅是一套车载智能系统，更是一套整合的服务体系。</span></span> \r\n</div>\r\n<p>\r\n\t<span style=\"font-size:14px;color:black;line-height:2;\">此次，经过全面升级的新奇骏，在外观、内饰、智能、安全方面等方面得到全面提升，这对</span><span style=\"font-size:14px;color:black;line-height:2;\">每一位渴望在城市和户外自由跨越的消费者来说是个很大的诱惑。相信，“智酷全能城市SUV”新奇骏，不会让任何一个渴望彰显个性、肆意驰骋的人失望。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:30:15','admin','管理员'),
  (98,'ruihe.new.car','数据分析：中高级车市全年销量冠军将花落谁家？','<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">“金九银十”落幕，在车市销量整体反弹的大趋势下，中高级车市也跟着水涨船高。回顾</span><span style=\"font-size:12pt;line-height:2;\">1-10</span><span style=\"font-size:12pt;line-height:2;\">月份的累计销量排行榜，依然是天籁、雅阁、凯美瑞三足鼎立。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">如上表，从排行榜上看，天籁已打破长期由雅凯所把持的中高级车市格局，无可争议地稳坐头把交椅，雅凯则紧随其后。而新君越、新帕萨特也成为不容忽视的新生力量。至于其他车型，相较于前五名，差距依然巨大。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">即将收官，这也意味着年度销量冠军争夺战将更为激烈。由于新君越及新帕萨特销量落后较多（新君越落后凯美瑞</span><span style=\"font-size:12pt;line-height:2;\">29,674</span><span style=\"font-size:12pt;line-height:2;\">辆），这基本上宣告了他们无缘年度冠军。年度销量冠军更多将是天籁、雅阁及凯美瑞同唱一台戏。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">而这三款车型，势必“明争暗斗”，使尽浑身解数，志在摘取年度销量桂冠。那么，</span><span style=\"font-size:12pt;line-height:2;\">2011</span><span style=\"font-size:12pt;line-height:2;\">年过后，是雅凯继续垄断中高级车市，还是天籁最终打破雅凯“寡头”局面？</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">让我们先看一下这几款车每月累计的销量走势：</span>\r\n</div>\r\n<p>\r\n\t<img style=\"width:540px;height:313px;\" alt=\"\" src=\"http://www.e-nissan.com.cn/upload/pv/image/campaign/1321595281524.jpg\" />\r\n</p>\r\n<p>\r\n\t<span style=\"line-height:2;\">&nbsp;</span>\r\n</p>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">从上表可以看出，</span><span style=\"font-size:12pt;line-height:2;\">6</span><span style=\"font-size:12pt;line-height:2;\">月是三强争霸的分水岭，天籁以强势表现一举超越雅凯，成为上半年销量冠军。进入下半年，天籁表现仍最为突出，其累计销量不仅持续领先，更以稳步增长的态势为整体平淡的车市增添了不少看点。而雅凯的销量虽然不断增长，但只能屈居其后。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">分析前十个月三款车型的平均月销量，天籁是</span><span style=\"font-size:12pt;line-height:2;\">12,515</span><span style=\"font-size:12pt;line-height:2;\">辆，雅阁为</span><span style=\"font-size:12pt;line-height:2;\">12,190</span><span style=\"font-size:12pt;line-height:2;\">辆，凯美瑞为</span><span style=\"font-size:12pt;line-height:2;\">12,097</span><span style=\"font-size:12pt;line-height:2;\">辆。而在总销量上，天籁目前领先雅阁</span><span style=\"font-size:12pt;line-height:2;\">3,241</span><span style=\"font-size:12pt;line-height:2;\">辆、凯美瑞</span><span style=\"font-size:12pt;line-height:2;\">4,173</span><span style=\"font-size:12pt;line-height:2;\">辆。这意味着，接下来的两个月，天籁即使仅保持平均月销量，雅阁、凯美瑞也需在目前各自平均月销量的基础上，分别平均每月超过天籁</span><span style=\"font-size:12pt;line-height:2;\">1,945</span><span style=\"font-size:12pt;line-height:2;\">辆、</span><span style=\"font-size:12pt;line-height:2;\">2,505</span><span style=\"font-size:12pt;line-height:2;\">辆方有机会夺冠。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">差距或许并不大，但在争夺年度销量冠军的关键时刻，这足以“致命”。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">从三款车型平均月销量及总销量上看，可以说，雅凯的垄断地位，正在一步步被天籁打破。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">首先，天籁的累计销量占据一定的优势。其次，天籁良好的口碑以及产品力优势，不仅为其赢得了消费者的认可，更确保了天籁在中高级车市场上的“一枝独秀”。最后，也是其他车型所无法企及的一点，是天籁势必夺冠的气势。东风日产市场销售总部副总部长杨嵩近日信心十足地撂下“狠话”：“我们坚信，今年天籁的销量肯定会突破</span><span style=\"font-size:12pt;line-height:2;\">15</span><span style=\"font-size:12pt;line-height:2;\">万台。我们也有绝对的信心，天籁会夺得全年销量冠军。”</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">综合以上，趁着前三季度夺冠之势，以及稳定而强烈的上升势头，天籁一举夺得年度销量冠军的可能性最大。而以天籁为代表的日系车，也将继续占据中高级车市场绝对优势的地位。</span>\r\n</div>\r\n<div style=\"text-indent:24pt;line-height:150%;text-align:left;\" align=\"left\">\r\n\t<span style=\"font-size:12pt;line-height:2;\">但是，正如一场戏的高潮总会在结尾出现——最后的冲刺阶段，面临“易主”压力的雅凯也势必穷追猛打。笑到最后的，是否一定是天籁？答案，</span><span style=\"font-size:12pt;line-height:2;\">2012</span><span style=\"font-size:12pt;line-height:2;\">年</span><span style=\"font-size:12pt;line-height:2;\">1</span><span style=\"font-size:12pt;line-height:2;\">月即将揭晓。</span>\r\n</div>','article.state.normal','普通','visible.true','显示',0,'2011-12-12 17:32:29','admin','管理员'),
  (99,'ruihe.insurance.knowledge','保险知识','<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">主险:</span></b> \r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">1、车辆损失险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp; 车辆损失险是指保险车辆遭受保险责任范围内的自然灾害(不包括地震)或意外事故，造成保险车辆本身损失，保险人依据保险合同的规定给予赔偿。这与第三者刚相反是顾自己的，如果您爱惜自己的车就要买。平时的小磕小碰，都可以得到赔偿。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">2、第三者责任险&nbsp;</span></b><span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;属强制性保险，车年审时需要。指合格驾驶员在使用被保险车辆过程中发生意外事故而造成第三者的财产直接损失与人员伤亡的。以现在的赔付标准，建议最少买10万元，最好买20万元或50万元，特别是新手或中意飞车的朋友及工作压力大精神不易集中的朋友，又因五万元、10万元、20万元的价钱相差不大，总之这个险种买大的自己安心。买时最好参照本地区的交通事故赔偿标准。</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">&nbsp;3、全车盗抢险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;如果你的车在使用过程中一直都在比较可靠、安全的停车场中停放，上下班路途中也没有什么特别僻静的路段，就可以考虑不保盗抢险，但如果你的车属于很常见的、丢失率比较高的车型，那一定要保盗抢险。这样一旦发生意外，尤其是新车，可以获得相应赔偿，以免损失惨重。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">4、车上人员责任险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;车上人员责任险建议买3万以下。如果你的车经常有朋友坐，那你也可以考虑买多个座位，不过不用买太多，保障额度在一万元至两万元/座就够了。这个险种很便宜，每座几十块钱就可以搞定。</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">附加险:</span></b> \r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">1、玻璃单独破碎险&nbsp;：</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;指使用过程中发生本车玻璃单独破碎，注意“单独”两字，而如是其他事故引起的，车损险里有赔，所以如是国产车，玻璃亦不贵，想省钱的可不买。如果没有自己的车库，停放在路边或者小区公用停车场的话，建议购买。</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">2、自燃损失险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;车辆在行驶过程中，因本车电器、线路、供油系统发生故障及载运货物自燃原因起火燃烧，造成车辆损失以及施救所支付的合理费用。是新车建议不买，三年以上的车建议考虑。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">3、车身划痕险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;在使用过程中，被他人剐划(无明显碰撞痕迹)需要修复的费用，一般新车、新手买。如果没有自己的车库，停放在路边或者小区公用停车场的话，小区物业一般的话，建议购买。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">4、不计免赔率特约</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp;&nbsp;车辆发生车辆损失险、全车盗抢险或第三者责任险的保险事故造成赔偿，对应由被保险人承担的免赔金额(20%)，由保险公司负责赔。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">5、不计免赔额&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;车辆发生车辆损失险、全车盗抢险或第三者责任险的保险事故造成赔偿，对应由被保险人承担的免赔金额，由保险公司负责赔。不计免赔险几乎是个必保的好险种，建议加上。特别是新手，加上了会有用的，尤其在你碰到大的事故损失时，这个险种可以大大减少你的损失。&nbsp;</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;</span><b><span style=\"font-size:14px;line-height:2;\">6、新增加设备损失险&nbsp;</span></b> \r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp; &nbsp; &nbsp;如果你是爱车爱改装车的人，那么这个险种必不可少，它对你购车后，在车上新装的各类部件提供保障。比如我们常见的大包围、儿童座椅，加装的导航、疝气大灯，都比较贵重，新增加设备损失险就是为这些加装的东西保驾护航的。</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-13 11:20:52','admin','管理员'),
  (100,'ruihe.insurance.indemnify','保险理赔','<h2 align=\"center\">\r\n\t<span style=\"font-size:14px;\">保险理赔的基本流程</span> \r\n</h2>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 出现交通事故后首先要做的是及时报案。出了交通事故除了向交通管理部门报案外，还要及时向保险公司报案。一方面让保险公司知道投保人出了交通事故，另一方面也可以向保险公司咨询如何处理、保护现场，保险公司会教车友如何向对方索要事故证明等。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213112440_904.jpg\" /> \r\n</p>\r\n<p class=\"indent24\">\r\n\t&nbsp;\r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 以上是车主和保险公司理赔员必须要做的。事实胜于雄辨，车主一定要注意做好前期工作，避免事后理赔时麻烦被动。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 其次要及时与保险公司沟通。车主要积极协助保险公司完成对车辆查勘、照相以及定损等必要工作。结案前应向交管部门了解事故中自己应负多大的责任、损失多少和伤者的赔偿费用等情况，然后再向保险公司询问哪些情况能赔哪些情况不能赔，尽量减少损失。同时，车主在找救援公司拖车以及找修理厂修车时，关于价格问题要与保险公司及时沟通，避免救援公司或者修理厂的开价与保险公司的赔偿价格相差太大。对于定损时没有发现的车辆损失，应及时通知保险公司，由保险公司进行二次查勘定损，这笔额外的损失就不用车主自己掏钱了。因为保险事故受损或造成第三者财产损坏，应当尽量修复。修理前被保险人须会同保险公司检验，确定修理项目、修理方式及修理费用。若客户自行修理，保险公司会重新核定甚至拒绝赔偿。车辆修复以后，在支付修理费用和办理领车手续前务必对修理质量进行查验。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-size:14px;line-height:2;\">最后提醒车主在出现交通事故后不应该出现两个极端：(1)在发生交通事故后喜欢私了，也就是说怕麻烦，觉得去理赔就是浪费时间，宁愿把这些时间浪费在和对方车主争执上。结果是耽搁了理赔的时间，往往是两头得不到赔偿，苦水只能往肚子里咽了。所以当发生交通事故时，最好不要私了，更不能忍气吞声。(2)哪怕一丁点的小刮擦都要去保险公司理赔。这样做既浪费时间，又增加了自己的理赔率，因为保险公司每年根据车主的出险率有一定的折扣。我们拿太平洋保险公司举例，太平洋公司规定：被保险车辆出险3次后，保险公司将从第4次事故起，每增加一次保险事故，则在条款规定的免赔基础上增加5%免赔率，在一年内该项免赔最高增加15%。由此看来，那一小点损失去理赔就不值了。因此建议车主在有很小的损失时就没有必要东奔西跑地浪费精力了。</span> \r\n</p>\r\n<p>\r\n\t&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-13 11:23:45','admin','管理员'),
  (101,'ruihe.insurance.introduce','保险服务介绍','<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 目前个人购买汽车保险的渠道主要有保险公司直销、电话网络营销、代理公司代销和4S店代销等。这些不同的车险渠道其实是有比较大的差别的，各自也有不同的优势。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　其中在4S店投保，价格上可能略高于电话或者网络投保。但是带给我们的利益也是很多的。我们众所周知的如：</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">专业的投保方案设计</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　1、到期续保温馨提醒。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　2、专业的保险咨询顾问，贴心设计完善的保险方案。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">高品质的维修质量</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　1、采用专业的维修设备。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　2、经过统一的系统培训、经验丰富的优秀技师。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　3、100%的使用原厂备件。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">省时又方便的理赔</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　1、专业的理赔顾问，为你提供一对一的理赔指导。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　2、协助与代办理赔事宜，使您理赔无忧。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　此外，还有全年无休365日全国服务热线时刻为您守候，有时候4S店为了回馈用户，会有一些感恩客户的活动，给予在店投保的客户更多的优惠与服务。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">在4S投保最核心优势</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　其实，在4S投保最核心优势体现在定损环节上。例如对于一般的保险事故车，保险公司只会按照市场上平均的、甚至最低的配件价和维修价来定损，而这个价格和品牌4S店的维修价格相差很大，即车主理赔金额与真实维修价格差距很大。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">　　选择4S店购买车险，就不会出现这样的问题。这是因为品牌4S店销售的车辆保险是经过专业人员精心选择、签订了认证协议、有理赔服务保障的保险。通过4S店投放车险的车辆在出现事故时，在车辆定损问题上，不仅是保险公司单方面的事情，而且受厂家总部到品牌4S店、由总到分的认证协议的约束。</span>\r\n</p>\r\n<p>\r\n\t<span style=\"font-size:14px;line-height:2;\">这样就保证了客户在4S店投保的保单，都有认证协议的保障，事故车的定损价格都会严格按照4S店的维修标准来确定。从而保证爱车事故后维修采用原厂配件及维修工艺，确保定损无差异，真正做到“投保放心、出险无忧、维修放心、理赔省心”。</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-13 11:27:15','admin','管理员'),
  (102,'ruihe.salled.notice','公告','<p>\r\n\t<b><span style=\"font-size:14px;line-height:2;\">1.质量担保原则</span></b> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户在严格按产品有关使用文件(保养手册，使用说明书)规定进行使用的前提下，因产品设计，制造，装配和材料等质量问题而引发的各类故障和零部件损坏，经东风日产轿车销售服务店鉴定属东风日产汽车销售有限公司责任的，给予质量担保服务。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 整车质量担保期限为车辆购买之日（以购买发票日期为准）起3年或行驶里程6万公里，且二者中以先达到的限定为准。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 整车质量担保期内，因产品质量问题而免费更换的零部件，其质量担保期以用户有利为原则，即更换零部件时整车剩余质量担保期限大于1年或者30000公里，则更换的零部件的质量担保期随整车质量担保期结束而结束；如果更换零部件时整车剩余质量担保期限小于1年或者30000公里，则更换的零部件的质量担保期按照1年或者30000公里执行，且两者中以先达到的限定为准。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户在东风日产汽车销售服务店自费修理更换零部件的质量担保期为自零部件更换之日（根据开具修理发票的日期）起1年或30000公里，且二者中以先达到的限定为准。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户在东风日产汽车销售服务店自费修理更换零部件的质量担保期为自零部件更换之日（根据开具修理发票的日期）起1年或3万公里，且二者中以先达到的限定为准。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<b><span style=\"font-size:14px;line-height:2;\">2. 其它质量担保说明</span></b> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">下列情况质量担保期为 5年：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; 车身因锈蚀导致结构破坏(碎石飞溅、化学粉尘、树液、盐、暴风、冰雹、闪电或其它不利环境造成的问题除外)。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">下列情况质量担保期为1年：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; a)乘客仓内、外装饰的制品因材料或制造质量问题，经鉴定为一汽马自达汽车销售有限公司责任的；</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; b)所有表面镀层和喷涂的零部件因材料本身差异、发生化学反应或附着力差导致的腐蚀、剥落、变色等缺陷，经鉴定属一汽马自达汽车销售有限公司责任的。</span> \r\n</p>\r\n<p class=\"indent24\">\r\n\t<span style=\"font-size:14px;line-height:2;\">下列情况质量担保期为6个月：</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; 蓄电池没电(含库存商品车)。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; 间接损失依据国家相关标准执行。</span><br />\r\n<span style=\"font-size:14px;line-height:2;\">&nbsp;&nbsp;&nbsp; 其它未提及部分质量担保期按3年或60000公里实施质量担保服务。</span> \r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-13 11:38:04','admin','管理员'),
  (103,'ruihe.salled.help','服务手册','<img alt=\"\" src=\"/rongzhan/attached/image/20111213/20111213115210_107.jpg\" />','article.state.normal','普通','visible.true','显示',0,'2011-12-13 11:42:13','admin','管理员'),
  (104,'ruihe.salled.special','特色服务','<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\">店内为</span><span style=\"font-size:14px;line-height:2;\">客户提供</span><span style=\"font-size:14px;line-height:2;\">宽敞舒适的休息大厅、宽带、</span><span style=\"font-size:14px;line-height:2;\">免费</span><span style=\"font-size:14px;line-height:2;\">咖啡等服务。</span>\r\n</p>\r\n<p align=\"center\">\r\n\t<span style=\"font-size:14px;line-height:2;\"></span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-13 12:12:09','admin','管理员'),
  (105,'rongzhan.about.company','旗下品牌','','article.state.normal','普通','visible.true','显示',0,'2011-12-17 10:34:04','admin','管理员');
COMMIT;

#
# Data for the `web_content` table  (LIMIT 0,500)
#

INSERT INTO `web_content` (`id`, `name`, `english`, `path`, `parentId`, `sort`, `hasShow`, `hasShowName`, `mode`, `modeName`) VALUES 
  ('rongzhan','融展集团','RongZhan Group','',NULL,1,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.home','首页','Home','index.jsp','rongzhan',22,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.about','集团介绍','About','','rongzhan',23,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.new','新闻中心','New','','rongzhan',29,'visible.true','显示','content.mode.more','多项'),
  ('rongzhan.service','集团服务','Services','','rongzhan',30,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.insurance','保险中心','Insurance','','rongzhan',31,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.loan','分期贷款','Loan','','rongzhan',32,'visible.true','显示','content.mode.none','空项'),
  ('rongzhan.hr','人才招聘','HR','','rongzhan',33,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.contact','联系我们','Contact','','rongzhan',34,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.speak','董事长致辞','Speak','','rongzhan.about',35,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.introduce','集团介绍','Introduce','','rongzhan.about',36,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.culture','企业文化','Enterprise culture','','rongzhan.about',37,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.course','发展历程','Course','','rongzhan.about',39,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.new.enterprise','企业新闻','Enterprise','','rongzhan.new',40,'visible.true','显示','content.mode.more','多项'),
  ('rongzhan.new.car','行业新闻','Car','','rongzhan.new',41,'visible.true','显示','content.mode.more','多项'),
  ('rongzhan.new.sall','促销新闻','Sall','','rongzhan.new',42,'visible.true','显示','content.mode.more','多项'),
  ('rongzhan.service.test','验车中心','Test','','rongzhan.service',43,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.service.rescue','24小时救援','Rescue','','rongzhan.service',44,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.service.special','特殊服务','Special','','rongzhan.service',45,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.service.member','会员服务','Memer','','rongzhan.service',46,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.service.book','在线预约','Book','','rongzhan.service',47,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.insurance.sall','保险销售','Sall','','rongzhan.insurance',48,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.insurance.indemnify','保险理赔','Indemnify','','rongzhan.insurance',49,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.loan.toyota','丰田金融','Toyota','','rongzhan.loan',50,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.loan.gm','通用金融','GM','','rongzhan.loan',51,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.loan.fw','大众金融','FW','','rongzhan.loan',52,'visible.true','显示','content.mode.one','单项'),
  ('ruihe','吉林市瑞合汽车贸易有限公司','ChangChun RuiFu','',NULL,54,'visible.false','隐藏','content.mode.none','空项'),
  ('ruihe.home','首页','Home','index.jsp','ruihe',56,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.about','企业介绍','About','','ruihe',57,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.new','新闻中心','New','','ruihe',58,'visible.true','显示','content.mode.more','多项'),
  ('ruihe.sall','销售服务','Sall','cus_cars.jsp','ruihe',59,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.salled','售后服务','Salled','','ruihe',60,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.insurance','保险服务','Insurance','','ruihe',61,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.online','在线客服','Online','','ruihe',62,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.book','预约服务','Book','cus_bookcar.jsp','ruihe',63,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.about.introduce','企业介绍','Introduce','','ruihe.about',64,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.about.glory','公司荣誉','Glory','','ruihe.about',65,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.about.form','公司形象','Form','','ruihe.about',66,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.about.contact','联系方式','Contact','','ruihe.about',67,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.new.offsall','优惠活动','OffSall','','ruihe.new',68,'visible.true','显示','content.mode.more','多项'),
  ('ruihe.new.company','公司新闻','Company','','ruihe.new',69,'visible.true','显示','content.mode.more','多项'),
  ('ruihe.new.car','行业新闻','Car','','ruihe.new',70,'visible.true','显示','content.mode.more','多项'),
  ('ruihe.sall.new','新车报价','NewCar','cus_cars.jsp','ruihe.sall',71,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.sall.offsall','优惠促销','OffSall','','ruihe.sall',72,'visible.true','显示','content.mode.more','多项'),
  ('ruihe.sall.special','特色服务','Special','','ruihe.sall',73,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.salled.notice','公告','Notice','','ruihe.salled',74,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.salled.repair','保修保养服务','Repair','','ruihe.salled',75,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.salled.special','特色服务','Special','','ruihe.salled',76,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.salled.help','服务手册','Help','','ruihe.salled',77,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.insurance.introduce','保险服务介绍','Introduce','','ruihe.insurance',78,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.insurance.knowledge','保险知识','Knowledge','','ruihe.insurance',79,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.insurance.indemnify','保险理赔','Insurance','','ruihe.insurance',80,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.online.enquire','资讯客服','Enquire','','ruihe.online',81,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.online.complain','投诉意见','Complain','cus_advise.jsp','ruihe.online',82,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.online.message','客户留言','Message','cus_message.jsp','ruihe.online',83,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.book.drive','试乘预约','Drive','cus_bookcar.jsp','ruihe.book',84,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.book.repair','维修预约','Repair','cus_bookcar.jsp','ruihe.book',85,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.book.maintain','保养预约','Maintain','cus_bookcar.jsp','ruihe.book',86,'visible.true','显示','content.mode.one','单项'),
  ('ruihe.book.buy','订车预约','Buy','cus_bookcar.jsp','ruihe.book',87,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.structure','组织架构','Structur','','rongzhan.about',120,'visible.true','显示','content.mode.one','单项'),
  ('dongri.home','首页','Home','index.jsp','dongri',123,'visible.true','显示','content.mode.one','单项'),
  ('dongri.about','企业介绍','About','','dongri',124,'visible.true','显示','content.mode.one','单项'),
  ('dongri.new','新闻中心','New','','dongri',125,'visible.true','显示','content.mode.more','多项'),
  ('dongri.sall','销售服务','Sall','cus_cars.jsp','dongri',126,'visible.true','显示','content.mode.one','单项'),
  ('dongri.salled','售后服务','Salled','','dongri',127,'visible.true','显示','content.mode.one','单项'),
  ('dongri.insurance','保险服务','Insurance','','dongri',128,'visible.true','显示','content.mode.one','单项'),
  ('dongri.online','在线客服','Online','','dongri',129,'visible.true','显示','content.mode.one','单项'),
  ('dongri.book','预约服务','Book','cus_bookcar.jsp','dongri',130,'visible.true','显示','content.mode.one','单项'),
  ('dongri.about.introduce','企业介绍','Introduce','','dongri.about',131,'visible.true','显示','content.mode.one','单项'),
  ('dongri.about.glory','公司荣誉','Glory','','dongri.about',132,'visible.true','显示','content.mode.one','单项'),
  ('dongri.about.form','公司形象','Form','','dongri.about',133,'visible.true','显示','content.mode.one','单项'),
  ('dongri.about.contact','联系方式','Contact','','dongri.about',134,'visible.true','显示','content.mode.one','单项'),
  ('dongri.new.offsall','优惠活动','OffSall','','dongri.new',135,'visible.true','显示','content.mode.more','多项'),
  ('dongri.new.company','公司新闻','Company','','dongri.new',136,'visible.true','显示','content.mode.more','多项'),
  ('dongri.new.car','行业新闻','Car','','dongri.new',137,'visible.true','显示','content.mode.more','多项'),
  ('dongri.sall.new','新车报价','NewCar','cus_cars.jsp','dongri.sall',138,'visible.true','显示','content.mode.one','单项'),
  ('dongri.sall.offsall','优惠促销','OffSall','','dongri.sall',139,'visible.true','显示','content.mode.one','单项'),
  ('dongri.sall.special','特色服务','Special','','dongri.sall',140,'visible.true','显示','content.mode.one','单项'),
  ('dongri.salled.notice','公告','Notice','','dongri.salled',141,'visible.true','显示','content.mode.one','单项'),
  ('dongri.salled.repair','保修保养服务','Repair','','dongri.salled',142,'visible.true','显示','content.mode.one','单项'),
  ('dongri.salled.special','特色服务','Special','','dongri.salled',143,'visible.true','显示','content.mode.one','单项'),
  ('dongri.salled.help','服务手册','Help','','dongri.salled',144,'visible.true','显示','content.mode.one','单项'),
  ('dongri.insurance.introduce','保险服务介绍','Introduce','','dongri.insurance',145,'visible.true','显示','content.mode.one','单项'),
  ('dongri.insurance.knowledge','保险知识','Knowledge','','dongri.insurance',146,'visible.true','显示','content.mode.one','单项'),
  ('dongri.insurance.indemnify','保险理赔','Insurance','','dongri.insurance',147,'visible.true','显示','content.mode.one','单项'),
  ('dongri.online.enquire','资讯客服','Enquire','','dongri.online',148,'visible.true','显示','content.mode.one','单项'),
  ('dongri.online.complain','投诉意见','Complain','cus_advise.jsp','dongri.online',149,'visible.true','显示','content.mode.one','单项'),
  ('dongri.online.message','客户留言','Message','cus_message.jsp','dongri.online',150,'visible.true','显示','content.mode.one','单项'),
  ('dongri.book.drive','试乘预约','Drive','cus_bookcar.jsp','dongri.book',151,'visible.true','显示','content.mode.one','单项'),
  ('dongri.book.repair','维修预约','Repair','cus_bookcar.jsp','dongri.book',152,'visible.true','显示','content.mode.one','单项'),
  ('dongri.book.maintain','保养预约','Maintain','cus_bookcar.jsp','dongri.book',153,'visible.true','显示','content.mode.one','单项'),
  ('dongri.book.buy','订车预约','Buy','cus_bookcar.jsp','dongri.book',154,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.home','首页','Home','index.jsp','rongsheng',155,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.about','企业介绍','About','','rongsheng',156,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.new','新闻中心','New','','rongsheng',157,'visible.true','显示','content.mode.more','多项'),
  ('rongsheng.sall','销售服务','Sall','','rongsheng',158,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.salled','售后服务','Salled','','rongsheng',159,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.insurance','保险服务','Insurance','','rongsheng',160,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.online','在线客服','Online','','rongsheng',161,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.book','预约服务','Book','','rongsheng',162,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.about.introduce','企业介绍','Introduce','','rongsheng.about',163,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.about.glory','公司荣誉','Glory','','rongsheng.about',164,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.about.form','公司形象','Form','','rongsheng.about',165,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.about.contact','联系方式','Contact','','rongsheng.about',166,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.new.offsall','优惠活动','OffSall','','rongsheng.new',167,'visible.true','显示','content.mode.more','多项'),
  ('rongsheng.new.company','公司新闻','Company','','rongsheng.new',168,'visible.true','显示','content.mode.more','多项'),
  ('rongsheng.new.car','行业新闻','Car','','rongsheng.new',169,'visible.true','显示','content.mode.more','多项'),
  ('rongsheng.sall.new','新车报价','NewCar','','rongsheng.sall',170,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.sall.offsall','优惠促销','OffSall','','rongsheng.sall',171,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.sall.special','特色服务','Special','','rongsheng.sall',172,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.salled.notice','公告','Notice','','rongsheng.salled',173,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.salled.repair','保修保养服务','Repair','','rongsheng.salled',174,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.salled.special','特色服务','Special','','rongsheng.salled',175,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.salled.help','服务手册','Help','','rongsheng.salled',176,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.insurance.introduce','保险服务介绍','Introduce','','rongsheng.insurance',177,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.insurance.knowledge','保险知识','Knowledge','','rongsheng.insurance',178,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.insurance.indemnify','保险理赔','Insurance','','rongsheng.insurance',179,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.online.enquire','资讯客服','Enquire','','rongsheng.online',180,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.online.complain','投诉意见','Complain','cus_advise.jsp','rongsheng.online',181,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.online.message','客户留言','Message','cus_message.jsp','rongsheng.online',182,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.book.drive','试乘预约','Drive','','rongsheng.book',183,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.book.repair','维修预约','Repair','','rongsheng.book',184,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.book.maintain','保养预约','Maintain','','rongsheng.book',185,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng.book.buy','订车预约','Buy','','rongsheng.book',186,'visible.true','显示','content.mode.one','单项'),
  ('suixin.home','首页','Home','index.jsp','suixin',187,'visible.true','显示','content.mode.one','单项'),
  ('suixin.about','企业介绍','About','','suixin',188,'visible.true','显示','content.mode.one','单项'),
  ('suixin.new','新闻中心','New','','suixin',189,'visible.true','显示','content.mode.more','多项'),
  ('suixin.sall','销售服务','Sall','cus_cars.jsp','suixin',190,'visible.true','显示','content.mode.one','单项'),
  ('suixin.salled','售后服务','Salled','','suixin',191,'visible.true','显示','content.mode.one','单项'),
  ('suixin.insurance','保险服务','Insurance','','suixin',192,'visible.true','显示','content.mode.one','单项'),
  ('suixin.online','在线客服','Online','','suixin',193,'visible.true','显示','content.mode.one','单项'),
  ('suixin.book','预约服务','Book','cus_bookcar.jsp','suixin',194,'visible.true','显示','content.mode.one','单项'),
  ('suixin.about.introduce','企业介绍','Introduce','','suixin.about',195,'visible.true','显示','content.mode.one','单项'),
  ('suixin.about.glory','公司荣誉','Glory','','suixin.about',196,'visible.true','显示','content.mode.one','单项'),
  ('suixin.about.form','公司形象','Form','','suixin.about',197,'visible.true','显示','content.mode.one','单项'),
  ('suixin.about.contact','联系方式','Contact','','suixin.about',198,'visible.true','显示','content.mode.one','单项'),
  ('suixin.new.offsall','优惠活动','OffSall','','suixin.new',199,'visible.true','显示','content.mode.more','多项'),
  ('suixin.new.company','公司新闻','Company','','suixin.new',200,'visible.true','显示','content.mode.more','多项'),
  ('suixin.new.car','行业新闻','Car','','suixin.new',201,'visible.true','显示','content.mode.more','多项'),
  ('suixin.sall.new','新车报价','NewCar','cus_cars.jsp','suixin.sall',202,'visible.true','显示','content.mode.one','单项'),
  ('suixin.sall.offsall','优惠促销','OffSall','','suixin.sall',203,'visible.true','显示','content.mode.one','单项'),
  ('suixin.sall.special','特色服务','Special','','suixin.sall',204,'visible.true','显示','content.mode.one','单项'),
  ('suixin.salled.notice','公告','Notice','','suixin.salled',205,'visible.true','显示','content.mode.one','单项'),
  ('suixin.salled.repair','保修保养服务','Repair','','suixin.salled',206,'visible.true','显示','content.mode.one','单项'),
  ('suixin.salled.special','特色服务','Special','','suixin.salled',207,'visible.true','显示','content.mode.one','单项'),
  ('suixin.salled.help','服务手册','Help','','suixin.salled',208,'visible.true','显示','content.mode.one','单项'),
  ('suixin.insurance.introduce','保险服务介绍','Introduce','','suixin.insurance',209,'visible.true','显示','content.mode.one','单项'),
  ('suixin.insurance.knowledge','保险知识','Knowledge','','suixin.insurance',210,'visible.true','显示','content.mode.one','单项'),
  ('suixin.insurance.indemnify','保险理赔','Insurance','','suixin.insurance',211,'visible.true','显示','content.mode.one','单项'),
  ('suixin.online.enquire','资讯客服','Enquire','','suixin.online',212,'visible.true','显示','content.mode.one','单项'),
  ('suixin.online.complain','投诉意见','Complain','cus_advise.jsp','suixin.online',213,'visible.true','显示','content.mode.one','单项'),
  ('suixin.online.message','客户留言','Message','cus_message.jsp','suixin.online',214,'visible.true','显示','content.mode.one','单项'),
  ('suixin.book.drive','试乘预约','Drive','cus_bookcar.jsp','suixin.book',215,'visible.true','显示','content.mode.one','单项'),
  ('suixin.book.repair','维修预约','Repair','cus_bookcar.jsp','suixin.book',216,'visible.true','显示','content.mode.one','单项'),
  ('suixin.book.maintain','保养预约','Maintain','cus_bookcar.jsp','suixin.book',217,'visible.true','显示','content.mode.one','单项'),
  ('suixin.book.buy','订车预约','Buy','cus_bookcar.jsp','suixin.book',218,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.home','首页','Home','index.jsp','xingbang',219,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.about','企业介绍','About','','xingbang',220,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.new','新闻中心','New','','xingbang',221,'visible.true','显示','content.mode.more','多项'),
  ('xingbang.sall','销售服务','Sall','cus_cars.jsp','xingbang',222,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.salled','售后服务','Salled','','xingbang',223,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.insurance','保险服务','Insurance','','xingbang',224,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.online','在线客服','Online','','xingbang',225,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.book','预约服务','Book','cus_bookcar.jsp','xingbang',226,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.about.introduce','企业介绍','Introduce','','xingbang.about',227,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.about.glory','公司荣誉','Glory','','xingbang.about',228,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.about.form','公司形象','Form','','xingbang.about',229,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.about.contact','联系方式','Contact','','xingbang.about',230,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.new.offsall','优惠活动','OffSall','','xingbang.new',231,'visible.true','显示','content.mode.more','多项'),
  ('xingbang.new.company','公司新闻','Company','','xingbang.new',232,'visible.true','显示','content.mode.more','多项'),
  ('xingbang.new.car','行业新闻','Car','','xingbang.new',233,'visible.true','显示','content.mode.more','多项'),
  ('xingbang.sall.new','新车报价','NewCar','cus_cars.jsp','xingbang.sall',234,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.sall.offsall','优惠促销','OffSall','','xingbang.sall',235,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.sall.special','特色服务','Special','','xingbang.sall',236,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.salled.notice','公告','Notice','','xingbang.salled',237,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.salled.repair','保修保养服务','Repair','','xingbang.salled',238,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.salled.special','特色服务','Special','','xingbang.salled',239,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.salled.help','服务手册','Help','','xingbang.salled',240,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.insurance.introduce','保险服务介绍','Introduce','','xingbang.insurance',241,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.insurance.knowledge','保险知识','Knowledge','','xingbang.insurance',242,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.insurance.indemnify','保险理赔','Insurance','','xingbang.insurance',243,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.online.enquire','资讯客服','Enquire','','xingbang.online',244,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.online.complain','投诉意见','Complain','cus_advise.jsp','xingbang.online',245,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.online.message','客户留言','Message','cus_message.jsp','xingbang.online',246,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.book.drive','试乘预约','Drive','cus_bookcar.jsp','xingbang.book',247,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.book.repair','维修预约','Repair','cus_bookcar.jsp','xingbang.book',248,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.book.maintain','保养预约','Maintain','cus_bookcar.jsp','xingbang.book',249,'visible.true','显示','content.mode.one','单项'),
  ('xingbang.book.buy','订车预约','Buy','cus_bookcar.jsp','xingbang.book',250,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.home','首页','Home','index.jsp','xinyu',252,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.about','企业介绍','About','','xinyu',253,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.new','新闻中心','New','','xinyu',254,'visible.true','显示','content.mode.more','多项'),
  ('xinyu.sall','销售服务','Sall','','xinyu',255,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.salled','售后服务','Salled','','xinyu',256,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.insurance','保险服务','Insurance','','xinyu',257,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.online','在线客服','Online','','xinyu',258,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.book','预约服务','Book','','xinyu',259,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.about.introduce','企业介绍','Introduce','','xinyu.about',260,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.about.glory','公司荣誉','Glory','','xinyu.about',261,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.about.form','公司形象','Form','','xinyu.about',262,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.about.contact','联系方式','Contact','','xinyu.about',263,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.new.offsall','优惠活动','OffSall','','xinyu.new',264,'visible.true','显示','content.mode.more','多项'),
  ('xinyu.new.company','公司新闻','Company','','xinyu.new',265,'visible.true','显示','content.mode.more','多项'),
  ('xinyu.new.car','行业新闻','Car','','xinyu.new',266,'visible.true','显示','content.mode.more','多项'),
  ('xinyu.sall.new','新车报价','NewCar','','xinyu.sall',267,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.sall.offsall','优惠促销','OffSall','','xinyu.sall',268,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.sall.special','特色服务','Special','','xinyu.sall',269,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.salled.notice','公告','Notice','','xinyu.salled',270,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.salled.repair','保修保养服务','Repair','','xinyu.salled',271,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.salled.special','特色服务','Special','','xinyu.salled',272,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.salled.help','服务手册','Help','','xinyu.salled',273,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.insurance.introduce','保险服务介绍','Introduce','','xinyu.insurance',274,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.insurance.knowledge','保险知识','Knowledge','','xinyu.insurance',275,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.insurance.indemnify','保险理赔','Insurance','','xinyu.insurance',276,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.online.enquire','资讯客服','Enquire','','xinyu.online',277,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.online.complain','投诉意见','Complain','cus_advise.jsp','xinyu.online',278,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.online.message','客户留言','Message','cus_message.jsp','xinyu.online',279,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.book.drive','试乘预约','Drive','','xinyu.book',280,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.book.repair','维修预约','Repair','','xinyu.book',281,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.book.maintain','保养预约','Maintain','','xinyu.book',282,'visible.true','显示','content.mode.one','单项'),
  ('xinyu.book.buy','订车预约','Buy','','xinyu.book',283,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng','绥化融展兴盛汽车销售服务有限公司','JiLin LongFu','',NULL,284,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.home','首页','Home','index.jsp','xingsheng',285,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.about','企业介绍','About','','xingsheng',286,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.new','新闻中心','New','','xingsheng',287,'visible.true','显示','content.mode.more','多项'),
  ('xingsheng.sall','销售服务','Sall','','xingsheng',288,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.salled','售后服务','Salled','','xingsheng',289,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.insurance','保险服务','Insurance','','xingsheng',290,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.online','在线客服','Online','','xingsheng',291,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.book','预约服务','Book','','xingsheng',292,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.about.introduce','企业介绍','Introduce','','xingsheng.about',293,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.about.glory','公司荣誉','Glory','','xingsheng.about',294,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.about.form','公司形象','Form','','xingsheng.about',295,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.about.contact','联系方式','Contact','','xingsheng.about',296,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.new.offsall','优惠活动','OffSall','','xingsheng.new',297,'visible.true','显示','content.mode.more','多项'),
  ('xingsheng.new.company','公司新闻','Company','','xingsheng.new',298,'visible.true','显示','content.mode.more','多项'),
  ('xingsheng.new.car','行业新闻','Car','','xingsheng.new',299,'visible.true','显示','content.mode.more','多项'),
  ('xingsheng.sall.new','新车报价','NewCar','','xingsheng.sall',300,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.sall.offsall','优惠促销','OffSall','','xingsheng.sall',301,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.sall.special','特色服务','Special','','xingsheng.sall',302,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.salled.notice','公告','Notice','','xingsheng.salled',303,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.salled.repair','保修保养服务','Repair','','xingsheng.salled',304,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.salled.special','特色服务','Special','','xingsheng.salled',305,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.salled.help','服务手册','Help','','xingsheng.salled',306,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.insurance.introduce','保险服务介绍','Introduce','','xingsheng.insurance',307,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.insurance.knowledge','保险知识','Knowledge','','xingsheng.insurance',308,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.insurance.indemnify','保险理赔','Insurance','','xingsheng.insurance',309,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.online.enquire','资讯客服','Enquire','','xingsheng.online',310,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.online.complain','投诉意见','Complain','cus_advise.jsp','xingsheng.online',311,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.online.message','客户留言','Message','cus_message.jsp','xingsheng.online',312,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.book.drive','试乘预约','Drive','','xingsheng.book',313,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.book.repair','维修预约','Repair','','xingsheng.book',314,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.book.maintain','保养预约','Maintain','','xingsheng.book',315,'visible.true','显示','content.mode.one','单项'),
  ('xingsheng.book.buy','订车预约','Buy','','xingsheng.book',316,'visible.true','显示','content.mode.one','单项'),
  ('xinyu','通化鑫宇汽车销售有限公司','JiLin LongFu','',NULL,317,'visible.true','显示','content.mode.one','单项'),
  ('xingbang','哈尔滨融展兴邦专营店','JiLin LongFu','',NULL,318,'visible.true','显示','content.mode.one','单项'),
  ('suixin','绥化融展绥鑫专营店','JiLin LongFu','',NULL,319,'visible.true','显示','content.mode.one','单项'),
  ('rongsheng','通化市融晟汽车销售服务有限公司','JiLin LongFu','',NULL,320,'visible.true','显示','content.mode.one','单项'),
  ('dongri','哈尔滨融展东日专营店','JiLin LongFu','',NULL,321,'visible.true','显示','content.mode.one','单项'),
  ('rongzhan.about.company','旗下品牌','Company','companylist.jsp','rongzhan.about',322,'visible.true','显示','content.mode.one','单项');
COMMIT;

#
# Data for the `web_message` table  (LIMIT 0,500)
#

INSERT INTO `web_message` (`id`, `cid`, `state`, `stateName`, `hasShow`, `hasShowName`, `sendTime`, `sendText`, `sendEmail`, `sendPhone`, `sendName`, `receiveTime`, `receiveText`, `receiveOperater`, `receiveOperaterName`, `type`) VALUES 
  (1,'rongzhan.about','message.state.false','未回复','visible.true','显示','2011-09-29 02:44:23','tttpp','11@11.11pp','13555555550','vvvppp','2011-09-29 02:44:23','vvvffffppp','admin','管理员',NULL),
  (2,'rongzhan','message.state.true','已回复','visible.false','隐藏','2011-09-29 03:39:08','hhhh','11@11.11','13967895555','123123123','2011-09-29 03:39:08','1412412412','admin','管理员',NULL),
  (3,'rongzhan','message.state.true','已回复','visible.false','隐藏','2011-09-29 03:44:07','aa\r\nbb\r\ncc','gg@11.com','13596160505','123','2011-09-29 03:44:07','124124\r\n123123\r\n123123123','admin','管理员',NULL),
  (5,'ruihe','message.state.false','未回复','visible.true','显示','2011-12-14 17:46:46','ttt','ttt','ttt','ttt','','','','','留言'),
  (6,'ruihe','message.state.false','未回复','visible.true','显示','2011-12-19 09:20:35','asdfa','asd','asd','asd','','','','','投诉'),
  (7,'ruihe','message.state.true','已回复','visible.true','显示','2011-12-19 11:07:45','w呜呜呜','123@163.com','13574658976','jyb','','别哭','','','留言'),
  (8,'ruihe','message.state.false','未回复','visible.true','显示','2011-12-19 14:41:40','uaef嗖地划分','jt@163.com','13585932123','姜','','','','','留言'),
  (9,'ruihe','message.state.false','未回复','visible.true','显示','2011-12-19 14:43:26','仨人的股份 ','2345','134545','二','','','','','留言'),
  (10,'ruihe','message.state.false','未回复','visible.true','显示','2011-12-20 15:02:49','阿斯顿飞','245','2345','打三分 ','','','','','投诉'),
  (11,'xingbang','message.state.false','未回复','visible.true','显示','2011-12-21 13:26:17','rewerg','245','2345','wer','','','','','投诉'),
  (12,'xingbang','message.state.false','未回复','visible.true','显示','2011-12-21 14:12:55','wowowttt','123','123','jyb','','','','','留言'),
  (13,'xingbang','message.state.false','未回复','visible.true','显示','2011-12-21 14:13:17','测试刷新','134','1234','jyb','','','','','留言'),
  (14,'xingbang','message.state.false','未回复','visible.true','显示','2011-12-21 14:17:24','呵呵呵呵','123','123','啊全文','','','','','留言'),
  (15,'xingbang','message.state.false','未回复','visible.true','显示','2011-12-21 14:18:41','哦哦','4','4','一','','','','','留言');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;