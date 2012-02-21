package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_13AnlauforganisationDataset extends Form {
	
	private static final String[] attr = {};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p3_1.jsp";
	}

	@Override
	public String getType() {
		return "1.3 Anlauforganisation";
	}

	@Override
	public String getTitle() {
		return "1.3 Anlauforganisation–Fahrzeugbau";
	}
}
