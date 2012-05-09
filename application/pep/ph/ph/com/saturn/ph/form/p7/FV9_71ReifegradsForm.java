package com.saturn.ph.form.p7;

import com.saturn.ph.Form;

public class FV9_71ReifegradsForm extends Form {
	
	private static final String[] attr = {
		"fv9ProjectStatus", "fv9PHMeetStyle_CN", "fv9PHMeetStyle_GM",
		"fv9ProductstandStatus", "fv9ProdStatusCom", "fv9ProdStatusComC", "fv9ProdMass_CN", "fv9ProdMass_GM",
		"fv9FunktionStatus","fv9FunktionCom","fv9FunktionComC", "fv9FunktionMass_GM", "fv9FunktionMass_CN",
		"fv9ProduktionStatus","fv9ProduktionCom","fv9ProduktionComC", "fv9ProduktionMass_GM", "fv9ProduktionMass_CN",
		"fv9BeschaffStatus","fv9BeschaffCom","fv9BeschaffComC", "fv9BeschaffMass_GM", "fv9BeschaffMass_CN",
		"fv9QualitStatus","fv9QualitCom","fv9QualitComC", "fv9QualitMass_GM", "fv9QualitMass_CN",
		"fv9VertriebStatus","fv9VertriebCom","fv9VertriebComC", "fv9VertrieMass_GM", "fv9VertrieMass_CN",
		"fv9FinanzenStatus","fv9FinanzenCom","fv9FinanzenComC", "fv9FinanzenMass_GM", "fv9FinanzenMass_CN",
		"fv9GewichtStatus","fv9GewichtCom","fv9GewichtComC", "fv9GewichtMass_GM", "fv9GewichtMass_CN",
		"fv9DokuStatus","fv9DokuCom","fv9DokuComC", "fv9DokuMass_GM", "fv9DokuMass_CN",
		"fv9TermineStatus","fv9TermineCom","fv9TermineComC", "fv9TerminMass_GM", "fv9TerminMass_CN",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/7/FV9_71Reifegrads.jsp";
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
