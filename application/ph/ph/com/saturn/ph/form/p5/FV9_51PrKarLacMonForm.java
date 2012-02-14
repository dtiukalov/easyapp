package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51PrKarLacMonForm extends Form {
	
	private static final String[] attr = {
		"fv9PressStatus", "fv9KarossStCom_CN", "fv9KarossStCom_GM", "fv9KarossStMab_CN",
		"fv9KarossStMab_GM", "fv9LackStatus", "fv9LackStCom_CN", "fv9LackStCom_GM",
		"fv9LackStMab_CN", "fv9LackStMab_GM", "fv9MontStatus", "fv9MontStCom_CN",
		"fv9MontStCom_GM", "fv9MontStMab_CN", "fv9MontStMab_GM"
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
		return "5.1 Status Presswerk, Karosseriebau, Lack, Montage ";
	}
}
