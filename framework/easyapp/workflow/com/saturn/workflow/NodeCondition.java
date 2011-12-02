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

public class NodeCondition {

	private String id;
	private String nodeId;

	private String model;
	private String modelName;
	private String type;
	private String typeName;
	private String value;
	private String valueName;

	private String sign;

	private static ORMapping<NodeCondition> mapping = new ResultORMapping<NodeCondition>();

	
	public static int add(NodeCondition vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_node_condition(nodeId, model, modelName, type, typeName, value, valueName, sign) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getNodeId(),
				vo.getModel(),
				vo.getModelName(),
				vo.getType(),
				vo.getTypeName(),
				vo.getValue(),
				vo.getValueName(),
				vo.getSign()
		);
	}
	
	public static int edit(NodeCondition vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_node_condition SET nodeId = ?, model = ?, modelName = ?, type = ?, typeName = ?, value = ?, valueName = ?, sign = ? WHERE id = ?", 
				vo.getNodeId(),
				vo.getModel(),
				vo.getModelName(),
				vo.getType(),
				vo.getTypeName(),
				vo.getValue(),
				vo.getValueName(),
				vo.getSign(),
				vo.getId()
		);
	}
	
	public static NodeCondition get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_node_condition WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, NodeCondition.class);
	}

	
	public static ListData<NodeCondition> getAll(NodeCondition vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_node_condition WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "nodeId")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, NodeCondition.class, start, offset);
	}
	
	
	public static List<NodeCondition> getList(String nodeId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_node_condition WHERE 1 = 1 AND nodeId = " + nodeId,
				null, 
				mapping, NodeCondition.class);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_node_condition WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public NodeCondition() {
		super();
	}


	public NodeCondition(String id, String nodeId, String model,
			String modelName, String type, String typeName, String value,
			String valueName, String sign) {
		super();
		this.id = id;
		this.nodeId = nodeId;
		this.model = model;
		this.modelName = modelName;
		this.type = type;
		this.typeName = typeName;
		this.value = value;
		this.valueName = valueName;
		this.sign = sign;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getValueName() {
		return valueName;
	}

	public void setValueName(String valueName) {
		this.valueName = valueName;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
