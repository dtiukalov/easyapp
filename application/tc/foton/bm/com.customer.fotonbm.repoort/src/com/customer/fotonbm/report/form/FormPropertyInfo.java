package com.customer.fotonbm.report.form;

/**
 * Form模板property描述对象
 * 
 * @author LeslieGu
 */
public class FormPropertyInfo {
	public static final String TYPE_STRING = "string";
	
	public static final String TYPE_IMAGE = "image";
	
	private String key; //属性key
	
	private String type; //属性类型
	
	private String defaultValue; //默认值

	public FormPropertyInfo(String key, String type, String defaultValue) {
		super();
		this.key = key;
		this.type = type;
		this.defaultValue = defaultValue;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return this.key + ", " + this.type + ", " + this.defaultValue;
	}
}
