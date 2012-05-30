package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_41NominLieferForm extends Form {
	
	private static final String[] attr = {
		"fv9Nominiert", "fv9Nichtnominiert", "fv9KritischeNomini", "fv9KWNo",
		"fv9KWNumber", "fv9KWCom", "fv9SpaeterCom",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType" ,"fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/FV9_41NominLiefer.jsp";
	}

	@Override
	public String getType() {
		return "FV9_41NominLiefer";
	}

	@Override
	public String getTitle() {
		return "4.1 Nominierungen/Lieferantenstatus";
	}
}
