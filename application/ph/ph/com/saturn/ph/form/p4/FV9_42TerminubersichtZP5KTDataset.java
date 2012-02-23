package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_42TerminubersichtZP5KTDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "4.2 Terminübersicht ZP5(KT)";
	}

	@Override
	public String getTitle() {
		return "4.2 Terminübersicht ZP5 KT ";
	}
}
