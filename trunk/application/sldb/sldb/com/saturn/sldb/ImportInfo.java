package com.saturn.sldb;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class ImportInfo {
	
	private String id;
	
	private String name;
	
	private String tableName;
	
	private String startLine;
	
	private String desc;
	
	private static ORMapping<ImportInfo> mapping = new ResultORMapping<ImportInfo>();
	
	public static int add(ImportInfo vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO sldb_import_info(name, tableName, startLine, `desc`) VALUES(?, ?, ?, ?)", 
				vo.getName(),
				vo.getTableName(),
				vo.getStartLine(),
				vo.getDesc()
		);
	}
	
	public static int edit(ImportInfo vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE sldb_import_info SET name = ?, tableName = ?, startLine = ?, `desc` = ? WHERE id = ?", 
				vo.getName(),
				vo.getTableName(),
				vo.getStartLine(),
				vo.getDesc(),
				vo.getId()
		);
	}

	public static ImportInfo get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_import_info WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, ImportInfo.class);
	}
	
	
	public static ListData<ImportInfo> getAll(ImportInfo vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM sldb_import_info WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "name")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, ImportInfo.class, start, offset);
	}
	
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM sldb_import_info WHERE id = ?", id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public ImportInfo() {
		super();
	}


	public ImportInfo(String id, String name, String tableName,
			String startLine, String desc) {
		super();
		this.id = id;
		this.name = name;
		this.tableName = tableName;
		this.startLine = startLine;
		this.desc = desc;
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

	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getStartLine() {
		return startLine;
	}

	public void setStartLine(String startLine) {
		this.startLine = startLine;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
