package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_14AnlaufkurveDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p4_1.jsp";
	}

	@Override
	public String getType() {
		return "1.4 Anlaufkurve";
	}

	@Override
	public String getTitle() {
		return "1.4 Anlaufkurve";
	}
}
