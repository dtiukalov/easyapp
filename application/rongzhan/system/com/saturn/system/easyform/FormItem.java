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

public class FormItem {
	
	private String id;
	private String name;
	private String showName;
	private String defaultValue;
	
	private String tableId;

	private String required;
	private String requiredName;
	private String readonly;
	private String readonlyName;
	private String hidden;
	private String hiddenName;
	
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
	private String formType;
	
	private static ORMapping<FormItem> mapping = new ResultORMapping<FormItem>();
	
	
	public static int add(FormItem vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		
		if (getByName(vo.getName(), vo.getTableId(), vo.getFormType()) != null) {
			return 0;
		}
		
		return SimpleDaoTemplate.update(
				"INSERT INTO app_form_item(name, showName, defaultValue, tableId, required, requiredName, readonly, readonlyName, hidden, hiddenName, min, max, regex, regexName, focusTip, func, dict, type, typeName, render, formType) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getName(),
				vo.getShowName(),
				vo.getDefaultValue(),
				vo.getTableId(),
				vo.getRequired(),
				vo.getRequiredName(),
				vo.getReadonly(),
				vo.getReadonlyName(),
				vo.getHidden(),
				vo.getHiddenName(),
				vo.getMin(),
				vo.getMax(),
				vo.getRegex(),
				vo.getRegexName(),
				vo.getFocusTip(),
				vo.getFunc(),
				vo.getDict(),
				vo.getType(),
				vo.getTypeName(),
				vo.getRender(),
				vo.getFormType()
		);
	}
	
	public static int edit(FormItem vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE app_form_item SET name = ?, showName = ?, defaultValue = ?, tableId = ?, required = ?, requiredName = ?, readonly = ?, readonlyName = ?, hidden = ?, hiddenName = ?, min = ?, max = ?, regex = ?, regexName = ?, focusTip = ?, func = ?, dict = ?, type = ?, typeName = ?, render = ?, formType = ? WHERE id = ?", 
				vo.getName(),
				vo.getShowName(),
				vo.getDefaultValue(),
				vo.getTableId(),
				vo.getRequired(),
				vo.getRequiredName(),
				vo.getReadonly(),
				vo.getReadonlyName(),
				vo.getHidden(),
				vo.getHiddenName(),
				vo.getMin(),
				vo.getMax(),
				vo.getRegex(),
				vo.getRegexName(),
				vo.getFocusTip(),
				vo.getFunc(),
				vo.getDict(),
				vo.getType(),
				vo.getTypeName(),
				vo.getRender(),
				vo.getFormType(),
				vo.getId()
		);
	}
	
	public static FormItem get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_form_item WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, FormItem.class);
	}
	
	public static FormItem getByName(String name, String tableId, String formType) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM app_form_item WHERE 1 = 1 and name = '"
						+ name + "' and tableId = '" + tableId + "' and formType = '" + formType + "'", null,
				mapping, FormItem.class);
	}
	
	public static List<FormItem> getList(String tableId, String formType) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_form_item WHERE 1 = 1 and tableId = "
						+ tableId + " and formType = '" + formType + "' order by id asc", null, mapping, FormItem.class);
	}
	
	public static List<FormItem> getHiddenItem(String tableId, String formType) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_form_item WHERE 1 = 1 and hidden = 'visible.false' and tableId = "
						+ tableId + " and formType = '" + formType + "' order by id asc", null, mapping, FormItem.class);
	}
	
	public static List<FormItem> getNotHiddenItem(String tableId, String formType) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM app_form_item WHERE 1 = 1 and hidden = 'visible.true' and tableId = "
						+ tableId + " and formType = '" + formType + "' order by id asc", null, mapping, FormItem.class);
	}
	
	public static ListData<FormItem> getAll(FormItem vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM app_form_item WHERE 1 = 1 and tableId = " + vo.getTableId() + " ",
				new DymaticCondition().addSimpleCondition(vo, "name", "showName", "formType")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, FormItem.class, start, offset);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM app_form_item WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public static int hidden(String id) {
		FormItem vo = get(id);
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
	
	public static int readonly(String id) {
		FormItem vo = get(id);
		String hidden = vo.getReadonly();
		
		if ("boolean.true".equals(hidden)) {
			vo.setReadonly("boolean.false");
			vo.setReadonlyName("否");
		} else {
			vo.setReadonly("boolean.true");
			vo.setReadonlyName("是");
		}
		
		return edit(vo);
	}
	
	public static int required(String id) {
		FormItem vo = get(id);
		String hidden = vo.getRequired();
		
		if ("boolean.true".equals(hidden)) {
			vo.setRequired("boolean.false");
			vo.setRequiredName("否");
		} else {
			vo.setRequired("boolean.true");
			vo.setRequiredName("是");
		}
		
		return edit(vo);
	}
	
	public static void change(final String firstId, final String secondId) {
		SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				FormItem i1 = get(firstId);
				FormItem i2 = get(secondId);
				
				String name1 = i1.getName();
				String name2 = i2.getName();
				
				SimpleDaoTemplate.update(connection,
					"UPDATE app_form_item SET id = ? WHERE name = ?", 
					"-1",
					name2
				);
					
				SimpleDaoTemplate.update(connection,
					"UPDATE app_form_item SET id = ? WHERE name = ?", 
					secondId,
					name1
				);
				
				SimpleDaoTemplate.update(connection,
					"UPDATE app_form_item SET id = ? WHERE name = ?", 
					firstId,
					name2
				);
				
				return 0;
			}
		});
	}
	
	public static void createItemForTable(String tableId, String formType) {
		if (formType == null || "null".equals(formType)) {
			return;
		}
		
		List<TableColumn> columns = TableColumn.getList(tableId);

		for (TableColumn column : columns) {
			String columnName = column.getName();
			String columnShowName = column.getShowName();

			FormItem item = new FormItem(null, columnName, columnShowName, "", tableId, "boolean.true", "是", "boolean.false", "否", "visible.true", "显示", "0", "50", "", "", "请输入内容", "function() {this.isvalid=true;}", "", "form.type.input", "输入框", "", formType);
			add(item);
		}
	}
	
	public static void createItemFromForm(String tableId, String formType) {
		String otherType = null;
		if ("add".equals(formType)) {
			otherType = "edit";
		} else {
			otherType = "add";
		}
		
		if (formType == null || "null".equals(formType)) {
			return;
		}
		
		List<FormItem> columns = FormItem.getList(tableId, otherType);

		for (FormItem column : columns) {

			FormItem item = new FormItem(column);
			item.setFormType(formType);
			
			add(item);
		}
	}
	
	public FormItem() {
		
	}

	public FormItem(String id, String name, String showName,
			String defaultValue, String tableId, String required,
			String requiredName, String readonly, String readonlyName,
			String hidden, String hiddenName, String min, String max,
			String regex, String regexName, String focusTip, String func,
			String dict, String type, String typeName, String render,
			String formType) {
		super();
		this.id = id;
		this.name = name;
		this.showName = showName;
		this.defaultValue = defaultValue;
		this.tableId = tableId;
		this.required = required;
		this.requiredName = requiredName;
		this.readonly = readonly;
		this.readonlyName = readonlyName;
		this.hidden = hidden;
		this.hiddenName = hiddenName;
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
		this.formType = formType;
	}
	
	public FormItem(FormItem item) {
		this(item.id, item.name, item.showName,
			item.defaultValue, item.tableId, item.required,
			item.requiredName, item.readonly, item.readonlyName,
			item.hidden, item.hiddenName, item.min, item.max,
			item.regex, item.regexName, item.focusTip, item.func,
			item.dict, item.type, item.typeName, item.render,
			item.formType);
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

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}

	public String getRequiredName() {
		return requiredName;
	}

	public void setRequiredName(String requiredName) {
		this.requiredName = requiredName;
	}

	public String getReadonly() {
		return readonly;
	}

	public void setReadonly(String readonly) {
		this.readonly = readonly;
	}

	public String getReadonlyName() {
		return readonlyName;
	}

	public void setReadonlyName(String readonlyName) {
		this.readonlyName = readonlyName;
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

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}
	
	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
