package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_72BeschlussForm extends Form {
	
	private static final String[] attr = {
		"fv9BeschlussPH", "fv9Beschlussantrag", "fv9BeschlussTitle", "fv9BeschlussStatus",
		"fv9BeschlussDept",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/FV9_72Beschluss.jsp";
	}

	@Override
	public String getType() {
		return "FV9_72Beschluss";
	}

	@Override
	public String getTitle() {
		return "7.2 Beschluss";
	}

}
