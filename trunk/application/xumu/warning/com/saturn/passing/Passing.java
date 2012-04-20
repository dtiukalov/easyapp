package com.saturn.passing;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;

public class Passing {

	private String id;

	private String station;
	private String card;

	private String createTime;

	private String dateTime;
	private String people;
	private String unit;
	private String name;
	private String address;
	private String peop;
	private String contact;
	private String number;
	
	
	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPeop() {
		return peop;
	}

	public void setPeop(String peop) {
		this.peop = peop;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public static int add(Passing vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return add(null, vo);
	}

	public static int add(Connection connection, Passing vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xm_passing(station, card, createTime) VALUES(?, ?, ?)";
		
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql, 
					vo.station,
					vo.card,
					vo.createTime
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				vo.station,
				vo.card,
				vo.createTime
			);
	}
	
	

	public static Passing get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_passing WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Passing.class);
	}

	public static ListData<Passing> getAll(Passing vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xm_passing WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND station = '?'", vo.station)
						.addCondition(" AND card = '?'", vo.card)
						.addCondition(" AND createTime like '%?%'", vo.createTime)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Passing.class, start, offset);
	}
	
	public static ListData<Passing> getLogAll(String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xumu_check_log WHERE 1 = 1",
				new DymaticCondition()
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Passing.class, start, offset);
	}
	
	public static Passing getLog(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xumu_check_log WHERE 1 = 1 and number = '" + id + "'",
				null, mapping, Passing.class);
	}
	
	public static int addCheck(Passing voCheck,String dateTime) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return addCheck(null, voCheck,dateTime);
	}
	
	public static int addCheck(Connection connection, Passing voCheck,String dateTime) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xumu_check_log(dateTime, people, unit, name, address, peop, contact, number) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql, 
					dateTime,
					voCheck.people,
					voCheck.unit,
					voCheck.name,
					voCheck.address,
					voCheck.peop,
					voCheck.contact,
					voCheck.number
					
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				dateTime,
				voCheck.people,
				voCheck.unit,
				voCheck.name,
				voCheck.address,
				voCheck.peop,
				voCheck.contact,
				voCheck.number
			);
	}
/*
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM xm_passing WHERE id = ?",
				id);
	}
	*/
	public static int remove(Connection connection, final String id) {
		if(connection != null) {
				return SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_passing WHERE id = ?", id);
		}
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				return SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_passing WHERE id = ?", id);
			}
		});
	}

	public static int removes(final String[] ids) {
		if (ids != null) {
			return SimpleDaoTemplate.update(new ITransaction() {
				public int execute(Connection connection) {
					for (String id : ids) {
						remove(connection, id);
					}
					return 1;
				}
			});
			
		}
		return 0;
	}

	private static ORMapping<Passing> mapping = new ResultORMapping<Passing>();

	public Passing() {

	}

	public Passing(String id, String station, String card, String createTime) {
		super();
		this.id = id;
		this.station = station;
		this.card = card;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
