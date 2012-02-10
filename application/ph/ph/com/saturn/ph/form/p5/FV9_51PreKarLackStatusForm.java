package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51PreKarLackStatusForm extends Form {
	
	private static final String[] attr = {
		"fv9KarosserStyle", "fv9KarosserStatus", "fv9KarossStatusCom", "fv9KarossStatusMab"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/5/p1_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_51KarosserStatus";
	}

	@Override
	public String getTitle() {
		return " 5.1 Status Karosseriebau ";
	}
}
