package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_44AggregateverfuegbarkeitDataset extends Form {
	
	private static final String[] attr = {};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p4_1.jsp";
	}

	@Override
	public String getType() {
		return "4.4 Aggregateverfuegbarkeit ZP3/ZP4";
	}

	@Override
	public String getTitle() {
		return "4.4 Aggregateverfügbarkeit ZP3/ZP4(图片)";
	}
}
