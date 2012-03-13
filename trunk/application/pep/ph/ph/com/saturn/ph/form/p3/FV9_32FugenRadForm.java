package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_32FugenRadForm extends Form {
	
	private static final String[] attr = {
		"fv9FugRadName", "fv9FugRadStatus", "fv9FugRadCom_CN", "fv9FugRadCom_GM",
		"fv9FugRadMabnh_CN","fv9FugRadMabnh_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_32FugenRad";
	}

	@Override
	public String getTitle() {
		return "3.2 Fugen und Radienplan";
	}
}
