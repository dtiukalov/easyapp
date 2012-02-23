package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21BMGForm extends Form {
	
	private static final String[] attr = {
		"fv9BMGMajor", "fv9BMGGesamtNum", "fv9BMGSollNum", "fv9BMGlstNum",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_6.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21BMG";
	}

	@Override
	public String getTitle() {
		return "2.1 BMG";
	}
}
