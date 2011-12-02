package com.saturn.workflow.runtime;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;
import com.saturn.workflow.FlowNode;
import com.saturn.workflow.WorkFlow;

public class WorkFlowProcess {

	private String id;
	private String instanceId;
	private String flowId;
	private String nodeId;
	
	private String operaterId;
	private String operaterName;
	private String sign;
	
	private String end;
	private String confirm;//确认
	
	private String confirmTime;
	private String endTime;
	
	private String remark;
	private String createTime;

	
	private String nodeNameStr;
	private String workflowNameStr;
	private String createrStr;
	
	private static ORMapping<WorkFlowProcess> mapping = new ResultORMapping<WorkFlowProcess>();
	
	private static ORMapping<WorkFlowProcess> mappingDetails = new ResultORMapping<WorkFlowProcess>() {

		@Override
		public void mappingResult(ResultSet rs, WorkFlowProcess t)
				throws SQLException {
			super.mappingResult(rs, t);
			
			t.setNodeNameStr(FlowNode.get(t.getNodeId()).getName());
			t.setWorkflowNameStr(WorkFlow.get(t.getFlowId()).getShowName());
			t.setCreaterStr(WorkFlow.get(t.getFlowId()).getCreaterName());
		}
		
	};
	
	public static int add(WorkFlowProcess vo) {
		return add(null, vo);
	}
	
	public static int add(Connection connection, WorkFlowProcess vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		
		if (connection == null) {
			return SimpleDaoTemplate.update(
					"INSERT INTO wf_runtime_process(instanceId, flowId, nodeId, operaterId, operaterName, sign, end, confirm, confirmTime, endTime, remark, createTime) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
					vo.getInstanceId(),
					vo.getFlowId(),
					vo.getNodeId(),
					vo.getOperaterId(),
					vo.getOperaterName(),
					vo.getSign(),
					vo.getEnd(),
					vo.getConfirm(),
					vo.getConfirmTime(),
					vo.getEndTime(),
					vo.getRemark(),
					vo.getCreateTime()
			);
		} 
		
		return SimpleDaoTemplate.update(connection, 
				"INSERT INTO wf_runtime_process(instanceId, flowId, nodeId, operaterId, operaterName, sign, end, confirm, confirmTime, endTime, remark, createTime) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				vo.getInstanceId(),
				vo.getFlowId(),
				vo.getNodeId(),
				vo.getOperaterId(),
				vo.getOperaterName(),
				vo.getSign(),
				vo.getEnd(),
				vo.getConfirm(),
				vo.getConfirmTime(),
				vo.getEndTime(),
				vo.getRemark(),
				vo.getCreateTime()
		);
	}
	
	public static int edit(WorkFlowProcess vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_runtime_process SET instanceId = ?, flowId = ?, nodeId = ?, operaterId = ?, operaterName = ?, sign = ?, end = ?, confirm = ?, confirmTime = ?, endTime = ?, remark = ? WHERE id = ?", 
				vo.getInstanceId(),
				vo.getFlowId(),
				vo.getNodeId(),
				vo.getOperaterId(),
				vo.getOperaterName(),
				vo.getSign(),
				vo.getEnd(),
				vo.getConfirm(),
				vo.getConfirmTime(),
				vo.getEndTime(),
				vo.getRemark(),
				vo.getId()
		);
	}
	
	public static int remark(String id, String remark) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_runtime_process SET remark = ? WHERE id = ?", remark, id
		);
	}
	
	public static WorkFlowProcess get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_runtime_process WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, WorkFlowProcess.class);
	}
	
	
	public static ListData<WorkFlowProcess> getAll(WorkFlowProcess vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_runtime_process WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "flowId", "instanceId", "end", "operaterId", "operaterName", "confirmTime", "endTime", "createTime")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
						mappingDetails, WorkFlowProcess.class, start, offset);
	}
	
	public static WorkFlowProcess getNotEndByInstanceIdAndUserId(String instanceId, String userId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_runtime_process WHERE 1 = 1 and end <> '是' and instanceId = " + instanceId + " and operaterId = '" + userId + "'",
				null, mapping, WorkFlowProcess.class);
	}
	
	public static List<WorkFlowProcess> getByInstanceId(String instanceId, String end) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_runtime_process WHERE 1 = 1 AND instanceId = " + instanceId,
				new DymaticCondition().addCondition("AND end = '?'", end),
				mapping, WorkFlowProcess.class);
	}
	
	public static List<WorkFlowProcess> getByOperaterIdNotEnd(String operaterId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_runtime_process WHERE 1 = 1 AND end <> '是' AND operaterId = " + operaterId,
				null,
				mapping, WorkFlowProcess.class);
	}
	
	public static int getStep(String instanceId) {
		return SimpleDaoTemplate.queryCount("SELECT count(distinct nodeId) from wf_runtime_process where instanceId=" + instanceId, null);
	}
	
	public static int confirm(final String id) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				WorkFlowProcess process = WorkFlowProcess.get(id);
				String sign = process.getSign();
				
				String instanceId = process.getInstanceId();
				String nodeId = process.getNodeId();
				
				int result = 0;
				
				if ("否".equals(sign)) {
					end(connection, instanceId, nodeId, id);
					result = 1;//节点结束
				} else {
					List<WorkFlowProcess> confirmed = getConfirm(connection, instanceId, nodeId);
					if (confirmed.isEmpty()) {
						end(connection, instanceId, nodeId, id);
						result = 1;//节点结束
					}
				}
				
				if (result == 0) {
					SimpleDaoTemplate.update(connection,
							"UPDATE wf_runtime_process SET confirm = '是', confirmTime = ? WHERE id = ?", 
							DateUtils.getSystemTime(),
							id
					);
				} else {
					SimpleDaoTemplate.update(connection,
							"UPDATE wf_runtime_process SET confirm = '是', confirmTime = ?, end = '是', endTime = ? WHERE id = ?", 
							DateUtils.getSystemTime(),
							DateUtils.getSystemTime(),
							id
					);
				}
				
				return result;//节点未结束
			}
		});
		
	}
	
	private static List<WorkFlowProcess> getConfirm(Connection connection, String instanceId, String nodeId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(connection, "SELECT * FROM wf_runtime_process WHERE 1 = 1 AND confirm = '是' AND instanceId = " + instanceId + " AND nodeId = " + nodeId,
				null,
				mapping, WorkFlowProcess.class);
	}
	
	private static int end(Connection connection, String instanceId, String nodeId, String confirmId) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_runtime_process SET end = '是', endTime = ? WHERE instanceId = ? and nodeId = ? and id <> " + confirmId, 
				DateUtils.getSystemTime(),
				instanceId,
				nodeId
		);
	}
	
	public WorkFlowProcess() {
		super();
	}


	public WorkFlowProcess(String id, String instanceId, String flowId,
			String nodeId, String operaterId, String operaterName, String sign,
			String end, String confirm, String confirmTime, String endTime,
			String remark, String createTime) {
		super();
		this.id = id;
		this.instanceId = instanceId;
		this.flowId = flowId;
		this.nodeId = nodeId;
		this.operaterId = operaterId;
		this.operaterName = operaterName;
		this.sign = sign;
		this.end = end;
		this.confirm = confirm;
		this.confirmTime = confirmTime;
		this.endTime = endTime;
		this.remark = remark;
		this.createTime = createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInstanceId() {
		return instanceId;
	}

	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}

	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public String getOperaterId() {
		return operaterId;
	}

	public void setOperaterId(String operaterId) {
		this.operaterId = operaterId;
	}

	public String getOperaterName() {
		return operaterName;
	}

	public void setOperaterName(String operaterName) {
		this.operaterName = operaterName;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getNodeNameStr() {
		return nodeNameStr;
	}

	public void setNodeNameStr(String nodeNameStr) {
		this.nodeNameStr = nodeNameStr;
	}
	
	public String getWorkflowNameStr() {
		return workflowNameStr;
	}

	public void setWorkflowNameStr(String workflowNameStr) {
		this.workflowNameStr = workflowNameStr;
	}

	public String getCreaterStr() {
		return createrStr;
	}

	public void setCreaterStr(String createrStr) {
		this.createrStr = createrStr;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
