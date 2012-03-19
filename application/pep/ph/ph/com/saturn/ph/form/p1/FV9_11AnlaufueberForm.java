package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_11AnlaufueberForm extends Form {
	
	private static final String[] attr = {
		"fv9ProjectDerivat", "fv9ProjectStufe", "fv9ProjectPVS",
		"fv9ProjectVFF", "fv9Project0S", "fv9ProjectSOP", "fv9ProjectMix",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType", "fv9otherUid", "fv9IsBackup", "object_type"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p1_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_11Anlaufueber";
	}

	@Override
	public String getTitle() {
		return "1.1 Anlaufuebersicht";
	}
}
