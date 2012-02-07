package com.saturn.ph.form;

import com.saturn.ph.Form;

public class FormTest extends Form {
	
	private static final String[] attr = {
		"fv9AA", "fv9BB", "fv9M", "fv9N"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9Test";
	}
}
