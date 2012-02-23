package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_11ProjectTerminForm extends Form {
	
	private static final String[] attr = {
		"fv9PMMLDate", "fv9PMMLOrg",
		"fv9PPMLDate", "fv9PPMLOrg",
		"fv9PDMLDate", "fv9PDMLOrg",
		
		"fv9PFMLDate", "fv9PFMLOrg",
		"fv9KEMLDate", "fv9KEMLOrg",
		"fv9DEMLDate", "fv9DEMLOrg",
		
		"fv9DFExtMLDate", "fv9DFExtMLOrg",
		"fv9DFIntMLDate", "fv9DFIntMLOrg",
		"fv9BFMLDate", "fv9BFMLOrg",
		
		"fv9LFMLDate", "fv9LFMLOrg",
		"fv9VFFMLDate", "fv9VFFMLOrg",
		"fv9PVSMLDate", "fv9PVSMLOrg",
		
		"fv90SMLDate", "fv90SMLOrg",
		"fv9SOPMLDate", "fv9SOPMLOrg",
		"fv9MEMLDate", "fv9MEMLOrg",
		
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName"
	};
		
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p1_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_11ProjectTermin";
	}

	@Override
	public String getTitle() {
		return "1.1 Projektterminplan";
	}
}
