package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_15FahrzeugaufZP5Form extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9ZP5NumSoll", "fv9ZP5Numlst", 
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_15FahrzeugaufZP5";
	}

	@Override
	public String getTitle() {
		return "1.5 Fahrzeugaufbaustatus";
	}
}
