package com.saturn.ph.form;

import com.saturn.ph.Form;

public class AgendaForm extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType", "fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum",
		
		"fv9ThemaNo",
		"fv9Thema",
		"fv9Vortragender",
		"fv9InBF",
		"fv9InLF",
		"fv9InVFF",
		"fv9InPVS",
		"fv9In0S",
		"fv9InSOP"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/agenda.jsp";
	}

	@Override
	public String getType() {
		return "FV9_Agenda";
	}

	@Override
	public String getTitle() {
		return "Agenda";
	}

}
