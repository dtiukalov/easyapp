package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51KarosserStatDataset  extends Form {
	
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
		return "5.1 Status Karosseriebau";
	}

	@Override
	public String getTitle() {
		return "5.1 Status Karosseriebau";
	}
}