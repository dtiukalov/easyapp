package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_35MassVerAudForm extends Form {
	
	private static final String[] attr = {
		"fv9AuditIst", "fv9AuditSoll",
		"fv9KWNo", 
		"fv9Projekt", "fv9ProjektCom_CN", "fv9ProjektCom_GM",
		"fv9Kaufteile", "fv9KaufteileCom_CN", "fv9KaufteileCom_GM", 
		"fv9Montage", "fv9MontageCom_CN", "fv9MontageCom_GM",
		"fv9Lack", "fv9LackCom_CN", "fv9LackCom_GM", 
		"fv9Karosseriebau", "fv9KarossCom_CN", "fv9KarossCom_GM",
		"fv9Presswerk", "fv9PresswerkCom_CN", "fv9PresswerkCom_GM", 
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/FV9_35MassVerAud.jsp";
	}

	@Override
	public String getType() {
		return "FV9_35MassVerAud";
	}

	@Override
	public String getTitle() {
		return "3.5 Massnahmen zur Verbesserung der  Audit-Ergebnisse";
	}
}
