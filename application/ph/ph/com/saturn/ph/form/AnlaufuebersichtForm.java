package com.saturn.ph.form;

import com.saturn.ph.Form;
//1.1 Anlaufuebersicht 衍生车型计划表
public class AnlaufuebersichtForm extends Form {
	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept",
		"Derviant0", "Stufe0", "VFF0","PVS0", "0S0", "SOP0","Mix0", 
		"Derviant1", "Stufe1", "VFF1","PVS1", "0S1", "SOP1","Mix1", 
		"Derviant2", "Stufe2", "VFF2","PVS2", "0S2", "SOP2","Mix2", 
		"Derviant3", "Stufe3", "VFF3","PVS3", "0S3", "SOP3","Mix3", 
		"Derviant4", "Stufe4", "VFF4","PVS4", "0S4", "SOP4","Mix4", 
		"Derviant5", "Stufe5", "VFF5","PVS5", "0S5", "SOP5","Mix5", 
		"Derviant6", "Stufe6", "VFF6","PVS6", "0S6", "SOP6","Mix6", 
		"Derviant7", "Stufe7", "VFF7","PVS7", "0S7", "SOP7","Mix7", 
		"Derviant8", "Stufe8", "VFF8","PVS8", "0S8", "SOP8","Mix8", 
		"Derviant9", "Stufe9", "VFF9","PVS90", "0S9", "SOP9","Mix9" 
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p1_3.jsp";
	}
	
	public String getType() {
		return "";
	}
	

	@Override
	public String getTitle() {
		return "";
	}
}
