package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_72UeberZuTerForm extends Form {
	
	private static final String[] attr = {
		"fv9TaskName",
		"fv9TaskDate"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/p2_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_72UeberZuTer";
	}

	@Override
	public String getTitle() {
		return "7.2 Uebersicht zukünftige Termine";
	}
}
