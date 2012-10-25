package com.saturn.system;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.SqlUtils;

public class Dict {
	
	private static final String[] fields = BeanUtils.getFields(Dict.class, "id");
	private static final String TABLE_NAME = "app_dict";
	
	private String id;
	private String key;
	private String value;
	private String type;
	private String pinyin;

	private static ORMapping<Dict> mapping = new ResultORMapping<Dict>();

	public static int add(Dict vo) {
		return SimpleDaoTemplate.update(
				SqlUtils.getInsertSql(TABLE_NAME, fields), BeanUtils.getFieldValues(vo, fields, (String)null));
	}

	public static Dict get(String id) {
		return SimpleDaoTemplate.queryOne(
				SqlUtils.getSelectSql(TABLE_NAME) + " AND id = " + id,
				null, mapping, Dict.class);
	}

	public static int edit(Dict vo) {
		return SimpleDaoTemplate
				.update(SqlUtils.getUpdateSql(TABLE_NAME, fields),
						BeanUtils.getFieldValues(vo, fields, "id"));
	}

	public static ListData<Dict> getDicts(Dict vo, String start,
			String offset, String orderBy, String order) {

		return SimpleDaoTemplate.query(
				SqlUtils.getSelectSql(TABLE_NAME), new DymaticCondition()
				.addSimpleCondition(vo, "key", "value", "pinyin").addCondition(" AND type = '?'", vo.type)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Dict.class, start, offset);
	}
	
	public static List<StringBuffer> getAllDictType() {
		return SimpleDaoTemplate.query("SELECT distinct(type) as typeStr from app_dict order by type", null,
				new ORMapping<StringBuffer>() {
					
					@Override
					public void mappingResult(ResultSet rs, StringBuffer t)
							throws SQLException {
					
						t.append(rs.getString("typeStr"));
					}
		}, StringBuffer.class);
	}
	
	public static void change(final String firstId, final String secondId) {
		SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				Dict i1 = get(firstId);
				Dict i2 = get(secondId);

				String key1 = i1.key;
				String key2 = i2.key;

				SimpleDaoTemplate.update(connection,
						"UPDATE app_dict SET id = ? WHERE `key` = ? AND type = ?", "-1",
						key2, i2.type);

				SimpleDaoTemplate.update(connection,
						"UPDATE app_dict SET id = ? WHERE `key` = ? AND type = ?",
						secondId, key1, i1.type);

				SimpleDaoTemplate.update(connection,
						"UPDATE app_dict SET id = ? WHERE `key` = ? AND type = ?",
						firstId, key2, i2.type);

				return 0;
			}
		});
	}
	
	public static List<Dict> getDictByType(String type) {
		return SimpleDaoTemplate.query(SqlUtils.getSelectSql(TABLE_NAME),
				new DymaticCondition().addCondition("AND type = '?' order by id desc", type),
				mapping, Dict.class);
	}
	
	public static String getDictJSONByType(String type) {
		List<Dict> vos = getDictByType(type);
		
		StringBuffer buffer = new StringBuffer("[");

		for (Dict vo : vos) {
			buffer.append("{\"id\":\"").append(vo.key).append("\", \"text\":\"")
					.append(vo.value).append("\", \"name\":\"")
					.append(vo.value).append("\"},");
		}
		if (!vos.isEmpty()) {
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]");

		return buffer.toString();
	}
	
	public static String getAllTypeJSON() {
		List<StringBuffer> datas = getAllDictType();
		StringBuffer buffer = new StringBuffer("[");

		for (int i = 0; i < datas.size(); ++i) {
			Object data = datas.get(i);
			buffer.append("{\"id\":\"").append(data).append("\", \"text\":\"")
					.append(data).append("\"},");
		}

		if (!datas.isEmpty()) {
			buffer.deleteCharAt(buffer.length() - 1);
		}
		buffer.append("]");

		return buffer.toString();
	}

	public static int remove(final String id) {
		return SimpleDaoTemplate
				.update(SqlUtils.getDeleteSql(TABLE_NAME), id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public Dict() {
	}

	public Dict(String id, String key, String value, String type, String pinyin) {
		super();
		this.id = id;
		this.key = key;
		this.value = value;
		this.type = type;
		this.pinyin = pinyin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
