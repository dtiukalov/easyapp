package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35AuditZP8KarossForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9PresswerkNum", "fv9KonzernNum", "fv9PrognoseNum",
		"fv9Note3Num","fv9Note2Num","fv9Note1Num",
		"fv9KW","fv9Name","fv9Score","fv9Option"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p5_8.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35AuditZP8Kaross";
	}

	@Override
	public String getTitle() {
		return "3.5 Audit ZP8 – Gewerk: Karosseriebau";
	}
}
