package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21BMGAbarbuebersForm extends Form {
	
	private static final String[] attr = {
		"fv9BMGType", "fv9BMGNum",
		"fv9BMGKWNo", "fv9BMGSoll", "fv9BMGAWE", "fv9BMGInArbeirt"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_7.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21BMGAbarbuebers";
	}

	@Override
	public String getTitle() {
		return "2.1 BMG";
	}
}
