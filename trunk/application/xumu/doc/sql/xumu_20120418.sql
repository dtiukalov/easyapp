/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.0.37-community-nt : Database - xumu
*********************************************************************
Server version : 5.0.37-community-nt
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
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(100) default NULL,
  `value` varchar(100) default NULL,
  `type` varchar(100) default NULL,
  `pinyin` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `app_dict` */

insert  into `app_dict`(`id`,`key`,`value`,`type`,`pinyin`) values (1,'article.state.normal','普通','article.state','putong'),(2,'article.state.recommand','推荐','article.state','tuijian'),(3,'article.state.top','置顶','article.state','zhiding'),(4,'ascii','ACSII码','regex','acsii'),(5,'bookcar.state.false','未确认','bookcar.state','weiqueren'),(6,'bookcar.state.true','确认','bookcar.state','queren'),(7,'bookcar.type.bookcar','订车','bookcar.type','dingche'),(8,'bookcar.type.change','置换','bookcar.type','zhihuan'),(9,'bookcar.type.drive','试驾','bookcar.type','shijia'),(10,'boolean.false','否','boolean','fou'),(11,'boolean.true','是','boolean','shi'),(12,'car.dongfenghonda','东风本田','car','dongfengbentian'),(13,'car.dongfenghonda.civic','思域','car.dongfenghonda','siyu'),(14,'car.dongfenghonda.crv','CRV','car.dongfenghonda','crv'),(15,'car.dongfenghonda.crv.1','系列一','car.dongfenghonda.crv','xilieyi'),(16,'car.dongfenghonda.crv.2','系列二','car.dongfenghonda.crv','xilieer'),(17,'car.dongfenghonda.spirior','思铂睿','car.dongfenghonda','siborui'),(18,'car.dongfengnissan','东风尼桑','car','dongfengnisang'),(19,'car.yiqivw','一汽大众','car','yiqidazhong'),(20,'chinese','中文','regex','zhengwen'),(21,'column.type.decimal','decimal','column.type','decimal'),(22,'column.type.int','int','column.type','int'),(23,'column.type.varchar','varchar','column.type','varchar'),(24,'content.mode.more','多项','content.mode','duoxiang'),(25,'content.mode.none','空项','content.mode','kongxiang'),(26,'content.mode.one','单项','content.mode','danxiang'),(28,'decmal','浮点数','regex','fudianshu'),(29,'email','邮箱','regex','youxiang'),(30,'flow.node.approve','回退节点','flow.node','huituijiedian'),(31,'flow.node.create','创建节点','flow.node','chuangjianjiedian'),(32,'flow.node.process','过程节点','flow.node','guochengjiedian'),(33,'flow.node.realize','结束节点','flow.node','jieshujiedian'),(34,'form.type.creater','创建者','form.type','chuangjianzhe'),(35,'form.type.datebox','日期','form.type','riqi'),(36,'form.type.datetime','日期时间','form.type','riqishijian'),(37,'form.type.textarea','文本域','form.type','wenbenyu'),(38,'form.type.combox','单选框','form.type','danxuankuang'),(39,'id','标识','regex','biaoshi'),(40,'idcard','身份证','regex','shenfenzheng'),(41,'integer','整数','regex','zhengshu'),(42,'letter','字母','regex','zimu'),(43,'loginId','登录标识','regex','denglubiaoshi'),(44,'message.state.false','未回复','message.state','weihuifu'),(45,'message.state.true','已回复','message.state','yihuifu'),(46,'node.condition.auth','权限','node.condition.model','qanxian'),(47,'node.condition.auth.department','组织机构','node.condition.auth','bumen'),(48,'node.condition.auth.role','角色','node.condition.auth','juese'),(49,'node.condition.auth.user','用户','node.condition.auth','yonghu'),(50,'node.condition.workflow','工作流','node.condition.model','chuangjianzhe'),(51,'node.condition.creater.department','部门负责人','node.condition.creater','bumenfuzeren'),(52,'node.condition.creater.self','本人','node.condition.creater','zhuangjianzhe'),(53,'notempty','非空','regex','feikong'),(54,'number','数字','regex','shuzi'),(55,'phone','手机电话','regex','shouji'),(56,'picture','图片','regex','tupian'),(57,'qq','QQ号','regex','qq'),(58,'rar','压缩文件','regex','yasuowenjian'),(59,'tel','座机电话','regex','zuoji'),(60,'url','URL','regex','url'),(61,'visible.false','隐藏','visible','yinchang'),(62,'visible.true','显示','visible','xianshi'),(63,'zipcode','邮编','regex','youbian'),(64,'只读','只读','node.state','zhidu'),(65,'必填','必填','node.state','bitian'),(66,'选填','选填','node.state','xuantian'),(67,'隐藏','隐藏','node.state','yincang'),(68,'yes','同意','advise','tongyi'),(69,'no','不同意','advise','butongyi'),(70,'form.type.input','输入框','form.type','shurukuang'),(71,'node.condition.creater.department.people','同部门','node.condition.creater','tongbumen'),(75,'node.condition.creater','创建者','node.condition.workflow','chuangjianzhe'),(86,'申报','申报','sldb.state.type','shenbao'),(87,'初审','初审','sldb.state.type','chushen'),(88,'核对','核对','sldb.state.type','hedui'),(89,'驳回','驳回','sldb.state.type','bohui'),(90,'通过','通过','sldb.state.type','tongguo'),(91,'农村低保收入','农村低保收入','sldb.person.type','nongcundibaoshouru'),(92,'城镇低保收入','城镇低保收入','sldb.person.type','chegnzhendibaoshouru'),(93,'农村低保','农村低保','sldb.person.type','nongcundibao'),(94,'城镇低保','城镇低保','sldb.person.type','chengzhendibao'),(95,'女','女','gender','nv'),(96,'男','男','gender','nan'),(97,'是','是','easyboolean','shi'),(98,'否','否','easyboolean','fou'),(102,'非农','非农','sldb.hukou','none'),(103,'农业','农业','sldb.hukou','none'),(104,'其他','其他','sldb.home','none'),(105,'农转非家庭','农转非家庭','sldb.home','none'),(106,'因残致贫家庭','因残致贫家庭','sldb.home','none'),(107,'年老体弱家庭','年老体弱家庭','sldb.home','none'),(108,'子女就学（升学）困难家庭','子女就学（升学）困难家庭','sldb.home','none'),(109,'因灾致贫家庭','因灾致贫家庭','sldb.home','none'),(110,'因病致贫家庭','因病致贫家庭','sldb.home','none'),(111,'三无人员家庭','三无人员家庭','sldb.home','none'),(112,'丧偶','丧偶','sldb.marry','none'),(113,'离异','离异','sldb.marry','none'),(114,'未婚','未婚','sldb.marry','none'),(115,'已婚','已婚','sldb.marry','none'),(116,'完全劳动能力','完全劳动能力','sldb.workable','none'),(117,'部分劳动能力','部分劳动能力','sldb.workable','none'),(118,'无劳动能力','无劳动能力','sldb.workable','none'),(119,'其他','其他','sldb.idType','none'),(120,'孤儿','孤儿','sldb.idType','none'),(121,'大学在校生','大学在校生','sldb.idType','none'),(122,'高中在校生','高中在校生','sldb.idType','none'),(123,'中学在校生','中学在校生','sldb.idType','none'),(124,'小学在校生','小学在校生','sldb.idType','none'),(125,'无业','无业','sldb.idType','none'),(126,'退休','退休','sldb.idType','none'),(127,'在职','在职','sldb.idType','none'),(128,'其他特殊病种','其他特殊病种','sldb.ill','none'),(129,'红斑狼疮','红斑狼疮','sldb.ill','none'),(130,'腰间盘突出','腰间盘突出','sldb.ill','none'),(131,'股骨头坏死','股骨头坏死','sldb.ill','none'),(132,'气管炎','气管炎','sldb.ill','none'),(133,'哮喘','哮喘','sldb.ill','none'),(134,'精神病','精神病','sldb.ill','none'),(135,'肺结核','肺结核','sldb.ill','none'),(136,'白血病','白血病','sldb.ill','none'),(137,'类风湿疾病','类风湿疾病','sldb.ill','none'),(138,'糖尿病','糖尿病','sldb.ill','none'),(139,'重症肝病','重症肝病','sldb.ill','none'),(140,'脑血栓','脑血栓','sldb.ill','none'),(141,'脑出血','脑出血','sldb.ill','none'),(142,'心脏病','心脏病','sldb.ill','none'),(143,'肾功能衰竭','肾功能衰竭','sldb.ill','none'),(144,'癌症','癌症','sldb.ill','none'),(145,'其他残疾','其他残疾','sldb.deformity','none'),(146,'多重残疾','多重残疾','sldb.deformity','none'),(147,'精神残疾','精神残疾','sldb.deformity','none'),(148,'智力残疾','智力残疾','sldb.deformity','none'),(149,'肢体残疾','肢体残疾','sldb.deformity','none'),(150,'言语残疾','言语残疾','sldb.deformity','none'),(151,'听力残疾','听力残疾','sldb.deformity','none'),(152,'视力残疾','视力残疾','sldb.deformity','none'),(153,'一级','一级','sldb.deformityLevel','none'),(154,'二级','二级','sldb.deformityLevel','none'),(155,'三级','三级','sldb.deformityLevel','none'),(156,'四级','四级','sldb.deformityLevel','none'),(157,'五级','五级','sldb.deformityLevel','none'),(158,'其他','其他','sldb.companyType','none'),(159,'地方集体','地方集体','sldb.companyType','none'),(160,'地方国有','地方国有','sldb.companyType','none'),(161,'省直集体','省直集体','sldb.companyType','none'),(162,'省直国有','省直国有','sldb.companyType','none'),(163,'中直集体','中直集体','sldb.companyType','none'),(164,'中直国有','中直国有','sldb.companyType','none'),(165,'其他','其他','sldb.trade','none'),(166,'轻化','轻化','sldb.trade','none'),(167,'建筑','建筑','sldb.trade','none'),(168,'地矿','地矿','sldb.trade','none'),(169,'机械军工','机械军工','sldb.trade','none'),(170,'农垦','农垦','sldb.trade','none'),(171,'冶金','冶金','sldb.trade','none'),(172,'森工','森工','sldb.trade','none'),(173,'煤炭','煤炭','sldb.trade','none'),(174,'其他保险','其他保险','sldb.insurance','none'),(175,'商业保险','商业保险','sldb.insurance','none'),(176,'工伤保险','工伤保险','sldb.insurance','none'),(177,'生育保险','生育保险','sldb.insurance','none'),(178,'失业保险','失业保险','sldb.insurance','none'),(179,'医疗保险','医疗保险','sldb.insurance','none'),(180,'养老保险','养老保险','sldb.insurance','none'),(181,'否','否','sldb.insurance','none');

/*Table structure for table `app_form_item` */

DROP TABLE IF EXISTS `app_form_item`;

CREATE TABLE `app_form_item` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `showName` varchar(50) default NULL,
  `defaultValue` varchar(500) default NULL,
  `tableId` int(11) default NULL,
  `required` varchar(50) default NULL,
  `requiredName` varchar(50) default NULL,
  `readonly` varchar(50) default NULL,
  `readonlyName` varchar(50) default NULL,
  `hidden` varchar(50) default NULL,
  `hiddenName` varchar(50) default NULL,
  `min` varchar(50) default NULL,
  `max` varchar(50) default NULL,
  `regex` varchar(50) default NULL,
  `regexName` varchar(50) default NULL,
  `focusTip` varchar(200) default NULL,
  `func` varchar(2000) default NULL,
  `dict` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  `render` varchar(2000) default NULL,
  `formType` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_form_item` */

insert  into `app_form_item`(`id`,`name`,`showName`,`defaultValue`,`tableId`,`required`,`requiredName`,`readonly`,`readonlyName`,`hidden`,`hiddenName`,`min`,`max`,`regex`,`regexName`,`focusTip`,`func`,`dict`,`type`,`typeName`,`render`,`formType`) values (16,'vvv','vvv','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(17,'name','名称','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(18,'age','年龄','',7,'boolean.true','是','boolean.true','是','visible.true','显示','','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(40,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(41,'phone','电话','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(42,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(43,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(\'#used\').combobox({\r\n	onSelect : function(record){\r\n	       $(\'#usedName\').val(record.text);\r\n        }\r\n});','add'),(44,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(45,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),(46,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),(54,'name','名称','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入中文','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(55,'phone','电话','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入有效电话号码','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(56,'email','邮箱','',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','email','邮箱','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(57,'used','有效','boolean.true',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','boolean','form.type.combox','单选框','$(\'#used\').combobox({\r\n	onSelect : function(record){\r\n	       $(\'#usedName\').val(record.text);\r\n        }\r\n});','edit'),(58,'usedName','是否有效','是',9,'boolean.false','否','boolean.false','否','visible.false','隐藏','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(59,'birthday','生日','current',9,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),(60,'desc','描述','',9,'boolean.false','否','boolean.false','否','visible.true','显示','0','51','','','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit'),(61,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(62,'date','日期','2012-09-09',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','data','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','add'),(63,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','add'),(68,'name','姓名','张三',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','chinese','中文','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','edit'),(69,'date','日期','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','data','日期','请输入内容','function() {this.isvalid=true;}','','form.type.datebox','日期','','edit'),(70,'phone','电话','',10,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','phone','手机电话','请输入内容','function() {this.isvalid=true;}','','form.type.textarea','文本域','','edit'),(71,'name','名称','',11,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(72,'number','编号','',11,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','number','数字','请输入内容','function() {this.isvalid=true;}','','form.type.input','输入框','','add'),(73,'date','日期','',11,'boolean.true','是','boolean.false','否','visible.true','显示','0','50','','','请输入内容','function() {this.isvalid=true;}','','form.type.datetime','日期时间','','add');

/*Table structure for table `app_queryform_item` */

DROP TABLE IF EXISTS `app_queryform_item`;

CREATE TABLE `app_queryform_item` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `showName` varchar(50) default NULL,
  `tableId` int(11) default NULL,
  `condition` varchar(50) default NULL,
  `conditionName` varchar(50) default NULL,
  `hidden` varchar(50) default NULL,
  `hiddenName` varchar(50) default NULL,
  `sort` varchar(50) default NULL,
  `sortName` varchar(50) default NULL,
  `width` varchar(50) default NULL,
  `format` varchar(2000) default NULL,
  `dict` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_queryform_item` */

insert  into `app_queryform_item`(`id`,`name`,`showName`,`tableId`,`condition`,`conditionName`,`hidden`,`hiddenName`,`sort`,`sortName`,`width`,`format`,`dict`,`type`,`typeName`) values (3,'age','年龄',7,'boolean.true','是','visible.true','显示','boolean.true','是','100','','car','form.type.input','输入框'),(9,'vvv','vvv',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','','form.type.textarea','文本域'),(10,'name','名称',7,'boolean.true','是','visible.true','显示','boolean.true','是','50','','boolean','form.type.combox','单选框'),(12,'name','名称',9,'boolean.true','是','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),(13,'phone','电话',9,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','form.type.input','输入框'),(14,'email','邮箱',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),(15,'used','有效',9,'boolean.true','是','visible.false','隐藏','boolean.true','是','50','','boolean','form.type.combox','单选框'),(16,'usedName','是否有效',9,'boolean.false','否','visible.true','显示','boolean.true','是','80','','','form.type.input','输入框'),(18,'birthday','生日',9,'boolean.true','是','visible.true','显示','boolean.true','是','150','','','form.type.datebox','日期'),(19,'desc','描述',9,'boolean.false','否','visible.true','显示','boolean.true','是','150','','','form.type.input','输入框'),(22,'name','姓名',10,'boolean.true','是','visible.true','显示','boolean.true','是','102','','','form.type.input','输入框'),(23,'date','日期',10,'boolean.true','是','visible.true','显示','boolean.true','是','152','','','form.type.datebox','日期'),(25,'phone','电话',10,'boolean.true','是','visible.true','显示','boolean.true','是','150','return value;','','form.type.input','输入框'),(26,'test_age','年龄',27,'boolean.true','是','visible.true','显示','boolean.true','是','100','','','input','输入框'),(27,'name','名称',11,'boolean.true','是','visible.true','显示','boolean.true','是','50','return value;','','form.type.input','输入框'),(28,'number','编号',11,'boolean.true','是','visible.true','显示','boolean.true','是','50','return value;','','form.type.input','输入框'),(29,'date','日期',11,'boolean.true','是','visible.true','显示','boolean.true','是','50','return value;','','form.type.input','输入框');

/*Table structure for table `app_resources` */

DROP TABLE IF EXISTS `app_resources`;

CREATE TABLE `app_resources` (
  `id` varchar(100) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `path` varchar(100) default NULL,
  `parentId` varchar(100) default NULL,
  `sort` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `app_resources` */

insert  into `app_resources`(`id`,`name`,`path`,`parentId`,`sort`) values ('auth','管理权限',NULL,NULL,1),('auth.user','管理用户','/app/auth/user/showUsers.jsp','auth',2),('auth.role','管理角色','/app/auth/role/showRoles.jsp','auth',3),('auth.resource','管理资源','/app/auth/resource/showResources.jsp','auth',4),('auth.organization','管理部门','/app/auth/organization/showOrganizations.jsp','auth',5),('configuration','管理基础配置','',NULL,6),('configuration.dict','管理数据字典','/app/system/dict/showDicts.jsp','configuration',7),('configuration.table','管理表','/app/system/easyform/table/show.jsp','configuration',41),('workflow','管理工作流','/app/workflow/info/show.jsp','configuration',42),('configuration.workflow.instance','管理工作流实例','/app/workflow/runtime/instance/show.jsp','configuration',43),('auth.change.password','修改密码','/app/auth/user/changePassword.jsp',NULL,57),('xm.warning','预警信息管理','',NULL,58),('xm.warning.farmer','养殖户填报信息','/app/warning/admin/farmerShow.jsp','xm.warning',59),('xm.passing','追溯信息管理','',NULL,60),('xm.passing.pass','流通信息','/app/passing/admin/passShow.jsp','xm.passing',61),('xm.medication','药品档案管理','',NULL,62),('xm.medication.number','存档数据','/app/medication/admin/medicationShow.jsp','xm.medication',63),('xm.warning.total','数据采集汇总','/app/warning/admin/totalShow.jsp','xm.warning',64),('xm.ready','生猪监测预警','',NULL,65),('xm.animal.log','巡查日志','/app/animal/admin/log.jsp','xm.animal',66),('xm.recall','畜产品质量安全追溯','',NULL,67),('xm.recall.culture','畜禽养殖档案','/app/recall/admin/culture/show.jsp','xm.recall',68),('xm.quarantine','检疫监管管理','',NULL,69),('xm.quarantine.area','产地检疫','/app/quarantine/admin/animal/show.jsp','xm.quarantine',71),('xm.animal','兽药监管管理','',NULL,72),('xm.ready.total','数据采集汇总','/app/warning/admin/totalShow.jsp','xm.ready',73),('xm.quarantine.kill','屠宰检疫','/app/quarantine/admin/product/show.jsp','xm.quarantine',74),('xm.quarantine.query','流通检疫','/app/quarantine/admin/showAll.jsp','xm.quarantine',75),('xm.recall.product','产品追溯','/app/recall/admin/message/showAll.jsp','xm.recall',76);

/*Table structure for table `app_table` */

DROP TABLE IF EXISTS `app_table`;

CREATE TABLE `app_table` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `showName` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_table` */

insert  into `app_table`(`id`,`name`,`showName`) values (9,'test_ust','测试用户'),(11,'xumu','畜牧');

/*Table structure for table `app_table_column` */

DROP TABLE IF EXISTS `app_table_column`;

CREATE TABLE `app_table_column` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `showName` varchar(50) default NULL,
  `tableId` int(11) default NULL,
  `type` varchar(50) default NULL,
  `typeName` varchar(50) default NULL,
  `length` varchar(50) default NULL,
  `defaultValue` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_table_column` */

insert  into `app_table_column`(`id`,`name`,`showName`,`tableId`,`type`,`typeName`,`length`,`defaultValue`) values (18,'name','名称',9,'column.type.varchar','varchar','50',''),(19,'phone','电话',9,'column.type.varchar','varchar','50',''),(20,'email','邮箱',9,'column.type.varchar','varchar','50',''),(21,'used','有效',9,'column.type.varchar','varchar','50','boolean.true'),(22,'desc','描述',9,'column.type.varchar','varchar','50',''),(23,'birthday','生日',9,'column.type.varchar','varchar','50',''),(24,'usedName','是否有效',9,'column.type.varchar','varchar','50','是'),(25,'name','姓名',10,'column.type.varchar','varchar','80',''),(26,'date','日期',10,'column.type.varchar','varchar','50',''),(27,'phone','电话',10,'column.type.varchar','varchar','50',''),(28,'name','名称',11,'column.type.varchar','varchar','50',''),(29,'number','编号',11,'column.type.varchar','varchar','50',''),(30,'date','日期',11,'column.type.varchar','varchar','50','');

/*Table structure for table `auth_organizations` */

DROP TABLE IF EXISTS `auth_organizations`;

CREATE TABLE `auth_organizations` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `description` varchar(500) default NULL,
  `responsible` varchar(50) default '否',
  `parentId` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_organizations` */

insert  into `auth_organizations`(`id`,`name`,`description`,`responsible`,`parentId`) values (3,'畜牧局','','否',NULL),(9,'人事副总','','否','3'),(11,'人事部长','','是','10'),(12,'人事部副部长','','否','10'),(13,'人事部助理','','否','10'),(14,'人事部成员','','否','10'),(16,'销售部长','','是','15'),(17,'管辖','','否',NULL),(18,'养殖户','','否','17');

/*Table structure for table `auth_re_organization_resource` */

DROP TABLE IF EXISTS `auth_re_organization_resource`;

CREATE TABLE `auth_re_organization_resource` (
  `organizationId` int(100) NOT NULL,
  `resourceId` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`organizationId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_re_organization_resource` */

/*Table structure for table `auth_re_organization_user` */

DROP TABLE IF EXISTS `auth_re_organization_user`;

CREATE TABLE `auth_re_organization_user` (
  `organizationId` int(100) NOT NULL,
  `userId` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`organizationId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_re_organization_user` */

insert  into `auth_re_organization_user`(`organizationId`,`userId`) values (11,'zhangsan'),(12,'admin'),(16,'lisi'),(18,'wangqian');

/*Table structure for table `auth_re_role_resource` */

DROP TABLE IF EXISTS `auth_re_role_resource`;

CREATE TABLE `auth_re_role_resource` (
  `roleId` int(100) NOT NULL,
  `resourceId` varchar(100) character set gb2312 NOT NULL default '',
  PRIMARY KEY  (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_re_role_resource` */

insert  into `auth_re_role_resource`(`roleId`,`resourceId`) values (1,'auth'),(1,'auth.change.password'),(1,'auth.organization'),(1,'auth.resource'),(1,'auth.role'),(1,'auth.user'),(1,'configuration'),(1,'configuration.dict'),(1,'configuration.table'),(1,'configuration.workflow.instance'),(1,'workflow'),(1,'xm.animal'),(1,'xm.animal.log'),(1,'xm.medication'),(1,'xm.medication.number'),(1,'xm.passing'),(1,'xm.passing.pass'),(1,'xm.quarantine'),(1,'xm.quarantine.area'),(1,'xm.quarantine.kill'),(1,'xm.quarantine.query'),(1,'xm.ready'),(1,'xm.ready.total'),(1,'xm.recall'),(1,'xm.recall.culture'),(1,'xm.recall.product'),(1,'xm.warning'),(1,'xm.warning.farmer'),(1,'xm.warning.total'),(2,'workstation'),(2,'workstation.done'),(2,'workstation.over'),(2,'workstation.tobe');

/*Table structure for table `auth_re_user_resource` */

DROP TABLE IF EXISTS `auth_re_user_resource`;

CREATE TABLE `auth_re_user_resource` (
  `userId` varchar(100) NOT NULL default '',
  `resourceId` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`userId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_re_user_resource` */

insert  into `auth_re_user_resource`(`userId`,`resourceId`) values ('1','auth'),('1','auth.organization'),('1','auth.reportData'),('1','auth.reportView'),('1','auth.resource'),('1','auth.role'),('1','auth.user'),('1','configuration'),('1','configuration.dict'),('1','test'),('admin','testWorkflow'),('rongzhan','auth.change.password'),('rongzhan','car'),('rongzhan','car.admin.bookcar'),('rongzhan','car.admin.newcar'),('rongzhan','website'),('rongzhan','website.editcontent');

/*Table structure for table `auth_re_user_role` */

DROP TABLE IF EXISTS `auth_re_user_role`;

CREATE TABLE `auth_re_user_role` (
  `userId` varchar(100) character set gb2312 NOT NULL default '',
  `roleId` int(100) NOT NULL,
  PRIMARY KEY  (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_re_user_role` */

insert  into `auth_re_user_role`(`userId`,`roleId`) values ('admin',1),('admin',2);

/*Table structure for table `auth_roles` */

DROP TABLE IF EXISTS `auth_roles`;

CREATE TABLE `auth_roles` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_roles` */

insert  into `auth_roles`(`id`,`name`,`description`) values (1,'超级管理员','拥有所有权限'),(2,'工作流','');

/*Table structure for table `auth_users` */

DROP TABLE IF EXISTS `auth_users`;

CREATE TABLE `auth_users` (
  `Id` varchar(100) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `email` varchar(100) default NULL,
  `phone` varchar(100) default NULL,
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `auth_users` */

insert  into `auth_users`(`Id`,`name`,`password`,`email`,`phone`) values ('admin','管理员','lueSGJZetyySpUndWjMBEg==','guyuzmq@gmail.com','18943630044'),('lisi','李四','lueSGJZetyySpUndWjMBEg==','11@11.11','13511111111'),('wangqian','王前','lueSGJZetyySpUndWjMBEg==','w@w.c','13596160570'),('zhangsan','张三','lueSGJZetyySpUndWjMBEg==','1111@11.11','13599999999');

/*Table structure for table `xm_farmer` */

DROP TABLE IF EXISTS `xm_farmer`;

CREATE TABLE `xm_farmer` (
  `id` bigint(20) NOT NULL auto_increment,
  `userId` varchar(100) default NULL,
  `userName` varchar(100) default NULL,
  `createTime` datetime default NULL,
  `opId` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `xm_farmer` */

insert  into `xm_farmer`(`id`,`userId`,`userName`,`createTime`,`opId`) values (1,'wangqian','王前','2012-04-02 15:39:33','1333352371860_wangqian'),(3,'wangqian','王前','2012-04-02 18:15:29','1333361729671_wangqian'),(9,'wangqian','王前','2012-04-03 07:55:47','1333410947140_wangqian'),(10,'wangqian','王前','2012-04-04 15:36:47','1333525007546_wangqian'),(11,'1010101','站点1','2012-04-14 18:37:13','1334399833188_1010101'),(12,'1010101','站点1','2012-04-14 20:53:45','1334408025752_1010101'),(13,'1010101','站点1','2012-04-14 20:58:48','1334408328717_1010101'),(14,'1010101','站点1','2012-04-14 21:39:53','1334410793237_1010101'),(15,'1010101','站点1','2012-04-14 21:44:51','1334411091109_1010101'),(16,'1010101','站点1','2012-04-14 22:00:58','1334412058053_1010101'),(17,'1010101','站点1','2012-04-15 09:19:47','1334452787215_1010101'),(18,'1010101','站点1','2012-04-15 09:22:55','1334452975809_1010101');

/*Table structure for table `xm_farmer_forage` */

DROP TABLE IF EXISTS `xm_farmer_forage`;

CREATE TABLE `xm_farmer_forage` (
  `id` bigint(20) NOT NULL auto_increment,
  `opId` varchar(100) default NULL,
  `type` varchar(20) default NULL,
  `num` int(11) default NULL,
  `price` varchar(20) default NULL,
  `total` varchar(20) default NULL,
  `userName` varchar(100) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `xm_farmer_forage` */

/*Table structure for table `xm_farmer_pig` */

DROP TABLE IF EXISTS `xm_farmer_pig`;

CREATE TABLE `xm_farmer_pig` (
  `id` bigint(20) NOT NULL auto_increment,
  `opId` varchar(100) default NULL,
  `opType` varchar(20) default NULL,
  `type` varchar(20) default NULL,
  `num` int(11) default NULL,
  `price` varchar(20) default NULL,
  `total` varchar(20) default NULL,
  `userName` varchar(100) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `xm_farmer_pig` */

insert  into `xm_farmer_pig`(`id`,`opId`,`opType`,`type`,`num`,`price`,`total`,`userName`,`createTime`) values (1,'1334410793237_1010101','新增','仔猪',2,'2','2','站点1','2012-04-14 21:39:53'),(2,'1334410793237_1010101','新增','育肥猪',2,'2','2','站点1','2012-04-14 21:39:53'),(3,'1334410793237_1010101','新增','能繁母猪',2,'2','2','站点1','2012-04-14 21:39:53'),(4,'1334410793237_1010101','新增','后备母猪',2,'2','2','站点1','2012-04-14 21:39:53'),(5,'1334411091109_1010101','检疫','仔猪',2,'','','站点1','2012-04-14 21:44:51'),(6,'1334411091109_1010101','检疫','育肥猪',2,'','','站点1','2012-04-14 21:44:51'),(7,'1334411091109_1010101','检疫','能繁母猪',2,'','','站点1','2012-04-14 21:44:51'),(8,'1334411091109_1010101','检疫','后备母猪',2,'','','站点1','2012-04-14 21:44:51'),(9,'1334412058053_1010101','卖出','仔猪',2,'2','2','站点1','2012-04-14 22:00:58'),(10,'1334412058053_1010101','卖出','育肥猪',2,'2','2','站点1','2012-04-14 22:00:58'),(11,'1334412058053_1010101','卖出','能繁母猪',2,'2','2','站点1','2012-04-14 22:00:58'),(12,'1334412058053_1010101','卖出','后备母猪',2,'2','2','站点1','2012-04-14 22:00:58'),(13,'1334412058053_1010101','死亡','仔猪',2,'','','站点1','2012-04-14 22:00:58'),(14,'1334412058053_1010101','死亡','育肥猪',2,'','','站点1','2012-04-14 22:00:58'),(15,'1334412058053_1010101','死亡','能繁母猪',2,'','','站点1','2012-04-14 22:00:58'),(16,'1334412058053_1010101','死亡','后备母猪',2,'','','站点1','2012-04-14 22:00:58'),(17,'1334412058053_1010101','淘汰','能繁母猪',2,'3','4','站点1','2012-04-14 22:00:58'),(18,'1334412058053_1010101','淘汰','后备母猪',2,'3','4','站点1','2012-04-14 22:00:58'),(19,'1334452787215_1010101','新增','仔猪',44,'44','44','站点1','2012-04-15 09:19:47'),(20,'1334452787215_1010101','检疫','出省境仔猪',1,'','','站点1','2012-04-15 09:19:47'),(21,'1334452787215_1010101','检疫','育肥猪',1,'','','站点1','2012-04-15 09:19:47'),(22,'1334452787215_1010101','检疫','省内仔猪',1,'','','站点1','2012-04-15 09:19:47'),(23,'1334452787215_1010101','检疫','省内育肥猪',1,'','','站点1','2012-04-15 09:19:47'),(24,'1334452787215_1010101','检疫','屠宰育肥猪',1,'','','站点1','2012-04-15 09:19:47'),(25,'1334452975809_1010101','新增','仔猪',44,'22','22','站点1','2012-04-15 09:22:55'),(26,'1334452975809_1010101','卖出','仔猪',333,'33','333','站点1','2012-04-15 09:22:55');

/*Table structure for table `xm_farmer_spend` */

DROP TABLE IF EXISTS `xm_farmer_spend`;

CREATE TABLE `xm_farmer_spend` (
  `id` bigint(20) NOT NULL auto_increment,
  `opId` varchar(100) default NULL,
  `type` varchar(20) default NULL,
  `price` varchar(20) default NULL,
  `userName` varchar(100) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

/*Data for the table `xm_farmer_spend` */

insert  into `xm_farmer_spend`(`id`,`opId`,`type`,`price`,`userName`,`createTime`) values (1,'1334452787215_1010101','人员工资','44','站点1','2012-04-15 09:19:47'),(2,'1334452787215_1010101','疫苗、治疗、劁猪费','44','站点1','2012-04-15 09:19:47'),(3,'1334452787215_1010101','水、电、燃料费','44','站点1','2012-04-15 09:19:47');

/*Table structure for table `xm_medication` */

DROP TABLE IF EXISTS `xm_medication`;

CREATE TABLE `xm_medication` (
  `id` bigint(20) NOT NULL auto_increment,
  `number` varchar(100) default NULL,
  `title` varchar(100) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; InnoDB free: 6144 kB';

/*Data for the table `xm_medication` */

insert  into `xm_medication`(`id`,`number`,`title`,`createTime`) values (3,'2012040401','兽药字2012040401批','2012-04-04 14:37:43');

/*Table structure for table `xm_passing` */

DROP TABLE IF EXISTS `xm_passing`;

CREATE TABLE `xm_passing` (
  `id` bigint(20) NOT NULL auto_increment,
  `station` varchar(100) default NULL,
  `card` varchar(100) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; InnoDB free: 6144 kB';

/*Data for the table `xm_passing` */

insert  into `xm_passing`(`id`,`station`,`card`,`createTime`) values (55,'000B','E2009027671701402540152C','2012-04-16 10:53:05'),(56,'000B','E2009027671701402540152C','2012-04-16 10:53:08'),(57,'000B','E2009027671701402540152C','2012-04-16 10:53:09'),(58,'000B','E2009027671701402540152C','2012-04-16 10:53:13'),(59,'000B','E2009027671701402540152C','2012-04-16 10:53:15'),(60,'000B','E2009027671701402540152C','2012-04-16 10:53:21'),(61,'000B','E2009027671701402540152C','2012-04-16 10:53:22'),(62,'000B','E2009027671701402540152C','2012-04-16 10:53:41'),(63,'000B','E2009027671701402540152C','2012-04-16 10:53:47'),(64,'000B','E2009027671701402540152C','2012-04-16 10:54:09'),(65,'000B','E2009027671701402540152C','2012-04-16 10:54:10'),(66,'000B','E2009027671701402540152C','2012-04-16 10:54:12'),(67,'000B','E2009027671701402540152C','2012-04-16 10:54:14'),(68,'000B','E2009027671701402540152C','2012-04-16 10:54:16'),(69,'000B','E2009027671701402540152C','2012-04-16 10:54:19'),(70,'000B','E2009027671701402540152C','2012-04-16 10:54:20'),(71,'000B','E2009027671701402540152C','2012-04-16 10:54:22'),(72,'000B','E2009027671701402540152C','2012-04-16 10:54:24'),(73,'000B','E2009027671701402540152C','2012-04-16 10:54:26'),(74,'000B','E2009027671701402540152C','2012-04-16 10:54:28'),(75,'000B','E2009027671701402540152C','2012-04-16 10:54:29'),(76,'000B','E2009027671701402540152C','2012-04-16 10:54:32'),(77,'000B','E2009027671701402540152C','2012-04-16 10:54:34'),(78,'000B','E2009027671701402540152C','2012-04-16 10:54:35'),(79,'000B','E2009027671701402540152C','2012-04-16 10:54:36'),(80,'000B','E2009027671701402540152C','2012-04-16 10:54:37'),(81,'000B','E2009027671701402540152C','2012-04-16 10:54:39'),(82,'000B','E2009027671701402540152C','2012-04-16 10:54:41'),(83,'000B','E2009027671701402540152C','2012-04-16 10:54:43'),(84,'000B','E2009027671701402540152C','2012-04-16 10:54:45'),(95,'000B','E2009027671701402540152C','2012-04-16 11:10:04'),(96,'000B','E2009027671701402540152C','2012-04-16 11:10:06'),(97,'000B','E2009027671701402540152C','2012-04-16 11:10:07'),(98,'000B','E2009027671701402540152C','2012-04-16 11:10:08'),(99,'000B','E2009027671701402540152C','2012-04-16 11:10:09'),(100,'000B','E2009027671701402540152C','2012-04-16 11:10:36'),(101,'000B','E2009027671701402540152C','2012-04-16 11:10:38'),(102,'000B','E2009027671701402540152C','2012-04-16 11:10:43'),(103,'000B','E2009027671701402540152C','2012-04-16 11:10:58'),(104,'000B','E2009027671701402540152C','2012-04-16 11:10:59'),(105,'000B','E2009027671701402540152C','2012-04-16 11:11:01'),(106,'000B','E2009027671701402540152C','2012-04-16 11:11:03'),(107,'000B','E2009027671701402540152C','2012-04-16 11:11:07'),(108,'000B','E2009027671701402540152C','2012-04-16 11:11:08'),(109,'000B','E2009027671701402540152C','2012-04-16 11:11:10'),(110,'000B','E2009027671701402540152C','2012-04-16 11:11:14'),(111,'000B','E2009027671701402540152C','2012-04-16 11:11:16'),(112,'000B','E2009027671701402540152C','2012-04-16 11:11:44'),(113,'000B','E2009027671701402540152C','2012-04-16 11:11:45'),(114,'000B','E2009027671701402540152C','2012-04-16 11:11:59'),(115,'000B','E2009027671701402540152C','2012-04-16 11:12:04'),(116,'000B','E2009027671701402540152C','2012-04-16 11:16:47'),(117,'000B','E2009027671701402540152C','2012-04-16 11:19:53'),(118,'000B','E2009027671701402540152C','2012-04-16 11:21:42'),(119,'000B','E2009027671701402540152C','2012-04-16 11:21:44'),(120,'000B','E2009027671701402540152C','2012-04-16 11:21:46'),(121,'000B','E2009027671701402540152C','2012-04-16 11:21:48'),(122,'000B','E2009027671701402540152C','2012-04-16 11:21:50'),(123,'000B','E2009027671701402540152C','2012-04-16 11:21:53'),(124,'000B','E2009027671701402540152C','2012-04-16 11:21:54'),(125,'000B','E2009027671701402540152C','2012-04-16 11:21:55'),(126,'000B','E2009027671701402540152C','2012-04-16 11:21:56'),(127,'000B','E2009027671701402540152C','2012-04-16 11:21:58'),(128,'000B','E2009027671701402540152C','2012-04-16 11:22:00'),(129,'000B','E2009027671701402540152C','2012-04-16 11:22:02'),(130,'000B','E2009027671701402540152C','2012-04-16 11:22:04'),(131,'000B','E2009027671701402540152C','2012-04-16 11:22:06'),(132,'000B','E2009027671701402540152C','2012-04-16 11:22:08'),(133,'000B','E2009027671701402540152C','2012-04-16 11:22:09'),(134,'000B','E2009027671701402540152C','2012-04-16 11:22:10'),(135,'000B','E2009027671701402540152C','2012-04-16 11:22:17'),(136,'000B','E2009027671701402540152C','2012-04-16 11:22:19'),(137,'000B','E2009027671701402540152C','2012-04-16 11:22:20'),(138,'000B','E2009027671701402540152C','2012-04-16 11:22:22'),(139,'000B','E2009027671701402540152C','2012-04-16 11:22:26'),(140,'000B','E2009027671701402540152C','2012-04-16 11:22:27'),(141,'000B','E2009027671701402540152C','2012-04-16 11:22:28'),(142,'000B','E2009027671701402540152C','2012-04-16 11:22:29'),(143,'000B','E2009027671701402540152C','2012-04-16 11:22:31'),(144,'000B','E2009027671701402540152C','2012-04-16 11:22:33'),(145,'000B','E2009027671701402540152C','2012-04-16 11:22:35'),(146,'000B','E2009027671701402540152C','2012-04-16 11:22:36'),(147,'000B','E2009027671701402540152C','2012-04-16 11:22:38'),(148,'000B','E2009027671701402540152C','2012-04-16 11:22:40'),(149,'000B','E2009027671701402540152C','2012-04-16 11:22:41'),(150,'000B','E2009027671701402540152C','2012-04-16 11:22:44'),(151,'000B','E2009027671701402540152C','2012-04-16 11:22:45'),(152,'000B','E2009027671701402540152C','2012-04-16 11:22:47'),(153,'000B','E2009027671701402540152C','2012-04-16 11:22:49'),(154,'000B','E2009027671701402540152C','2012-04-16 11:23:00'),(155,'000B','E2009027671701402540152C','2012-04-16 11:26:04'),(156,'000B','E2009027671701402540152C','2012-04-16 11:26:09'),(157,'000B','E2009027671701402540152C','2012-04-16 11:27:03'),(158,'000B','E2009027671701402540152C','2012-04-16 11:27:07'),(159,'000B','E2009027671701402540152C','2012-04-16 11:27:18'),(160,'000B','E2009027671701402540152C','2012-04-16 11:27:19'),(161,'000B','E2009027671701402540152C','2012-04-16 11:27:26'),(162,'000B','E2009027671701402540152C','2012-04-16 11:27:29'),(163,'000B','E2009027671701402540152C','2012-04-16 11:27:30'),(164,'000B','E2009027671701402540152C','2012-04-16 11:27:32'),(165,'000B','E2009027671701402540152C','2012-04-16 11:27:34'),(166,'000B','E2009027671701402540152C','2012-04-16 11:27:37'),(167,'000B','E2009027671701402540152C','2012-04-16 11:27:39'),(168,'000B','E2009027671701402540152C','2012-04-16 11:27:40'),(169,'000B','E2009027671701442540153C','2012-04-16 11:27:51'),(170,'000B','10F43A00DDD906C000000000','2012-04-18 09:47:21'),(171,'000B','10F43A00DDD906C000000000','2012-04-18 09:47:22'),(172,'000B','E200902767170179254015C8','2012-04-18 09:47:53'),(173,'000B','E200902767170179254015C8','2012-04-18 09:47:57'),(174,'000B','E200902767170179254015C8','2012-04-18 09:47:59'),(175,'000B','E200902767170179254015C8','2012-04-18 09:48:02'),(176,'000B','E200902767170179254015C8','2012-04-18 09:48:24'),(177,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:29'),(178,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:31'),(179,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:32'),(180,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:34'),(181,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:36'),(182,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:38'),(183,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:39'),(184,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:41'),(185,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:42'),(186,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:43'),(187,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:44'),(188,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:45'),(189,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:46'),(190,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:47'),(191,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:48'),(192,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:49'),(193,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:50'),(194,'000B','10F43A00DDD906C000000000','2012-04-18 09:48:51'),(195,'000B','E200902767170179254015C8','2012-04-18 09:49:08'),(196,'000B','E200902767170179254015C8','2012-04-18 09:49:13'),(197,'000B','E200902767170179254015C8','2012-04-18 09:49:15'),(198,'000B','E200902767170179254015C8','2012-04-18 09:49:17'),(199,'000B','E200902767170179254015C8','2012-04-18 09:49:19'),(200,'000B','E200902767170179254015C8','2012-04-18 09:49:21'),(201,'000B','E200902767170177254015C0','2012-04-18 09:49:38'),(202,'000B','E200902767170177254015C0','2012-04-18 09:49:39'),(203,'000B','E200902767170177254015C0','2012-04-18 09:49:41'),(204,'000B','E200902767170177254015C0','2012-04-18 09:49:42'),(205,'000B','E200902767170177254015C0','2012-04-18 09:49:43'),(206,'000B','E200902767170177254015C0','2012-04-18 09:49:44'),(207,'000B','E200902767170177254015C0','2012-04-18 09:49:46'),(208,'000B','E200902767170177254015C0','2012-04-18 09:49:50'),(209,'000B','E200902767170177254015C0','2012-04-18 09:49:51'),(210,'000B','E200902767170177254015C0','2012-04-18 09:50:00'),(211,'000B','E200902767170177254015C0','2012-04-18 09:50:01'),(212,'000B','10F43A00DDD906C000000000','2012-04-18 09:50:11'),(213,'000B','E200902767170179254015C8','2012-04-18 09:50:19'),(214,'000B','E200902767170179254015C8','2012-04-18 09:50:20'),(215,'000B','E200902767170179254015C8','2012-04-18 09:50:21'),(216,'000B','E200902767170179254015C8','2012-04-18 09:50:22'),(217,'000B','E200902767170179254015C8','2012-04-18 09:50:23'),(218,'000B','E200902767170179254015C8','2012-04-18 09:50:24'),(219,'000B','E200902767170179254015C8','2012-04-18 09:50:25'),(220,'000B','E200902767170179254015C8','2012-04-18 09:50:26'),(221,'000B','E200902767170179254015C8','2012-04-18 09:50:27'),(222,'000B','E200902767170179254015C8','2012-04-18 09:50:29'),(223,'000B','E200902767170179254015C8','2012-04-18 09:50:30'),(224,'000B','E200902767170179254015C8','2012-04-18 09:50:31'),(225,'000B','E200902767170179254015C8','2012-04-18 09:50:32'),(226,'000B','E200902767170179254015C8','2012-04-18 09:50:34'),(227,'000B','E200902767170179254015C8','2012-04-18 09:50:35'),(228,'000B','E200902767170179254015C8','2012-04-18 09:50:36'),(229,'000B','E200902767170179254015C8','2012-04-18 09:50:37'),(230,'000B','E200902767170179254015C8','2012-04-18 09:50:38'),(231,'000B','E200902767170179254015C8','2012-04-18 09:50:39'),(232,'000B','E200902767170179254015C8','2012-04-18 09:50:40'),(233,'000B','E200902767170179254015C8','2012-04-18 09:50:41'),(234,'000B','E200902767170179254015C8','2012-04-18 09:50:42'),(235,'000B','E200902767170179254015C8','2012-04-18 09:50:43'),(236,'000B','E200902767170179254015C8','2012-04-18 09:50:44'),(237,'000B','E200902767170179254015C8','2012-04-18 09:50:45'),(238,'000B','E200902767170179254015C8','2012-04-18 09:50:46'),(239,'000B','E200902767170179254015C8','2012-04-18 09:50:47'),(240,'000B','E200902767170179254015C8','2012-04-18 09:50:48'),(241,'000B','E200902767170179254015C8','2012-04-18 09:50:50'),(242,'000B','E200902767170179254015C8','2012-04-18 09:50:51'),(243,'000B','E200902767170177254015C0','2012-04-18 09:50:51'),(244,'000B','E200902767170177254015C0','2012-04-18 09:50:55'),(245,'000B','E200902767170179254015C8','2012-04-18 09:50:57'),(246,'000B','E200902767170179254015C8','2012-04-18 09:50:58'),(247,'000B','E200902767170177254015C0','2012-04-18 09:50:59'),(248,'000B','E200902767170179254015C8','2012-04-18 09:51:01'),(249,'000B','E200902767170179254015C8','2012-04-18 09:51:03'),(250,'000B','E200902767170179254015C8','2012-04-18 09:51:13'),(251,'000B','E200902767170179254015C8','2012-04-18 09:51:15'),(252,'000B','E200902767170179254015C8','2012-04-18 09:51:18'),(253,'000B','E200902767170177254015C0','2012-04-18 09:51:35'),(254,'000B','E200902767170179254015C8','2012-04-18 09:51:40'),(255,'000B','000100130014000100002203','2012-04-18 09:51:40'),(256,'000B','000100130014000100002203','2012-04-18 09:51:44'),(257,'000B','000100130014000100002203','2012-04-18 09:51:46'),(258,'000B','000100130014000100002203','2012-04-18 09:51:48'),(259,'000B','E200902767170179254015C8','2012-04-18 09:51:51'),(260,'000B','E200902767170179254015C8','2012-04-18 09:56:40'),(261,'000B','E200902767170179254015C8','2012-04-18 09:56:41'),(262,'000B','E200902767170179254015C8','2012-04-18 09:56:42'),(263,'000B','E200902767170179254015C8','2012-04-18 09:56:44'),(264,'000B','E200902767170179254015C8','2012-04-18 09:56:49'),(265,'000B','E200902767170179254015C8','2012-04-18 10:00:25'),(266,'000B','E200902767170179254015C8','2012-04-18 10:00:39'),(267,'000B','E200902767170179254015C8','2012-04-18 10:00:59'),(268,'000B','E200902767170179254015C8','2012-04-18 10:01:02'),(269,'000B','E200902767170179254015C8','2012-04-18 10:01:04'),(270,'000B','E200902767170179254015C8','2012-04-18 10:01:08'),(271,'000B','E200902767170179254015C8','2012-04-18 10:01:26'),(272,'000B','E200902767170179254015C8','2012-04-18 10:01:28'),(273,'000B','E200902767170179254015C8','2012-04-18 10:01:37'),(274,'000B','E200902767170179254015C8','2012-04-18 10:01:38'),(275,'000B','E200902767170179254015C8','2012-04-18 10:01:40'),(276,'000B','E200902767170179254015C8','2012-04-18 10:01:42'),(277,'000B','E200902767170179254015C8','2012-04-18 10:01:44'),(278,'000B','E200902767170179254015C8','2012-04-18 10:01:48'),(279,'000B','E200902767170179254015C8','2012-04-18 10:01:50'),(280,'000B','E200902767170179254015C8','2012-04-18 10:01:51'),(281,'000B','E200902767170179254015C8','2012-04-18 10:01:53'),(282,'000B','E200902767170179254015C8','2012-04-18 10:01:55'),(283,'000B','E200902767170179254015C8','2012-04-18 10:01:57'),(284,'000B','E200902767170179254015C8','2012-04-18 10:02:03'),(285,'000B','E200902767170179254015C8','2012-04-18 10:02:05'),(286,'000B','E200902767170179254015C8','2012-04-18 10:02:06'),(287,'000B','E200902767170179254015C8','2012-04-18 10:02:07'),(288,'000B','E200902767170179254015C8','2012-04-18 10:02:09'),(289,'000B','E200902767170179254015C8','2012-04-18 10:02:11'),(290,'000B','E200902767170179254015C8','2012-04-18 10:02:13'),(291,'000B','E200902767170179254015C8','2012-04-18 10:02:15'),(292,'000B','E200902767170179254015C8','2012-04-18 10:02:16'),(293,'000B','E200902767170179254015C8','2012-04-18 10:02:20'),(294,'000B','E200902767170179254015C8','2012-04-18 10:02:23'),(295,'000B','E200902767170179254015C8','2012-04-18 10:02:30'),(296,'000B','E200902767170179254015C8','2012-04-18 10:02:32'),(297,'000B','E200902767170179254015C8','2012-04-18 10:02:34'),(298,'000B','E200902767170179254015C8','2012-04-18 10:02:35'),(299,'000B','E200902767170179254015C8','2012-04-18 10:02:37'),(300,'000B','E200902767170179254015C8','2012-04-18 10:02:38'),(301,'000B','E200902767170179254015C8','2012-04-18 10:02:40'),(302,'000B','E200902767170179254015C8','2012-04-18 10:02:42'),(303,'000B','E200902767170179254015C8','2012-04-18 10:02:44'),(304,'000B','E200902767170179254015C8','2012-04-18 10:02:51'),(305,'000B','E200902767170179254015C8','2012-04-18 10:02:53'),(306,'000B','E200902767170179254015C8','2012-04-18 10:02:54'),(307,'000B','E200902767170179254015C8','2012-04-18 10:02:56'),(308,'000B','E200902767170179254015C8','2012-04-18 10:02:58'),(309,'000B','E200902767170179254015C8','2012-04-18 10:03:00'),(310,'000B','E200902767170179254015C8','2012-04-18 10:03:02'),(311,'000B','E200902767170179254015C8','2012-04-18 10:03:06'),(312,'000B','E200902767170179254015C8','2012-04-18 10:03:08'),(313,'000B','E200902767170179254015C8','2012-04-18 10:03:09'),(314,'000B','E200902767170179254015C8','2012-04-18 10:03:11'),(315,'000B','E200902767170179254015C8','2012-04-18 10:03:13'),(316,'000B','E200902767170179254015C8','2012-04-18 10:03:15'),(317,'000B','E200902767170179254015C8','2012-04-18 10:03:17'),(318,'000B','E200902767170179254015C8','2012-04-18 10:03:19'),(319,'000B','E200902767170179254015C8','2012-04-18 10:03:22'),(320,'000B','E200902767170179254015C8','2012-04-18 10:03:24'),(321,'000B','E200902767170179254015C8','2012-04-18 10:03:26'),(322,'000B','E200902767170179254015C8','2012-04-18 10:03:29'),(323,'000B','E200902767170179254015C8','2012-04-18 10:03:31'),(324,'000B','E200902767170179254015C8','2012-04-18 10:03:33'),(325,'000B','E200902767170179254015C8','2012-04-18 10:03:34'),(326,'000B','E200902767170179254015C8','2012-04-18 10:03:35'),(327,'000B','E200902767170179254015C8','2012-04-18 10:03:37'),(328,'000B','E200902767170179254015C8','2012-04-18 10:03:39'),(329,'000B','E200902767170179254015C8','2012-04-18 10:03:41'),(330,'000B','E200902767170179254015C8','2012-04-18 10:03:43'),(331,'000B','E200902767170179254015C8','2012-04-18 10:03:44'),(332,'000B','E200902767170179254015C8','2012-04-18 10:03:46'),(333,'000B','E200902767170179254015C8','2012-04-18 10:03:50'),(334,'000B','E200902767170179254015C8','2012-04-18 10:03:52'),(335,'000B','E200902767170179254015C8','2012-04-18 10:03:54'),(336,'000B','E200902767170179254015C8','2012-04-18 10:03:55'),(337,'000B','E200902767170179254015C8','2012-04-18 10:03:57'),(338,'000B','E200902767170179254015C8','2012-04-18 10:03:59'),(339,'000B','E200902767170179254015C8','2012-04-18 10:04:01'),(340,'000B','E200902767170179254015C8','2012-04-18 10:04:08'),(341,'000B','E200902767170179254015C8','2012-04-18 10:04:10'),(342,'000B','E200902767170179254015C8','2012-04-18 10:04:14'),(343,'000B','E200902767170179254015C8','2012-04-18 10:04:21'),(344,'000B','E200902767170179254015C8','2012-04-18 10:04:23'),(345,'000B','E200902767170179254015C8','2012-04-18 10:04:25'),(346,'000B','E200902767170179254015C8','2012-04-18 10:04:30'),(347,'000B','E200902767170179254015C8','2012-04-18 10:04:32'),(348,'000B','E200902767170179254015C8','2012-04-18 10:04:41'),(349,'000B','E200902767170179254015C8','2012-04-18 10:04:43'),(350,'000B','E200902767170179254015C8','2012-04-18 10:04:56'),(351,'000B','E200902767170179254015C8','2012-04-18 10:04:57'),(352,'000B','E200902767170179254015C8','2012-04-18 10:04:59'),(353,'000B','E200902767170179254015C8','2012-04-18 10:05:01'),(354,'000B','E200902767170179254015C8','2012-04-18 10:05:03'),(355,'000B','E200902767170179254015C8','2012-04-18 10:05:05'),(356,'000B','E200902767170179254015C8','2012-04-18 10:05:07'),(357,'000B','E200902767170179254015C8','2012-04-18 10:05:10'),(358,'000B','E200902767170179254015C8','2012-04-18 10:05:12'),(359,'000B','E200902767170179254015C8','2012-04-18 10:05:14'),(360,'000B','E200902767170179254015C8','2012-04-18 10:05:16'),(361,'000B','E200902767170179254015C8','2012-04-18 10:05:18'),(362,'000B','E200902767170179254015C8','2012-04-18 10:05:20'),(363,'000B','E200902767170179254015C8','2012-04-18 10:05:22'),(364,'000B','E200902767170179254015C8','2012-04-18 10:05:23'),(365,'000B','E200902767170179254015C8','2012-04-18 10:05:25'),(366,'000B','E200902767170179254015C8','2012-04-18 10:05:27'),(367,'000B','E200902767170179254015C8','2012-04-18 10:05:29'),(368,'000B','E200902767170179254015C8','2012-04-18 10:05:32'),(369,'000B','E200902767170179254015C8','2012-04-18 10:05:34'),(370,'000B','E200902767170179254015C8','2012-04-18 10:05:35'),(371,'000B','E200902767170179254015C8','2012-04-18 10:05:40'),(372,'000B','E200902767170179254015C8','2012-04-18 10:05:47'),(373,'000B','E200902767170179254015C8','2012-04-18 10:05:49'),(374,'000B','E200902767170179254015C8','2012-04-18 10:05:51'),(375,'000B','E200902767170179254015C8','2012-04-18 10:05:53'),(376,'000B','E200902767170179254015C8','2012-04-18 10:05:55'),(377,'000B','E200902767170179254015C8','2012-04-18 10:05:57'),(378,'000B','E200902767170179254015C8','2012-04-18 10:05:59'),(379,'000B','E200902767170179254015C8','2012-04-18 10:06:04'),(380,'000B','E200902767170179254015C8','2012-04-18 10:06:06'),(381,'000B','E200902767170179254015C8','2012-04-18 10:06:08'),(382,'000B','E200902767170179254015C8','2012-04-18 10:06:10'),(383,'000B','E200902767170179254015C8','2012-04-18 10:06:11'),(384,'000B','E200902767170179254015C8','2012-04-18 10:06:12'),(385,'000B','E200902767170179254015C8','2012-04-18 10:06:16'),(386,'000B','E200902767170179254015C8','2012-04-18 10:06:21'),(387,'000B','E200902767170179254015C8','2012-04-18 10:06:23'),(388,'000B','E200902767170179254015C8','2012-04-18 10:06:25'),(389,'000B','E200902767170179254015C8','2012-04-18 10:06:27'),(390,'000B','E200902767170179254015C8','2012-04-18 10:06:28'),(391,'000B','E200902767170179254015C8','2012-04-18 10:06:30'),(392,'000B','E200902767170179254015C8','2012-04-18 10:06:34'),(393,'000B','E200902767170179254015C8','2012-04-18 10:06:36'),(394,'000B','E200902767170179254015C8','2012-04-18 10:06:38'),(395,'000B','E200902767170179254015C8','2012-04-18 10:06:40'),(396,'000B','E200902767170179254015C8','2012-04-18 10:06:41'),(397,'000B','E200902767170179254015C8','2012-04-18 10:06:43'),(398,'000B','E200902767170179254015C8','2012-04-18 10:06:45'),(399,'000B','E200902767170179254015C8','2012-04-18 10:06:52'),(400,'000B','E200902767170179254015C8','2012-04-18 10:06:54'),(401,'000B','E200902767170179254015C8','2012-04-18 10:06:56'),(402,'000B','E200902767170179254015C8','2012-04-18 10:06:58'),(403,'000B','E200902767170179254015C8','2012-04-18 10:07:01'),(404,'000B','E200902767170179254015C8','2012-04-18 10:07:02'),(405,'000B','E200902767170179254015C8','2012-04-18 10:07:04'),(406,'000B','E200902767170179254015C8','2012-04-18 10:07:08'),(407,'000B','E200902767170179254015C8','2012-04-18 10:07:10'),(408,'000B','E200902767170179254015C8','2012-04-18 10:07:13'),(409,'000B','E200902767170179254015C8','2012-04-18 10:07:14'),(410,'000B','E200902767170179254015C8','2012-04-18 10:07:16'),(411,'000B','E200902767170179254015C8','2012-04-18 10:07:19'),(412,'000B','E200902767170179254015C8','2012-04-18 10:07:21'),(413,'000B','E200902767170179254015C8','2012-04-18 10:07:23'),(414,'000B','E200902767170179254015C8','2012-04-18 10:07:24'),(415,'000B','E200902767170179254015C8','2012-04-18 10:07:27'),(416,'000B','E200902767170179254015C8','2012-04-18 10:07:28'),(417,'000B','E200902767170179254015C8','2012-04-18 10:07:32'),(418,'000B','E200902767170179254015C8','2012-04-18 10:07:33'),(419,'000B','E200902767170179254015C8','2012-04-18 10:07:35'),(420,'000B','E200902767170179254015C8','2012-04-18 10:07:36'),(421,'000B','E200902767170179254015C8','2012-04-18 10:07:39'),(422,'000B','E200902767170179254015C8','2012-04-18 10:07:40'),(423,'000B','E200902767170179254015C8','2012-04-18 10:07:42'),(424,'000B','E200902767170179254015C8','2012-04-18 10:07:44'),(425,'000B','E200902767170179254015C8','2012-04-18 10:07:48'),(426,'000B','E200902767170179254015C8','2012-04-18 10:07:52'),(427,'000B','E200902767170179254015C8','2012-04-18 10:07:57'),(428,'000B','E200902767170179254015C8','2012-04-18 10:08:01'),(429,'000B','E200902767170179254015C8','2012-04-18 10:08:10'),(430,'000B','E200902767170179254015C8','2012-04-18 10:08:12'),(431,'000B','E200902767170179254015C8','2012-04-18 10:08:17'),(432,'000B','E200902767170179254015C8','2012-04-18 10:08:21'),(433,'000B','E200902767170179254015C8','2012-04-18 10:08:23'),(434,'000B','E200902767170179254015C8','2012-04-18 10:08:25'),(435,'000B','E200902767170179254015C8','2012-04-18 10:08:26'),(436,'000B','E200902767170179254015C8','2012-04-18 10:08:28'),(437,'000B','E200902767170179254015C8','2012-04-18 10:08:31'),(438,'000B','E200902767170179254015C8','2012-04-18 10:08:32'),(439,'000B','E200902767170179254015C8','2012-04-18 10:08:36'),(440,'000B','E200902767170179254015C8','2012-04-18 10:08:39'),(441,'000B','E200902767170179254015C8','2012-04-18 10:08:41'),(442,'000B','E200902767170179254015C8','2012-04-18 10:08:43'),(443,'000B','E200902767170179254015C8','2012-04-18 10:08:45'),(444,'000B','E200902767170179254015C8','2012-04-18 10:08:47'),(445,'000B','E200902767170179254015C8','2012-04-18 10:08:49'),(446,'000B','E200902767170179254015C8','2012-04-18 10:08:50'),(447,'000B','E200902767170179254015C8','2012-04-18 10:08:52'),(448,'000B','E200902767170179254015C8','2012-04-18 10:08:54'),(449,'000B','E200902767170179254015C8','2012-04-18 10:08:56'),(450,'000B','E200902767170179254015C8','2012-04-18 10:08:58'),(451,'000B','E200902767170179254015C8','2012-04-18 10:09:00'),(452,'000B','E200902767170179254015C8','2012-04-18 10:09:01'),(453,'000B','E200902767170179254015C8','2012-04-18 10:09:03'),(454,'000B','E200902767170179254015C8','2012-04-18 10:09:05'),(455,'000B','E200902767170179254015C8','2012-04-18 10:09:06'),(456,'000B','E200902767170179254015C8','2012-04-18 10:09:15'),(457,'000B','E200902767170179254015C8','2012-04-18 10:09:17'),(458,'000B','E200902767170179254015C8','2012-04-18 10:09:19'),(459,'000B','E200902767170179254015C8','2012-04-18 10:09:21'),(460,'000B','E200902767170179254015C8','2012-04-18 10:09:22'),(461,'000B','E200902767170179254015C8','2012-04-18 10:09:25'),(462,'000B','E200902767170179254015C8','2012-04-18 10:09:27'),(463,'000B','E200902767170179254015C8','2012-04-18 10:09:28'),(464,'000B','E200902767170179254015C8','2012-04-18 10:09:30'),(465,'000B','E200902767170179254015C8','2012-04-18 10:09:31'),(466,'000B','E200902767170179254015C8','2012-04-18 10:09:33'),(467,'000B','E200902767170179254015C8','2012-04-18 10:09:35'),(468,'000B','E200902767170179254015C8','2012-04-18 10:09:37'),(469,'000B','E200902767170179254015C8','2012-04-18 10:09:39'),(470,'000B','E200902767170179254015C8','2012-04-18 10:09:41'),(471,'000B','E200902767170179254015C8','2012-04-18 10:09:43'),(472,'000B','E200902767170179254015C8','2012-04-18 10:09:45'),(473,'000B','E200902767170179254015C8','2012-04-18 10:09:47'),(474,'000B','E200902767170179254015C8','2012-04-18 10:09:49'),(475,'000B','E200902767170179254015C8','2012-04-18 10:09:51'),(476,'000B','E200902767170179254015C8','2012-04-18 10:09:53'),(477,'000B','E200902767170179254015C8','2012-04-18 10:09:55'),(478,'000B','E200902767170179254015C8','2012-04-18 10:09:57'),(479,'000B','E200902767170179254015C8','2012-04-18 10:09:59'),(480,'000B','E200902767170179254015C8','2012-04-18 10:10:01'),(481,'000B','E200902767170179254015C8','2012-04-18 10:10:03'),(482,'000B','E200902767170179254015C8','2012-04-18 10:10:05'),(483,'000B','E200902767170179254015C8','2012-04-18 10:10:07'),(484,'000B','E200902767170179254015C8','2012-04-18 10:10:08'),(485,'000B','E200902767170179254015C8','2012-04-18 10:10:11'),(486,'000B','E200902767170179254015C8','2012-04-18 10:10:13'),(487,'000B','E200902767170179254015C8','2012-04-18 10:10:15'),(488,'000B','E200902767170179254015C8','2012-04-18 10:10:17'),(489,'000B','E200902767170179254015C8','2012-04-18 10:10:19'),(490,'000B','E200902767170179254015C8','2012-04-18 10:10:20'),(491,'000B','E200902767170179254015C8','2012-04-18 10:10:22'),(492,'000B','E200902767170179254015C8','2012-04-18 10:10:25'),(493,'000B','E200902767170179254015C8','2012-04-18 10:10:27'),(494,'000B','E200902767170179254015C8','2012-04-18 10:10:30'),(495,'000B','E200902767170179254015C8','2012-04-18 10:10:33'),(496,'000B','E200902767170179254015C8','2012-04-18 10:10:34'),(497,'000B','E200902767170179254015C8','2012-04-18 10:10:37'),(498,'000B','E200902767170179254015C8','2012-04-18 10:10:51'),(499,'000B','E200902767170179254015C8','2012-04-18 10:10:53'),(500,'000B','E200902767170179254015C8','2012-04-18 10:10:55'),(501,'000B','E200902767170179254015C8','2012-04-18 10:10:56'),(502,'000B','E200902767170179254015C8','2012-04-18 10:10:57'),(503,'000B','E200902767170179254015C8','2012-04-18 10:11:06'),(504,'000B','E200902767170179254015C8','2012-04-18 10:11:08'),(505,'000B','E200902767170179254015C8','2012-04-18 10:11:10'),(506,'000B','E200902767170179254015C8','2012-04-18 10:11:23'),(507,'000B','E200902767170179254015C8','2012-04-18 10:11:25'),(508,'000B','E200902767170179254015C8','2012-04-18 10:11:27'),(509,'000B','E200902767170179254015C8','2012-04-18 10:11:43'),(510,'000B','E200902767170179254015C8','2012-04-18 10:11:45'),(511,'000B','E200902767170179254015C8','2012-04-18 10:11:46'),(512,'000B','E200902767170179254015C8','2012-04-18 10:11:48'),(513,'000B','E200902767170179254015C8','2012-04-18 10:11:50'),(514,'000B','E200902767170179254015C8','2012-04-18 10:11:52'),(515,'000B','E200902767170179254015C8','2012-04-18 10:11:54'),(516,'000B','E200902767170179254015C8','2012-04-18 10:11:57'),(517,'000B','E200902767170179254015C8','2012-04-18 10:11:59'),(518,'000B','E200902767170179254015C8','2012-04-18 10:12:03'),(519,'000B','E200902767170179254015C8','2012-04-18 10:12:05'),(520,'000B','E200902767170179254015C8','2012-04-18 10:12:07'),(521,'000B','E200902767170179254015C8','2012-04-18 10:12:09'),(522,'000B','E200902767170179254015C8','2012-04-18 10:12:11'),(523,'000B','E200902767170179254015C8','2012-04-18 10:12:15'),(524,'000B','E200902767170179254015C8','2012-04-18 10:12:16'),(525,'000B','E200902767170179254015C8','2012-04-18 10:12:18'),(526,'000B','E200902767170179254015C8','2012-04-18 10:12:20'),(527,'000B','E200902767170179254015C8','2012-04-18 10:12:24'),(528,'000B','E200902767170179254015C8','2012-04-18 10:12:26'),(529,'000B','E200902767170179254015C8','2012-04-18 10:12:27'),(530,'000B','E200902767170179254015C8','2012-04-18 10:12:29'),(531,'000B','E200902767170179254015C8','2012-04-18 10:12:31'),(532,'000B','E200902767170179254015C8','2012-04-18 10:12:33'),(533,'000B','E200902767170179254015C8','2012-04-18 10:12:35'),(534,'000B','E200902767170179254015C8','2012-04-18 10:12:37'),(535,'000B','E200902767170179254015C8','2012-04-18 10:12:39'),(536,'000B','E200902767170179254015C8','2012-04-18 10:12:41'),(537,'000B','E200902767170179254015C8','2012-04-18 10:12:43'),(538,'000B','E200902767170179254015C8','2012-04-18 10:12:44'),(539,'000B','E200902767170179254015C8','2012-04-18 10:12:51'),(540,'000B','E200902767170179254015C8','2012-04-18 10:12:53'),(541,'000B','E200902767170179254015C8','2012-04-18 10:12:56'),(542,'000B','E200902767170179254015C8','2012-04-18 10:12:59'),(543,'000B','E200902767170179254015C8','2012-04-18 10:13:00'),(544,'000B','E200902767170179254015C8','2012-04-18 10:13:02'),(545,'000B','E200902767170179254015C8','2012-04-18 10:13:05'),(546,'000B','E200902767170179254015C8','2012-04-18 10:13:06'),(547,'000B','E200902767170179254015C8','2012-04-18 10:13:08'),(548,'000B','E200902767170179254015C8','2012-04-18 10:13:12'),(549,'000B','E200902767170179254015C8','2012-04-18 10:13:13'),(550,'000B','E200902767170179254015C8','2012-04-18 10:13:15'),(551,'000B','E200902767170179254015C8','2012-04-18 10:13:17'),(552,'000B','E200902767170179254015C8','2012-04-18 10:13:20'),(553,'000B','E200902767170179254015C8','2012-04-18 10:13:21'),(554,'000B','E200902767170179254015C8','2012-04-18 10:13:32'),(555,'000B','E200902767170179254015C8','2012-04-18 10:13:36'),(556,'000B','E200902767170179254015C8','2012-04-18 10:13:38'),(557,'000B','E200902767170179254015C8','2012-04-18 10:13:39'),(558,'000B','E200902767170179254015C8','2012-04-18 10:13:41'),(559,'000B','E200902767170179254015C8','2012-04-18 10:13:45'),(560,'000B','E200902767170179254015C8','2012-04-18 10:13:47'),(561,'000B','E200902767170179254015C8','2012-04-18 10:13:48'),(562,'000B','E200902767170179254015C8','2012-04-18 10:13:50'),(563,'000B','E200902767170179254015C8','2012-04-18 10:13:54'),(564,'000B','E200902767170179254015C8','2012-04-18 10:13:56'),(565,'000B','E200902767170179254015C8','2012-04-18 10:13:57'),(566,'000B','E200902767170179254015C8','2012-04-18 10:13:59'),(567,'000B','E200902767170179254015C8','2012-04-18 10:14:01'),(568,'000B','E200902767170179254015C8','2012-04-18 10:14:03'),(569,'000B','E200902767170179254015C8','2012-04-18 10:14:05'),(570,'000B','E200902767170179254015C8','2012-04-18 10:14:10'),(571,'000B','E200902767170179254015C8','2012-04-18 10:14:12'),(572,'000B','E200902767170179254015C8','2012-04-18 10:14:14'),(573,'000B','E200902767170179254015C8','2012-04-18 10:14:16'),(574,'000B','E200902767170179254015C8','2012-04-18 10:14:18'),(575,'000B','E200902767170179254015C8','2012-04-18 10:14:20'),(576,'000B','E200902767170179254015C8','2012-04-18 10:14:21'),(577,'000B','E200902767170179254015C8','2012-04-18 10:14:29'),(578,'000B','E200902767170179254015C8','2012-04-18 10:14:30'),(579,'000B','E200902767170179254015C8','2012-04-18 10:14:38'),(580,'000B','E200902767170179254015C8','2012-04-18 10:14:47'),(581,'000B','E200902767170179254015C8','2012-04-18 10:14:48'),(582,'000B','E200902767170179254015C8','2012-04-18 10:14:52'),(583,'000B','E200902767170179254015C8','2012-04-18 10:14:54'),(584,'000B','E200902767170179254015C8','2012-04-18 10:14:58'),(585,'000B','E200902767170179254015C8','2012-04-18 10:14:59'),(586,'000B','E200902767170179254015C8','2012-04-18 10:15:02'),(587,'000B','E200902767170179254015C8','2012-04-18 10:15:03'),(588,'000B','E200902767170179254015C8','2012-04-18 10:15:05'),(589,'000B','E200902767170179254015C8','2012-04-18 10:15:07'),(590,'000B','E200902767170179254015C8','2012-04-18 10:15:09'),(591,'000B','E200902767170179254015C8','2012-04-18 10:15:13'),(592,'000B','E200902767170179254015C8','2012-04-18 10:15:14'),(593,'000B','E200902767170179254015C8','2012-04-18 10:15:16'),(594,'000B','E200902767170179254015C8','2012-04-18 10:15:18'),(595,'000B','E200902767170179254015C8','2012-04-18 10:15:20'),(596,'000B','E200902767170179254015C8','2012-04-18 10:15:22'),(597,'000B','E200902767170179254015C8','2012-04-18 10:15:23'),(598,'000B','E200902767170179254015C8','2012-04-18 10:15:25'),(599,'000B','E200902767170179254015C8','2012-04-18 10:15:27'),(600,'000B','E200902767170179254015C8','2012-04-18 10:15:31'),(601,'000B','E200902767170179254015C8','2012-04-18 10:15:33'),(602,'000B','E200902767170179254015C8','2012-04-18 10:15:35'),(603,'000B','E200902767170179254015C8','2012-04-18 10:15:36'),(604,'000B','E200902767170179254015C8','2012-04-18 10:15:38'),(605,'000B','E200902767170179254015C8','2012-04-18 10:15:40'),(606,'000B','E200902767170179254015C8','2012-04-18 10:15:41'),(607,'000B','E200902767170179254015C8','2012-04-18 10:15:42'),(608,'000B','E200902767170179254015C8','2012-04-18 10:15:43'),(609,'000B','E200902767170179254015C8','2012-04-18 10:15:44'),(610,'000B','E200902767170179254015C8','2012-04-18 10:15:46'),(611,'000B','E200902767170179254015C8','2012-04-18 10:15:48'),(612,'000B','E200902767170179254015C8','2012-04-18 10:15:50'),(613,'000B','E200902767170179254015C8','2012-04-18 10:15:51'),(614,'000B','E200902767170179254015C8','2012-04-18 10:15:53'),(615,'000B','E200902767170179254015C8','2012-04-18 10:16:01'),(616,'000B','E200902767170179254015C8','2012-04-18 10:16:03'),(617,'000B','E200902767170179254015C8','2012-04-18 10:16:05'),(618,'000B','E200902767170179254015C8','2012-04-18 10:16:06'),(619,'000B','E200902767170179254015C8','2012-04-18 10:16:12'),(620,'000B','E200902767170179254015C8','2012-04-18 10:16:15'),(621,'000B','E200902767170179254015C8','2012-04-18 10:16:17'),(622,'000B','E200902767170179254015C8','2012-04-18 10:16:20'),(623,'000B','E200902767170179254015C8','2012-04-18 10:16:23'),(624,'000B','E200902767170179254015C8','2012-04-18 10:16:24'),(625,'000B','E200902767170179254015C8','2012-04-18 10:16:26'),(626,'000B','E200902767170179254015C8','2012-04-18 10:16:30'),(627,'000B','E200902767170179254015C8','2012-04-18 10:16:33'),(628,'000B','E200902767170179254015C8','2012-04-18 10:16:45'),(629,'000B','E200902767170179254015C8','2012-04-18 10:16:56'),(630,'000B','E200902767170179254015C8','2012-04-18 10:16:58'),(631,'000B','E200902767170179254015C8','2012-04-18 10:17:01'),(632,'000B','E200902767170179254015C8','2012-04-18 10:17:03'),(633,'000B','E200902767170179254015C8','2012-04-18 10:17:05'),(634,'000B','E200902767170179254015C8','2012-04-18 10:17:07'),(635,'000B','E200902767170179254015C8','2012-04-18 10:17:08'),(636,'000B','E200902767170179254015C8','2012-04-18 10:17:10'),(637,'000B','E200902767170179254015C8','2012-04-18 10:17:14'),(638,'000B','E200902767170179254015C8','2012-04-18 10:17:18'),(639,'000B','E200902767170177254015C0','2012-04-18 10:17:20'),(640,'000B','E200902767170179254015C8','2012-04-18 10:17:32'),(641,'000B','E200902767170179254015C8','2012-04-18 10:17:34'),(642,'000B','E200902767170179254015C8','2012-04-18 10:17:36'),(643,'000B','E200902767170179254015C8','2012-04-18 10:17:37'),(644,'000B','E200902767170179254015C8','2012-04-18 10:17:40'),(645,'000B','E200902767170179254015C8','2012-04-18 10:17:48'),(646,'000B','E200902767170179254015C8','2012-04-18 10:17:53'),(647,'000B','E200902767170179254015C8','2012-04-18 10:17:54'),(648,'000B','E200902767170179254015C8','2012-04-18 10:18:29'),(649,'000B','E200902767170179254015C8','2012-04-18 10:18:30'),(650,'000B','E200902767170179254015C8','2012-04-18 10:18:32'),(651,'000B','E200902767170179254015C8','2012-04-18 10:18:33'),(652,'000B','E200902767170179254015C8','2012-04-18 10:18:37'),(653,'000B','E200902767170179254015C8','2012-04-18 10:18:38'),(654,'000B','E200902767170179254015C8','2012-04-18 10:18:40'),(655,'000B','E200902767170179254015C8','2012-04-18 10:18:41'),(656,'000B','E200902767170179254015C8','2012-04-18 10:18:42'),(657,'000B','E200902767170179254015C8','2012-04-18 10:18:44'),(658,'000B','E200902767170179254015C8','2012-04-18 10:18:49'),(659,'000B','E200902767170179254015C8','2012-04-18 10:18:56'),(660,'000B','E200902767170179254015C8','2012-04-18 10:18:58'),(661,'000B','E200902767170179254015C8','2012-04-18 10:19:02'),(662,'000B','E200902767170179254015C8','2012-04-18 10:19:07'),(663,'000B','E200902767170179254015C8','2012-04-18 10:19:31'),(664,'000B','E200902767170179254015C8','2012-04-18 10:19:38');

/*Table structure for table `xumu` */

DROP TABLE IF EXISTS `xumu`;

CREATE TABLE `xumu` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default '',
  `number` varchar(50) default '',
  `date` varchar(50) default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xumu` */

insert  into `xumu`(`id`,`name`,`number`,`date`) values (1,'11','11','2012-04-11 12:52:16');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
