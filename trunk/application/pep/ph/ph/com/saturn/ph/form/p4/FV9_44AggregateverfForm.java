package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_44AggregateverfForm extends Form {

	private static final String[] attr = {
		"fv9Market", "fv9Motor", "fv9MotorTech", "fv9CylinderNo", "fv9Emission", 
		"fv9Parameter", "fv9EmissionStandards", "fv9Getriebe", 
		"fv9VFFStatus", "fv9PVSStatus", "fv90SStatus", "fv9SOPStatus",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	@Override
	public String getJspPath() {
		// TODO Auto-generated method stub
		return "/app/pep/4/FV9_44Aggregateverf.jsp";
	}

	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return "FV9_44Aggregateverf";
	}

	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return "4.4 Aggregateverfuegbarkeit ZP3/ZP4";
	}

}
