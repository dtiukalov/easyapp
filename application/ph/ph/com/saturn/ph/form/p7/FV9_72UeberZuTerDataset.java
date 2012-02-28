package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_72UeberZuTerDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/p2_2.jsp";
	}

	@Override
	public String getType() {
		return "7.2 Ubersicht zukunftige Termine";
	}

	@Override
	public String getTitle() {
		return "7.2 Uebersicht zukünftige Termine";
	}
}
