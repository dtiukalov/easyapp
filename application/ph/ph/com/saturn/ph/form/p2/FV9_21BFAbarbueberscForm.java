package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21BFAbarbueberscForm extends Form {
	
	private static final String[] attr = {
		"fv9BFreigType", "fv9BFreigTypeNum", 
		"fv9BFKWNo", "fv9BFreiSoll", "fv9BFAWE", "fv9BFInArbeirt",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_5.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21BFAbarbuebersc";
	}

	@Override
	public String getTitle() {
		return "2.1 B-Freigaben";
	}
}
