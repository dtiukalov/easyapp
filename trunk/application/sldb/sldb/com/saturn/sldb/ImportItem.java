package com.saturn.sldb;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class ImportItem {

	private String id;

	private String name;
	private String type;

	private String infoId;
	private String colume;
	private String length;
	private String showLength;
	
	private static ORMapping<ImportItem> mapping = new ResultORMapping<ImportItem>();

	public static int add(ImportItem vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO sldb_import_item(name, type, infoId, colume, length, showLength) VALUES(?, ?, ?, ?, ?, ?)", 
				vo.getName(),
				vo.getType(),
				vo.getInfoId(),
				vo.getColume(),
				vo.getLength(),
				vo.getShowLength()
		);
	}
	
	public static int edit(ImportItem vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE sldb_import_item SET name = ?, type = ?, infoId = ?, colume = ?, length = ?, showLength = ? WHERE id = ?", 
				vo.getName(),
				vo.getType(),
				vo.getInfoId(),
				vo.getColume(),
				vo.getLength(),
				vo.getShowLength(),
				vo.getId()
		);
	}

	public static ImportItem get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_import_item WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, ImportItem.class);
	}
	
	public static ImportItem getByName(String name, String infoId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_import_item WHERE 1 = 1 and name = '" + name + "' and infoId = '" + infoId + "'",
				null, mapping, ImportItem.class);
	}
	
	public static ListData<ImportItem> getAll(ImportItem vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM sldb_import_item WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name", "infoId")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, ImportItem.class, start, offset);
	}
	
	
	public static List<ImportItem> getList(String infoId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM sldb_import_item WHERE infoId = " + infoId + " order by id asc",
				null,
				mapping, ImportItem.class);
	}
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM sldb_import_item WHERE id = ?", id);
	}

	public static void change(final String firstId, final String secondId) {
		SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				ImportItem i1 = get(firstId);
				ImportItem i2 = get(secondId);

				String name1 = i1.getName();
				String name2 = i2.getName();

				SimpleDaoTemplate.update(connection,
						"UPDATE sldb_import_item SET id = ? WHERE name = ?", "-1",
						name2);

				SimpleDaoTemplate.update(connection,
						"UPDATE sldb_import_item SET id = ? WHERE name = ?",
						secondId, name1);

				SimpleDaoTemplate.update(connection,
						"UPDATE sldb_import_item SET id = ? WHERE name = ?",
						firstId, name2);

				return 0;
			}
		});
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	public ImportItem() {
		super();
	}

	public ImportItem(String id, String name, String type, String infoId,
			String colume, String length) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.infoId = infoId;
		this.colume = colume;
		this.length = length;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfoId() {
		return infoId;
	}

	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}
	
	public String getColume() {
		return colume;
	}

	public void setColume(String colume) {
		this.colume = colume;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getShowLength() {
		return showLength;
	}

	public void setShowLength(String showLength) {
		this.showLength = showLength;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
