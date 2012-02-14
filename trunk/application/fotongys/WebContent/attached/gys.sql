create user web identified by web;
grant create session, create table to web;
grant resource to web;

CREATE TABLE "download"   
(   
    "mailuid"     VARCHAR2(50),   
    "mailpid"   VARCHAR2(50),   
    "fromUser"    VARCHAR2(50), 
    "userid"    VARCHAR2(50), 
    "datetime"    VARCHAR2(50), 
    "hasDownload"    VARCHAR2(50), 
    "downloadNum"    VARCHAR2(50)    
);

CREATE TABLE "app_dict" (
  "id" varchar(100) NOT NULL,
  "value" varchar(100) NOT NULL,
  "type" varchar(100) NOT NULL,
  "pinyin" varchar(100) default NULL,
  PRIMARY KEY  ("id")
);