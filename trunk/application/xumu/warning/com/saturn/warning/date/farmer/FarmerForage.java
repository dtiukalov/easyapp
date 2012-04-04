package com.saturn.warning.date.farmer;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class FarmerForage {
	
	public final static String SESSION_FORAGE = "FORAGE_SESSION";
	
	private String id;

	private String opId;
	private String type;
	
	private String num;
	private String price;
	private String total;
	
	private String userName;
	private String createTime;
	
	
	private static ORMapping<FarmerForage> mapping = new ResultORMapping<FarmerForage>();
	
	public static int add(FarmerForage vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return add(null, vo);
	}
	
	public static int add(Connection connection, FarmerForage vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xm_farmer_forage(opId, type, num, price, total, userName, createTime) VALUES(?, ?, ?, ?, ?, ?, ?)";
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql, 
					vo.opId,
					vo.type,
					vo.num,
					vo.price,
					vo.total,
					vo.userName,
					vo.createTime
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				vo.opId,
				vo.type,
				vo.num,
				vo.price,
				vo.total,
				vo.userName,
				vo.createTime
		);
	}
	
	public static FarmerForage get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_farmer_forage WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FarmerForage.class);
	}
	
	public static ListData<FarmerForage> getAll(FarmerForage vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xm_farmer_forage WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND opId = '?'", vo.opId)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, FarmerForage.class, start, offset);
	}
	/*
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM xm_farmer_forage WHERE id = ?",
				id);
	}
	*/
	public static int remove(Connection connection, final String id) {
		if(connection != null) {
			return SimpleDaoTemplate.update(connection, 
					"DELETE FROM xm_farmer_forage WHERE id = ?",
					id);
		}
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				return SimpleDaoTemplate.update(connection, 
						"DELETE FROM xm_farmer_forage WHERE id = ?",
						id);
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
	
	public FarmerForage() {
	}

	public FarmerForage(String id, String opId, String type, String num,
			String price, String total, String userName, String createTime) {
		super();
		this.id = id;
		this.opId = opId;
		this.type = type;
		this.num = num;
		this.price = price;
		this.total = total;
		this.userName = userName;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
