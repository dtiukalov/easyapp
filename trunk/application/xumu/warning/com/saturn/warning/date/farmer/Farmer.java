package com.saturn.warning.date.farmer;

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

public class Farmer {

	private String id;

	private String userId;
	private String userName;

	private String createTime;
	private String opId;

	public static int add(Farmer vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return add(null, vo);
	}

	public static int add(Connection connection, Farmer vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		String sql = "INSERT INTO xm_farmer(userId, userName, createTime, opId) VALUES(?, ?, ?, ?)";
		
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					sql, 
					vo.userId,
					vo.userName,
					vo.createTime,
					vo.opId
			);
		}
		
		return SimpleDaoTemplate.update(
				sql, 
				vo.userId,
				vo.userName,
				vo.createTime,
				vo.opId
			);
	}
	
	public static int addAll(final Farmer vo, final List<FarmerPig> pigs, final List<FarmerForage> forages, final List<FarmerSpend> spends) {
		return SimpleDaoTemplate.update(new ITransaction() {
			
			@Override
			public int execute(Connection connection) {
				String opId = System.currentTimeMillis() + "_" + vo.getUserId();
				String createTime = DateUtils.getSystemTime();
				vo.setOpId(opId);
				vo.setCreateTime(createTime);
				
				add(connection, vo);
				
				if (pigs != null) {
					for (FarmerPig pig : pigs) {
						pig.setOpId(opId);
						pig.setCreateTime(createTime);
						pig.setUserName(vo.getUserName());
						FarmerPig.add(connection, pig);
					}
				}
				
				if (forages != null) {
					for (FarmerForage forage : forages) {
						forage.setOpId(opId);
						forage.setCreateTime(createTime);
						forage.setUserName(vo.getUserName());
						FarmerForage.add(connection, forage);
					}
				}
				
				if (spends != null) {
					for (FarmerSpend spend : spends) {
						spend.setOpId(opId);
						spend.setCreateTime(createTime);
						spend.setUserName(vo.getUserName());
						FarmerSpend.add(connection, spend);
					}
				}
				
				return 1;
			}
		});
	}

	public static Farmer get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM xm_farmer WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Farmer.class);
	}

	public static ListData<Farmer> getAll(Farmer vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM xm_farmer WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND opId = '?'", vo.opId)
						.addCondition(" AND userName = '?'", vo.userName)
						.addCondition(" AND createTime like '%?%'", vo.createTime)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Farmer.class, start, offset);
	}
/*
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM xm_farmer WHERE id = ?",
				id);
	}
	*/
	public static int remove(Connection connection, final String id) {
		if(connection != null) {
			Farmer farmer = get(id);
			if(farmer != null && farmer.getOpId() != null) {
				int value = SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_farmer WHERE id = ?", id);
				int value1 = SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_farmer_pig WHERE opId = ?", farmer.getOpId());
				int value2 = SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_farmer_forage WHERE opId = ?", farmer.getOpId());
				int value3 = SimpleDaoTemplate.update(connection,
						"DELETE FROM xm_farmer_spend WHERE opId = ?", farmer.getOpId());
				return 1;
			}
		}
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				Farmer farmer = get(id);
				if(farmer != null && farmer.getOpId() != null) {
					int value = SimpleDaoTemplate.update(connection,
							"DELETE FROM xm_farmer WHERE id = ?", id);
					int value1 = SimpleDaoTemplate.update(connection,
							"DELETE FROM xm_farmer_pig WHERE opId = ?", farmer.getOpId());
					int value2 = SimpleDaoTemplate.update(connection,
							"DELETE FROM xm_farmer_forage WHERE opId = ?", farmer.getOpId());
					int value3 = SimpleDaoTemplate.update(connection,
							"DELETE FROM xm_farmer_spend WHERE opId = ?", farmer.getOpId());
					return 1;
				}
				return 0;
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

	private static ORMapping<Farmer> mapping = new ResultORMapping<Farmer>();

	public Farmer() {

	}

	public Farmer(String id, String userId, String userName, String createTime,
			String opId) {
		super();
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.createTime = createTime;
		this.opId = opId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
