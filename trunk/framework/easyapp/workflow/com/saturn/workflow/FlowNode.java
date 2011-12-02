package com.saturn.workflow;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class FlowNode {

	private String id;
	private String flowId;
	private String name;

	private String type;// create, approve(回退), process, realize(结束)
	private String typeName;
	
	private String conditonStr;
	private String nextNodeStr;
	
	
	private static ORMapping<FlowNode> mapping = new ResultORMapping<FlowNode>();
	
	private static ORMapping<FlowNode> mappingDetail = new ResultORMapping<FlowNode>() {
		@Override
		public void mappingResult(ResultSet rs, FlowNode t) throws SQLException {
			super.mappingResult(rs, t);
			
			List<NodeCondition> conditions = NodeCondition.getList(t.getId());
			
			StringBuffer buffer = new StringBuffer();
			if (!conditions.isEmpty()) {
				for (NodeCondition condition : conditions) {
					buffer.append(condition.getModelName()).append("/").append(condition.getTypeName()).append("/").append(condition.getValueName()).append("; ");
				}
				
				t.setConditonStr(buffer.toString());
			} else {
				t.setConditonStr("");
			}
			
			List<FlowLine> lines = FlowLine.getList(t.getFlowId(), t.getId());
			
			buffer = new StringBuffer();
			if (!lines.isEmpty()) {
				for (FlowLine line : lines) {
					buffer.append(line.getEndName()).append(";");
				}
				
				t.setNextNodeStr(buffer.toString());
			} else {
				t.setNextNodeStr("");
			}
		}
	};

	public static int add(FlowNode vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_node(flowId, name, type, typeName) VALUES(?, ?, ?, ?)", 
				vo.getFlowId(),
				vo.getName(),
				vo.getType(),
				vo.getTypeName()
		);
	}
	
	public static int edit(FlowNode vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_node SET flowId = ?, name = ?, type = ?, typeName = ? WHERE id = ?", 
				vo.getFlowId(),
				vo.getName(),
				vo.getType(),
				vo.getTypeName(),
				vo.getId()
		);
	}
	
	public static FlowNode get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_node WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FlowNode.class);
	}
	
	public static ListData<FlowNode> getAll(FlowNode vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_node WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name", "type", "flowId")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
						mappingDetail, FlowNode.class, start, offset);
	}
	
	public static List<FlowNode> getByFlowId(String flowId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_node WHERE 1 = 1 AND flowId = " + flowId,
				null,
				mapping, FlowNode.class);
	}
	
	public static FlowNode getByName(String name, String flowId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne("SELECT * FROM wf_node WHERE 1 = 1 AND name = '" + name + "' AND flowId = " + flowId,
				null,
				mapping, FlowNode.class);
	}
	
	public static FlowNode getStartNode(String flowId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne("SELECT * FROM wf_node WHERE 1 = 1 AND type = 'flow.node.create' AND flowId = " + flowId,
				null,
				mapping, FlowNode.class);
	}
	
	public static String getJSONNodes(String flowId) {
		List<FlowNode> nodes = getByFlowId(flowId);
		
		StringBuffer buffer = new StringBuffer("[");

		for (FlowNode node : nodes) {
			buffer.append("{\"id\":\"").append(node.getId()).append("\", \"text\":\"")
					.append(node.getName()).append("\"},");
		}
		if (!nodes.isEmpty()) {
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]");

		return buffer.toString();
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_node WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public FlowNode() {
		// TODO Auto-generated constructor stub
	}

	public FlowNode(String id, String flowId, String name, String type,
			String typeName) {
		super();
		this.id = id;
		this.flowId = flowId;
		this.name = name;
		this.type = type;
		this.typeName = typeName;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getConditonStr() {
		return conditonStr;
	}

	public void setConditonStr(String conditonStr) {
		this.conditonStr = conditonStr;
	}

	public String getNextNodeStr() {
		return nextNodeStr;
	}

	public void setNextNodeStr(String nextNodeStr) {
		this.nextNodeStr = nextNodeStr;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
