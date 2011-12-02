package com.saturn.workflow;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class FlowLine {

	private String id;
	private String flowId;
	private String name;

	private String startId;
	private String startName;
	private String endId;
	private String endName;

	private String reject;// 是否回退
	private String express;// 表达式
	
	private static ORMapping<FlowLine> mapping = new ResultORMapping<FlowLine>();
	
	public static int add(FlowLine vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO wf_line(flowId, name, startId, startName, endId, endName, reject, express) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getFlowId(),
				vo.getName(),
				vo.getStartId(),
				vo.getStartName(),
				vo.getEndId(),
				vo.getEndName(),
				vo.getReject(),
				vo.getExpress()
		);
	}
	
	public static int edit(FlowLine vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE wf_line SET flowId = ?, name = ?, startId = ?, startName = ?, endId = ?, endName = ?, reject = ?, express = ? WHERE id = ?", 
				vo.getFlowId(),
				vo.getName(),
				vo.getStartId(),
				vo.getStartName(),
				vo.getEndId(),
				vo.getEndName(),
				vo.getReject(),
				vo.getExpress(),
				vo.getId()
		);
	}
	
	public static FlowLine get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_line WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FlowLine.class);
	}
	
	public static ListData<FlowLine> getAll(FlowLine vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_line WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name", "flowId")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, FlowLine.class, start, offset);
	}
	
	
	public static List<FlowLine> getList(String flowId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_line WHERE 1 = 1 AND flowId = " + flowId,
				null,
				mapping, FlowLine.class);
	}
	
	public static List<FlowLine> getList(String flowId, String startId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM wf_line WHERE 1 = 1 AND flowId = " + flowId + " AND startId = " + startId,
				null,
				mapping, FlowLine.class);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM wf_line WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public FlowLine() {
		super();
	}


	public FlowLine(String id, String flowId, String name, String startId,
			String startName, String endId, String endName, String reject,
			String express) {
		super();
		this.id = id;
		this.flowId = flowId;
		this.name = name;
		this.startId = startId;
		this.startName = startName;
		this.endId = endId;
		this.endName = endName;
		this.reject = reject;
		this.express = express;
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

	public String getStartId() {
		return startId;
	}

	public void setStartId(String startId) {
		this.startId = startId;
	}

	
	public String getStartName() {
		return startName;
	}

	public void setStartName(String startName) {
		this.startName = startName;
	}

	public String getEndId() {
		return endId;
	}

	public void setEndId(String endId) {
		this.endId = endId;
	}

	public String getEndName() {
		return endName;
	}

	public void setEndName(String endName) {
		this.endName = endName;
	}

	public String getReject() {
		return reject;
	}

	public void setReject(String reject) {
		this.reject = reject;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
