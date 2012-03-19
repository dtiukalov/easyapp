package com.saturn.ph.form.pbackup;

import com.saturn.ph.Form;
import com.saturn.tc.utils.WorkspaceUtils;

public class FV9BackUpDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/backupDataset.jsp";
	}

	@Override
	public String getType() {
		return WorkspaceUtils.BackUpType;
	}

	@Override
	public String getTitle() {
		return "backup";
	}
}
