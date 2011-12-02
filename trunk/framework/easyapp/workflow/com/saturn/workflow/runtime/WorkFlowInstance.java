package com.saturn.workflow.runtime;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;

public class WorkFlowInstance {

	private String id;
	private String flowId;
	private String flowName;
	private String flowShowName;

	private String creater;
	private String createrName;
	private String createTime;

	private String endTime;
	
	private static ORMapping<WorkFlowInstance> mapping = new ResultORMapping<WorkFlowInstance>();
	
	public static int add(WorkFlowInstance vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_runtime_instance(flowId, flowName, flowShowName, creater, createrName, createTime) VALUES(?, ?, ?, ?, ?, ?)", 
				vo.getFlowId(),
				vo.getFlowName(),
				vo.getFlowShowName(),
				vo.getCreater(),
				vo.getCreaterName(),
				vo.getCreateTime()
		);
	}
	
	public static WorkFlowInstance get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_runtime_instance WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, WorkFlowInstance.class);
	}
	
	public static WorkFlowInstance getByUserAndCreateTime(String userId, String createTime) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_runtime_instance WHERE 1 = 1 and creater = '" + userId + "' AND createTime = '" + createTime + "'",
				null, mapping, WorkFlowInstance.class);
	}
	
	public static ListData<WorkFlowInstance> getAll(WorkFlowInstance vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_runtime_instance WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "flowId", "createTime", "endTime", "createrName")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, WorkFlowInstance.class, start, offset);
	}
	
	public static ListData<WorkFlowInstance> getEnd(WorkFlowInstance vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_runtime_instance WHERE 1 = 1 AND endTime is not NULL",
				new DymaticCondition().addSimpleCondition(vo, "flowId", "createTime", "endTime", "createrName", "creater")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, WorkFlowInstance.class, start, offset);
	}
	
	public static int remove(final String idi) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_runtime_instance WHERE id = ?",
				idi);
	}
	public static int end(final String id) {
		return SimpleDaoTemplate.update("UPDATE wf_runtime_instance SET endTime = ? WHERE id = ?",
				DateUtils.getSystemTime(),
				id);
	}
	
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public WorkFlowInstance() {
		super();
	}


	public WorkFlowInstance(String id, String flowId, String flowName,
			String flowShowName, String creater, String createrName,
			String createTime) {
		super();
		this.id = id;
		this.flowId = flowId;
		this.flowName = flowName;
		this.flowShowName = flowShowName;
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

	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	public String getFlowName() {
		return flowName;
	}

	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}

	public String getFlowShowName() {
		return flowShowName;
	}

	public void setFlowShowName(String flowShowName) {
		this.flowShowName = flowShowName;
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

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
