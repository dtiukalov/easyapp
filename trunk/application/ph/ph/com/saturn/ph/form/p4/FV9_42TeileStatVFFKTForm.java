package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_42TeileStatVFFKTForm extends Form {
	
	private static final String[] attr = {
		"fv9TotalNum", "fv9CKDCOPNum",
		"fv9TeilestName","fv9TeileAusSerien", "fv9TeileNote6",
		"fv9TeileFehlend", "fv9TeileNote3","fv9TeileNote1",
		"fv9TopKrisUmf", "fv9TopEinNum", "fv9TopVSISWZ", "fv9TopVSIN3",
		"fv9PreRelesed", "fv9Oraganization"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p2_3.jsp";
	}

	@Override
	public String getType() {
		return "FV9_42TeileStatVFFKT";
	}

	@Override
	public String getTitle() {
		return "4.2 Teilestatus zu VFF ZP5 (KT) ";
	}

}
