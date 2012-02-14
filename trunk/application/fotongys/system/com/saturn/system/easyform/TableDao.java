package com.saturn.system.easyform;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.LogManager;

@SuppressWarnings("rawtypes")
public class TableDao {
	private static Logger Logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private static ORMapping<HashMap> mapping = new ORMapping<HashMap>() {

		@SuppressWarnings("unchecked")//hashmap的类型检查
		@Override
		public void mappingResult(ResultSet rs, HashMap t) throws SQLException {
			try {
				ResultSetMetaData metaData = rs.getMetaData();
				
				if (metaData != null) {
					int size = metaData.getColumnCount();
					for (int i = 1; i <= size; ++i) {
						String name = metaData.getColumnName(i);
						
						try {
							String value = rs.getString(name);
							t.put(name, value);
						} catch (Exception e) {
							Logger.debug(e);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			Logger.debug("Result Mapping Object[" + t.getClass().getSimpleName() + "]:" + t);
		}
	};
	
	public static int add(Map vo, String tableId) {
		Table table = Table.get(tableId);
		List<TableColumn> columns = TableColumn.getList(tableId);
		
		int size = columns.size();

		if (size > 0) {
			String[] columnNames = new String[size];
			String[] values = new String[size];
			String[] quotes = new String[size];
			
			int i = 0;
			for (TableColumn column : columns) {
				columnNames[i] = "`" + column.getName() + "`";
				values[i] = (String)vo.get(column.getName());
				quotes[i] = "?";
				++i;
			}
			
			return SimpleDaoTemplate.update(
					"INSERT INTO " + table.getName() + "(" + getStr(columnNames) + ") VALUES(" + getStr(quotes)+ ")", values
			);
		}
		
		return 0;
	}
	
	public static int edit(Map vo, String tableId) {
		Table table = Table.get(tableId);
		List<TableColumn> columns = TableColumn.getList(tableId);
		
		int size = columns.size();

		if (size > 0) {
			String[] columnNames = new String[size];
			String[] values = new String[size];
			
			int i = 0;
			for (TableColumn column : columns) {
				columnNames[i] = "`" + column.getName() + "` = ?";
				values[i] = (String)vo.get(column.getName());
				++i;
			}
			
			return SimpleDaoTemplate.update(
					"UPDATE " + table.getName() + " SET " + getStr(columnNames) + " WHERE id = " + vo.get("id"), values
			);
		}
		
		return 0;
	}
	
	public static HashMap get(String tableId, String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		Table table = Table.get(tableId);
		String name = table.getName();
		
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM " + name + " WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, HashMap.class);
	}
	
	public static ListData<HashMap> getAll(Map vo, String tableId, String start,
			String offset, String orderBy, String order) {
		
		Table table = Table.get(tableId);
		String name = table.getName();
		
		List<QueryFormItem> items = QueryFormItem.getList(tableId);
		int size = items.size();
		
		List<String> conditions = new ArrayList<String>();
		for (QueryFormItem item : items) {
			if ("boolean.true".equals(item.getCondition())) {
				conditions.add(item.getName());
			}
		}
		
		return SimpleDaoTemplate.query("SELECT * FROM " + name + " WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, conditions.toArray(new String[size]))
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, HashMap.class, start, offset);
	}
	
	public static List<HashMap> getList(Map vo, String tableId) {
		
		Table table = Table.get(tableId);
		String name = table.getName();
		
		List<QueryFormItem> items = QueryFormItem.getList(tableId);
		int size = items.size();
		
		List<String> conditions = new ArrayList<String>();
		for (QueryFormItem item : items) {
			conditions.add(item.getName());
		}
		
		return SimpleDaoTemplate.query("SELECT * FROM " + name + " WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, conditions.toArray(new String[size])),
				mapping, HashMap.class);
	}
	
	public static int remove(final String tableId, final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		
		Table table = Table.get(tableId);
		final String name = table.getName();
		
		return SimpleDaoTemplate.update("DELETE FROM " + name + " WHERE id = ?",
				id);
	}
	
	public static void removes(final String tableId, String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(tableId, id);
			}
		}
	}
	
	public static String getStr(String[] vars) {
		StringBuffer buffer = new StringBuffer();
		for (String var : vars) {
			buffer.append(var).append(",");
		}
		
		buffer.deleteCharAt(buffer.length()-1);
		return buffer.toString();
	}
}
