package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_15BauprogVFF extends Form {
	
	private static final String[] attr = {
		"fv9Stufe", 
		"fv9FahrSoll", "fv9Fahrlst",
		"fv9KarossSoll", "fv9Karosslst", 
		"fv9KarossStart","fv9KarossEnd", 
		"fv9LackStart", "fv9LackEnd",
		"fv9MontageStart", "fv9MontageEnd", 
		"fv9ObergabeStart","fv9ObergabeEnd",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_15BauprogVFF";
	}

	@Override
	public String getTitle() {
		return "1.5 Bauprogramm VFF";
	}
}
