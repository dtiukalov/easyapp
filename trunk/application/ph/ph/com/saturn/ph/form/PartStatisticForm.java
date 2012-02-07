package com.saturn.ph.form;

import com.saturn.ph.Form;
//2.1 P-Freigaben/B-Freigaben/BMG 零件数量统计表
public class PartStatisticForm extends Form {
	private static final String[] attr = {
		"fv9ReportMeil","fv9ReportDept",
		"fv9Phase",
		"fv9AggregateSoll", "fv9AggregateIst",
		"fv9AusstattungSoll", "fv9AusstattungIst", 
		"fv9FahrwerkSoll","fv9FahrwerkIst", 
		"fv9GetriebeSoll", "fv9GetriebeIst",
		"fv9KarosserieSoll", "fv9KarosserieIst",
		"fv9MotorSoll","fv9MotorIst", 
		"fv9134Soll", "fv9134Ist"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p1_2.jsp";
	}

	public String getType() {
		return "";
	}
}
