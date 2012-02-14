package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_42TerSichtZP5HTForm extends Form {
	
	private static final String[] attr = {
		"fv9TopPartName", "fv9AssemblyName", "fv9BFZerStart", "fv9BFZerEnd",
		"fv9BFStart", "fv9BFEnd", "fv9HWZStart", "fv9HWZEnd",
		"fv9KSWZStart", "fv9KSWZEnd", "fv9WVerlStart", "fv9WVerlEnd",
		"fv9SWZStart", "fv9SWZEnd", "fv9EMAnStart", "fv9EMAnEnd",
		"fv9Note3Start", "fv9Note3End", "fv9Note1Start", "fv9Note1End"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p2_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_42TerSichtZP5HT";
	}

	@Override
	public String getTitle() {
		return "4.2 Terminuebersicht ZP5 (HT)";
	}
}
