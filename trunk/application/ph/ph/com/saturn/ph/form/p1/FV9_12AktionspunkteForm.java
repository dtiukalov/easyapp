package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_12AktionspunkteForm extends Form {
	
	private static final String[] attr = {
		"fv9Aktion_CN", "fv9Aktion_GM", "fv9Verantwortlich", "fv9Termin", "fv9Status",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
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
		return "1.2 Aktionspunkte aus letzter Pilothalle";
	}
}
