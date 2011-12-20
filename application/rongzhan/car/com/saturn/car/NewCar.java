package com.saturn.car;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class NewCar {
	
	private String id;
	private String cid;
	
	private String brand;//品牌
	private String model;//型号
	private String series;//系列
	private String brandName;//品牌
	private String modelName;//型号
	private String seriesName;//系列
	
	private String image;
	private String price;
	private String realPrice;
	private String gift;//礼品
	private String saller;
	
	private static ORMapping<NewCar> mapping = new ResultORMapping<NewCar>();
	
	public static int add(NewCar vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO car_newcar(cid, brand, brandName, model, modelName, series, seriesName, image, price, realPrice, gift, saller) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getCid(),
				vo.getBrand(),
				vo.getBrandName(),
				vo.getModel(),
				vo.getModelName(),
				vo.getSeries(),
				vo.getSeriesName(),
				vo.getImage(),
				vo.getPrice(),
				vo.getRealPrice(),
				vo.getGift(),
				vo.getSaller()
		);
	}
	
	public static int edit(NewCar vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE car_newcar SET cid = ?, brand = ?, brandName = ?, model = ?, modelName = ?, series = ?, seriesName = ?, image = ?, price = ?, realPrice = ?, gift = ? , saller = ? WHERE id = ?", 
				vo.getCid(),
				vo.getBrand(),
				vo.getBrandName(),
				vo.getModel(),
				vo.getModelName(),
				vo.getSeries(),
				vo.getSeriesName(),
				vo.getImage(),
				vo.getPrice(),
				vo.realPrice,
				vo.getGift(),
				vo.getSaller(),
				vo.getId()
		);
	}
	
	public static NewCar get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM car_newcar WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, NewCar.class);
	}
	
	
	public static ListData<NewCar> getAll(NewCar vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM car_newcar WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "cid", "brand", "model", "series", "realPrice", "gift")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, NewCar.class, start, offset);
	}
	
	
	public static List<NewCar> getListByCid(String cid) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM car_newcar WHERE 1 = 1 and cid = '" + cid + "'",
				null,
				mapping, NewCar.class);
	}
	
	public static List<NewCar> getListByModel(String cid, String model) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM car_newcar WHERE 1 = 1 and cid = '" + cid + "' and model = '" + model + "'",
				null,
				mapping, NewCar.class);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM car_newcar WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public NewCar() {
		
	}

	public NewCar(String id, String cid, String brand, String model,
			String series, String brandName, String modelName,
			String seriesName, String image, String price, String realPrice,
			String gift, String saller) {
		super();
		this.id = id;
		this.cid = cid;
		this.brand = brand;
		this.model = model;
		this.series = series;
		this.brandName = brandName;
		this.modelName = modelName;
		this.seriesName = seriesName;
		this.image = image;
		this.price = price;
		this.realPrice = realPrice;
		this.gift = gift;
		this.saller = saller;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(String realPrice) {
		this.realPrice = realPrice;
	}

	public String getGift() {
		return gift;
	}

	public void setGift(String gift) {
		this.gift = gift;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getSeriesName() {
		return seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}
	
	
	public String getSaller() {
		return saller;
	}

	public void setSaller(String saller) {
		this.saller = saller;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
