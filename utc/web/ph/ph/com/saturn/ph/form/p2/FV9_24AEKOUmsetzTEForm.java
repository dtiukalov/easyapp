package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_24AEKOUmsetzTEForm extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum",
		"fv9TEStyleName", "fv9TEStyleNum",
		"fv9ChartTitle"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/FV9_24AEKOUmsetzTE.jsp";
	}

	@Override
	public String getType() {
		return "FV9_24AEKOUmsetzTE";
	}

	@Override
	public String getTitle() {
		return "2.4 Status Aeko";
	}


}
