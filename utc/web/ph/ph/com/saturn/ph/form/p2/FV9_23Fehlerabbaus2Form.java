package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_23Fehlerabbaus2Form extends Form {

	private static final String[] attr = {
		"fv9Geschlossen", "fv9KWNo", 
		"fv9NewAFelhler", "fv9NewBFelhler", "fv9NewCFelhler", 
		"fv9SolvedAFelhler", "fv9SolvedBFelhler", "fv9SolvedCFelhler", 

		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};
	@Override
	public String[] getAttributes() {
		// TODO Auto-generated method stub
		return attr;
	}

	@Override
	public String getJspPath() {
		// TODO Auto-generated method stub
		return "/app/pep/2/FV9_23Fehlerabbaus2.jsp";
	}

	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return "FV9_23Fehlerabbaus2";
	}

	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return "2.3 Fehlerabbaustatus Software";
	}

}
