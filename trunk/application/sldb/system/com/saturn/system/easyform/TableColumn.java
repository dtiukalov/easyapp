package com.saturn.system.easyform;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class TableColumn {

	private String id;
	private String name;
	private String showName;

	private String tableId;

	private String type;
	private String typeName;
	private String length;
	private String defaultValue;

	private static ORMapping<TableColumn> mapping = new ResultORMapping<TableColumn>();

	public static int add(TableColumn vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO app_table_column(name, showName, tableId, type, typeName, length, defaultValue) VALUES(?, ?, ?, ?, ?, ?, ?)",
						vo.getName(), vo.getShowName(), vo.getTableId(), vo.getType(), vo.getTypeName(),
						 vo.getLength(), vo.getDefaultValue()

				);
	}

	public static int edit(TableColumn vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE app_table_column SET name = ?, showName = ?, tableId = ?, type = ?, typeName = ?, length = ?, defaultValue = ? WHERE id = ?",
						vo.getName(), vo.getShowName(), vo.getTableId(), vo.getType(), vo.getTypeName(),
						vo.getLength(),
						vo.getDefaultValue(), vo.getId());
	}

	public static TableColumn get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_table_column WHERE 1 = 1 and id = '" + id
						+ "'", null, mapping, TableColumn.class);
	}

	public static TableColumn getByName(String name, String tableId) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_table_column WHERE 1 = 1 and name = '"
						+ name + "'and tableId = '" + tableId + "'", null, mapping, TableColumn.class);
	}

	public static ListData<TableColumn> getAll(TableColumn vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_table_column WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name",
						"showName", "tableId").addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, TableColumn.class, start, offset);
	}
	
	
	public static List<TableColumn> getList(String tableId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM app_table_column WHERE 1 = 1 and tableId = " + tableId,
				null,
				mapping, TableColumn.class);
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM app_table_column WHERE id = ?", id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public TableColumn() {
	}

	public TableColumn(String id, String name, String showName, String tableId,
			String type, String typeName, String length,
			String defaultValue) {
		super();
		this.id = id;
		this.name = name;
		this.showName = showName;
		this.tableId = tableId;
		this.type = type;
		this.typeName = typeName;
		this.length = length;
		this.defaultValue = defaultValue;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
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
