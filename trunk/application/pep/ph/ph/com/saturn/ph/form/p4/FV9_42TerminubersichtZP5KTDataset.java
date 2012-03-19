package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_42TerminubersichtZP5KTDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/imageDataset.jsp";
	}

	@Override
	public String getType() {
		return "4.2 Terminubersicht ZP5 (KT)";
	}

	@Override
	public String getTitle() {
		return "4.2 Terminuebersicht ZP5 KT ";
	}
}
