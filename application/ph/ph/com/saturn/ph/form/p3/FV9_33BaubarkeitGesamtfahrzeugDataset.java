package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_33BaubarkeitGesamtfahrzeugDataset extends Form {
	
	private static final String[] attr = {};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p3_2.jsp";
	}

	@Override
	public String getType() {
		return "3.3BaubarkeitGesamtfahrzeug";
	}

	@Override
	public String getTitle() {
		return "3.3 Baubarkeit Gesamtfahrzeug ";
	}
}