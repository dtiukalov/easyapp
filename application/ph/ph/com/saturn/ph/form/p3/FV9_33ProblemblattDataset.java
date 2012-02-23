package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_33ProblemblattDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p3_3.jsp";
	}

	@Override
	public String getType() {
		return "3.3 Problemblatt";
	}

	@Override
	public String getTitle() {
		return "3.3 Problemblatt";
	}
}
