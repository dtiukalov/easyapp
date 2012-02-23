package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21PFreigabeForm extends Form {
	
	private static final String[] attr = {
		"fv9PFMajor", "fv9PFGesamtNum", "fv9PFSollNum", "fv9PFlstNum",
		"fv9PreRelesed", "fv9Oraganization"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21PFreigabe";
	}

	@Override
	public String getTitle() {
		return "2.1 P-Freigaben";
	}
}
