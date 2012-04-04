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
