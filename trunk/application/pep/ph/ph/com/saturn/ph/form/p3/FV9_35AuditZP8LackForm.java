package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35AuditZP8LackForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9LackierereiNum", "fv9KonzernNum", "fv9PrognoseNum",
		"fv9Note3Num", "fv9Note2Num", "fv9Note1Num",
		"fv9KW", "fv9Name", "fv9Score", "fv9Option",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/FV9_35AuditZP8Lack.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35AuditZP8Lack";
	}

	@Override
	public String getTitle() {
		return "3.5 Audit ZP8 – Gewerk: Lackiererei";
	}
}
