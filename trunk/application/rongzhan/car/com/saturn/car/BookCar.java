package com.saturn.car;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class BookCar {
	private String id;
	private String cid;
	
	private String brand;
	private String model;
	private String series;
	private String brandName;//品牌
	private String modelName;//型号
	private String seriesName;//系列
	
	private String license;
	private String phone;
	private String userName;
	
	private String type;
	private String typeName;
	
	private String text;
	
	private String bookTime;
	private String createTime;
	private String state;
	private String stateName;
	
	private static ORMapping<BookCar> mapping = new ResultORMapping<BookCar>();
	
	public static int add(BookCar vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO car_bookcar(cid, brand, brandName, model, modelName, series, seriesName, " +
				"license, phone, type, typeName, text, bookTime, createTime, state, stateName, userName) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getCid(),
				vo.getBrand(),
				vo.getBrandName(),
				vo.getModel(),
				vo.getModelName(),
				vo.getSeries(),
				vo.getSeriesName(),
				vo.getLicense(),
				vo.getPhone(),
				vo.getType(),
				vo.getTypeName(),
				vo.getText(),
				vo.getBookTime(),
				vo.getCreateTime(),
				vo.getState(),
				vo.getStateName(),
				vo.getUserName()
		);
	}
	
	public static int edit(BookCar vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE car_bookcar SET cid = ?, brand = ?, brandName = ?, model = ?, modelName = ?, series = ?, seriesName = ?, " +
				"license = ?, phone = ?, type = ?, typeName = ?, text = ?, bookTime = ?, createTime = ? , state = ?, stateName = ?, userName = ? WHERE id = ?", 
				vo.getCid(),
				vo.getBrand(),
				vo.getBrandName(),
				vo.getModel(),
				vo.getModelName(),
				vo.getSeries(),
				vo.getSeriesName(),
				vo.getLicense(),
				vo.getPhone(),
				vo.getType(),
				vo.getTypeName(),
				vo.getText(),
				vo.getBookTime(),
				vo.getCreateTime(),
				vo.getState(),
				vo.getStateName(),
				vo.getUserName(),
				vo.getId()
		);
	}
	
	public static BookCar get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM car_bookcar WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, BookCar.class);
	}
	
	
	public static ListData<BookCar> getAll(BookCar vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM car_bookcar WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "cid", "brand", "model", "series", "type", "license", "phone", "text", "bookTime", "createTime", "state", "userName")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, BookCar.class, start, offset);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM car_bookcar WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public static int state(String id) {
		BookCar vo = get(id);
		String state = vo.getState();
		
		if ("bookcar.state.true".equals(state)) {
			vo.setState("bookcar.state.false");
			vo.setStateName("未确认");
		} else {
			vo.setState("bookcar.state.true");
			vo.setStateName("确认");
		}
		
		return edit(vo);
	}
	
	public BookCar() {
		
	}

	public BookCar(String id, String cid, String brand, String model,
			String series, String brandName, String modelName,
			String seriesName, String license, String phone, String type,
			String typeName, String text, String bookTime, String createTime,
			String state, String stateName, String userName) {
		super();
		this.id = id;
		this.cid = cid;
		this.brand = brand;
		this.model = model;
		this.series = series;
		this.brandName = brandName;
		this.modelName = modelName;
		this.seriesName = seriesName;
		this.license = license;
		this.phone = phone;
		this.type = type;
		this.typeName = typeName;
		this.text = text;
		this.bookTime = bookTime;
		this.createTime = createTime;
		this.state = state;
		this.stateName = stateName;
		this.userName = userName;
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

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
