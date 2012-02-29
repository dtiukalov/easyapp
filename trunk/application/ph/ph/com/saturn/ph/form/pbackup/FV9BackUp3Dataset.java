package com.saturn.ph.form.pbackup;

import com.saturn.ph.Form;

public class FV9BackUp3Dataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/backupDataset.jsp";
	}

	@Override
	public String getType() {
		return "backup3";
	}

	@Override
	public String getTitle() {
		return "backup";
	}
}
