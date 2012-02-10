package com.saturn.ph.form.p5;

import com.saturn.ph.Form;

public class FV9_51KarosserStatusForm extends Form {
	
	private static final String[] attr = {
		"fv9PressStatus", "fv9PressStatusCom", "fv9PressStatusMab",
		"fv9KarossStatus","fv9KarossStatusCom","fv9KarossStatusMab",
		"fv9LackStatus","fv9LackStatusCom","fv9LackStatusMab",
		"fv9MontStatus","fv9MontStatusCom","fv9MontStatusMab",
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/5/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_51KarosserStatus";
	}

	@Override
	public String getTitle() {
		return "5.1 Status Presswerk, Karosseriebau, Lack, Montage";
	}
}
