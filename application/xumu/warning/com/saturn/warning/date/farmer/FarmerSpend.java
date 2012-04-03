package com.saturn.warning.date.farmer;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class FarmerSpend {
	
	public final static String SESSION_SPEND = "SPEND_SESSION";
	
	private String id;

	private String opId;
	private String type;
	
	private String price;
	
	private String userName;	
	private String createTime;
	
	
	private static ORMapping<FarmerSpend> mapping = new ResultORMapping<FarmerSpend>();
	
	public static int add(FarmerSpend vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return add(null, vo);
	}
	
	public static int add(Connection connection, FarmerSpend vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xm_farmer_spend(opId, type, price, userName, createTime) VALUES(?, ?, ?, ?, ?)";
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
				sql, 
				vo.opId,
				vo.type,
				vo.price,
				vo.userName,
				vo.createTime
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				vo.opId,
				vo.type,
				vo.price,
				vo.userName,
				vo.createTime
			);
	}
	
	public static FarmerSpend get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_farmer_spend WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FarmerSpend.class);
	}
	
	public static ListData<FarmerSpend> getAll(FarmerSpend vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xm_farmer_spend WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND opId = '?'", vo.opId)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, FarmerSpend.class, start, offset);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM xm_farmer_spend WHERE id = ?",
				id);
	}
	
	public FarmerSpend() {
	}

	public FarmerSpend(String id, String opId, String type, String price,
			String userName, String createTime) {
		super();
		this.id = id;
		this.opId = opId;
		this.type = type;
		this.price = price;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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
