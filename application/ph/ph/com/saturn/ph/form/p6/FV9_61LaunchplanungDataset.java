package com.saturn.ph.form.p6;

import com.saturn.ph.Form;

public class FV9_61LaunchplanungDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/6/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "6.1 Launchplanung";
	}

	@Override
	public String getTitle() {
		return "6.1 Launchplanung";
	}
}
