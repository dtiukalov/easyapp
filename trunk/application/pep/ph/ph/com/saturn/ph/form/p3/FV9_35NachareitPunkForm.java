package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35NachareitPunkForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9Montage", "fv9Lack", "fv9Kaufteile",
		"fv9Karosseriebau","fv9Presswerk","fv9Prognose",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/FV9_35NachareitPunk.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35NachareitPunk";
	}

	@Override
	public String getTitle() {
		return "3.5 Nacharbeitpunkte";
	}
}
