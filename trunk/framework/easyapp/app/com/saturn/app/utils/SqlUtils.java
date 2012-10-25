package com.saturn.app.utils;

public class SqlUtils {
	
	private SqlUtils() {
		
	}
	
	public static String getInsertSql(String table, String[] fields) {
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("INSERT INTO ").append(table).append("(");
		buffer.append(getFieldStr(", ", fields)).append(") VALUES (");
		buffer.append(getString("?", fields.length)).append(")");
		
		return buffer.toString();
	}
	
	public static String getUpdateSql(String table, String[] fields) {
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("UPDATE ").append(table).append(" SET ");
		buffer.append(getFieldStr(" = ?, ", fields)).append(" = ? WHERE id = ?");
		
		return buffer.toString();
	}
	
	public static String getDeleteSql(String table) {
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("DELETE FROM ").append(table).append(" WHERE id = ?");
		
		return buffer.toString();
	}
	
	public static String getSelectSql(String table) {
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("SELECT * FROM ").append(table).append(" WHERE 1 = 1 ");
		
		return buffer.toString();
	}
	
	private static String getString(String c, int num) {
		StringBuffer buffer = new StringBuffer();
		
		for (int i = 0; i < num; ++i) {
			if (i != num -1) {
				buffer.append(c).append(", ");
			} else {
				buffer.append(c);
			}
		}
		
		return buffer.toString();
	}
	
	private static String getFieldStr(String delimiter, String ...fields) {
		StringBuffer buffer = new StringBuffer();
		
		for (int i = 0; i < fields.length; ++i) {
			String field = fields[i];
			if (i != fields.length -1) {
				buffer.append('`').append(field).append('`').append(delimiter);
			} else {
				buffer.append('`').append(field).append('`');
			}
		}
		
		return buffer.toString();

	}
}
