/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.1.31-community : Database - rongzhan
*********************************************************************
Server version : 5.1.31-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `rongzhan`;

USE `rongzhan`;

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

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('website','管理网站','',NULL,8),('website.content','管理目录','/app/website/content/show.jsp','website',14),('website.article','管理文章','/app/website/article/show.jsp','website',32),('website.message','管理消息','/app/website/message/show.jsp','website',33),('car','管理汽车','',NULL,34),('website.editcontent','管理融展集团','/app/website/admin/main.jsp?cid=rongzhan','website',35),('car.newcar','管理新车','/app/car/newcar/show.jsp','car',37),('car.bookcar','管理预约','/app/car/bookcar/show.jsp','car',38),('car.admin.bookcar','管理车辆预约','/app/car/admin/bookcarShow.jsp?cid=rongzhan','car',39),('car.admin.newcar','管理新车信息','/app/car/admin/newcarShow.jsp?cid=rongzhan','car',40),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57),('website.changchunfuiru','管理长春瑞孚网站','/app/website/admin/main.jsp?cid=changchunruifu','website',59);

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

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values (1,'auth'),(1,'auth.change.password'),(1,'auth.organization'),(1,'auth.resource'),(1,'auth.role'),(1,'auth.user'),(1,'car'),(1,'car.admin.bookcar'),(1,'car.admin.newcar'),(1,'car.bookcar'),(1,'car.newcar'),(1,'configuration'),(1,'configuration.dict'),(1,'configuration.table'),(1,'configuration.workflow.instance'),(1,'website'),(1,'website.article'),(1,'website.content'),(1,'website.editcontent'),(1,'website.message'),(1,'workflow'),(4,'car'),(4,'car.admin.bookcar'),(4,'car.admin.newcar'),(4,'car.bookcar'),(4,'car.newcar'),(4,'website'),(4,'website.article'),(4,'website.changchunfuiru'),(4,'website.content'),(4,'website.editcontent'),(4,'website.message');

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

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin',1),('admin',4),('rongzhan',4);

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

insert  into `auth_roles`(`id`,`name`,`description`) values (1,'超级管理员','拥有所有权限'),(4,'荣展集团','');

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

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','lueSGJZetyySpUndWjMBEg==','guyuzmq@gmail.com','18943630044'),('rongzhan','融展集团','0N495lkCGCREg87rx9tGew==','11@11.cc','13597878687');

/*Table structure for table `car_bookcar` */

DROP TABLE IF EXISTS `car_bookcar`;

CREATE TABLE `car_bookcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `brandName` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `modelName` varchar(100) DEFAULT NULL,
  `series` varchar(100) DEFAULT NULL,
  `seriesName` varchar(100) DEFAULT NULL,
  `license` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `bookTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `state` varchar(100) DEFAULT 'bookcar.state.false',
  `stateName` varchar(100) DEFAULT '未确认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `car_bookcar` */

insert  into `car_bookcar`(`id`,`cid`,`brand`,`brandName`,`model`,`modelName`,`series`,`seriesName`,`license`,`phone`,`type`,`typeName`,`text`,`bookTime`,`createTime`,`state`,`stateName`) values (6,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','123123','13596160570','bookcar.type.drive','试驾','123123123','2011-10-02 20:44:46','2011-10-02 12:44:29','bookcar.state.true','确认'),(7,'rongzhan.about','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.2','系列二','1231234','13596160504','bookcar.type.bookcar','试驾','adfsfa4','2011-10-24 20:56:51','2011-10-02 12:56:27','bookcar.state.true','确认'),(8,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.2','系列二','123','13596160570','bookcar.type.drive','试驾','','2011-11-07 11:50:04','2011-11-06 03:49:16','bookcar.state.true','确认');

/*Table structure for table `car_newcar` */

DROP TABLE IF EXISTS `car_newcar`;

CREATE TABLE `car_newcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `brandName` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `modelName` varchar(100) DEFAULT NULL,
  `series` varchar(100) DEFAULT NULL,
  `seriesName` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `realPrice` varchar(100) DEFAULT NULL,
  `gift` varchar(100) DEFAULT NULL,
  `saller` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `car_newcar` */

insert  into `car_newcar`(`id`,`cid`,`brand`,`brandName`,`model`,`modelName`,`series`,`seriesName`,`image`,`price`,`realPrice`,`gift`,`saller`) values (2,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','22.1','20.2','尴尬',NULL),(3,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','20','18','尴尬5',NULL),(5,'rongzhan','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','23','21','fffss方法','张三:18943630044'),(8,'rongzhan.about','car.dongfenghonda','东风本田','car.dongfenghonda.crv','CRV','car.dongfenghonda.crv.1','系列一','/easyapp/attached/appCar/20111002/20111002035431_773.jpg','21','10','123213','13123555666');

/*Table structure for table `web_article` */

DROP TABLE IF EXISTS `web_article`;

CREATE TABLE `web_article` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `text` varchar(10000) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateName` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `operater` varchar(100) DEFAULT NULL,
  `operaterName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `web_article` */

insert  into `web_article`(`id`,`cid`,`title`,`text`,`type`,`typeName`,`state`,`stateName`,`count`,`createTime`,`operater`,`operaterName`) values (13,'rongzhan.about.speak','董事长致辞','<h1 align=\"center\">\r\n	大家吃好喝好，喝好吃好1122333999\r\n</h1>\r\n<p align=\"center\">\r\n	<span style=\"font-family:arial black;\">&nbsp;&nbsp;&nbsp;aaaaa方法啊啊</span> \r\n</p>\r\n<p align=\"center\">\r\n	<embed src=\"http://player.youku.com/player.php/sid/XMzI3Mjg4ODYw/v.swf\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"font-family:arial black;\"></span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:38:58','admin','管理员'),(14,'rongzhan.about.introduce','集团介绍','<p>\r\n	这是一个集团介绍，介绍啥呢333333为什么\r\n</p>\r\n<p>\r\n	阿斯多夫是否\r\n</p>\r\n<p>\r\n	asdfsdfasdfsdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:40:00','admin','管理员'),(15,'rongzhan.about.glory','企业荣誉','<img alt=\"\" src=\"/easyapp/attached/image/20111014/20111014063720_910.bmp\" />企业老多荣誉了！真滴！111eee','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:41:09','admin','管理员'),(16,'rongzhan.about.structure','组织架构','什么组织呢？','article.state.normal','普通','visible.true','显示',0,'2011-09-27 03:16:34','admin','管理员'),(17,'rongzhan.about.course','发展历程','','article.state.normal','普通','visible.false','隐藏',0,'2011-09-28 08:02:01','admin','管理员'),(21,'rongzhan.insurance.sall','保险销售','4444啊啊啊uuu11','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:17','admin','管理员'),(22,'rongzhan.service.rescue','24小时救援','22','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:24','admin','管理员'),(23,'rongzhan.service.member','会员服务','333','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:49','admin','管理员'),(24,'rongzhan.insurance.indemnify','保险理赔','55555','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:09:01','admin','管理员'),(25,'rongzhan.service.book','在线预约','<img alt=\"\" src=\"http://maps.googleapis.com/maps/api/staticmap?center=43.88088320219475%2C125.24943320629882&amp;zoom=15&amp;size=558x360&amp;maptype=roadmap&amp;markers=43.88088320219475%2C125.24943320629882&amp;language=zh_CN&amp;sensor=false\" /><img alt=\"\" src=\"/easyapp/attached/image/20111011/20111011023626_650.bmp\" /><embed src=\"/easyapp/attached/media/20111002/20111002035431_773.jpg\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /> \r\n<p>\r\n	asfasf\r\n</p>\r\n<p>\r\n	asdfasdf\r\n</p>\r\n<p>\r\n	asfdsadf\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	ZXZX\r\n</p>\r\n<p>\r\n	asfasfd\r\n</p>\r\n<p>\r\n	asfasf\r\n</p>\r\n<p>\r\n	asdfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:07','admin','管理员'),(26,'rongzhan.service.special','特殊服务','','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:20','admin','管理员'),(27,'rongzhan.service.test','验车中心','asdfsfsdfff','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:12:19','rongzhan','融展集团'),(43,'rongzhan.loan.toyota','丰田金融','<img alt=\"\" src=\"/easyapp/attached/image/20110929/20110929080127_311.bmp\" />ttttthhhiii','article.state.normal','普通','visible.true','显示',0,'2011-09-28 11:40:50','admin','管理员'),(44,'rongzhan.loan.gm','通用金融','aa','article.state.recommand','推荐','visible.true','显示',0,'2011-09-28 11:41:11','admin','管理员'),(47,'rongzhan','融展集团','ggggaaa','article.state.normal','普通','visible.true','显示',0,'2011-09-28 13:32:39','admin','管理员'),(50,'rongzhan.new.enterprise','aaaaaa','aaaaaa','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:12:45','admin','管理员'),(51,'rongzhan.loan.fw','大众金融','','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:13:36','admin','管理员'),(53,'rongzhan.hr','人才招聘','&nbsp;\r\n<table border=\"1\" cellspacing=\"0\" bordercolor=\"#000000\" cellpadding=\"0\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span style=\"font-family:宋体;\">阿速度法司法</span><span></span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>sfasfd</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>sdf</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>a</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>sdfsdf</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>df</span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>asdfasdf</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>sdf</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>f</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aaa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>asdf</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>aa</span> \r\n				</p>\r\n			</td>\r\n			<td valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span>s</span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<input value=\"bb\" name=\"aa\" /></input />&nbsp;\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	<br />\r\n&nbsp;\r\n</p>\r\n<table border=\"1\" cellspacing=\"0\" bordercolor=\"#000000\" cellpadding=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span style=\"font-family:宋体;\">阿速度法司法</span><span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>sfasfd</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>sdf</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>sdfsdf</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>df</span></span></span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>asdfasdf</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>sdf</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>f</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>asdf</span></span></span> \r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span></span>\r\n				</p>\r\n			</td>\r\n			<td style=\"background-color:transparent;\" valign=\"top\" width=\"114\">\r\n				<p>\r\n					<span><span><span>s</span></span></span> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:01','admin','管理员'),(54,'rongzhan.contact','联系我们','<p>\r\n	aaa\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\nbbbb\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	ccc\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:06','admin','管理员'),(56,'rongzhan.new.enterprise','hhh','hhhh','article.state.normal','普通','visible.true','显示',0,'2011-09-29 05:03:23','admin','管理员'),(57,'rongzhan.new.enterprise','ttt','ttttt','article.state.normal','普通','visible.true','显示',0,'2011-09-29 05:03:28','admin','管理员'),(58,'rongzhan.new.car','jjjj','jjjj','article.state.normal','普通','visible.true','显示',0,'2011-09-29 05:06:44','admin','管理员'),(59,'rongzhan.new.car','hhhh','hhhh','article.state.normal','普通','visible.false','隐藏',0,'2011-09-29 05:07:07','admin','管理员'),(60,'rongzhan.new.car','111','','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:44:54','admin','管理员'),(61,'rongzhan.new.car','tttt','','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:45:22','admin','管理员'),(62,'rongzhan.new.enterprise','aaa','bbb','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:57:19','admin','管理员'),(63,'rongzhan.new.enterprise','ffffffff','ffffffffffffff','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:58:55','admin','管理员'),(65,'rongzhan.new.enterprise','bbbbbbb','<strong>bbbbbbbbbbbbbbbbbbbbbvvv</strong>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:31:24','admin','管理员'),(66,'rongzhan.new.sall','fff','FFFvv','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:59:12','admin','管理员'),(68,'rongzhan.new.car','tttt','<strong></strong><span style=\"background-color:#ffe500;\"><strong><em><img alt=\"\" src=\"/easyapp/attached/image/20110929/20110929125415_554.bmp\" /><img alt=\"\" src=\"/easyapp/attached/image/20111005/20111005001743_570.jpg\" />tttt</em></strong></span>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 13:12:12','admin','管理员'),(69,'rongzhan.loan.11','放松放松的','<p>\r\n	asdfasdf\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	asdfasfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-10-10 03:36:47','admin','管理员'),(71,'rongzhan.new.enterprise','xzcvxcvxcv','zxcvzxcv<img alt=\"\" src=\"/easyapp/attached/image/20111017/20111017091057_261.bmp\" />','article.state.normal','普通','visible.true','显示',0,'2011-10-17 09:11:34','admin','管理员'),(72,'test.home','测试','一个测试','article.state.top','置顶','visible.true','可见',0,'2011-11-17 09:56:58','admin','管理员'),(73,'changchunruifu.about.introduce','企业介绍','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:20:58','rongzhan','融展集团'),(74,'changchunruifu.sall.new','新车报价','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:15','rongzhan','融展集团'),(75,'changchunruifu.sall.offsall','优惠促销','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:18','rongzhan','融展集团'),(76,'changchunruifu.sall.special','特色服务','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:19','rongzhan','融展集团'),(77,'changchunruifu.online.enquire','资讯客服','','article.state.normal','普通','visible.true','显示',0,'2011-12-02 22:54:44','admin','管理员');

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `web_content` */

insert  into `web_content`(`id`,`name`,`english`,`path`,`parentId`,`sort`,`hasShow`,`hasShowName`,`mode`,`modeName`) values ('rongzhan','融展集团','RongZhan Group','',NULL,1,'visible.true','显示','content.mode.none','空项'),('rongzhan.home','首页','Home','index.jsp','rongzhan',22,'visible.true','显示','content.mode.none','空项'),('rongzhan.about','集团介绍','About','','rongzhan',23,'visible.true','显示','content.mode.none','空项'),('rongzhan.new','新闻中心','New','','rongzhan',29,'visible.true','显示','content.mode.more','多项'),('rongzhan.service','集团服务','Services','','rongzhan',30,'visible.true','显示','content.mode.none','空项'),('rongzhan.insurance','保险中心','Insurance','','rongzhan',31,'visible.true','显示','content.mode.none','空项'),('rongzhan.loan','分期贷款','Loan','','rongzhan',32,'visible.true','显示','content.mode.none','空项'),('rongzhan.hr','人才招聘','HR','','rongzhan',33,'visible.true','显示','content.mode.one','单项'),('rongzhan.contact','联系我们','Contact','','rongzhan',34,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.speak','董事长致辞','Speak','','rongzhan.about',35,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.introduce','集团介绍','Introduce','','rongzhan.about',36,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.course','发展历程','Course','','rongzhan.about',37,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.glory','企业荣誉','Glory','','rongzhan.about',38,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.structure','组织架构','Structur','','rongzhan.about',39,'visible.true','显示','content.mode.one','单项'),('rongzhan.new.enterprise','企业新闻','Enterprise','','rongzhan.new',40,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.car','行业新闻','Car','','rongzhan.new',41,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.sall','促销新闻','Sall','','rongzhan.new',42,'visible.true','显示','content.mode.more','多项'),('rongzhan.service.test','验车中心','Test','','rongzhan.service',43,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.rescue','24小时救援','Rescue','','rongzhan.service',44,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.special','特殊服务','Special','','rongzhan.service',45,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.member','会员服务','Memer','','rongzhan.service',46,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.book','在线预约','Book','','rongzhan.service',47,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.sall','保险销售','Sall','','rongzhan.insurance',48,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.indemnify','保险理赔','Indemnify','','rongzhan.insurance',49,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.toyota','丰田金融','Toyota','','rongzhan.loan',50,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.gm','通用金融','GM','','rongzhan.loan',51,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.fw','大众金融','FW','','rongzhan.loan',52,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.11','放松放松的','sdfsf','','rongzhan.loan',53,'visible.true','显示','content.mode.one','单项'),('changchunruifu','长春瑞孚汽车销售服务有限公司','ChangChun RuiFu','',NULL,54,'visible.true','显示','content.mode.none','空项'),('jilinshenglongfu','吉林省隆孚汽车销售服务有限公司','JiLin LongFu','',NULL,55,'visible.true','显示','content.mode.none','空项'),('changchunruifu.home','首页','Home','','changchunruifu',56,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about','企业介绍','About','','changchunruifu',57,'visible.true','显示','content.mode.one','单项'),('changchunruifu.new','新闻中心','New','','changchunruifu',58,'visible.true','显示','content.mode.more','多项'),('changchunruifu.sall','销售服务','Sall','','changchunruifu',59,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled','售后服务','Salled','','changchunruifu',60,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance','保险服务','Insurance','','changchunruifu',61,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online','在线客服','Online','','changchunruifu',62,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book','预约服务','Book','','changchunruifu',63,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.introduce','企业介绍','Introduce','','changchunruifu.about',64,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.glory','公司荣誉','Glory','','changchunruifu.about',65,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.form','公司形象','Form','','changchunruifu.about',66,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.contact','联系方式','Contact','','changchunruifu.about',67,'visible.true','显示','content.mode.one','单项'),('changchunruifu.new.offsall','优惠活动','OffSall','','changchunruifu.new',68,'visible.true','显示','content.mode.more','多项'),('changchunruifu.new.company','公司新闻','Company','','changchunruifu.new',69,'visible.true','显示','content.mode.more','多项'),('changchunruifu.new.car','行业新闻','Car','','changchunruifu.new',70,'visible.true','显示','content.mode.more','多项'),('changchunruifu.sall.new','新车报价','NewCar','','changchunruifu.sall',71,'visible.true','显示','content.mode.one','单项'),('changchunruifu.sall.offsall','优惠促销','OffSall','','changchunruifu.sall',72,'visible.true','显示','content.mode.one','单项'),('changchunruifu.sall.special','特色服务','Special','','changchunruifu.sall',73,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.notice','公告','Notice','','changchunruifu.salled',74,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.repair','保修保养服务','Repair','','changchunruifu.salled',75,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.special','特色服务','Special','','changchunruifu.salled',76,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.help','服务手册','Help','','changchunruifu.salled',77,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.introduce','保险服务介绍','Introduce','','changchunruifu.insurance',78,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.knowledge','保险知识','Knowledge','','changchunruifu.insurance',79,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.indemnify','保险理赔','Insurance','','changchunruifu.insurance',80,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.enquire','资讯客服','Enquire','','changchunruifu.online',81,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.complain','投诉意见','Complain','','changchunruifu.online',82,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.message','客户留言','Message','','changchunruifu.online',83,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.drive','试乘预约','Drive','','changchunruifu.book',84,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.repair','维修预约','Repair','','changchunruifu.book',85,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.maintain','保养预约','Maintain','','changchunruifu.book',86,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.buy','订车预约','Buy','','changchunruifu.book',87,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.home','首页','Home','','jilinshenglongfu',88,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about','企业介绍','About','','jilinshenglongfu',89,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.new','新闻中心','New','','jilinshenglongfu',90,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.sall','销售服务','Sall','','jilinshenglongfu',91,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled','售后服务','Salled','','jilinshenglongfu',92,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance','保险服务','Insurance','','jilinshenglongfu',93,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online','在线客服','Online','','jilinshenglongfu',94,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book','预约服务','Book','','jilinshenglongfu',95,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.introduce','企业介绍','Introduce','','jilinshenglongfu.about',96,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.glory','公司荣誉','Glory','','jilinshenglongfu.about',97,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.form','公司形象','Form','','jilinshenglongfu.about',98,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.contact','联系方式','Contact','','jilinshenglongfu.about',99,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.new.offsall','优惠活动','OffSall','','jilinshenglongfu.new',100,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.new.company','公司新闻','Company','','jilinshenglongfu.new',101,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.new.car','行业新闻','Car','','jilinshenglongfu.new',102,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.sall.new','新车报价','NewCar','','jilinshenglongfu.sall',103,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.sall.offsall','优惠促销','OffSall','','jilinshenglongfu.sall',104,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.sall.special','特色服务','Special','','jilinshenglongfu.sall',105,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.notice','公告','Notice','','jilinshenglongfu.salled',106,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.repair','保修保养服务','Repair','','jilinshenglongfu.salled',107,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.special','特色服务','Special','','jilinshenglongfu.salled',108,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.help','服务手册','Help','','jilinshenglongfu.salled',109,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.introduce','保险服务介绍','Introduce','','jilinshenglongfu.insurance',110,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.knowledge','保险知识','Knowledge','','jilinshenglongfu.insurance',111,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.indemnify','保险理赔','Insurance','','jilinshenglongfu.insurance',112,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.enquire','资讯客服','Enquire','','jilinshenglongfu.online',113,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.complain','投诉意见','Complain','','jilinshenglongfu.online',114,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.message','客户留言','Message','','jilinshenglongfu.online',115,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.drive','试乘预约','Drive','','jilinshenglongfu.book',116,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.repair','维修预约','Repair','','jilinshenglongfu.book',117,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.maintain','保养预约','Maintain','','jilinshenglongfu.book',118,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.buy','订车预约','Buy','','jilinshenglongfu.book',119,'visible.true','显示','content.mode.one','单项');

/*Table structure for table `web_message` */

DROP TABLE IF EXISTS `web_message`;

CREATE TABLE `web_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateName` varchar(100) DEFAULT NULL,
  `hasShow` varchar(100) DEFAULT NULL,
  `hasShowName` varchar(100) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `sendText` varchar(1000) DEFAULT NULL,
  `sendEmail` varchar(100) DEFAULT NULL,
  `sendPhone` varchar(100) DEFAULT NULL,
  `sendName` varchar(100) DEFAULT NULL,
  `receiveTime` datetime DEFAULT NULL,
  `receiveText` varchar(1000) DEFAULT NULL,
  `receiveOperater` varchar(100) DEFAULT NULL,
  `receiveOperaterName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `web_message` */

insert  into `web_message`(`id`,`cid`,`state`,`stateName`,`hasShow`,`hasShowName`,`sendTime`,`sendText`,`sendEmail`,`sendPhone`,`sendName`,`receiveTime`,`receiveText`,`receiveOperater`,`receiveOperaterName`) values (1,'rongzhan.about','message.state.false','未回复','visible.true','显示','2011-09-29 02:44:23','tttpp','11@11.11pp','13555555550','vvvppp','2011-09-29 02:44:23','vvvffffppp','admin','管理员'),(2,'rongzhan','message.state.true','已回复','visible.false','隐藏','2011-09-29 03:39:08','hhhh','11@11.11','13967895555','123123123','2011-09-29 03:39:08','1412412412','admin','管理员'),(3,'rongzhan','message.state.true','已回复','visible.false','隐藏','2011-09-29 03:44:07','aa\r\nbb\r\ncc','gg@11.com','13596160505','123','2011-09-29 03:44:07','124124\r\n123123\r\n123123123','admin','管理员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
