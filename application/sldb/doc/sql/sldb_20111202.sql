/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.1.31-community : Database - sldb
*********************************************************************
Server version : 5.1.31-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `sldb`;

USE `sldb`;

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
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

/*Data for the table `app_dict` */

insert  into `app_dict`(`id`,`key`,`value`,`type`,`pinyin`) values (1,'article.state.normal','普通','article.state','putong'),(2,'article.state.recommand','推荐','article.state','tuijian'),(3,'article.state.top','置顶','article.state','zhiding'),(4,'ascii','ACSII码','regex','acsii'),(5,'bookcar.state.false','未确认','bookcar.state','weiqueren'),(6,'bookcar.state.true','确认','bookcar.state','queren'),(7,'bookcar.type.bookcar','订车','bookcar.type','dingche'),(8,'bookcar.type.change','置换','bookcar.type','zhihuan'),(9,'bookcar.type.drive','试驾','bookcar.type','shijia'),(10,'boolean.false','否','boolean','fou'),(11,'boolean.true','是','boolean','shi'),(12,'car.dongfenghonda','东风本田','car','dongfengbentian'),(13,'car.dongfenghonda.civic','思域','car.dongfenghonda','siyu'),(14,'car.dongfenghonda.crv','CRV','car.dongfenghonda','crv'),(15,'car.dongfenghonda.crv.1','系列一','car.dongfenghonda.crv','xilieyi'),(16,'car.dongfenghonda.crv.2','系列二','car.dongfenghonda.crv','xilieer'),(17,'car.dongfenghonda.spirior','思铂睿','car.dongfenghonda','siborui'),(18,'car.dongfengnissan','东风尼桑','car','dongfengnisang'),(19,'car.yiqivw','一汽大众','car','yiqidazhong'),(20,'chinese','中文','regex','zhengwen'),(21,'column.type.decimal','decimal','column.type','decimal'),(22,'column.type.int','int','column.type','int'),(23,'column.type.varchar','varchar','column.type','varchar'),(24,'content.mode.more','多项','content.mode','duoxiang'),(25,'content.mode.none','空项','content.mode','kongxiang'),(26,'content.mode.one','单项','content.mode','danxiang'),(28,'decmal','浮点数','regex','fudianshu'),(29,'email','邮箱','regex','youxiang'),(30,'flow.node.approve','回退节点','flow.node','huituijiedian'),(31,'flow.node.create','创建节点','flow.node','chuangjianjiedian'),(32,'flow.node.process','过程节点','flow.node','guochengjiedian'),(33,'flow.node.realize','结束节点','flow.node','jieshujiedian'),(34,'form.type.creater','创建者','form.type','chuangjianzhe'),(35,'form.type.datebox','日期','form.type','riqi'),(36,'form.type.datetime','日期时间','form.type','riqishijian'),(37,'form.type.textarea','文本域','form.type','wenbenyu'),(38,'form.type.combox','单选框','form.type','danxuankuang'),(39,'id','标识','regex','biaoshi'),(40,'idcard','身份证','regex','shenfenzheng'),(41,'integer','整数','regex','zhengshu'),(42,'letter','字母','regex','zimu'),(43,'loginId','登录标识','regex','denglubiaoshi'),(44,'message.state.false','未回复','message.state','weihuifu'),(45,'message.state.true','已回复','message.state','yihuifu'),(46,'node.condition.auth','权限','node.condition.model','qanxian'),(47,'node.condition.auth.department','组织机构','node.condition.auth','bumen'),(48,'node.condition.auth.role','角色','node.condition.auth','juese'),(49,'node.condition.auth.user','用户','node.condition.auth','yonghu'),(50,'node.condition.workflow','工作流','node.condition.model','chuangjianzhe'),(51,'node.condition.creater.department','部门负责人','node.condition.creater','bumenfuzeren'),(52,'node.condition.creater.self','本人','node.condition.creater','zhuangjianzhe'),(53,'notempty','非空','regex','feikong'),(54,'number','数字','regex','shuzi'),(55,'phone','手机电话','regex','shouji'),(56,'picture','图片','regex','tupian'),(57,'qq','QQ号','regex','qq'),(58,'rar','压缩文件','regex','yasuowenjian'),(59,'tel','座机电话','regex','zuoji'),(60,'url','URL','regex','url'),(61,'visible.false','隐藏','visible','yinchang'),(62,'visible.true','显示','visible','xianshi'),(63,'zipcode','邮编','regex','youbian'),(64,'只读','只读','node.state','zhidu'),(65,'必填','必填','node.state','bitian'),(66,'选填','选填','node.state','xuantian'),(67,'隐藏','隐藏','node.state','yincang'),(68,'yes','同意','advise','tongyi'),(69,'no','不同意','advise','butongyi'),(70,'form.type.input','输入框','form.type','shurukuang'),(71,'node.condition.creater.department.people','同部门','node.condition.creater','tongbumen'),(75,'node.condition.creater','创建者','node.condition.workflow','chuangjianzhe'),(86,'申报','申报','sldb.state.type','shenbao'),(87,'初审','初审','sldb.state.type','chushen'),(88,'核对','核对','sldb.state.type','hedui'),(89,'驳回','驳回','sldb.state.type','bohui'),(90,'通过','通过','sldb.state.type','tongguo'),(91,'农村低保收入','农村低保收入','sldb.person.type','nongcundibaoshouru'),(92,'城镇低保收入','城镇低保收入','sldb.person.type','chegnzhendibaoshouru'),(93,'农村低保','农村低保','sldb.person.type','nongcundibao'),(94,'城镇低保','城镇低保','sldb.person.type','chengzhendibao'),(95,'女','女','gender','nv'),(96,'男','男','gender','nan'),(97,'是','是','easyboolean','shi'),(98,'否','否','easyboolean','fou'),(102,'非农','非农','sldb.hukou','none'),(103,'农业','农业','sldb.hukou','none'),(104,'其他','其他','sldb.home','none'),(105,'农转非家庭','农转非家庭','sldb.home','none'),(106,'因残致贫家庭','因残致贫家庭','sldb.home','none'),(107,'年老体弱家庭','年老体弱家庭','sldb.home','none'),(108,'子女就学（升学）困难家庭','子女就学（升学）困难家庭','sldb.home','none'),(109,'因灾致贫家庭','因灾致贫家庭','sldb.home','none'),(110,'因病致贫家庭','因病致贫家庭','sldb.home','none'),(111,'三无人员家庭','三无人员家庭','sldb.home','none'),(112,'丧偶','丧偶','sldb.marry','none'),(113,'离异','离异','sldb.marry','none'),(114,'未婚','未婚','sldb.marry','none'),(115,'已婚','已婚','sldb.marry','none'),(116,'完全劳动能力','完全劳动能力','sldb.workable','none'),(117,'部分劳动能力','部分劳动能力','sldb.workable','none'),(118,'无劳动能力','无劳动能力','sldb.workable','none'),(119,'其他','其他','sldb.idType','none'),(120,'孤儿','孤儿','sldb.idType','none'),(121,'大学在校生','大学在校生','sldb.idType','none'),(122,'高中在校生','高中在校生','sldb.idType','none'),(123,'中学在校生','中学在校生','sldb.idType','none'),(124,'小学在校生','小学在校生','sldb.idType','none'),(125,'无业','无业','sldb.idType','none'),(126,'退休','退休','sldb.idType','none'),(127,'在职','在职','sldb.idType','none'),(128,'其他特殊病种','其他特殊病种','sldb.ill','none'),(129,'红斑狼疮','红斑狼疮','sldb.ill','none'),(130,'腰间盘突出','腰间盘突出','sldb.ill','none'),(131,'股骨头坏死','股骨头坏死','sldb.ill','none'),(132,'气管炎','气管炎','sldb.ill','none'),(133,'哮喘','哮喘','sldb.ill','none'),(134,'精神病','精神病','sldb.ill','none'),(135,'肺结核','肺结核','sldb.ill','none'),(136,'白血病','白血病','sldb.ill','none'),(137,'类风湿疾病','类风湿疾病','sldb.ill','none'),(138,'糖尿病','糖尿病','sldb.ill','none'),(139,'重症肝病','重症肝病','sldb.ill','none'),(140,'脑血栓','脑血栓','sldb.ill','none'),(141,'脑出血','脑出血','sldb.ill','none'),(142,'心脏病','心脏病','sldb.ill','none'),(143,'肾功能衰竭','肾功能衰竭','sldb.ill','none'),(144,'癌症','癌症','sldb.ill','none'),(145,'其他残疾','其他残疾','sldb.deformity','none'),(146,'多重残疾','多重残疾','sldb.deformity','none'),(147,'精神残疾','精神残疾','sldb.deformity','none'),(148,'智力残疾','智力残疾','sldb.deformity','none'),(149,'肢体残疾','肢体残疾','sldb.deformity','none'),(150,'言语残疾','言语残疾','sldb.deformity','none'),(151,'听力残疾','听力残疾','sldb.deformity','none'),(152,'视力残疾','视力残疾','sldb.deformity','none'),(153,'一级','一级','sldb.deformityLevel','none'),(154,'二级','二级','sldb.deformityLevel','none'),(155,'三级','三级','sldb.deformityLevel','none'),(156,'四级','四级','sldb.deformityLevel','none'),(157,'五级','五级','sldb.deformityLevel','none'),(158,'其他','其他','sldb.companyType','none'),(159,'地方集体','地方集体','sldb.companyType','none'),(160,'地方国有','地方国有','sldb.companyType','none'),(161,'省直集体','省直集体','sldb.companyType','none'),(162,'省直国有','省直国有','sldb.companyType','none'),(163,'中直集体','中直集体','sldb.companyType','none'),(164,'中直国有','中直国有','sldb.companyType','none'),(165,'其他','其他','sldb.trade','none'),(166,'轻化','轻化','sldb.trade','none'),(167,'建筑','建筑','sldb.trade','none'),(168,'地矿','地矿','sldb.trade','none'),(169,'机械军工','机械军工','sldb.trade','none'),(170,'农垦','农垦','sldb.trade','none'),(171,'冶金','冶金','sldb.trade','none'),(172,'森工','森工','sldb.trade','none'),(173,'煤炭','煤炭','sldb.trade','none'),(174,'其他保险','其他保险','sldb.insurance','none'),(175,'商业保险','商业保险','sldb.insurance','none'),(176,'工伤保险','工伤保险','sldb.insurance','none'),(177,'生育保险','生育保险','sldb.insurance','none'),(178,'失业保险','失业保险','sldb.insurance','none'),(179,'医疗保险','医疗保险','sldb.insurance','none'),(180,'养老保险','养老保险','sldb.insurance','none'),(181,'否','否','sldb.insurance','none');

/*Table structure for table `app_form_item` */

DROP TABLE IF EXISTS `app_form_item`;

CREATE TABLE `app_form_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `showName` varchar(50) DEFAULT NULL,
  `defaultValue` varchar(500) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `required` varchar(50) DEFAULT NULL,
  `requiredName` varchar(50) DEFAULT NULL,
  `readonly` varchar(50) DEFAULT NULL,
  `readonlyName` varchar(50) DEFAULT NULL,
  `hidden` varchar(50) DEFAULT NULL,
  `hiddenName` varchar(50) DEFAULT NULL,
  `min` varchar(50) DEFAULT NULL,
  `max` varchar(50) DEFAULT NULL,
  `regex` varchar(50) DEFAULT NULL,
  `regexName` varchar(50) DEFAULT NULL,
  `focusTip` varchar(200) DEFAULT NULL,
  `func` varchar(2000) DEFAULT NULL,
  `dict` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  `render` varchar(2000) DEFAULT NULL,
  `formType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `app_form_item` */

insert  into `app_form_item`(`id`,`name`,`showName`,`defaultValue`,`tableId`,`required`,`requiredName`,`readonly`,`readonlyName`,`hidden`,`hiddenName`,`min`,`max`,`regex`,`regexName`,`focusTip`,`func`,`dict`,`type`,`typeName`,`render`,`formType`) values (16,'vvv','vvv','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(17,'name','名称','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(18,'age','年龄','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(40,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(41,'phone','电话','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(42,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(43,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(\'#used\').combobox({\r\n	onSelect : function(record){\r\n	       $(\'#usedName\').val(record.text);\r\n        }\r\n});','add'),(44,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(45,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),(46,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),(54,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(55,'phone','电话','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(56,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(57,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(\'#used\').combobox({\r\n	onSelect : function(record){\r\n	       $(\'#usedName\').val(record.text);\r\n        }\r\n});','edit'),(58,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(59,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),(60,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','51','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit'),(61,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(62,'date','日期','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','日期','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),(63,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),(68,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(69,'date','日期','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','日期','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),(70,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit');

/*Table structure for table `app_queryform_item` */

DROP TABLE IF EXISTS `app_queryform_item`;

CREATE TABLE `app_queryform_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `showName` varchar(50) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `condition` varchar(50) DEFAULT NULL,
  `conditionName` varchar(50) DEFAULT NULL,
  `hidden` varchar(50) DEFAULT NULL,
  `hiddenName` varchar(50) DEFAULT NULL,
  `sort` varchar(50) DEFAULT NULL,
  `sortName` varchar(50) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `format` varchar(2000) DEFAULT NULL,
  `dict` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `app_queryform_item` */

insert  into `app_queryform_item`(`id`,`name`,`showName`,`tableId`,`condition`,`conditionName`,`hidden`,`hiddenName`,`sort`,`sortName`,`width`,`format`,`dict`,`type`,`typeName`) values (3,'age','年龄',7,'boolean.true','是','visible.true','显示','boolean.true','是','100','','car','form.type.input','输入框'),(9,'vvv','vvv',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','','form.type.textarea','文本域'),(10,'name','名称',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','boolean','form.type.combox','单选框'),(12,'name','名称',9,'boolean.true','是','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),(13,'phone','电话',9,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','form.type.input','输入框'),(14,'email','邮箱',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),(15,'used','有效',9,'boolean.true','是','visible.false','隐藏','boolean.true','是','50','','boolean','form.type.combox','单选框'),(16,'usedName','是否有效',9,'boolean.false','否','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),(18,'birthday','生日',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.datebox','日期'),(19,'desc','描述',9,'boolean.false','否','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),(22,'name','姓名',10,'boolean.true','是','visible.true','显示','boolean.true','是','101','','','form.type.input','输入框'),(23,'date','日期',10,'boolean.true','是','visible.true','显示','boolean.true','是','152','','','form.type.datebox','日期'),(25,'phone','电话',10,'boolean.true','是','visible.true','显示','boolean.true','是','150','return value;','','form.type.input','输入框'),(26,'test_age','年龄',27,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','input','输入框');

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `parentId` varchar(100) DEFAULT NULL,
  `sort` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('configuration.table','管理表','/app/system/easyform/table/show.jsp','configuration',41),('sldb.admin','管理双辽低保','',NULL,45),('sldb.person','双辽低保','',NULL,49),('sldb.admin.importInfo','管理导入表格','/app/sldb/info/show.jsp','sldb.admin',50),('sldb.import','数据导入','',NULL,51),('sldb.person.apply','申请低保','/app/sldb/person/apply.jsp','sldb.person',52),('sldb.person.first','初审低保','/app/sldb/person/first.jsp','sldb.person',53),('sldb.person.check','核对低保','/app/sldb/person/check.jsp','sldb.person',54),('sldb.person.end','决议低保','/app/sldb/person/end.jsp','sldb.person',55),('sldb.admin.import','查看导入数据','/app/sldb/import/show.jsp','sldb.admin',56),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57),('sldb.import.house','房产数据','/app/sldb/import/sub/house.jsp','sldb.import',58);

/*Table structure for table `app_table` */

DROP TABLE IF EXISTS `app_table`;

CREATE TABLE `app_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `showName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `app_table` */

insert  into `app_table`(`id`,`name`,`showName`) values (9,'test_ust','测试用户'),(10,'test_abc','ABC');

/*Table structure for table `app_table_column` */

DROP TABLE IF EXISTS `app_table_column`;

CREATE TABLE `app_table_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `showName` varchar(50) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `defaultValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `app_table_column` */

insert  into `app_table_column`(`id`,`name`,`showName`,`tableId`,`type`,`typeName`,`length`,`defaultValue`) values (12,'age','年龄',7,'column.type.varchar','varchar','50','5'),(13,'name','名称',7,'column.type.varchar','varchar','50','11'),(14,'name','名称',8,'column.type.varchar','varchar','50',''),(15,'age','年龄',8,'column.type.varchar','varchar','50',''),(16,'ss','ss',8,'column.type.varchar','varchar','50',''),(17,'vvv','vvv',7,'column.type.varchar','varchar','50','1'),(18,'name','名称',9,'column.type.varchar','varchar','50',''),(19,'phone','电话',9,'column.type.varchar','varchar','50',''),(20,'email','邮箱',9,'column.type.varchar','varchar','50',''),(21,'used','有效',9,'column.type.varchar','varchar','50','boolean.true'),(22,'desc','描述',9,'column.type.varchar','varchar','50',''),(23,'birthday','生日',9,'column.type.varchar','varchar','50',''),(24,'usedName','是否有效',9,'column.type.varchar','varchar','50','是'),(25,'name','姓名',10,'column.type.varchar','varchar','50',''),(26,'date','日期',10,'column.type.varchar','varchar','50',''),(27,'phone','电话',10,'column.type.varchar','varchar','50',''),(44,'testCol','测试列',1,'column.type.varchar','varchar','50','无');

/*Table structure for table `auth_organizations` */

DROP TABLE IF EXISTS `auth_organizations`;

CREATE TABLE `auth_organizations` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `responsible` varchar(50) DEFAULT '否',
  `parentId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `auth_organizations` */

insert  into `auth_organizations`(`id`,`name`,`description`,`responsible`,`parentId`) values (3,'长春巾航科技有限公司','','否',NULL),(4,'董事长','','否','3'),(5,'总经理','','是','3'),(6,'销售副总','','否','3'),(7,'售后副总','','否','3'),(8,'财务副总','','否','3'),(9,'人事副总','','否','3'),(10,'人事部','','否','3'),(11,'人事部长','','是','10'),(12,'人事部副部长','','否','10'),(13,'人事部助理','','否','10'),(14,'人事部成员','','否','10'),(15,'销售部','','否','3'),(16,'销售部长','','是','15');

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

insert  into `auth_re_organization_user`(`organizationId`,`userId`) values (11,'zhangsan'),(12,'admin'),(16,'lisi');

/*Table structure for table `auth_re_role_resource` */

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` int(100) NOT NULL,
  `resourceId` varchar(100) CHARACTER SET gb2312 NOT NULL DEFAULT '',
  PRIMARY KEY (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_re_role_resource` */

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values (1,'auth'),(1,'auth.change.password'),(1,'auth.organization'),(1,'auth.resource'),(1,'auth.role'),(1,'auth.user'),(1,'car'),(1,'car.admin.bookcar'),(1,'car.admin.newcar'),(1,'car.bookcar'),(1,'car.newcar'),(1,'configuration'),(1,'configuration.dict'),(1,'configuration.table'),(1,'configuration.workflow.instance'),(1,'website'),(1,'website.article'),(1,'website.content'),(1,'website.editcontent'),(1,'website.message'),(1,'workflow'),(3,'sldb.admin'),(3,'sldb.admin.import'),(3,'sldb.admin.importInfo'),(3,'sldb.import'),(3,'sldb.import.house'),(3,'sldb.person'),(3,'sldb.person.apply'),(3,'sldb.person.check'),(3,'sldb.person.end'),(3,'sldb.person.first');

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

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin',1),('admin',3);

/*Table structure for table `auth_roles` */

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `auth_roles` */

insert  into `auth_roles`(`id`,`name`,`description`) values (1,'超级管理员','拥有所有权限'),(3,'双辽低保','双辽低保管理员');

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

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','lueSGJZetyySpUndWjMBEg==','guyuzmq@gmail.com','18943630044'),('zhangsan','张三','lueSGJZetyySpUndWjMBEg==','1111@11.11','13599999999');

/*Table structure for table `sldb_house2011-12` */

DROP TABLE IF EXISTS `sldb_house2011-12`;

CREATE TABLE `sldb_house2011-12` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `identify` varchar(20) DEFAULT NULL,
  `sum` varchar(10) DEFAULT NULL,
  `importDate` varchar(50) DEFAULT NULL,
  `iid` varchar(100) DEFAULT NULL,
  `importType` int(10) DEFAULT NULL,
  `importError` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `sldb_house2011-12` */

insert  into `sldb_house2011-12`(`id`,`name`,`identify`,`sum`,`importDate`,`iid`,`importType`,`importError`) values (4,'张三','2.20102198112034E16','3.0','2011-12','admin1322745684235',1,''),(5,'李四','2.20102198112034E16','4.0','2011-12','admin1322745684235',1,''),(6,'王五','2.20102198112034E16','5.0','2011-12','admin1322745684235',1,''),(7,'张三','22010219811203401','3.0','2011-12','admin1322746088392',1,''),(8,'李四','22010219811203402','4.0','2011-12','admin1322746088392',1,''),(9,'王五','22010219811203403','5.0','2011-12','admin1322746088392',1,''),(10,'马六','22010219811203404','','2011-12','admin1322746088392',1,''),(11,'张三','22010219811203401','3.0','2011-12','admin1322801082010',1,''),(12,'李四','22010219811203402','4.0','2011-12','admin1322801082010',1,''),(13,'王五','22010219811203403','5.0','2011-12','admin1322801082010',1,''),(14,'马六','22010219811203404','6.0','2011-12','admin1322801082010',1,''),(19,'张三','22010219811203401','3.0','2011-12','admin1322836059229',1,''),(20,'李四','22010219811203402','4.0','2011-12','admin1322836059229',1,''),(21,'王五','22010219811203403','5.0','2011-12','admin1322836059229',1,''),(22,'马六','22010219811203404','6.0','2011-12','admin1322836059229',1,'');

/*Table structure for table `sldb_import` */

DROP TABLE IF EXISTS `sldb_import`;

CREATE TABLE `sldb_import` (
  `id` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `creater` varchar(50) DEFAULT NULL,
  `createrName` varchar(50) DEFAULT NULL,
  `sum` varchar(20) DEFAULT NULL,
  `importDate` varchar(10) DEFAULT NULL,
  `filePath` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sldb_import` */

insert  into `sldb_import`(`id`,`type`,`createTime`,`creater`,`createrName`,`sum`,`importDate`,`filePath`) values ('admin1322745684235','2','2011-12-01 21:21:24','admin','管理员','3','2011-12','E:\\01project\\01current\\new\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\easyapp\\sldb\\2\\2011-12\\\\20111201212124_admin.xls'),('admin1322746088392','2','2011-12-01 21:28:08','admin','管理员','4','2011-12','E:\\01project\\01current\\new\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\easyapp\\sldb\\2\\2011-12\\\\20111201212808_admin.xls'),('admin1322801082010','2','2011-12-02 12:44:42','admin','管理员','4','2011-12','E:\\01project\\01current\\new\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\easyapp\\sldb\\2\\2011-12\\\\20111202124442_admin.xls'),('admin1322836059229','2','2011-12-02 22:27:39','admin','管理员','4','2011-12','E:\\01project\\01current\\new\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\sldb\\sldb\\2\\2011-12\\\\20111202222739_admin.xls');

/*Table structure for table `sldb_import_info` */

DROP TABLE IF EXISTS `sldb_import_info`;

CREATE TABLE `sldb_import_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `startLine` varchar(50) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sldb_import_info` */

insert  into `sldb_import_info`(`id`,`name`,`tableName`,`startLine`,`desc`) values (2,'房产局','sldb_house','1','房产局导入表格信息');

/*Table structure for table `sldb_import_item` */

DROP TABLE IF EXISTS `sldb_import_item`;

CREATE TABLE `sldb_import_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `colume` varchar(50) DEFAULT NULL,
  `length` varchar(20) DEFAULT NULL,
  `showLength` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `infoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sldb_import_item` */

insert  into `sldb_import_item`(`id`,`name`,`colume`,`length`,`showLength`,`type`,`infoId`) values (5,'姓名','name','20','70','字符串',2),(6,'身份证','identify','20','150','字符串',2),(7,'有房数','sum','10','70','字符串',2);

/*Table structure for table `sldb_person` */

DROP TABLE IF EXISTS `sldb_person`;

CREATE TABLE `sldb_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identify` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `creater` varchar(50) DEFAULT NULL,
  `createrName` varchar(50) DEFAULT NULL,
  `createrDepartment` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `race` varchar(50) DEFAULT NULL,
  `hukou` varchar(50) DEFAULT NULL,
  `home` varchar(50) DEFAULT NULL,
  `homeSum` varchar(50) DEFAULT NULL,
  `workable` varchar(50) DEFAULT NULL,
  `marry` varchar(50) DEFAULT NULL,
  `idType` varchar(50) DEFAULT NULL,
  `first` varchar(50) DEFAULT NULL,
  `ill` varchar(50) DEFAULT NULL,
  `deformity` varchar(50) DEFAULT NULL,
  `deformityLevel` varchar(50) DEFAULT NULL,
  `companyType` varchar(50) DEFAULT NULL,
  `trade` varchar(50) DEFAULT NULL,
  `insurance` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `sldb_person` */

insert  into `sldb_person`(`id`,`identify`,`type`,`createTime`,`creater`,`createrName`,`createrDepartment`,`state`,`name`,`gender`,`race`,`hukou`,`home`,`homeSum`,`workable`,`marry`,`idType`,`first`,`ill`,`deformity`,`deformityLevel`,`companyType`,`trade`,`insurance`,`company`,`contact`,`street`,`address`,`desc`) values (3,'220102198112034411','城镇低保','2011-11-26 17:17:58','admin','管理员','人事部副部长','申报','张三1','女','31','1','是',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'是',NULL,NULL,NULL,NULL,NULL,NULL),(4,'220102198112034412','城镇低保','2011-11-26 19:12:50','admin','管理员','人事部副部长','申报','1','男','12','3','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(5,'220102198112034412','城镇低保','2011-11-26 19:14:43','admin','管理员','人事部副部长','申报','222','男','33','12','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(6,'220102198112034412','城镇低保','2011-11-26 19:19:26','admin','管理员','人事部副部长','初审','234234','男','33','333','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(7,'220102198112034412','城镇低保','2011-11-26 20:00:30','admin','管理员','人事部副部长','创建','234234','男','3123','12313','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(8,'220102198112034412','城镇低保','2011-11-26 20:01:17','admin','管理员','人事部副部长','创建','12313','男','123','13','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(9,'220102198112034412','城镇低保','2011-11-26 20:02:02','admin','管理员','人事部副部长','核对','1213','男','123','12','否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL),(15,'220102198112034412','城镇低保','2011-12-01 23:40:55','admin','管理员','人事部副部长','初审','王五1','男','汉','农业','三无人员家庭','3','无劳动能力','已婚','在职','否','糖尿病','精神残疾','三级','中直国有','煤炭','生育保险','12312','313123','123123','123123','333'),(17,'111011223122331123','城镇低保','2011-12-02 00:23:41','admin','管理员','人事部副部长','通过','1111','男','333','农业','三无人员家庭','3','部分劳动能力','未婚','大学在校生','是','心脏病','肢体残疾','二级','中直集体','森工','工伤保险','3123','123123','123123','123123','1233');

/*Table structure for table `sldb_person_state` */

DROP TABLE IF EXISTS `sldb_person_state`;

CREATE TABLE `sldb_person_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `identify` varchar(20) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `sldb_person_state` */

insert  into `sldb_person_state`(`id`,`pid`,`userId`,`userName`,`createTime`,`name`,`identify`,`state`,`note`) values (9,6,'admin','管理员','2011-11-26 19:22:26','234234','220102198112034412','申报',''),(10,7,'admin','管理员','2011-11-26 20:00:58','234234','220102198112034412','申报',''),(11,8,'admin','管理员','2011-11-26 20:01:44','12313','220102198112034412','申报',''),(12,9,'admin','管理员','2011-11-26 20:02:27','1213','220102198112034412','申报',''),(13,9,'admin','管理员','2011-11-26 20:04:41','1213','220102198112034412','申报',''),(14,9,'admin','管理员','2011-11-26 20:17:46','1213','220102198112034412','初审','13123'),(15,6,'admin','管理员','2011-11-26 20:19:20','234234','220102198112034412','初审',''),(16,9,'admin','管理员','2011-11-26 20:29:48','1213','220102198112034412','核对','eee'),(17,-1,'admin','admin','2011-11-26 13:00:00','zhangsan','220102198112034412','申报',''),(18,-1,'admin','admin','2011-11-26 13:00:00','zhangsan','220102198112034412','申报',''),(19,-1,'admin','admin','2011-11-26 13:00:00','zhangsan','220102198112034412','申报',''),(20,17,'admin','管理员','2011-12-02 10:26:20','1111','111011223122331123','申报',''),(21,17,'admin','管理员','2011-12-02 10:26:32','1111','111011223122331123','初审',''),(22,17,'admin','管理员','2011-12-02 10:26:39','1111','111011223122331123','核对',''),(23,17,'admin','管理员','2011-12-02 10:26:45','1111','111011223122331123','通过',''),(24,15,'admin','管理员','2011-12-02 12:48:03','王五1','220102198112034412','申报',''),(25,15,'admin','管理员','2011-12-02 12:48:20','王五1','220102198112034412','初审','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
