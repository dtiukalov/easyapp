package com.saturn.medication;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;

public class Medication {

	private String id;

	private String number;
	private String title;

	private String createTime;

	public static int add(Medication vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return add(null, vo);
	}

	public static int add(Connection connection, Medication vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xm_medication(number, title, createTime) VALUES(?, ?, ?)";
		
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql, 
					vo.number,
					vo.title,
					vo.createTime
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				vo.number,
				vo.title,
				vo.createTime
			);
	}
	
	public static int edit(Medication vo) {
		return edit(null, vo);
	}
	
	public static int edit(Connection connection, Medication vo) {
		String createTime = DateUtils.getSystemTime();
		String sql = "UPDATE xm_medication SET number = ?, title = ?, createTime = ? WHERE id = ?";
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql,
					vo.number, vo.title, createTime, vo.id);
		}
		return SimpleDaoTemplate.update(
				sql,
				vo.number, vo.title, createTime, vo.id);
	}

	public static Medication get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_medication WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Medication.class);
	}
	
	public static Medication search(String number) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_medication WHERE 1 = 1 and number = '" + number + "'",
				null, mapping, Medication.class);
	}

	public static ListData<Medication> getAll(Medication vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xm_medication WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND number = '?'", vo.number)
						.addCondition(" AND title = '?'", vo.title)
						.addCondition(" AND createTime like '%?%'", vo.createTime)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Medication.class, start, offset);
	}
/*
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM xm_medication WHERE id = ?",
				id);
	}
	*/
	public static int remove(Connection connection, final String id) {
		if(connection != null) {
				return SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_medication WHERE id = ?", id);
		}
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				return SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_medication WHERE id = ?", id);
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

	private static ORMapping<Medication> mapping = new ResultORMapping<Medication>();

	public Medication() {

	}

	public Medication(String id, String number, String title, String createTime) {
		super();
		this.id = id;
		this.number = number;
		this.title = title;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
