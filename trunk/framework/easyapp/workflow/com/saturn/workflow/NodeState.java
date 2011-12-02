package com.saturn.workflow;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class NodeState {

	private String id;
	private String flowId;
	private String nodeId;
	private String itemName;
	private String state;
	
	private static ORMapping<NodeState> mapping = new ResultORMapping<NodeState>();
	
	public static int add(NodeState vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_node_item_state(flowId, nodeId, itemName, state) VALUES(?, ?, ?, ?)", 
				vo.getFlowId(),
				vo.getNodeId(),
				vo.getItemName(),
				vo.getState()
		);
	}
	
	private static int add(Connection connection, NodeState vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(connection,
				"INSERT INTO wf_node_item_state(flowId, nodeId, itemName, state) VALUES(?, ?, ?, ?)", 
				vo.getFlowId(),
				vo.getNodeId(),
				vo.getItemName(),
				vo.getState()
		);
	}
	
	public static List<NodeState> getList(String flowId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_node_item_state WHERE 1 = 1 AND flowId = " + flowId, null, 
				mapping, NodeState.class);
	}
	
	public static int addAll(final List<NodeState> vos) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				int count = 0;
				
				String flowId = vos.get(0).getFlowId();
				
				SimpleDaoTemplate.update(connection, "DELETE FROM wf_node_item_state WHERE flowId = ?",
						flowId);
				
				for (NodeState state : vos) {
					count += add(connection, state);
				}
				
				return count;
			}
		});
	}
	
	public static String getJSONList(String flowId) {
		List<NodeState> states = getList(flowId);
		
		return states.toString();
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_node_item_state WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public NodeState() {
		super();
	}

	public NodeState(String id, String flowId, String nodeId, String itemName,
			String state) {
		super();
		this.id = id;
		this.flowId = flowId;
		this.nodeId = nodeId;
		this.itemName = itemName;
		this.state = state;
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

	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
