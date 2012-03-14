package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_52LogistikkonzeptForm extends Form {
	
	private static final String[] attr = {
		"fv9LogistikStyle", "fv9LogistikStatus",
		"fv9LogistikStCom_CN", "fv9LogistikStCom_GM",
		"fv9LogistikMab_CN", "fv9LogistikMab_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/5/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_52Logiskonzept";
	}

	@Override
	public String getTitle() {
		return "5.2 Logistikkonzept";
	}
}
