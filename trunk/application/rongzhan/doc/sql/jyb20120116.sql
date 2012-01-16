INSERT INTO `app_dict` (`key`, `value`, `type`, `pinyin`) VALUES
  ('car.yiqivw.suteng','速腾','car.yiqivw','suteng'),
  ('car.yiqivw.jieda','捷达','car.yiqivw','jieda'),
  ('car.yiqivw.maiteng','迈腾','car.yiqivw','maiteng'),
  ('car.yiqivw.baolai','宝来','car.yiqivw','baolai'),
  ('car.yiqivw.gaoerfu','高尔夫','car.yiqivw','gaoerfu'),
  ('car.yiqivw.gti','GTI','car.yiqivw','gti'),
  ('car.yiqivw.cc','CC','car.yiqivw','cc'),
  ('car.yiqivw.suteng.1','技术型','car.yiqivw.suteng','1'),
  ('car.yiqivw.suteng.2','豪华型','car.yiqivw.suteng','2'),
  ('car.yiqivw.suteng.3','时尚型','car.yiqivw.suteng','3'),
  ('car.yiqivw.suteng.4','舒适型','car.yiqivw.suteng','4'),
  ('car.yiqivw.suteng.5','特别版','car.yiqivw.suteng','5'),
  ('car.yiqivw.suteng.6','冠军版','car.yiqivw.suteng','6'),
  ('car.yiqivw.jieda.1','伙伴','car.yiqivw.jieda','1'),
  ('car.yiqivw.jieda.2','前卫','car.yiqivw.jieda','2'),
  ('car.yiqivw.jieda.3','柴油先锋','car.yiqivw.jieda','3'),
  ('car.yiqivw.maiteng.1','标准型','car.yiqivw.maiteng','1'),
  ('car.yiqivw.maiteng.2','精英型','car.yiqivw.maiteng','2'),
  ('car.yiqivw.maiteng.3','舒适型','car.yiqivw.maiteng','3'),
  ('car.yiqivw.maiteng.4','DSG舒适型','car.yiqivw.maiteng','4'),
  ('car.yiqivw.maiteng.5','DSG豪华型','car.yiqivw.maiteng','5'),
  ('car.yiqivw.maiteng.6','DSG尊贵型','car.yiqivw.maiteng','6'),
  ('car.yiqivw.maiteng.7','DSG至尊型','car.yiqivw.maiteng','7'),
  ('car.yiqivw.maiteng.8','DSG旗舰型','car.yiqivw.maiteng','8'),
  ('car.yiqivw.baolai.1','舒适型','car.yiqivw.baolai','1'),
  ('car.yiqivw.baolai.2','豪华型','car.yiqivw.baolai','2'),
  ('car.yiqivw.baolai.3','时尚型','car.yiqivw.baolai','3'),
  ('car.yiqivw.baolai.4','Sportline','car.yiqivw.baolai','4'),
  ('car.yiqivw.gaoerfu.1','舒适型','car.yiqivw.gaoerfu','1'),
  ('car.yiqivw.gaoerfu.2','豪华型','car.yiqivw.gaoerfu','2'),
  ('car.yiqivw.gaoerfu.3','时尚型','car.yiqivw.gaoerfu','3'),
  ('car.yiqivw.gti.1','舒适版','car.yiqivw.gti','1'),
  ('car.yiqivw.cc.1','尊贵型','car.yiqivw.cc','1'),
  ('car.yiqivw.cc.2','豪华型','car.yiqivw.cc','2'),
  ('car.yiqivw.cc.3','至尊型','car.yiqivw.cc','3');
COMMIT;

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='xinyu.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='xinyu.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xinyu.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xinyu.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xinyu.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xinyu.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xinyu.book.buy';

UPDATE WEB_CONTENT SET path='index.jsp' WHERE id='xinyu.home';
UPDATE WEB_CONTENT SET path='cus_advise.jsp' WHERE id='xinyu.online.complain';
UPDATE WEB_CONTENT SET path='cus_message.jsp' WHERE id='xinyu.online.message';

COMMIT;