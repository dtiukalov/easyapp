package com.saturn.ph.form.p1;

import com.saturn.ph.Form;

public class FV9_11VorserienTerForm extends Form {
	
	private static final String[] attr = {
		"fv9VFFTBTZP5", "fv9VFFTBTZP7", "fv9VFFVorStart", "fv9VFFVorEnd",
		"fv9VFFVorBatches","fv9VFFVorFzg","fv9VFFAbsMeter","fv9VFFAbsStart",
		"fv9VFFAbsEnd","fv9PVSTBTZP5","fv9PVSTBTZP7","fv9PVSVorStart",
		"fv9PVSVorEnd","fv9PVSVorBatches","fv9PVSVorFzg","fv9PVSAbsMeter",
		"fv9PVSAbsStart","fv9PVSAbsEnd","fv90STBTZP5","fv90STBTZP7",
		"fv90SVorStart","fv90SVorEnd","fv90SVorBatches","fv90SVorFzg",
		"fv90SAbsMeter","fv90SAbsStart","fv90SAbsEnd","fv9TPPA_ME",
		"fv9QFTPPA_Kunde",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/1/p1_4.jsp";
	}

	@Override
	public String getType() {
		return "FV9_11VorserienTer";
	}

	@Override
	public String getTitle() {
		return "1.1 Vorserienterminplan";
	}
}
