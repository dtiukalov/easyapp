package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21PBFreigBMGForm extends Form {
	
	private static final String[] attr = {
		"fv9FreigabeStyle", "fv9FreigabeStatus", "fv9AnzahlNum", "fv9FreigSollNum",
		"fv9FreiglstNum", "fv9FreigCom_CN", "fv9FreigCom_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_21PBFreigBMG";
	}

	@Override
	public String getTitle() {
		return "2.1 P/B Freigabe und BMG";
	}
}
