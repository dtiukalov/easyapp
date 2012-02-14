package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

import com.saturn.ph.form.p1.FV9_12AktionspunkteForm;
import com.saturn.ph.form.p1.FV9_14AnlaufkurveDataset;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP5Form;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP8Form;
import com.saturn.ph.form.p1.FV9_15ProgrammpunkteForm;
import com.saturn.ph.form.p2.FV9_24AEKOUmsetzForm;
import com.saturn.ph.form.p2.FV9_24StatusAEKOForm;
import com.saturn.ph.form.p4.FV9_44AggregateverfuegbarkeitDataset;
import com.saturn.ph.form.p5.FV9_52LogistikkonzeptForm;

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
		
		add(new FV9_12AktionspunkteForm());
		add(new FV9_14AnlaufkurveDataset());
		add(new FV9_15ProgrammpunkteForm());
		add(new FV9_15FahrzeugaufZP5Form());
		add(new FV9_15FahrzeugaufZP8Form());
		add(new FV9_24AEKOUmsetzForm());
		add(new FV9_24StatusAEKOForm());
		add(new FV9_52LogistikkonzeptForm());
		
		add(new FV9_44AggregateverfuegbarkeitDataset());
	}
}
