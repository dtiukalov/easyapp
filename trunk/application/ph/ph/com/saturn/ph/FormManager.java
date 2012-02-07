package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

import com.saturn.ph.form.Form152;
import com.saturn.ph.form.FormTest;

public class FormManager {
	
	private static Map<String, Form> forms = new HashMap<String, Form>();

	static {
		inital();
	}
	
	private FormManager() {
	}
	
	public static Map<String, Object> getFormValue(String type, String uid, boolean refresh) {
		if (forms.containsKey(type)) {
			return forms.get(type).getValue(uid, refresh);
		}
		
		return new HashMap<String, Object>();
	}
	
	public static String getJspPath(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getJspPath();
		}
		
		return "/ph/index.jsp";
	}
	
	public static void add(Form form) {
		forms.put(form.getType(), form);
	}
	
	private static void inital() {
		add(new Form152());
		add(new FormTest());
	}
}
