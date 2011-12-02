package com.saturn.sldb;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DatabaseManager;
import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class PersonState {
	private String id;
	private String pid;

	private String userId;
	private String userName;
	private String createTime;

	private String name;
	private String identify;

	private String state;
	private String note;
	
	private static ORMapping<PersonState> mapping = new ResultORMapping<PersonState>();

	public static int add(PersonState vo) {
		return add(DatabaseManager.getInstance().getConnection(), vo);
	}
	
	public static int add(Connection connection, PersonState vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(connection,
				"INSERT INTO sldb_person_state(pid, userId, userName, createTime, name, identify, state, note)" +
				" VALUES(?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.pid,
				vo.userId,
				vo.userName,
				vo.createTime,
				vo.name,
				vo.identify,
				vo.state,
				vo.note
		);
	}
	
	public static int edit(PersonState vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE sldb_person_state SET pid = ?, userId = ?, userName = ?, createTime = ?, name = ?, identify = ?, state = ?, note = ? WHERE id = ?", 
				vo.pid,
				vo.userId,
				vo.userName,
				vo.createTime,
				vo.name,
				vo.identify,
				vo.state,
				vo.note,
				vo.id
		);
	}
	
	public static PersonState get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_person_state WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, PersonState.class);
	}
	
	
	public static ListData<PersonState> getAll(PersonState vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM sldb_person_state WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "userId", "state")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, PersonState.class, start, offset);
	}
	
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM sldb_person_state WHERE id = ?", id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public PersonState(String id, String pid, String userId, String userName,
			String createTime, String name, String identify, String state,
			String note) {
		super();
		this.id = id;
		this.pid = pid;
		this.userId = userId;
		this.userName = userName;
		this.createTime = createTime;
		this.name = name;
		this.identify = identify;
		this.state = state;
		this.note = note;
	}

	public PersonState() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
