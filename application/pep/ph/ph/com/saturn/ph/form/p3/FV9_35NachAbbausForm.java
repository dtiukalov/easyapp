package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35NachAbbausForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9MontageNum", "fv9LackNum", "fv9KauftNum",
		"fv9KarossNum", "fv9PresswerkNum", "fv9AusStrNum", "fv9Prognose",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/FV9_35NachAbbaus.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35NachAbbaus";
	}

	@Override
	public String getTitle() {
		return "3.5 Nacharbeit Abbaustatus";
	}
}
