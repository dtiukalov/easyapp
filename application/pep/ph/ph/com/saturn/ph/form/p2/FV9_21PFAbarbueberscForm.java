package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21PFAbarbueberscForm extends Form {
	
	private static final String[] attr = {
		"fv9PFreigType", "fv9PFreigTypeNum", "fv9PFKWNo", "fv9PFreiSoll",
		"fv9PFAWE", "fv9PFInArbeirt",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21PFAbarbuebersc";
	}

	@Override
	public String getTitle() {
		return "2.1 P-Freigaben";
	}
}
