package com.saturn.ph.form;

import com.saturn.ph.Form;
//2.1 P/B Freigabe und BMG P/B认可和BMG认可表
public class PBandBMGForm extends Form {
	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept",
		"fv9MBTSoll", "fv9MBTIst", "fv9MBTBemerkung", 
		"fv9FAKOMSoll", "fv9FAKOMIst","fv9FAKOMBemerkung",
		"fv9StucklisteSoll", "fv9StucklisteIst", "fv9StucklisteBemerkung",
		"fv9PBSoll","fv9PBIst", "fv9PBBemerkung", 
		"fv9BMGSoll", "fv9BMGIst", "fv9BMGBemerkung"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_1.jsp";
	}
	
	public String getType() {
		return "";
	}
}
