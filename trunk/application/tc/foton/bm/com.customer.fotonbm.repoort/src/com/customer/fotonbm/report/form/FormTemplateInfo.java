package com.customer.fotonbm.report.form;

import java.util.HashMap;
import java.util.Map;

/**
 * Form模板描述对象
 * 
 * @author LeslieGu
 */
public class FormTemplateInfo {
	
	private String key;//form模板key
	
	private String description;//描述
	
	private Map<String, FormPropertyInfo> properties = new HashMap<String, FormPropertyInfo>();
	
	public FormTemplateInfo(String key, String description, Map<String, FormPropertyInfo> properties) {
		this.key = key;
		this.description = description;
		this.properties = properties;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Map<String, FormPropertyInfo> getProperties() {
		return properties;
	}
	
	public FormPropertyInfo getProperty(String key) {
		return this.properties.get(key);
	}

	public void setProperties(Map<String, FormPropertyInfo> properties) {
		this.properties = properties;
	}

	@Override
	public String toString() {
		return this.key + ", " + this.description + ", " + this.properties;
	}
}
