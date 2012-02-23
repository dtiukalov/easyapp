package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_36Vorch2TagForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9InPlanung", "fv9MabnaNichtErarb", "fv9MabnaWerdenDef",
		"fv9MabnaDef", "fv9IO", "fv9PrognosePlan", "fv9Zeil","fv9PrognoseIO",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p6_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_36Vorch2Tag";
	}

	@Override
	public String getTitle() {
		return "3.6 Vorschau 2-Tagesproduktion";
	}
}
