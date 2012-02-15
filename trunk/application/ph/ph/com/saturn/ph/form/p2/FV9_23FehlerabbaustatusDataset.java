package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_23FehlerabbaustatusDataset extends Form {
	
	private static final String[] attr = {};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p3_2.jsp";
	}

	@Override
	public String getType() {
		return "2.3Fehlerabbaustatus";
	}

	@Override
	public String getTitle() {
		return "2.3 Fehlerabbaustatus";
	}
}
