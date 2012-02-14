package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_21PBFreigBMGForm extends Form {
	
	private static final String[] attr = {
		"fv9FreigabeStyle", "fv9FreigabeStatus", "fv9AnzahlNum", "fv9FreigSollNum",
		"fv9FreiglstNum", "fv9FreigCom_CN", "fv9FreigComme_GM", "fv9PFreigAnahlNum",
		"fv9PFreigCom_CN", "fv9PFreigCom_GM", "fv9BFreigAnahlNum", "fv9BFreigCom_CN",
		"fv9BFreigCom_GM", "fv9BMGAnahlNum", "fv9BMGCom_CN", "fv9BMGCom_GM"
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
