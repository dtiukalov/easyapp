package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_44AggregateverfuegbarkeitDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p4_1.jsp";
	}

	@Override
	public String getType() {
		return "4.4 Aggregateverfugbarkeit ZP3/ZP4";
	}

	@Override
	public String getTitle() {
		return "4.4 Aggregateverfügbarkeit ZP3/ZP4";
	}
}
