package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_15FahrzeugaufZP8Form extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9ZP8NumSoll", "fv9ZP8Numlst"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_15FahrzeugaufZP8";
	}

	@Override
	public String getTitle() {
		return "1.5 Fahrzeugaufbaustatus";
	}
}
