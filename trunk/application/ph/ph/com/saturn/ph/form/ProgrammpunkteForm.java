package com.saturn.ph.form;

import com.saturn.ph.Form;
//1.5 Programmpunkte年型统计表
public class ProgrammpunkteForm extends Form {

	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept","fv9Genehmigt", "fv9PPCOP", "fv9PPErsteinsatz", "fv9PPnicht"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_4.jsp";
	}
	
	public String getType() {
		return "";
	}

}
