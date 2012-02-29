package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_34FuntNachBautForm extends Form {
	
	private static final String[] attr = {
		"fv9FunctionStyle", "fv9StylePoint", "fv9FunctionAK", "fv9FunctionBK", "fv9FunctionIO",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9OtherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p4_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_34FuntNachBaut";
	}

	@Override
	public String getTitle() {
		return "3.4 Funktionsmaße nach Bauteilen";
	}
}
