package com.saturn.workflow;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class FlowFormItem {
	private String id;
	private String flowId;

	private String name;
	private String showName;
	private String defaultValue;

	private String min;
	private String max;
	private String regex;
	private String regexName;
	private String focusTip;
	private String func;

	private String dict;
	private String type;
	private String typeName;
	private String render;

	
	private String state;
	private static ORMapping<FlowFormItem> mapping = new ResultORMapping<FlowFormItem>();

	public static int add(FlowFormItem vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()

		if (getByName(vo.getName(), vo.getFlowId()) != null) {
			return 0;
		}

		return SimpleDaoTemplate
				.update("INSERT INTO wf_form_item(name, showName, defaultValue, flowId, min, max, regex, regexName, focusTip, func, dict, type, typeName, render) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.getName(), vo.getShowName(), vo.getDefaultValue(),
						vo.getFlowId(), vo.getMin(), vo.getMax(),
						vo.getRegex(), vo.getRegexName(), vo.getFocusTip(),
						vo.getFunc(), vo.getDict(), vo.getType(),
						vo.getTypeName(), vo.getRender());
	}

	public static int edit(FlowFormItem vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE wf_form_item SET name = ?, showName = ?, defaultValue = ?, flowId = ?, min = ?, max = ?, regex = ?, regexName = ?, focusTip = ?, func = ?, dict = ?, type = ?, typeName = ?, render = ? WHERE id = ?",
						vo.getName(), vo.getShowName(), vo.getDefaultValue(),
						vo.getFlowId(), vo.getMin(), vo.getMax(),
						vo.getRegex(), vo.getRegexName(), vo.getFocusTip(),
						vo.getFunc(), vo.getDict(), vo.getType(),
						vo.getTypeName(), vo.getRender(), vo.getId());
	}

	public static FlowFormItem get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_form_item WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FlowFormItem.class);
	}

	public static FlowFormItem getByName(String name, String flowId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM wf_form_item WHERE 1 = 1 and name = '" + name
						+ "' and flowId = " + flowId, null, mapping,
				FlowFormItem.class);
	}

	public static List<FlowFormItem> getList(String flowId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM wf_form_item WHERE 1 = 1 and flowId = " + flowId
						+ " order by id asc", null, mapping,
				FlowFormItem.class);
	}
	
	public static List<FlowFormItem> getListWithState(String flowId, String nodeId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT item.*, state.state FROM wf_form_item as item, wf_node_item_state as state WHERE 1 = 1 and state.itemName = item.name and state.flowId = item.flowId and state.flowId = " + flowId + " and state.nodeId = " + nodeId
						+ " order by id asc", null, mapping,
				FlowFormItem.class);
	}
	
	public static List<FlowFormItem> getHiddenItem(String flowId, String nodeId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT item.*, state.state FROM wf_form_item as item, wf_node_item_state as state WHERE 1 = 1 and state.state = '隐藏' and state.itemName = item.name and state.flowId = item.flowId and state.flowId = " + flowId + " and state.nodeId = " + nodeId
						+ " order by id asc", null, mapping,
				FlowFormItem.class);
	}
	
	public static List<FlowFormItem> getNotHiddenItem(String flowId, String nodeId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT item.*, state.state FROM wf_form_item as item, wf_node_item_state as state WHERE 1 = 1 and state.state <> '隐藏' and state.itemName = item.name and state.flowId = item.flowId and state.flowId = " + flowId + " and state.nodeId = " + nodeId
						+ " order by id asc", null, mapping,
				FlowFormItem.class);
	}

	public static ListData<FlowFormItem> getAll(FlowFormItem vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM wf_form_item WHERE 1 = 1 and flowId = "
						+ vo.getFlowId() + " ", new DymaticCondition()
						.addSimpleCondition(vo, "name", "showName")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, FlowFormItem.class, start, offset);
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM wf_form_item WHERE id = ?", id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public static void change(final String firstId, final String secondId) {
		SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				FlowFormItem i1 = get(firstId);
				FlowFormItem i2 = get(secondId);

				String name1 = i1.getName();
				String name2 = i2.getName();

				SimpleDaoTemplate.update(connection,
						"UPDATE wf_form_item SET id = ? WHERE name = ?", "-1",
						name2);

				SimpleDaoTemplate.update(connection,
						"UPDATE wf_form_item SET id = ? WHERE name = ?",
						secondId, name1);

				SimpleDaoTemplate.update(connection,
						"UPDATE wf_form_item SET id = ? WHERE name = ?",
						firstId, name2);

				return 0;
			}
		});
	}
	
	public static int createTable(final String sql) {
		String[] sqls = sql.split(";");

		for (String s : sqls) {
			SimpleDaoTemplate.update(s);
		}
		
		return 1;
	}

	public static String getCreateTableSql(String id) {
		WorkFlow workflow = WorkFlow.get(id);
		String tableName = WorkFlow.WORKFLOW_FOMR_TABLE_PRE
				+ workflow.getName();

		List<FlowFormItem> items = FlowFormItem.getList(id);
		StringBuffer buffer = new StringBuffer();
		buffer.append("DROP TABLE IF EXISTS `" + tableName + "`;\n");
		buffer.append("CREATE TABLE `").append(tableName).append("`(\n");
		buffer.append("\t`id` int(11) NOT NULL AUTO_INCREMENT,\n");
		buffer.append("\t`instanceId` int(11) NOT NULL,\n");
		if (items != null) {
			int size = items.size();
			for (int i = 0; i < size; ++i) {
				FlowFormItem item = items.get(i);
					buffer.append("\t`").append(item.getName()).append("` ")
							.append("varchar(").append(item.getMax()).append(") ");

				buffer.append("DEFAULT ");
				String value = item.getDefaultValue();
				if (value == null) {
					buffer.append("NULL,");
				} else {
					buffer.append("'").append(value).append("',");
				}
				buffer.append('\n');
			}
		}

		buffer.append("\tPRIMARY KEY (`id`)");

		buffer.append("\n) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;");
		return buffer.toString();
	}

	public FlowFormItem() {

	}

	public FlowFormItem(String id, String flowId, String name, String showName,
			String defaultValue, String min, String max, String regex,
			String regexName, String focusTip, String func, String dict,
			String type, String typeName, String render) {
		super();
		this.id = id;
		this.flowId = flowId;
		this.name = name;
		this.showName = showName;
		this.defaultValue = defaultValue;
		this.min = min;
		this.max = max;
		this.regex = regex;
		this.regexName = regexName;
		this.focusTip = focusTip;
		this.func = func;
		this.dict = dict;
		this.type = type;
		this.typeName = typeName;
		this.render = render;
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

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getMax() {
		return max;
	}

	public void setMax(String max) {
		this.max = max;
	}

	public String getRegex() {
		return regex;
	}

	public void setRegex(String regex) {
		this.regex = regex;
	}

	public String getRegexName() {
		return regexName;
	}

	public void setRegexName(String regexName) {
		this.regexName = regexName;
	}

	public String getFocusTip() {
		return focusTip;
	}

	public void setFocusTip(String focusTip) {
		this.focusTip = focusTip;
	}

	public String getFunc() {
		return func;
	}

	public void setFunc(String func) {
		this.func = func;
	}

	public String getDict() {
		return dict;
	}

	public void setDict(String dict) {
		this.dict = dict;
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

	public String getRender() {
		return render;
	}

	public void setRender(String render) {
		this.render = render;
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
