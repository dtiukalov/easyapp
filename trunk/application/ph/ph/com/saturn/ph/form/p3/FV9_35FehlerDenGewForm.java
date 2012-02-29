package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35FehlerDenGewForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9Fahrzeuge", 
		"fv9PresswerkNum", "fv9PresswerkProg",
		"fv9KarossNum", "fv9KarossProg",
		"fv9LackNum", "fv9LackProg",
		"fv9MontageNum", "fv9MontageProg",
		"fv9KaufteileNum", "fv9KaufteileProg",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p5_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35FehlerDenGew";
	}

	@Override
	public String getTitle() {
		return "3.5 Fehlerpunkte in den Gewerken";
	}
}
