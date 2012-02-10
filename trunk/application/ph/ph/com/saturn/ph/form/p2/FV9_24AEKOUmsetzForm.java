package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_24AEKOUmsetzForm extends Form {
	
	private static final String[] attr = {
		"fv9Aktion", "fv9Verantwortlich", "fv9Termin", "fv9PHStatus"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_12Aktionspunkte";
	}

	@Override
	public String getTitle() {
		return "1.2 Aktionspunkte";
	}
}
