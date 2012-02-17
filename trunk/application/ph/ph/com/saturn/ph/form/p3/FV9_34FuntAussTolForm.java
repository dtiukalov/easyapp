package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_34FuntAussTolForm extends Form {
	
	private static final String[] attr = {
		"fv9FuncInTolGreen", "fv9FuncInTolYellow", 
		"fv9FuncSmall05", "fv9FuncSmall05Com", 
		"fv9FuncSmall10", "fv9FuncSmall10Com", 
		"fv9FuncSmall15", "fv9FuncSmall15Com", 
		"fv9FuncSmall20", "fv9FuncSmall20Com",
		"fv9FuncBig20", "fv9FuncBig20Com"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p4_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_34FuntAussTol";
	}

	@Override
	public String getTitle() {
		return "3.4 Funktionsmaße außerhalb der Toleranz";
	}
}
