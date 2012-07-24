package com.saturn.system.easyform;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Table {

	private String id;
	private String name;
	private String showName;

	private static ORMapping<Table> mapping = new ResultORMapping<Table>();

	public static int add(Table vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO app_table(name, showName) VALUES(?, ?)",
						vo.getName(), vo.getShowName());
	}

	public static int edit(Table vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE app_table SET name = ?, showName = ? WHERE id = ?",
						vo.getName(), vo.getShowName(),
						vo.getId());
	}

	public static Table get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_table WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Table.class);
	}

	public static Table getByName(String name) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.queryOne("SELECT * FROM app_table WHERE 1 = 1 and name = '"
						+ name + "'", null, mapping, Table.class);
	}

	public static ListData<Table> getAll(Table vo, String start, String offset,
			String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_table WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name",
						"showName").addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, Table.class, start, offset);
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM app_table WHERE id = ?",
				id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public static int createTable(final String sql) {
		String[] sqls = sql.split(";");

		for (String s : sqls) {
			SimpleDaoTemplate.update(s);
		}
		
		return 1;
	}

	public static String getCreateTableSql(String id) {
		Table table = Table.get(id);

		List<TableColumn> columns = TableColumn.getList(id);
		StringBuffer buffer = new StringBuffer();
		buffer.append("DROP TABLE IF EXISTS `" + table.getName() + "`;\n");
		buffer.append("CREATE TABLE `").append(table.getName()).append("`(\n");
		buffer.append("\t`id` int(11) NOT NULL AUTO_INCREMENT,\n");
		if (columns != null) {
			int size = columns.size();
			for (int i = 0; i < size; ++i) {
				TableColumn column = columns.get(i);
				buffer.append("\t`").append(column.getName()).append("` ")
						.append(column.getTypeName()).append("(")
						.append(column.getLength()).append(") ");

				buffer.append("DEFAULT ");
				String value = column.getDefaultValue();
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

	public Table() {
		super();
	}

	public Table(String id, String name, String showName) {
		super();
		this.id = id;
		this.name = name;
		this.showName = showName;
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

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
