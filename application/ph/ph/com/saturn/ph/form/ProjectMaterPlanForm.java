package com.saturn.ph.form;

import com.saturn.ph.Form;
//1.1 Projektterminplan 项目主计划表
public class ProjectMaterPlanForm extends Form {
	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept",
		"fv9PM", "fv9PMDept",
		"fv9PP", "fv9PPDept", 
		"fv9PD", "fv9PDDept", 
		"fv9PF", "fv9PFDept",
		"fv9KE", "fv9KEDept",
		"fv9DE", "fv9DEDept", 
		"fv9DFExt", "fv9DFExtDept", 
		"fv9DFInt", "fv9DFIntDept", 
		"fv9BF", "fv9BFDept",
		"fv9LF", "fv9LFDept",
		"fv9VFF", "fv9VFFDept",
		"fv9PVS", "fv9PVSDept",
		"fv90S", "fv90SDept",
		"fv9SOP", "fv9SOPDept",
		"fv9ME", "fv9MEDept"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p1_2.jsp";
	}
	
	public String getType() {
		return "";
	}
	

	@Override
	public String getTitle() {
		return "";
	}
}
