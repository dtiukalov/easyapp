#修改表car_bookcar 字段 bookTime 类型为 VARCHAR(30)

INSERT INTO `web_content` (`id`, `name`, `english`, `path`, `parentId`, `hasShow`, `hasShowName`, `mode`, `modeName`) VALUES 
  ('rongzhan.about.company','旗下品牌','Company','companylist.jsp','rongzhan.about','visible.true','显示','content.mode.one','单项');
COMMIT;

INSERT INTO `app_dict` (`key`, `value`, `type`, `pinyin`) VALUES
  ('car.dongfengnissan.gtr','GT-R','car.dongfengnissan','GTR'),
  ('car.dongfengnissan.tianlai','天籁','car.dongfengnissan','tianlai'),
  ('car.dongfengnissan.xuanyi','轩逸','car.dongfengnissan','xuanyi'),
  ('car.dongfengnissan.qijun','奇骏','car.dongfengnissan','qijun'),
  ('car.dongfengnissan.xiaoke','逍客','car.dongfengnissan','xiaoke'),
  ('car.dongfengnissan.yida','颐达','car.dongfengnissan','yida'),
  ('car.dongfengnissan.qida','骐达','car.dongfengnissan','qida'),
  ('car.dongfengnissan.liwei','骊威','car.dongfengnissan','liwei'),
  ('car.dongfengnissan.yangguang','阳光','car.dongfengnissan','yangguang'),
  ('car.dongfengnissan.machi','玛驰','car.dongfengnissan','machi'),
  ('car.dongfengnissan.gtr.1','系列一','car.dongfengnissan.gtr','xilieyi'),
  ('bookcar.type.repair','维修','bookcar.type','weixiu'),
  ('bookcar.type.maintain','保养','bookcar.type','baoyang'),
  ('car.dongfengnissan.machi.1','系列一','car.dongfengnissan.machi','xilieyi');
COMMIT;

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='ruihe.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='ruihe.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='ruihe.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='ruihe.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='ruihe.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='ruihe.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='ruihe.book.buy';

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='xingbang.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='xingbang.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xingbang.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xingbang.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xingbang.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xingbang.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='xingbang.book.buy';

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='suixin.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='suixin.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='suixin.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='suixin.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='suixin.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='suixin.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='suixin.book.buy';

UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='dongri.sall';
UPDATE WEB_CONTENT SET path='cus_cars.jsp' WHERE id='dongri.sall.new';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='dongri.book';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='dongri.book.drive';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='dongri.book.repair';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='dongri.book.maintain';
UPDATE WEB_CONTENT SET path='cus_bookcar.jsp' WHERE id='dongri.book.buy';

COMMIT;

