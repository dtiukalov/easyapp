INSERT INTO `app_dict` (`key`, `value`, `type`, `pinyin`) VALUES
  ('car.infiniti','英菲尼迪','car','yingfienidi'),
  ('car.infiniti.gconvertible','GConvertible','car.infiniti','GConvertible'),
  ('car.infiniti.gcoupe','G Coupe','car.infiniti','G Coupe'),
  ('car.infiniti.gsedan','G Sedan','car.infiniti','G Sedan'),
  ('car.infiniti.m','M','car.infiniti','M'),
  ('car.infiniti.ex','EX','car.infiniti','EX'),
  ('car.infiniti.fx','FX','car.infiniti','FX'),
  ('car.infiniti.qx','QX','car.infiniti','QX'),
  ('car.infiniti.gconvertible.1','系列一','car.infiniti.gconvertible','xilieyi');
COMMIT;

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='infiniti.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='infiniti.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='infiniti.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='infiniti.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='infiniti.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='infiniti.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='infiniti.book.buy';

UPDATE WEB_CONTENT SET path='index.jsp' WHERE id='infiniti.home';
UPDATE WEB_CONTENT SET path='cus_advise.jsp' WHERE id='infiniti.online.complain';
UPDATE WEB_CONTENT SET path='cus_message.jsp' WHERE id='infiniti.online.message';

COMMIT;

