INSERT INTO `app_dict` (`key`, `value`, `type`, `pinyin`) VALUES
  ('留言','留言','website.message.type','liuyan'),
  ('投诉','投诉','website.message.type','tousu');
  
INSERT INTO `app_resources` (`id`, `name`, `path`, `parentid`, `sort`) VALUES
('car.xuefulan.newcar','雪弗兰新车信息','/app/car/admin/newcarShow.jsp?cid=xuefulan','car','87'),
  ('car.xuefulan.bookcar','雪弗兰车辆预约','/app/car/admin/bookcarShow.jsp?cid=xuefulan','car','88'),
  ('car.honda.newcar','东本新车信息','/app/car/admin/newcarShow.jsp?cid=honda','car','89'),
  ('car.honda.bookcar','东本车辆预约','/app/car/admin/bookcarShow.jsp?cid=honda','car','90'),
  ('website.ruihe.message','瑞合消息','/app/car/admin/messageShow.jsp?cid=ruihe','website','91'),
  ('website.xingsheng.message','兴盛消息','/app/car/admin/messageShow.jsp?cid=xingsheng','website','92'),
  ('website.xinyu.message','鑫宇消息','/app/car/admin/messageShow.jsp?cid=xinyu','website','93'),
  ('website.xingbang.message','兴邦消息','/app/car/admin/messageShow.jsp?cid=xingbang','website','94'),
  ('website.suixin.message','绥鑫消息','/app/car/admin/messageShow.jsp?cid=suixin','website','95'),
  ('website.rongsheng.message','融晟消息','/app/car/admin/messageShow.jsp?cid=rongsheng','website','96'),
  ('website.infiniti.message','英菲尼迪消息','/app/car/admin/messageShow.jsp?cid=infiniti','website','97'),
  ('website.dongri.message','东日消息','/app/car/admin/messageShow.jsp?cid=dongri','website','98'),
  ('website.xuefulan.message','英菲尼迪消息','/app/car/admin/messageShow.jsp?cid=xuefulan','website','99'),
  ('website.honda.message','东日消息','/app/car/admin/messageShow.jsp?cid=honda','website','100');
  
  
UPDATE WEB_CONTENT SET path='contactme.jsp' WHERE id='rongzhan.contact';

COMMIT;