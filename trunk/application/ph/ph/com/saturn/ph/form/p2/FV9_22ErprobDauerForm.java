package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_22ErprobDauerForm extends Form {
	
	private static final String[] attr = {
		"fv9ErprobStyle", "fv9ErprobStatus", 
		"fv9ErprobStCom_CN", "fv9ErprobStCom_GM",
		"fv9ErprobNachSch_CN", "fv9ErprobNachSch_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_22ErprobDauer";
	}

	@Override
	public String getTitle() {
		return "2.2 Erprobung und Dauerlauf";
	}
}
