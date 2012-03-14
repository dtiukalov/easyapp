package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35AuditNoteZP8Form extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9AuditErstang", "fv9TargetProg", "fv9AuditZweit",
		"fv9KonzAuditMitNA","fv9AuditMax","fv9AuditMin",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid", "fv9IsBackup"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p5_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35AuditNoteZP8";
	}

	@Override
	public String getTitle() {
		return "3.5 Auditnoten ZP8";
	}
}
