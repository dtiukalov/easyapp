package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_42TeilequalitaetZP5HTDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "4.2 Teilequalitaet ZP5 (HT)";
	}

	@Override
	public String getTitle() {
		return "4.2 Teilequalität ZP5 (HT)";
	}
}
