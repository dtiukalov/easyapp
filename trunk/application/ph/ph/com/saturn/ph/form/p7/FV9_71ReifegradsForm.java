package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_71ReifegradsForm extends Form {
	
	private static final String[] attr = {
		"fv9ProjectStatus",
		"fv9ProductstandStatus", "fv9ProdStatusCom", "fv9ProdStatusComC",
		"fv9FunktionStatus","fv9FunktionCom","fv9FunktionComC",
		"fv9ProduktionStatus","fv9ProduktionCom","fv9ProduktionComC",
		"fv9BeschaffStatus","fv9BeschaffCom","fv9BeschaffComC",
		"fv9QualitStatus","fv9QualitCom","fv9QualitComC",
		"fv9VertriebStatus","fv9VertriebCom","fv9VertriebComC",
		"fv9FinanzenStatus","fv9FinanzenCom","fv9FinanzenComC",
		"fv9GewichtStatus","fv9GewichtCom","fv9GewichtComC",
		"fv9DokuStatus","fv9DokuCom","fv9DokuComC",
		"fv9TermineStatus","fv9TermineCom","fv9TermineComC"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_71Reifegrads";
	}

	@Override
	public String getTitle() {
		return "7.1 Reifegradspiegel";
	}
}
