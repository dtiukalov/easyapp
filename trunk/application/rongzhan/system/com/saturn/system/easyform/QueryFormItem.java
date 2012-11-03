package com.saturn.system.easyform;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class QueryFormItem {

	private String id;
	private String name;
	private String showName;

	private String tableId;

	private String condition;
	private String conditionName;
	private String hidden;
	private String hiddenName;
	private String sort;
	private String sortName;

	private String width;
	private String format;

	private String dict;
	private String type;
	private String typeName;

	private static ORMapping<QueryFormItem> mapping = new ResultORMapping<QueryFormItem>();

	public static int add(QueryFormItem vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()

		if (getByName(vo.getName(), vo.getTableId()) != null) {
			return 0;
		}

		return SimpleDaoTemplate
				.update("INSERT INTO app_queryform_item(name, showName, tableId, `condition`, conditionName, hidden, hiddenName, sort, sortName, width, format, dict, type, typeName) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.getName(), vo.getShowName(), vo.getTableId(),
						vo.getCondition(), vo.getConditionName(),
						vo.getHidden(), vo.getHiddenName(), vo.getSort(),
						vo.getSortName(), vo.getWidth(), vo.getFormat(),
						vo.getDict(), vo.getType(), vo.getTypeName());
	}

	public static int edit(QueryFormItem vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE app_queryform_item SET name = ?, showName = ?, tableId = ?, `condition` = ?, conditionName = ?, hidden = ?, hiddenName = ?, sort = ?, sortName = ?, width = ?, format = ?, dict = ?, type = ?, typeName = ? WHERE id = ?",
						vo.getName(), vo.getShowName(), vo.getTableId(),
						vo.getCondition(), vo.getConditionName(),
						vo.getHidden(), vo.getHiddenName(), vo.getSort(),
						vo.getSortName(), vo.getWidth(), vo.getFormat(),
						vo.getDict(), vo.getType(), vo.getTypeName(),
						vo.getId());
	}

	public static QueryFormItem get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and id = '" + id
						+ "'", null, mapping, QueryFormItem.class);
	}

	public static QueryFormItem getByName(String name, String tableId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and name = '"
						+ name + "'and tableId = '" + tableId + "'", null,
				mapping, QueryFormItem.class);
	}

	public static ListData<QueryFormItem> getAll(QueryFormItem vo,
			String start, String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and tableId = " + vo.getTableId() + " ",
				new DymaticCondition().addSimpleCondition(vo,
						"name", "showName").addCondition("ORDER BY {0} {1}",
						orderBy, order), mapping, QueryFormItem.class, start,
				offset);
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM app_queryform_item WHERE id = ?", id);
	}

	public static List<QueryFormItem> getList(String tableId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and tableId = "
						+ tableId + " order by id asc", null, mapping, QueryFormItem.class);
	}
	
	public static List<QueryFormItem> getConditonItem(String tableId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and `condition` = 'boolean.true' and tableId = "
						+ tableId + " order by id asc", null, mapping, QueryFormItem.class);
	}
	
	public static List<QueryFormItem> getNotHiddenItem(String tableId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_queryform_item WHERE 1 = 1 and hidden = 'visible.true' and tableId = "
						+ tableId + " order by id asc", null, mapping, QueryFormItem.class);
	}

	public static void createItemForTable(String tableId) {
		List<TableColumn> columns = TableColumn.getList(tableId);

		for (TableColumn column : columns) {
			String columnName = column.getName();
			String columnShowName = column.getShowName();

			QueryFormItem item = new QueryFormItem(null, columnName,
					columnShowName, tableId, "boolean.true", "是",
					"visible.true", "显示", "boolean.true", "是", "50", "return value;", "",
					"form.type.input", "输入框");
			add(item);
		}
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public static int hidden(String id) {
		QueryFormItem vo = get(id);
		String hidden = vo.getHidden();
		
		if ("visible.true".equals(hidden)) {
			vo.setHidden("visible.false");
			vo.setHiddenName("隐藏");
		} else {
			vo.setHidden("visible.true");
			vo.setHiddenName("显示");
		}
		
		return edit(vo);
	}
	
	public static int condition(String id) {
		QueryFormItem vo = get(id);
		String condtion = vo.getCondition();
		
		if ("boolean.true".equals(condtion)) {
			vo.setCondition("boolean.false");
			vo.setConditionName("否");
		} else {
			vo.setCondition("boolean.true");
			vo.setConditionName("是");
		}
		
		return edit(vo);
	}
	
	public static int sort(String id) {
		QueryFormItem vo = get(id);
		String sort = vo.getSort();
		
		if ("boolean.true".equals(sort)) {
			vo.setSort("boolean.false");
			vo.setSortName("否");
		} else {
			vo.setSort("boolean.true");
			vo.setSortName("是");
		}
		
		return edit(vo);
	}
	
	public static void change(final String firstId, final String secondId) {
		SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				QueryFormItem i1 = get(firstId);
				QueryFormItem i2 = get(secondId);
				
				String name1 = i1.getName();
				String name2 = i2.getName();
				
				SimpleDaoTemplate.update(connection,
					"UPDATE app_queryform_item SET id = ? WHERE name = ?", 
					"-1",
					name2
				);
					
				SimpleDaoTemplate.update(connection,
					"UPDATE app_queryform_item SET id = ? WHERE name = ?", 
					secondId,
					name1
				);
				
				SimpleDaoTemplate.update(connection,
					"UPDATE app_queryform_item SET id = ? WHERE name = ?", 
					firstId,
					name2
				);
				
				return 0;
			}
		});
	}

	public QueryFormItem() {
	}

	public QueryFormItem(String id, String name, String showName,
			String tableId, String condition, String conditionName,
			String hidden, String hiddenName, String sort, String sortName,
			String width, String format,
			String dict, String type, String typeName) {
		super();
		this.id = id;
		this.name = name;
		this.showName = showName;
		this.tableId = tableId;
		this.condition = condition;
		this.conditionName = conditionName;
		this.hidden = hidden;
		this.hiddenName = hiddenName;
		this.sort = sort;
		this.sortName = sortName;
		this.width = width;
		this.format = format;
		this.dict = dict;
		this.type = type;
		this.typeName = typeName;
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

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getConditionName() {
		return conditionName;
	}

	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}

	public String getHidden() {
		return hidden;
	}

	public void setHidden(String hidden) {
		this.hidden = hidden;
	}

	public String getHiddenName() {
		return hiddenName;
	}

	public void setHiddenName(String hiddenName) {
		this.hiddenName = hiddenName;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
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

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
