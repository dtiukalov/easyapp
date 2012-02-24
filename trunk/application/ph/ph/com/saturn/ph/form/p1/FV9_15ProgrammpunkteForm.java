package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_15ProgrammpunkteForm extends Form {
	
	private static final String[] attr = {
		"fv9PPCOP", "fv9PPErste", "fv9PPNicht",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_4.jsp";
	}

	@Override
	public String getType() {
		return "FV9_15Programmpunk";
	}

	@Override
	public String getTitle() {
		return "1.5 Programmpunkte";
	}
}
