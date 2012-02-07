package com.saturn.ph.form;

import com.saturn.ph.Form;
//1.5 Fahrzeugaufbaustatus VFF/PVS/0S 装车数量计划表
public class FahrzeugaufbaustaForm extends Form{
	
	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept",
		"fv9KW0", "fv9Soll0", "fv9Ist0",
		"fv9KW1", "fv9Soll1", "fv9Ist1",
		"fv9KW2", "fv9Soll2", "fv9Ist2",
		"fv9KW3", "fv9Soll3", "fv9Ist3",
		"fv9KW4", "fv9Soll4", "fv9Ist4",
		"fv9KW5", "fv9Soll5", "fv9Ist5",
		"fv9KW6", "fv9Soll6", "fv9Ist6",
		"fv9KW7", "fv9Soll7", "fv9Ist7",
		"fv9KW8", "fv9Soll8", "fv9Ist8",
		"fv9KW9", "fv9Soll9", "fv9Ist9",
		"fv9KW10", "fv9Soll10", "fv9Ist10",
		"fv9KW11", "fv9Soll11", "fv9Ist11",
		"fv9KW12", "fv9Soll12", "fv9Ist12",
		"fv9KW13", "fv9Soll13", "fv9Ist13",
		"fv9KW14", "fv9Soll14", "fv9Ist14",
		"fv9KW15", "fv9Soll15", "fv9Ist15",
		"fv9KW16", "fv9Soll16", "fv9Ist16",
		"fv9KW17", "fv9Soll17", "fv9Ist17",
		"fv9KW18", "fv9Soll18", "fv9Ist18",
		"fv9KW19", "fv9Soll19", "fv9Ist19"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p5_3.jsp";
	}

	public String getType() {
		return "";
	}
}
