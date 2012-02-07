package com.saturn.ph.form;

import com.saturn.ph.Form;
//1.2 Aktionspunkte aus letzter Pilothalle 遗留问题汇报表
public class LastPHForm extends Form {
	
	private static final String[] attr = {
		"ReportMeil","ReportDept",
		"fv9Benennung0", "fv9Ergebnis0", "fv9Verantwortlich0", "fv9Termin0", "fv9Status0",
		"fv9Benennung1", "fv9Ergebnis1", "fv9Verantwortlich1", "fv9Termin1", "fv9Status1",
		"fv9Benennung2", "fv9Ergebnis2", "fv9Verantwortlich2", "fv9Termin2", "fv9Status2",
		"fv9Benennung3", "fv9Ergebnis3", "fv9Verantwortlich3", "fv9Termin3", "fv9Status3",
		"fv9Benennung4", "fv9Ergebnis4", "fv9Verantwortlich4", "fv9Termin4", "fv9Status4",
		"fv9Benennung5", "fv9Ergebnis5", "fv9Verantwortlich5", "fv9Termin5", "fv9Status5",
		"fv9Benennung6", "fv9Ergebnis6", "fv9Verantwortlich6", "fv9Termin6", "fv9Status6",
		"fv9Benennung7", "fv9Ergebnis7", "fv9Verantwortlich7", "fv9Termin7", "fv9Status7",
		"fv9Benennung8", "fv9Ergebnis8", "fv9Verantwortlich8", "fv9Termin8", "fv9Status8",
		"fv9Benennung9", "fv9Ergebnis9", "fv9Verantwortlich9", "fv9Termin9", "fv9Status9"
	};
	
	public String[] getAttributes() {
		return attr;
	}
	
	public String getType() {
		return "";
	}

	public String getJspPath() {
		return "/app/pep/1/p2_1.jsp";
	}
	
	@Override
	public String getTitle() {
		return "";
	}
}
