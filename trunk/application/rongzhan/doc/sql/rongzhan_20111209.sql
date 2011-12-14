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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `web_article` */

insert  into `web_article`(`id`,`cid`,`title`,`text`,`type`,`typeName`,`state`,`stateName`,`count`,`createTime`,`operater`,`operaterName`) values (13,'rongzhan.about.speak','董事长致辞','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;融展是事业的港湾，我们把员工作为公司的服务对象，为员工的学习 、 工作、发展提供服务，努力为员工创造良好的工作环境，建造良好的事业发展平台,使您的知识技能、聪明才智得以施展，事业理想得以实现。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;融展是温馨的家园。进入融展您会体会到瑞孚这个大家庭的温暖，以人为本的管理使员工感受到在制度约束下的亲情管理，团结互助的团队精神使您体会到大家的互助关心、相互帮助的同事亲情。我们是融展的员工，我们是伙伴，是亲人，我们共同拥有融展这个温暖的大家庭。\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;融展是成长的课堂。这是一个学习型的企业，是一个不断提高、学习、成长的团队。我们一直十分重视员工的提高培训。我们珍视每个员工的才能和智慧，关注着每个员工能力和素质的提高。我们为员工创造良好的学习氛围，提供培训提高的机会。您的能力、技能、品德修养将在工作和学习中得到锻炼和提高。融展在学习中起步，员工在学习中提高。\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:38:58','admin','管理员'),(14,'rongzhan.about.introduce','集团介绍','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;融展集团是国内第一批获东风日产汽车认证， 集整车展示销售维修服务零件供应和信息咨询服务为一体的东风日产汽车4S服务中心。成经8年的开拓与发展，集团已由一家单一东风日产品牌的4S店，发展成为拥有6家主营东风日产品牌， 兼营奥迪、一汽大众丰田品牌的汽车4S专业服务企业集团。 目前集团服务网点分布于长春、大连、沈阳、哈尔滨、通化、延吉、绥化等地 ，根据集团发展规划在未来的2-3年中，再新增4S网点二十余家。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;前身系吉林瑞孚汽车有限公司。公司成立于2001年，集团公司注册资本3,000万元人民币，是一家以汽车销售和汽车维修服务为主业的综合性集团型企业，自成立以来先后取得上海大众、一汽丰田、东风日产、长安福特、广州丰田、广州本田、上海通用、北京现代、东风本田、一汽商用车、上海双龙、一汽大众、比亚迪、一汽奥迪、一汽奔腾、奇瑞等国内数家汽车知名品牌的代理权，年销量在吉林省居于同行业前三强，在东北三省位居于前十强。\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:40:00','admin','管理员'),(15,'rongzhan.about.glory','企业荣誉','<img alt=\"\" src=\"/easyapp/attached/image/20111014/20111014063720_910.bmp\" />企业老多荣誉了！真滴！111eee','article.state.normal','普通','visible.true','显示',0,'2011-09-27 01:41:09','admin','管理员'),(16,'rongzhan.about.structure','组织架构','<img style=\"width:696px;height:534px;\" height=\"30\" alt=\"\" src=\"/rongzhan/attached/image/20111209/20111209192911_193.jpg\" width=\"28\" />','article.state.normal','普通','visible.true','显示',0,'2011-09-27 03:16:34','admin','管理员'),(17,'rongzhan.about.course','发展历程','','article.state.normal','普通','visible.false','隐藏',0,'2011-09-28 08:02:01','admin','管理员'),(21,'rongzhan.insurance.sall','保险销售','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京运通集团保险销售部合作保险公司如下:太平洋保险、人保保险、平安保险。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:17','admin','管理员'),(22,'rongzhan.service.rescue','24小时救援','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团提供客户市内24小时免费救援（限融展集团品牌车型）。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:24','admin','管理员'),(23,'rongzhan.service.member','会员服务','<div>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</div>\r\n<div>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团将为您提供免费午餐和洗浴。（限融展集团客户，每车2人次/天）。\r\n</div>\r\n<div>\r\n	&nbsp;\r\n</div>\r\n<div>\r\n	&nbsp;\r\n</div>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:06:49','admin','管理员'),(24,'rongzhan.insurance.indemnify','保险理赔','<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团是人保、平安、太平洋等保险公司的定损中心。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;融展集团保险理赔热线：0431-85126301。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:09:01','admin','管理员'),(25,'rongzhan.service.book','在线预约','<img alt=\"\" src=\"http://maps.googleapis.com/maps/api/staticmap?center=43.88088320219475%2C125.24943320629882&amp;zoom=15&amp;size=558x360&amp;maptype=roadmap&amp;markers=43.88088320219475%2C125.24943320629882&amp;language=zh_CN&amp;sensor=false\" /><img alt=\"\" src=\"/easyapp/attached/image/20111011/20111011023626_650.bmp\" /><embed src=\"/easyapp/attached/media/20111002/20111002035431_773.jpg\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /> \r\n<p>\r\n	asfasf\r\n</p>\r\n<p>\r\n	asdfasdf\r\n</p>\r\n<p>\r\n	asfdsadf\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	ZXZX\r\n</p>\r\n<p>\r\n	asfasfd\r\n</p>\r\n<p>\r\n	asfasf\r\n</p>\r\n<p>\r\n	asdfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:07','admin','管理员'),(26,'rongzhan.service.special','特殊服务','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<div>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团将为您提供免费午餐和洗浴。（限融展集团客户，每车2人次/天）\r\n</div>\r\n<div>\r\n	&nbsp;\r\n</div>\r\n<div>\r\n	&nbsp;\r\n</div>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:11:20','admin','管理员'),(27,'rongzhan.service.test','验车中心','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;吉林融展集团可以为您提供全套的新车验车服务，如有不明请咨询：\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;验车中心电话：0431-85126301\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 08:12:19','admin','管理员'),(43,'rongzhan.loan.toyota','丰田金融','<p align=\"center\">\r\n	&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n	贷款说明\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 11:40:50','admin','管理员'),(44,'rongzhan.loan.gm','通用金融','<p align=\"center\">\r\n	&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n	贷款说明\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.recommand','推荐','visible.true','显示',0,'2011-09-28 11:41:11','admin','管理员'),(47,'rongzhan','融展集团','ggggaaa','article.state.normal','普通','visible.true','显示',0,'2011-09-28 13:32:39','admin','管理员'),(51,'rongzhan.loan.fw','大众金融','<p align=\"center\">\r\n	&nbsp;\r\n</p>\r\n<p align=\"center\">\r\n	贷款说明\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;请选择您所需要的汽车品牌，进入后，方可计算。网站所提供数据，仅供参考，准确数据请咨询相应品牌店销售顾问。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:13:36','admin','管理员'),(53,'rongzhan.hr','人才招聘','&nbsp;&nbsp;\r\n<p>\r\n	一、4S店总经理\r\n</p>\r\n<p>\r\n	工作职责：<br />\r\n1、根据汽车投资公司总部战略部署，制定4S店战略规划，设定4S店发展目标，保障4S店业务的有效发展。<br />\r\n2、根据汽车投资公司总部设定的业务目标，制定4S店年度预算及年度工作计划并保障完成。<br />\r\n3、根据汽车投资公司总部设定的业务目标，领导业务团队充分发挥部门工作效率，完成公司业务目标<br />\r\n4、与汽车投资公司总部进行高效沟通，汇报4S店运行情况，为公司的决策提供有效的信息支持。<br />\r\n5、根据4S店情况，制定4S店的各项制度，有力领导4S店团队高效工作，及时完成利润指标。<br />\r\n6、根据4S店业务发展需要，合理计划4S店的公共关系维护，主机厂上午洽谈的项目运作，组织相关经济协议、合同签订工作，确保市场份额增长。<br />\r\n7、根据业务发展规划，拓展和汽车销售相关的新业务，如汽车服务、二手车销售等，实现新业务的有效提升。<br />\r\n8、对4S店进行运营成本控制、对4S店各部门实行考核和监督，确保运营成本得到有效控制。<br />\r\n9、4S店团队建设和培训。<br />\r\n任职要求：<br />\r\n1.经营管理、汽车营销类大专以上学历；<br />\r\n2.五年以上4S店总经理或主机厂相关工作经验。<br />\r\n3.较强的授课、演讲和市场分析能力，有梁红的社会关系。<br />\r\n4.年龄30岁以上，能适应出差。\r\n</p>\r\n<p>\r\n	二、4S店人力资源经理\r\n</p>\r\n<p>\r\n	工作职责：\r\n</p>\r\n<p>\r\n	1、建立建全公司人力资源和行政管理制度，并监督各项制度的执行。\r\n</p>\r\n<p>\r\n	2、确定年度人力编制，根据年度需求组织开展人员招聘。\r\n</p>\r\n<p>\r\n	3、负责制订绩效考核制度，定期组织员工进行考核。\r\n</p>\r\n<p>\r\n	4、制订年度培训计划，组织各部门开展培训，组织对培训效果技能考核鉴定。\r\n</p>\r\n<p>\r\n	5、制定合理的薪酬方案。\r\n</p>\r\n<p>\r\n	6、负责劳动合同的签订和管理工作，代表公司解决劳动诉讼。\r\n</p>\r\n<p>\r\n	7、负责组织企业活动、建设企业文化。\r\n</p>\r\n<p>\r\n	8、完成上级交办的其它工作。\r\n</p>\r\n<p>\r\n	任职要求：<br />\r\n1、人力资源、行政管理相关专业，本科以上学历，30岁以上，3年以上汽贸行业同岗位工作经验；<br />\r\n2、具备较丰富的人力资源工作与专业知识，熟悉劳动法律、法规并能够熟练应用,人力资源管理师中级职称；<br />\r\n3、具有较强的计划、组织、协调能力和出色的人际交能力。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	三、4S店财务经理\r\n</p>\r\n<p>\r\n	工作职责：<br />\r\n1、全面负责4S店财务部的日常管理工作及各类报表的编制，组织和协调财务部的日常会计核算工作，保证会计核算流程正常运转；<br />\r\n2、组织制定财务方面的管理制度及有关规定，并监督执行；<br />\r\n3、负责编制及组织实施4S店财务预算；<br />\r\n4、负责资金、资产的管理工作，并及时为集团财务部长及4S店总经理提供财务分析报告<br />\r\n6、负责店内融资工作，保证店内经营资金的正常运转；<br />\r\n7、监控可能会对公司造成的经济损失的重大经济活动；<br />\r\n8、负责与当地的其它机构（银行、税务等）保持良好的关系；<br />\r\n9、协助集团财务部长开展财务部与内外的沟通与协调工作；<br />\r\n10、负责4S店财务部团队的建设与人员管理。<br />\r\n<br />\r\n任职要求：<br />\r\n1、财务管理相关专业，本科以上学历，30岁以上，3年以上汽贸行业同岗位工作经验；<br />\r\n2、熟悉会计法、经济法、税法等相关的政策、法律、法规；<br />\r\n3、具有较强的组织、沟通、分析、控制能力；<br />\r\n4、熟练使用用友/金额财务软件。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	四、薪酬绩效经理\r\n</p>\r\n<p>\r\n	工作职责：<br />\r\n1、根据公司总体战略规划，建立、完善公司内部的薪酬、绩效体系；<br />\r\n2、负责组织实施公司内部的绩效管理、薪酬福利管理工作；<br />\r\n3、负责指导和监管公司各部门的绩效管理，薪酬福利相关工作；<br />\r\n4、本科及以上学历，相关专业毕业；<br />\r\n5、五年以上薪酬、绩效考核相关工作经验，精通KPI、BSC、360°、MBO等考核工具和方法，并有成功案例；能独立策划绩效考核及部门激励方案，流程；\r\n</p>\r\n6、曾就任于企业管理顾问公司并执行过人力资源绩效方面的项目','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:01','admin','管理员'),(54,'rongzhan.contact','联系我们','<p>\r\n	吉林省融展投资（集团）有限公司\r\n</p>\r\n<hr class=\"ke-pagebreak\" style=\"page-break-after:always;\" />\r\n地址：长春市高力汽贸城C区6栋201/202室\r\n<hr class=\"ke-pagebreak\" style=\"page-break-after:always;\" />\r\n<p>\r\n	电话：0431-85126301&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<hr class=\"ke-pagebreak\" style=\"page-break-after:always;\" />\r\n传真：0431-85126301&nbsp;&nbsp;&nbsp;&nbsp;','article.state.normal','普通','visible.true','显示',0,'2011-09-28 14:27:06','admin','管理员'),(61,'rongzhan.new.car','本田8月全球产量下跌9% 中国逆向增长18%','<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium Simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:26px;font-family:Arial, Helvetica, sans-serif;text-align:center;\">&nbsp;\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	本田汽车近日公布其8月全球产量同比下跌9.3%，连续7个月维持下降趋势。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	今年8月，本田全球总产量为261,524辆。日本国内产量同比下降17.2%至56,356辆。最大生产国美国产量略有上升，同比增长6.1%至90,538辆，但整个北美区域依然同比下跌5.0%至109,397辆。产出增长最快的国家之一为中国，8月产量55,567辆，增幅高达17.7%，带动本田在亚洲（除日本）产量上升3.6%至82,727辆。跌幅最明显的是欧洲区域，4,814辆的产量较2010年同期减少了52.5%。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	前8个月累计产量下滑明显。全球总产量1,770,967辆，低于去年同期水平26.3%；日本国内产量393,638辆，同比滑落39.1%；日本以外产量1,377,329辆，同比下降21.7%。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	尽管本田未公布全球及其他区域销量数据，不过表示8月在日本国内销量34,267辆较去年同比重挫47.3%，迄今已连续12个月下行。</span></span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 10:45:22','admin','管理员'),(65,'rongzhan.new.enterprise','9月28日东风日产绥化融展绥鑫专营店盛大开业','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;由吉林省融展投资（集团）有限公司投资建立的、功能完备的东风日产4S店——绥化融展绥鑫专营店即将落成，并将于近9月28日正式对外营业。东风日产专营店的成立，将为消费者提供全方位的汽车销售及汽车售后服务，方便消费者家门口买车保养。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a href=\"http://www.pcauto.com.cn/images/html/viewpic_pcauto.htm?http://img0.pcauto.com.cn/pcauto/1109/07/1632288_001.jpg&amp;channel=2622\" target=\"_blank\"><img title=\"东风日产绥化融展绥鑫专营店 九月下旬将盛大开业\" style=\"border-right:gray 1px solid;border-top:gray 1px solid;border-left:gray 1px solid;border-bottom:gray 1px solid;\" alt=\"东风日产绥化融展绥鑫专营店 九月下旬将盛大开业\" src=\"http://img0.pcauto.com.cn/pcauto/1109/23/1651729_01_thumb.jpg\" /></a> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	　　为庆祝东风日产绥化融展绥鑫专营店开业，即日起在店内订购东风日产任意一款车型（楼兰除外）的客户，均享有大幅优惠，最高优惠达30000元；小编还得之东风日产首款豪华跑车型SUV车型——楼兰目前已全面接受预定。欢迎感兴趣的朋友致电0455-8283555/8411333。\r\n</p>\r\n<p style=\"text-align:left;\">\r\n	　　融展集团是集整车展示销售、维修服务、零件供应和信息咨询服务位一体的东风日产汽车4S服务中心。集团现已由一家单一东风日产品牌的4S店，发展成为拥有11家，主营：东风日产 东风日产启辰,<a class=\"cmsLink\" href=\"http://price.pcauto.com.cn/brand.jsp?bid=28\" target=\"_blank\">英菲尼迪</a>、<a class=\"cmsLink\" href=\"http://price.pcauto.com.cn/brand.jsp?bid=1\" target=\"_blank\">一汽奥迪</a>、<a class=\"cmsLink\" href=\"http://price.pcauto.com.cn/brand.jsp?bid=2\" target=\"_blank\">一汽大众</a>、上海通用，<a class=\"cmsLink\" href=\"http://price.pcauto.com.cn/brand.jsp?bid=147\" target=\"_blank\">东风本田</a>、丰田品牌的汽车4S专业服务企业集团。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a href=\"http://www.pcauto.com.cn/images/html/viewpic_pcauto.htm?http://img0.pcauto.com.cn/pcauto/1109/07/1632288_0003.jpg&amp;channel=2622\" target=\"_blank\"><img title=\"东风日产融展绥鑫专营店\" style=\"border-right:gray 1px solid;border-top:gray 1px solid;border-left:gray 1px solid;border-bottom:gray 1px solid;\" alt=\"东风日产融展绥鑫专营店\" src=\"http://img0.pcauto.com.cn/pcauto/1109/07/1632288_0003_thumb.jpg\" /></a> \r\n</p>\r\n<p>\r\n	　　据张秉华总经理介绍，融展绥鑫专营店是东风日产乘用车公司指定的A级<a class=\"cmsLink\" href=\"http://4s.pcauto.com.cn/\" target=\"_blank\">经销商</a>，提供原厂纯正配件供应，采用专用维修设备，是集东风日产汽车销售服务、维修服务、配件供应、信息反馈、二手车置换、按揭服务于一体的专营店；即日起在本店订车、购车的客户，东风日产全系车型的均有优惠，价格8.28-37.18不等。\r\n</p>\r\n<p>\r\n	　　专营店预计9月下旬正式开业，在一万多平方米的占地面积中，宽阔的客户停车区、明亮现代的汽车展示厅、设备一流的维修车间、温馨舒适的客户休息区和豪华的客户活动中心等功能区。——东风日产绥化融展绥鑫专营店欢迎您的莅临！\r\n</p>\r\n<p>\r\n	<strong>　　经销商：绥化东风日产融展绥鑫专营店<br />\r\n　　地址：西二环路香格里拉凤凰城对面<br />\r\n　　销售热线：0455-8283555&nbsp; 8175458</strong> \r\n</p>\r\n<!--{13167463066562}-->\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:31:24','admin','管理员'),(66,'rongzhan.new.sall','东风日产哈尔滨年底团购会火热报名中','<p style=\"clear:both;padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px auto 20px;width:564px;text-indent:2em;padding-top:0px;\">\r\n	<p>\r\n		<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;不造车，只造精彩生活。东风日产不断创造精彩，快速达至300万台销量新高，再创年80万台销量佳绩，腾龙迎新岁，感恩 “赢•新•汇”，到店、购车、服务、换车全程有豪礼，邀你畅赢精彩。</span></span> \r\n	</p>\r\n	<p>\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"clear:both;padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px auto 20px;width:564px;text-indent:2em;padding-top:0px;\">\r\n		<p>\r\n			<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\"><img class=\"imgborder\" style=\"border-right:#dee3e7 1px solid;padding-right:5px;border-top:#dee3e7 1px solid;display:block;padding-left:5px;padding-bottom:5px;margin:0px auto 5px;border-left:#dee3e7 1px solid;padding-top:5px;border-bottom:#dee3e7 1px solid;background-color:#ffffff;background-origin:initial;background-clip:initial;\" alt=\"\" src=\"http://img2.bitautoimg.com/autoalbum//files/20080416/012/200804161158215312_31653_514x341__m1.jpg\" border=\"1\" /></span></span> \r\n		</p>\r\n		<p>\r\n			<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;东风日产“赢•新•汇”融展东日专营店2011年最后一次抄底团购会开始报名了。报名热线：84348888 843577777</span></span>\r\n		</p>\r\n		<p>\r\n			<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;销售电话：400-698-1006</span></span>\r\n		</p>\r\n		<p>\r\n			<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:24px;font-family:simsun, arial, helvetica, sans-serif;text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;店面地址：哈尔滨市道里区机场路18号</span></span>\r\n		</p>\r\n<script type=\"text/javascript\">function getVoteStation(type) { if(type==-1) { gid(\"beforeVote\").innerHTML=\"\"; return; } else if(type==1) { if(gid(\"beforeVote\")) { var str = gid(\"beforeVote\").innerHTML; gid(\"beforeVote\").innerHTML=\"\"; gid(\"afterVote\").innerHTML = str; } } }</script>\r\n<!--buy car area--><!--buy car area-->\r\n		<p class=\"buycar\">\r\n			&nbsp;\r\n		</p>\r\n<!--PRINT area-->','article.state.normal','普通','visible.true','显示',0,'2011-09-29 11:59:12','admin','管理员'),(68,'rongzhan.new.car','通用与日产联手研究开发电动车技术','<span class=\"Apple-style-span\" style=\"word-spacing:0px;font:medium Simsun;text-transform:none;color:#000000;text-indent:0px;white-space:normal;letter-spacing:normal;border-collapse:separate;orphans:2;widows:2;webkit-border-horizontal-spacing:0px;webkit-border-vertical-spacing:0px;webkit-text-decorations-in-effect:none;webkit-text-size-adjust:auto;webkit-text-stroke-width:0px;\"><span class=\"Apple-style-span\" style=\"font-size:14px;color:#333333;line-height:26px;font-family:Arial, Helvetica, sans-serif;text-align:center;\">&nbsp;\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	2011年9月30日，通用电气与日产汽车宣布签署合作协议，将共同研究开发电动车技术。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	在日产汽车位于美国密歇根州Farmington Hills的北美技术中心，通用电气与日产宣布签署了一项有效期两年的合作协议，着眼于共同研究开发电动车技术，加速电动车基础设施改进步伐，并刺激电动车销售增长。研究的焦点在于：日产聆风一类电动车的充电操作，将对家庭及企业电力系统和公用电网产生怎样的影响。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	通用电气全球研发总监Mark Little在日产北美技术中心出席了媒体发布会，其表示：“我们将并肩协作，通过推广电动车应用让世界更加美好。”两家公司之前就曾经达成电动车方面的合作，2010年4月，双方签署一项为期三年的协议，共同开发电动车充电装置。\r\n</p>\r\n<p style=\"padding-right:0px;padding-left:0px;padding-bottom:0px;margin:0px;text-indent:2em;padding-top:0px;text-align:left;\">\r\n	日产汽车当前正在向市场销售聆风电动车，今年到目前为止总销量已经突破7千辆。作为日产的新能源车主打产品，聆风与通用汽车的沃蓝达增程式电动车等插电式混合动力车形成了竞争关系。\r\n</p>\r\n</span></span> \r\n<p>\r\n	<span style=\"background-color:#ffe500;\"><strong><em></em></strong></span>&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-09-29 13:12:12','admin','管理员'),(69,'rongzhan.loan.11','放松放松的','<p>\r\n	asdfasdf\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	asdfasfasdf\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-10-10 03:36:47','admin','管理员'),(72,'test.home','测试','一个测试','article.state.top','置顶','visible.true','可见',0,'2011-11-17 09:56:58','admin','管理员'),(73,'changchunruifu.about.introduce','企业介绍','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:20:58','rongzhan','融展集团'),(74,'changchunruifu.sall.new','新车报价','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:15','rongzhan','融展集团'),(75,'changchunruifu.sall.offsall','优惠促销','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:18','rongzhan','融展集团'),(76,'changchunruifu.sall.special','特色服务','','article.state.normal','普通','visible.true','显示',0,'2011-12-01 13:21:19','rongzhan','融展集团'),(77,'changchunruifu.online.enquire','资讯客服','','article.state.normal','普通','visible.true','显示',0,'2011-12-02 22:54:44','admin','管理员'),(78,'changchunruifu.book.drive','试乘预约','','article.state.normal','普通','visible.true','显示',0,'2011-12-04 00:18:49','admin','管理员'),(79,'rongzhan.new.car','中汽协：全年汽车出口有望超80万辆 ','<p>\r\n	<span style=\"font-family:Verdana;\">据中国汽车工业协会预测，今年全年出口汽车有望超过80万辆，创出历史新高。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:Verdana;\">商务部机电和科技产业司副司长支陆逊接受媒体采访时表示，汽车是世界贸易中排名第一的货物贸易，约占全球货物贸易总额的10%。德国、日本、韩国等汽车生产大国出口量占全部产量的比重分别为75%、65%和50%，甚至巴西都达20%以上。我国去年全部汽车出口量是58万辆，约占整个产量的3%左右。</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 15:59:39','admin','管理员'),(80,'rongzhan.new.car','今年缺陷汽车占据乘用车销量近两成','&nbsp;&nbsp;&nbsp; 国家质检总局近日披露，今年前三季度，中国汽车召回事件达到67起，共计召回缺陷汽车174.56万辆，占同期乘用车销量的比例高达16.57%。而去年全年，中国汽车仅召回117万辆，占同期乘用车销量的8.5%','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:01:10','admin','管理员'),(81,'rongzhan.new.car','汽车将按排量征车船税','&nbsp;&nbsp; 在近日召开的国务院常务会议上，包括《中华人民共和国车船税法实施条例(草案)》在内的四项条例获得审议并原则通过。从此次审议的车船税法细节来看，将汽车按排量分为7档征税;政府部门强化了通过征税来调整汽车产品消费结构的方式，乘用车车船税将按排量分档征收，排量越大需缴纳的额度越高。','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:01:59','admin','管理员'),(82,'rongzhan.new.car','东风1.1亿收购东风渝安','上周，东风汽车公司旗下香港上市公司东风汽车集团股份有限公司（00489.HK）发布公告称，拟以109545400元收购东风小康全资拥有的东风渝安所有股权。同时，东风渝安同意偿还股东东风小康140454600元股东借款。东风集团股份公告显示，以2011年6月30日为评估基准日的资产评估报告，东风渝安评估价值为259855300元。','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:02:53','admin','管理员'),(83,'rongzhan.new.car','未来中国动力电池市场价值约3000亿','在日前举办的加2011中国太阳能产业高层论坛上洋泰能源董事长黄友权表示，未来的中国市场动力电池市场价值大约在3000亿人民币，日韩方面已经开始产业化固体电解质钒动力电池。同时在储能领域必然存在多种电池技术共存的局面，不会有一种技术垄断整个市场的局面出现。','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:03:33','admin','管理员'),(84,'rongzhan.new.enterprise','骄然天成非同凡响 英菲尼迪闪耀长春','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;（2011年12月6日，长春）今天，作为红牛F1车队官方合作伙伴，<a class=\"t_link\" href=\"http://product.cheshi.com/brand_112/\" target=\"_blank\"><span style=\"color:#333;\">英菲尼迪</span></a>旗下的第44家特许经销店——<a class=\"t_link\" href=\"http://news.cheshi.com/cckj/200901/89778.shtml\" target=\"_blank\"><span style=\"color:#333;\">长</span></a>春融展英菲尼迪璀璨开业，英菲尼迪中国事业总部总经理吕征宇先生及长春融展英菲尼迪各级领导出席了盛大的开业庆典，并与众多嘉宾齐聚一堂，共同见证了这一盛事。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a title=\"骄然天成非同凡响 英菲尼迪闪耀长春\" href=\"http://news.cheshi.com/picbrowser/20111207/462792_2167056.shtml\" target=\"_blank\"><img alt=\"骄然天成非同凡响 英菲尼迪闪耀长春\" src=\"http://img1.cheshi-img.com/201112/462792/4edf1bf92dc98_500.jpg\" border=\"0\" /></a>\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	长春融展英菲尼迪经销店外观\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;长春融展英菲尼迪坐落于长春<a class=\"t_link\" href=\"http://www.cheshi.com/\" target=\"_blank\"><span style=\"color:#333;\">汽车</span></a>产业开发区，严格按照英菲尼迪全球统一的零售环境设计标准（IREDI）建设而成。店内完美秉承了英菲尼迪“致情致盛，完美体验”（Total Ownership ExperienceTM）的客户服务理念，不仅倾情打造至臻一流的硬件设施，而且拥有舒适尊雅的服务环境，以及彰显时尚艺韵的设计风格，使当代豪华的生活品味同“灵感、优雅、力量”的品牌精髓巧然融为一体。经销店整体宛如艺术殿堂，展示区中精粹集合了英菲尼迪款款惊艳之作——奢华全尺寸<a class=\"t_link\" href=\"http://product.cheshi.com/SUV/\" target=\"_blank\"><span style=\"color:#333;\">SUV</span></a> QX56、跑<a class=\"t_link\" href=\"http://product.cheshi.com/\" target=\"_blank\"><span style=\"color:#333;\">车型</span></a>SUV FX系列、<a class=\"t_link\" href=\"http://product.cheshi.com/paoche/\" target=\"_blank\"><span style=\"color:#333;\">跑车</span></a>型Crossover EX系列、高端豪华轿车<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_950/\" target=\"_blank\"><span style=\"color:#333;\">英菲尼迪M</span></a>系列和运动型豪华座驾G系列，全方位展现英菲尼迪车型奢华与优雅、动感与时尚的完美气质。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;开业仪式上，英菲尼迪中国事业总部总经理吕征宇先生表示：“长春融展英菲尼迪作为英菲尼迪品牌大家庭中新的一员，将为东北地区的<a class=\"t_link\" href=\"http://product.cheshi.com/haohuache/\" target=\"_blank\"><span style=\"color:#333;\">豪华车</span></a>消费者营造一个意境卓然的豪华新体验。如同每一家英菲尼迪的经销店一样，在这个充满艺术与时尚气息的展厅内，不但完美展示了英菲尼迪全系灵感座驾，更通过尊崇贴心的服务，悉心传递出英菲尼迪独有的“致情致盛 完美体验”的客户服务理念。长春融展英菲尼迪的建立，标志着英菲尼迪对中国吉林地区的<a class=\"t_link\" href=\"http://news.cheshi.com/cckj/200901/89780.shtml\" target=\"_blank\"><span style=\"color:#333;\">高</span></a>度重视与信心，以及对东北市场战略引擎的再度加速。同时，长春融展英菲尼迪也为品牌与周边地区的豪华车消费者架起了更为畅通的桥梁，使他们能够更加深入、直接地感受到英菲尼迪‘灵感、优雅、力量’的品牌精髓。”\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;自2007年进入中国以来，伴随着全系车型的登陆，英菲尼迪受到了越来越多中国消费者的关注与青睐，在短短4年间，品牌以锐不可当之势在中国豪华车市场占据了重要地位。2010年，英菲尼迪在中国的销量达到了11,513台，增幅高达137.3%，以骄人的成绩享誉业界。2011年，英菲尼迪继续保持着强劲的增长势头，不仅销售数字节节攀升，完备精准的营销策略和别出心裁的体验式市场活动令品牌更加深入人心。其中，与红牛F1车队的激情合作令广大消费者充分感受到英菲尼迪隽雅澎湃的<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_523/\" target=\"_blank\"><span style=\"color:#333;\">无限</span></a>力量；而充满驾乘乐趣的2011“G系极风之旅”大型赛道体验活动和“驾•享新境”2011英菲尼迪M全国<a class=\"t_link\" href=\"http://news.cheshi.com/sjpc/morelist_1.shtml\" target=\"_blank\"><span style=\"color:#333;\">试驾</span></a>会也让更多消费者亲身体验到英菲尼迪旗下优秀产品的卓越魅力。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a title=\"骄然天成非同凡响 英菲尼迪闪耀长春\" href=\"http://news.cheshi.com/picbrowser/20111207/462792_2167059.shtml\" target=\"_blank\"><img alt=\"骄然天成非同凡响 英菲尼迪闪耀长春\" src=\"http://img2.cheshi-img.com/201112/462792/4edf1bfc836a4_500.jpg\" border=\"0\" /></a>\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	长春融展英菲尼迪开业庆典 现场嘉宾合影\r\n</p>\r\n<p>\r\n	英菲尼迪始终倡导用灵动超凡的产品设计演绎奢华独到的生活态度，用悉心尊贵的客户服务表达全情体验的消费主张。新晋亮相的长春融展英菲尼迪不仅为消费者提供尊崇、愉悦的购车环境，更带给消费者英菲尼迪品牌文化的独特感受，打造出灵感与艺术完美融合的新坐标。预计截止今年年底，英菲尼迪将在中国开设超过50家特许经销店，并致力于为中国消费者提供“致情致盛，完美体验”的客户关怀理念。以全新<a class=\"t_link\" href=\"http://product.cheshi.com/bseries_274/\" target=\"_blank\"><span style=\"color:#333;\">挑战者</span></a>形象破界而行的英菲尼迪，必将为更多豪华车消费者带来前所未有的豪华新体验。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>','article.state.top','置顶','visible.true','显示',0,'2011-12-09 16:13:47','admin','管理员'),(85,'rongzhan.new.enterprise','汽车节能补贴10月取消','&nbsp;&nbsp;&nbsp;&nbsp;日前，一条“汽车产品补贴政策门槛提高，小排量汽车节能惠民补贴将于9月底取消”的消息在网上传得沸沸扬扬。有消息称，2010年6月起执行的汽车节能惠民补贴，9月底将被取消。还有一种说法是，汽车节能补贴政策不会全部取消，但是补贴门槛将提高，享受补贴的车型每百公里油耗门槛将由6.9升提升至6.3升。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;东风日产融展东日4S店，9月19日接到厂家文件称：9月16日，发改委，工信部和财政部联合发布《关于调整节能汽车推广补贴政策的通知》，先行 的补贴政策将执行到2011年9月30号，2011年10月1日起将实施新的节能汽车油耗标准，油耗门槛整体提高8%。东风日产原轩逸1.6 排量的手动档车型、阳光手动挡车型 、骐达手动挡车型将于10月1日起退出节能补贴范围，而旗下新骐达1.6排量CVT车型，阳光1.5排量车型补贴金额仍为3000元/台。<br />','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:25:43','admin','管理员'),(86,'rongzhan.new.sall','瑞孚岁末温暖奉送 共庆日产年度盛会','<p>\r\n	2011年，是东风日产崭新的一年，我们以超越同行的速度达成300万台销量，创造了东风日产奇迹。这一切都离不开广大车主的信赖和支持，是您成就了东风日产在行业及市场越来越好的口碑。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	为回馈广大车主对东风日产的厚爱，现东风日产瑞孚店联合绽放网在长春市景阳大路3862号（11高西行1500米87中斜对面）特推出“瑞孚岁末温暖奉送，共庆日产年度盛会——全系团购会第二季”活动。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<strong>12</strong><strong>月3</strong><strong>日-12</strong><strong>月31</strong><strong>日&nbsp;&nbsp;&nbsp; </strong><strong>瑞孚岁末温暖奉送——雪地胎团购</strong>\r\n</p>\r\n<p>\r\n	购邓禄普冬季轮胎，买三赠一！\r\n</p>\r\n<p>\r\n	限量50套，先到先得！\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<strong>12</strong><strong>月10</strong><strong>日下午一点&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>给你的爱车许个愿</strong>\r\n</p>\r\n<p>\r\n	追求时尚生活的你面对爱车，是精心装饰？还是倍加呵护？\r\n</p>\r\n<p>\r\n	为你的爱车许个愿，让心愿变成现实，让爱车炫动色彩，彰显个性！\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<strong>12</strong><strong>月17</strong><strong>日下午一点&nbsp;&nbsp;&nbsp; </strong><strong>瑞孚岁末温暖奉送——全系团购会第二季</strong>\r\n</p>\r\n<p>\r\n	东风日产全系车型岁末特惠！\r\n</p>\r\n<p>\r\n	现场签到得精美礼品一份！\r\n</p>\r\n<p>\r\n	购车绽放网即送时尚家电一台！\r\n</p>\r\n<p>\r\n	现场参与互动活动还有机会赢取其他高价值礼品！\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	精彩活动抢先报！\r\n</p>\r\n<p>\r\n	尊享一：看车买车，岁末特惠！\r\n</p>\r\n<p>\r\n	尊享二：非常试驾，礼遇随行！\r\n</p>\r\n<p>\r\n	尊享三：有奖竞猜，优智生活！\r\n</p>\r\n<p>\r\n	尊享四：微博互动，好礼相送！\r\n</p>\r\n<p>\r\n	尊享五：车品竞拍，超值享受！\r\n</p>\r\n<p>\r\n	尊享六：茶艺表演，品质服务！\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	品牌的保障，品质的服务！东风日产瑞孚店给您不一样的感受！请在2011年12月16日前登陆绽放网进行报名，即可参与本次活动。\r\n</p>\r\n<p>\r\n	<img style=\"width:540px;height:186px;\" src=\"http://image.bitauto.com/dealer/news/50002200/f715b12b-dddb-4f2b-a5ad-cff60de091c1.jpg\" />\r\n</p>\r\n<div id=\"afterVote\">\r\n</div>\r\n<script type=\"text/javascript\">function getVoteStation(type) { if(type==-1) { gid(\"beforeVote\").innerHTML=\"\"; return; } else if(type==1) { if(gid(\"beforeVote\")) { var str = gid(\"beforeVote\").innerHTML; gid(\"beforeVote\").innerHTML=\"\"; gid(\"afterVote\").innerHTML = str; } } } </script>\r\n<!--buy car area-->\r\n<div class=\"buycar\">\r\n	<ul>\r\n		<li>\r\n			<label>销售电话：</label><span class=\"tel400\">400-666-9466</span> \r\n			<li>\r\n				<label>联系电话：</label><span><img alt=\"联系电话\" src=\"http://dealer.bitauto.com/membersite/Common/Control/DealerInfoImg.ashx?op=get&amp;dealerid=50002200&amp;type=tel&amp;size=14\" /></span> \r\n				<li>\r\n					<label>店面地址：</label><span>长春市景阳大路3862号（11高西行1500米87中斜对面）</span> \r\n				</li>\r\n					</ul>\r\n						</div>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:51:49','admin','管理员'),(87,'rongzhan.new.sall','福特新嘉年华惠民补贴即将倒计时!','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;今年开始，福特新嘉华被例入国家惠民补贴车型，这一利好消息出台后使新嘉年华销售势头更火爆，并且新嘉华同时享受购置税按7.5%征收。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;日前，国家发改委产业协调司相关负责人明确表示：随着国内汽车消费刚性需求与潜力逐渐提升，明年购置税优惠政策肯定会取消。那么以10万元左右的1.6以下排量汽车来说，仅购置税部分2011年比2010年多支付2300多元。同时，惠民补贴3000元的惠民政策即将到期，也就是说2011年购新嘉年华要比2010年多花5300多元钱。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;现吉林隆孚为了更好的为购车者服务，把更多的利益让给广大客户。在2010年12月31日前购车的客户不仅享受惠民补贴与购置税优惠政策，还会有现金5000优惠与精美礼包赠送。先到先得，心动不如行动。还等什么？机不可失，失不再来。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;新嘉年华将会是你明智的选择\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;联系地址：<span class=\"red fb f20\">长春市景阳大路3520号</span>\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 16:59:56','admin','管理员'),(88,'rongzhan.new.sall','[长春]英菲尼迪FX35 享最高优惠7.3万元!','<p>\r\n	　近日，编辑从长春地区英菲尼迪经销商了解到，目前购买英菲尼迪FX35车型，最高可享7.3万元现金优惠，店内有部分现车。详情请看下表：\r\n</p>\r\n<center>\r\n	<table class=\"ke-zeroborder\" cellspacing=\"1\" cellpadding=\"1\" width=\"530\" bgcolor=\"#000000\" border=\"0\">\r\n		<tbody>\r\n			<tr bgcolor=\"#c0c0c0\">\r\n				<td align=\"middle\" colspan=\"2\" height=\"30\">\r\n					<strong>车型+款式</strong>\r\n				</td>\r\n				<td align=\"middle\" width=\"60\">\r\n					<strong>指导价</strong>\r\n				</td>\r\n				<td align=\"middle\" width=\"60\">\r\n					<strong>降幅</strong>\r\n				</td>\r\n				<td align=\"middle\" width=\"60\">\r\n					<strong>现价</strong>\r\n				</td>\r\n				<td align=\"middle\" width=\"60\">\r\n					<strong>降幅比例</strong>\r\n				</td>\r\n				<td align=\"middle\" width=\"40\">\r\n					<strong>现车情况<strong></strong></strong>\r\n				</td>\r\n			</tr>\r\n			<tr bgcolor=\"#ffffff\">\r\n				<td align=\"middle\" height=\"55\">\r\n					<a href=\"http://db.auto.sohu.com/trim-116457.shtml\" target=\"_blank\"><img alt=\"英菲尼迪FX FX35 金尚标准版\" src=\"http://i3.itc.cn/20110119/669_0c8c3388_dd23_432d_afed_60a16e87f8f9.jpg\" width=\"80\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					<a class=\"teshu\" href=\"http://db.auto.sohu.com/model-1780.shtml\" target=\"_blank\">英菲尼迪FX</a> <a href=\"http://db.auto.sohu.com/model-1780.shtml\" target=\"_blank\">FX35</a> 金尚标准版\r\n				</td>\r\n				<td align=\"middle\">\r\n					78.90<br />\r\n<a href=\"http://goche.auto.sohu.com/calc_nu.html?pr=78.90&amp;m=0&amp;t=1\" target=\"_blank\"><img alt=\"购车计算\" src=\"http://photocdn.sohu.com/20111117/Img325996146.gif\" align=\"absMiddle\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					7.3万\r\n				</td>\r\n				<td align=\"middle\">\r\n					71.6万<br />\r\n<a href=\"http://goche.auto.sohu.com/calc_nu.html?pr=71.6&amp;m=0&amp;t=1\" target=\"_blank\"><img alt=\"购车计算\" src=\"http://photocdn.sohu.com/20111117/Img325996146.gif\" align=\"absMiddle\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					9.25%\r\n				</td>\r\n				<td align=\"middle\">\r\n					有\r\n				</td>\r\n			</tr>\r\n			<tr bgcolor=\"#ffffff\">\r\n				<td align=\"middle\" height=\"55\">\r\n					<a href=\"http://db.auto.sohu.com/trim-116458.shtml\" target=\"_blank\"><img alt=\"英菲尼迪FX FX35 金尚超越版\" src=\"http://m1.auto.itc.cn/car/120/84/70/Img907084_120.jpg\" width=\"80\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					<a class=\"teshu\" href=\"http://db.auto.sohu.com/model-1780.shtml\" target=\"_blank\">英菲尼迪FX</a> <a class=\"teshu\" href=\"http://db.auto.sohu.com/model-1780.shtml\" target=\"_blank\">FX35</a> 金尚超越版\r\n				</td>\r\n				<td align=\"middle\">\r\n					82.20<br />\r\n<a href=\"http://goche.auto.sohu.com/calc_nu.html?pr=82.20&amp;m=0&amp;t=1\" target=\"_blank\"><img alt=\"购车计算\" src=\"http://photocdn.sohu.com/20111117/Img325996146.gif\" align=\"absMiddle\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					6.9万\r\n				</td>\r\n				<td align=\"middle\">\r\n					75.3万<br />\r\n<a href=\"http://goche.auto.sohu.com/calc_nu.html?pr=75.3&amp;m=0&amp;t=1\" target=\"_blank\"><img alt=\"购车计算\" src=\"http://photocdn.sohu.com/20111117/Img325996146.gif\" align=\"absMiddle\" border=\"0\" /></a>\r\n				</td>\r\n				<td align=\"middle\">\r\n					8.39%\r\n				</td>\r\n				<td align=\"middle\">\r\n					有\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</center>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;英菲尼迪FX车型的前脸看起来更运动，更现代。外观上的变化包括前挡泥板，带有英菲尼迪FX35大标识的双拱形格栅，L型的HID双氙头大灯及一体化的雾灯。大灯部分与保险杠、发动机盖、水箱框架等周围的接缝非常匀称，大灯与发动机盖之间有橡胶垫保证了整体密封性。\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;英菲尼迪的心脏是一颗荣获世界十佳发动机称号的引擎。英菲尼迪FX35的发动机排量为3.5升，在数据方面，这台发动机在CVTCS连续可变汽门正时的辅助下，6800转/分时可输出307马力（226Kw），4800转/分时爆发出350牛米的最大扭矩。更高端车型英菲尼迪FX50车型则配备的是5.0升V8发动机。\r\n</p>\r\n<p>\r\n	　　编辑点评：FX系列作为英菲尼迪旗下高端SUV车型，与宝马X5、奥迪Q7及奔驰ML等车型为同级别，价格相仿而品牌知名度，及车型外型上的认可度，并不是每人都能接受的，现FX最高可享7.3万元的现金优惠，关注此车型的网友不妨致电经销商或到店详谈选购。\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 17:03:04','admin','管理员'),(89,'rongzhan.about.culture','企业文化','&nbsp;<img style=\"width:722px;height:583px;\" height=\"336\" alt=\"\" src=\"/rongzhan/attached/image/20111209/20111209194909_923.jpg\" width=\"500\" /> \r\n<p>\r\n	&nbsp;\r\n</p>','article.state.normal','普通','visible.true','显示',0,'2011-12-09 19:44:58','admin','管理员');

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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

/*Data for the table `web_content` */

insert  into `web_content`(`id`,`name`,`english`,`path`,`parentId`,`sort`,`hasShow`,`hasShowName`,`mode`,`modeName`) values ('rongzhan','融展集团','RongZhan Group','',NULL,1,'visible.true','显示','content.mode.none','空项'),('rongzhan.home','首页','Home','index.jsp','rongzhan',22,'visible.true','显示','content.mode.none','空项'),('rongzhan.about','集团介绍','About','','rongzhan',23,'visible.true','显示','content.mode.none','空项'),('rongzhan.new','新闻中心','New','','rongzhan',29,'visible.true','显示','content.mode.more','多项'),('rongzhan.service','集团服务','Services','','rongzhan',30,'visible.true','显示','content.mode.none','空项'),('rongzhan.insurance','保险中心','Insurance','','rongzhan',31,'visible.true','显示','content.mode.none','空项'),('rongzhan.loan','分期贷款','Loan','','rongzhan',32,'visible.true','显示','content.mode.none','空项'),('rongzhan.hr','人才招聘','HR','','rongzhan',33,'visible.true','显示','content.mode.one','单项'),('rongzhan.contact','联系我们','Contact','','rongzhan',34,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.speak','董事长致辞','Speak','','rongzhan.about',35,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.introduce','集团介绍','Introduce','','rongzhan.about',36,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.culture','企业文化','Enterprise culture','','rongzhan.about',37,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.course','发展历程','Course','','rongzhan.about',39,'visible.true','显示','content.mode.one','单项'),('rongzhan.new.enterprise','企业新闻','Enterprise','','rongzhan.new',40,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.car','行业新闻','Car','','rongzhan.new',41,'visible.true','显示','content.mode.more','多项'),('rongzhan.new.sall','促销新闻','Sall','','rongzhan.new',42,'visible.true','显示','content.mode.more','多项'),('rongzhan.service.test','验车中心','Test','','rongzhan.service',43,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.rescue','24小时救援','Rescue','','rongzhan.service',44,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.special','特殊服务','Special','','rongzhan.service',45,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.member','会员服务','Memer','','rongzhan.service',46,'visible.true','显示','content.mode.one','单项'),('rongzhan.service.book','在线预约','Book','','rongzhan.service',47,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.sall','保险销售','Sall','','rongzhan.insurance',48,'visible.true','显示','content.mode.one','单项'),('rongzhan.insurance.indemnify','保险理赔','Indemnify','','rongzhan.insurance',49,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.toyota','丰田金融','Toyota','','rongzhan.loan',50,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.gm','通用金融','GM','','rongzhan.loan',51,'visible.true','显示','content.mode.one','单项'),('rongzhan.loan.fw','大众金融','FW','','rongzhan.loan',52,'visible.true','显示','content.mode.one','单项'),('changchunruifu','长春瑞孚汽车销售服务有限公司','ChangChun RuiFu','',NULL,54,'visible.true','显示','content.mode.none','空项'),('jilinshenglongfu','吉林省隆孚汽车销售服务有限公司','JiLin LongFu','',NULL,55,'visible.true','显示','content.mode.none','空项'),('changchunruifu.home','首页','Home','','changchunruifu',56,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about','企业介绍','About','','changchunruifu',57,'visible.true','显示','content.mode.one','单项'),('changchunruifu.new','新闻中心','New','','changchunruifu',58,'visible.true','显示','content.mode.more','多项'),('changchunruifu.sall','销售服务','Sall','','changchunruifu',59,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled','售后服务','Salled','','changchunruifu',60,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance','保险服务','Insurance','','changchunruifu',61,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online','在线客服','Online','','changchunruifu',62,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book','预约服务','Book','','changchunruifu',63,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.introduce','企业介绍','Introduce','','changchunruifu.about',64,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.glory','公司荣誉','Glory','','changchunruifu.about',65,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.form','公司形象','Form','','changchunruifu.about',66,'visible.true','显示','content.mode.one','单项'),('changchunruifu.about.contact','联系方式','Contact','','changchunruifu.about',67,'visible.true','显示','content.mode.one','单项'),('changchunruifu.new.offsall','优惠活动','OffSall','','changchunruifu.new',68,'visible.true','显示','content.mode.more','多项'),('changchunruifu.new.company','公司新闻','Company','','changchunruifu.new',69,'visible.true','显示','content.mode.more','多项'),('changchunruifu.new.car','行业新闻','Car','','changchunruifu.new',70,'visible.true','显示','content.mode.more','多项'),('changchunruifu.sall.new','新车报价','NewCar','','changchunruifu.sall',71,'visible.true','显示','content.mode.one','单项'),('changchunruifu.sall.offsall','优惠促销','OffSall','','changchunruifu.sall',72,'visible.true','显示','content.mode.one','单项'),('changchunruifu.sall.special','特色服务','Special','','changchunruifu.sall',73,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.notice','公告','Notice','','changchunruifu.salled',74,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.repair','保修保养服务','Repair','','changchunruifu.salled',75,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.special','特色服务','Special','','changchunruifu.salled',76,'visible.true','显示','content.mode.one','单项'),('changchunruifu.salled.help','服务手册','Help','','changchunruifu.salled',77,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.introduce','保险服务介绍','Introduce','','changchunruifu.insurance',78,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.knowledge','保险知识','Knowledge','','changchunruifu.insurance',79,'visible.true','显示','content.mode.one','单项'),('changchunruifu.insurance.indemnify','保险理赔','Insurance','','changchunruifu.insurance',80,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.enquire','资讯客服','Enquire','','changchunruifu.online',81,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.complain','投诉意见','Complain','','changchunruifu.online',82,'visible.true','显示','content.mode.one','单项'),('changchunruifu.online.message','客户留言','Message','','changchunruifu.online',83,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.drive','试乘预约','Drive','','changchunruifu.book',84,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.repair','维修预约','Repair','','changchunruifu.book',85,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.maintain','保养预约','Maintain','','changchunruifu.book',86,'visible.true','显示','content.mode.one','单项'),('changchunruifu.book.buy','订车预约','Buy','','changchunruifu.book',87,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.home','首页','Home','','jilinshenglongfu',88,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about','企业介绍','About','','jilinshenglongfu',89,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.new','新闻中心','New','','jilinshenglongfu',90,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.sall','销售服务','Sall','','jilinshenglongfu',91,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled','售后服务','Salled','','jilinshenglongfu',92,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance','保险服务','Insurance','','jilinshenglongfu',93,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online','在线客服','Online','','jilinshenglongfu',94,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book','预约服务','Book','','jilinshenglongfu',95,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.introduce','企业介绍','Introduce','','jilinshenglongfu.about',96,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.glory','公司荣誉','Glory','','jilinshenglongfu.about',97,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.form','公司形象','Form','','jilinshenglongfu.about',98,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.about.contact','联系方式','Contact','','jilinshenglongfu.about',99,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.new.offsall','优惠活动','OffSall','','jilinshenglongfu.new',100,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.new.company','公司新闻','Company','','jilinshenglongfu.new',101,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.new.car','行业新闻','Car','','jilinshenglongfu.new',102,'visible.true','显示','content.mode.more','多项'),('jilinshenglongfu.sall.new','新车报价','NewCar','','jilinshenglongfu.sall',103,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.sall.offsall','优惠促销','OffSall','','jilinshenglongfu.sall',104,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.sall.special','特色服务','Special','','jilinshenglongfu.sall',105,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.notice','公告','Notice','','jilinshenglongfu.salled',106,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.repair','保修保养服务','Repair','','jilinshenglongfu.salled',107,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.special','特色服务','Special','','jilinshenglongfu.salled',108,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.salled.help','服务手册','Help','','jilinshenglongfu.salled',109,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.introduce','保险服务介绍','Introduce','','jilinshenglongfu.insurance',110,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.knowledge','保险知识','Knowledge','','jilinshenglongfu.insurance',111,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.insurance.indemnify','保险理赔','Insurance','','jilinshenglongfu.insurance',112,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.enquire','资讯客服','Enquire','','jilinshenglongfu.online',113,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.complain','投诉意见','Complain','','jilinshenglongfu.online',114,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.online.message','客户留言','Message','','jilinshenglongfu.online',115,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.drive','试乘预约','Drive','','jilinshenglongfu.book',116,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.repair','维修预约','Repair','','jilinshenglongfu.book',117,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.maintain','保养预约','Maintain','','jilinshenglongfu.book',118,'visible.true','显示','content.mode.one','单项'),('jilinshenglongfu.book.buy','订车预约','Buy','','jilinshenglongfu.book',119,'visible.true','显示','content.mode.one','单项'),('rongzhan.about.structure','组织架构','Structur','','rongzhan.about',120,'visible.true','显示','content.mode.one','单项');

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
