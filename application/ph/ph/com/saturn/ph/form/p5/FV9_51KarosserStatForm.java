package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51KarosserStatForm extends Form {
	
	private static final String[] attr = {
		"fv9KarosserStyle", "fv9KarosserStatus", 
		"fv9KarossStCom_CN", "fv9KarossStCom_GM",
		"fv9KarossMab_CN", "fv9KarossMab_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/5/p1_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_51KarosserStat";
	}

	@Override
	public String getTitle() {
		return "5.1 Status Karosseriebau";
	}
}
