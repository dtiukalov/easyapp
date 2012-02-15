package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35NachareitPunkForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9Montage", "fv9Lack", "fv9Kaufteile",
		"fv9Karosseriebau","fv9Presswerk","fv9Prognose"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p5_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35NachareitPunk";
	}

	@Override
	public String getTitle() {
		return "3.5 Nacharbeitpunkte";
	}
}
