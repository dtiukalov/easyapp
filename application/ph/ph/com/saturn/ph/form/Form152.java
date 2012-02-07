package com.saturn.ph.form;

import com.saturn.ph.Form;

public class Form152 extends Form {
	
	private static final String[] attr = {
		"p1", "p2", "p3"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_2.jsp";
	}

	@Override
	public String getType() {
		return "Fahrzeugaufbaustatus";
	}
	

	@Override
	public String getTitle() {
		return "";
	}
}
