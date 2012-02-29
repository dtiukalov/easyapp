package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_72BeschlussDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "7.2 Beschluss";
	}

	@Override
	public String getTitle() {
		return "7.2 Beschluss";
	}
}
