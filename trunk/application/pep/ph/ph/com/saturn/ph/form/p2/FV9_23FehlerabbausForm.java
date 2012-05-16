package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_23FehlerabbausForm extends Form {

	private static final String[] attr = {
		"fv9KWNo", "fv9AFelhler", "fv9BFelhler", "fv9CFelhler", 
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule"
	};
	@Override
	public String[] getAttributes() {
		// TODO Auto-generated method stub
		return attr;
	}

	@Override
	public String getJspPath() {
		// TODO Auto-generated method stub
		return "/app/pep/2/FV9_23Fehlerabbaus.jsp";
	}

	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return "FV9_23Fehlerabbaus";
	}

	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return "2.3 Fehlerabbaustatus Software";
	}

}
