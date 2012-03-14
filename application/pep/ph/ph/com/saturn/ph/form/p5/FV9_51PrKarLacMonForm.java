package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51PrKarLacMonForm extends Form {
	
	private static final String[] attr = {
		"fv9PressStatus", "fv9PressStCom_CN","fv9PressStCom_GM","fv9PressStMab_CN","fv9PressStMab_GM",
		"fv9KarossStatus", "fv9KarossStCom_CN", "fv9KarossStCom_GM", "fv9KarossStMab_CN","fv9KarossStMab_GM",
		"fv9LackStatus", "fv9LackStCom_CN", "fv9LackStCom_GM","fv9LackStMab_CN", "fv9LackStMab_GM", 
		"fv9MontStatus", "fv9MontStCom_CN","fv9MontStCom_GM", "fv9MontStMab_CN", "fv9MontStMab_GM",
		"fv9ElectStatus", "fv9ElectStCom_CN","fv9ElectStCom_GM", "fv9ElectStMab_CN", "fv9ElectStMab_GM",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/5/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_51PrKarLacMon";
	}

	@Override
	public String getTitle() {
		return "5.1 Status Presswerk, Karosseriebau, Lack, Montage, Electric ";
	}
}
