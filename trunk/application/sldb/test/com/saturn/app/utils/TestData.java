package com.saturn.app.utils;

import org.json.JSONObject;

public class TestData {
	private String id;
	private String name;

	public TestData() {
		super();
	}

	public TestData(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
