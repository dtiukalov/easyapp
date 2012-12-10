package com.saturn.ph.form;

import com.saturn.ph.Form;
import com.saturn.tc.utils.WorkspaceUtils;

public class FV9PHImageDataset  extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type","fv9SortNum"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/imageDataset.jsp";
	}

	@Override
	public String getType() {
		return WorkspaceUtils.DatasetType;
	}

	@Override
	public String getTitle() {
		return "backup";
	}
}
