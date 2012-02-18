package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_43TeileStatVFFKTForm extends Form {
	
	private static final String[] attr = {
		"fv9TotalNum", "fv9CKDCOPNum", 
		"fv9TeilestName","fv9TeileAusSerien", "fv9TeileNote6",
		"fv9TeileFehlend", "fv9TeileNote3","fv9TeileNote1",
		"fv9TopKrisUmf", "fv9TopEinNum", "fv9TopVSISWZ",
		"fv9TopVSIN3"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p3_2.jsp";
	}

	@Override
	public String getType() {
		return "FV9_43TeileStatVFF";
	}

	@Override
	public String getTitle() {
		return "4.3 Teilestatus zu VFF ZP7 ";
	}
}