package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

import com.saturn.ph.form.Form152;
import com.saturn.ph.form.FormTest;
import com.saturn.ph.form.p1.FV9_12AktionspunkteForm;
import com.saturn.ph.form.p1.FV9_15ProgrammpunkteForm;
import com.saturn.ph.form.p4.FV9_44Dataset;

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
		
		return "/app/pep/index.jsp";
	}
	
	public static String getFormTitle(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getTitle();
		}
		
		return "";
	}
	
	public static void add(Form form) {
		forms.put(form.getType(), form);
	}
	
	private static void inital() {
		add(new Form152());
		add(new FormTest());
		
		add(new FV9_12AktionspunkteForm());
		add(new FV9_15ProgrammpunkteForm());
		
		add(new FV9_44Dataset());
	}
}
