package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_43TeilequalitaetZP7KTDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p3_1.jsp";
	}

	@Override
	public String getType() {
		return "4.3 Teilequalitaet ZP7 KT";
	}

	@Override
	public String getTitle() {
		return "4.3 Teilequalität ZP7 KT ";
	}
}
