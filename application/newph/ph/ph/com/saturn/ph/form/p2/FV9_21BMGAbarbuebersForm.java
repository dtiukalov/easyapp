package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21BMGAbarbuebersForm extends Form {
	
	private static final String[] attr = {
		"fv9BMGType", "fv9BMGNum",
		"fv9BMGKWNo", "fv9BMGSoll", "fv9BMGAWE", "fv9BMGInArbeirt", "fv9Prognose",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9DisDate", 
		"fv9KWNo", "fv9ZSB", "fv9Tei", "fv9TeilNum", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/FV9_21BMGAbarbuebers.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21BMGAbarbuebers";
	}

	@Override
	public String getTitle() {
		return "2.1 BMG";
	}
}
