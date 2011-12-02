package com.saturn.workflow;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class WorkFlow {

	public static final String WORKFLOW_FOMR_TABLE_PRE = "wf_cus_";
	
	private String id;
	private String name;
	private String showName;

	private String creater;
	private String createrName;
	private String createTime;

	private static ORMapping<WorkFlow> mapping = new ResultORMapping<WorkFlow>();
	
	public static int add(WorkFlow vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_workflow(name, showName, creater, createrName, createTime) VALUES(?, ?, ?, ?, ?)", 
				vo.getName(),
				vo.getShowName(),
				vo.getCreater(),
				vo.getCreaterName(),
				vo.getCreateTime()
		);
	}
	
	public static int edit(WorkFlow vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_workflow SET name = ?, showName = ?, creater = ?, createrName = ?, createTime = ? WHERE id = ?", 
				vo.getName(),
				vo.getShowName(),
				vo.getCreater(),
				vo.getCreaterName(),
				vo.getCreateTime(),
				vo.getId()
				
		);
	}
	
	public static WorkFlow get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_workflow WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, WorkFlow.class);
	}
	
	public static WorkFlow getByName(String name) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_workflow WHERE 1 = 1 and name = '" + name + "'",
				null, mapping, WorkFlow.class);
	}
	
	public static ListData<WorkFlow> getAll(WorkFlow vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_workflow WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name", "showName", "createrName", "createTime")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, WorkFlow.class, start, offset);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_workflow WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public WorkFlow() {
		// TODO Auto-generated constructor stub
	}

	public WorkFlow(String id, String name, String showName, String creater,
			String createrName, String createTime) {
		super();
		this.id = id;
		this.name = name;
		this.showName = showName;
		this.creater = creater;
		this.createrName = createrName;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
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
