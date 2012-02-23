package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_34FuntionsmasseForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9FunktionSmall75", "fv9FunktionSmall100", "fv9FunktionBig100", "fv9Zielwert",
		"fv9PrognoseAK", "fv9PrognoseBK", "fv9PrognoseIO",
		"fv9PreRelesed", "fv9Oraganization"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p4_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_34Funtionsmasse";
	}

	@Override
	public String getTitle() {
		return "3.4 Funktionsmasse";
	}
}