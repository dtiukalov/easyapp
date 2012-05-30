package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21BMGForm extends Form {
	
	private static final String[] attr = {
		"fv9BMGMajor", "fv9BMGGesamtNum", "fv9BMGSollNum", "fv9BMGlstNum",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/FV9_21BMG.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21BMG";
	}

	@Override
	public String getTitle() {
		return "2.1 BMG";
	}
}
