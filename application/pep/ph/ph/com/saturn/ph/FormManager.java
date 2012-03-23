package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

import com.saturn.ph.form.p1.FV9_11AnlaufueberForm;
import com.saturn.ph.form.p1.FV9_11AnlaufuebersichtDataset;
import com.saturn.ph.form.p1.FV9_11ProjectTerminForm;
import com.saturn.ph.form.p1.FV9_11VorserienTerForm;
import com.saturn.ph.form.p1.FV9_12AktionspunkteForm;
import com.saturn.ph.form.p1.FV9_13AnlauforganisationDataset;
import com.saturn.ph.form.p1.FV9_14AnlaufkurveDataset;
import com.saturn.ph.form.p1.FV9_15Bauprog0S;
import com.saturn.ph.form.p1.FV9_15BauprogPVS;
import com.saturn.ph.form.p1.FV9_15BauprogVFF;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP5Form;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP8Form;
import com.saturn.ph.form.p1.FV9_15ProgrammpunkteForm;
import com.saturn.ph.form.p2.FV9_21BFAbarbueberscForm;
import com.saturn.ph.form.p2.FV9_21BFreigabeForm;
import com.saturn.ph.form.p2.FV9_21BMGAbarbuebersForm;
import com.saturn.ph.form.p2.FV9_21BMGForm;
import com.saturn.ph.form.p2.FV9_21PBFreigBMGForm;
import com.saturn.ph.form.p2.FV9_21PFAbarbueberscForm;
import com.saturn.ph.form.p2.FV9_21PFreigabeForm;
import com.saturn.ph.form.p2.FV9_22ErprobDauerForm;
import com.saturn.ph.form.p2.FV9_23FehlerabbaustatusDataset;
import com.saturn.ph.form.p2.FV9_23SoftwarefehlerentwicklungDataset;
import com.saturn.ph.form.p2.FV9_24AEKOUmsetzForm;
import com.saturn.ph.form.p2.FV9_24StatusAEKOForm;
import com.saturn.ph.form.p3.FV9_31PrufMBCubForm;
import com.saturn.ph.form.p3.FV9_32FugenRadForm;
import com.saturn.ph.form.p3.FV9_33BaubarkeitGesamtfahrzeug1Dataset;
import com.saturn.ph.form.p3.FV9_33BaubarkeitGesamtfahrzeug2Dataset;
import com.saturn.ph.form.p3.FV9_33ProblemblattDataset;
import com.saturn.ph.form.p3.FV9_34FuntAussTolForm;
import com.saturn.ph.form.p3.FV9_34FuntNachBautForm;
import com.saturn.ph.form.p3.FV9_34FuntionsmasseForm;
import com.saturn.ph.form.p3.FV9_35AuditNoteZP8Form;
import com.saturn.ph.form.p3.FV9_35AuditZP8KarossForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8KaufForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8LackForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8MontForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8PressForm;
import com.saturn.ph.form.p3.FV9_35FehlerDenGewForm;
import com.saturn.ph.form.p3.FV9_35MassVerAudForm;
import com.saturn.ph.form.p3.FV9_35MassnAbarBFForm;
import com.saturn.ph.form.p3.FV9_35NachAbbausForm;
import com.saturn.ph.form.p3.FV9_35NachareitPunkForm;
import com.saturn.ph.form.p3.FV9_36Vorch2TagForm;
import com.saturn.ph.form.p4.FV9_41NominLieferForm;
import com.saturn.ph.form.p4.FV9_42ProblemblattZP5HTDataset;
import com.saturn.ph.form.p4.FV9_42ProblemblattZP5KTDataset;
import com.saturn.ph.form.p4.FV9_42TeileStat0SHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStat0SKTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatPVSHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatPVSKTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatVFFHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatVFFKTForm;
import com.saturn.ph.form.p4.FV9_42TeilequalitaetZP5HTDataset;
import com.saturn.ph.form.p4.FV9_42TeilequalitaetZP5KTDataset;
import com.saturn.ph.form.p4.FV9_42TerminubersichtZP5HTDataset;
import com.saturn.ph.form.p4.FV9_42TerminubersichtZP5KTDataset;
import com.saturn.ph.form.p4.FV9_43ProblemblattZP7KTDataset;
import com.saturn.ph.form.p4.FV9_43TeileStat0SKTForm;
import com.saturn.ph.form.p4.FV9_43TeileStatPVSKTForm;
import com.saturn.ph.form.p4.FV9_43TeileStatVFFKTForm;
import com.saturn.ph.form.p4.FV9_43TeilequalitaetZP7KTDataset;
import com.saturn.ph.form.p4.FV9_43TerminubersichtZP7KTDataset;
import com.saturn.ph.form.p4.FV9_44AggregateverfuegbarkeitDataset;
import com.saturn.ph.form.p5.FV9_51KarosserStatForm;
import com.saturn.ph.form.p5.FV9_51PrKarLacMonForm;
import com.saturn.ph.form.p5.FV9_52LogistikkonzeptForm;
import com.saturn.ph.form.p6.FV9_61LaunchplanungDataset;
import com.saturn.ph.form.p7.FV9_71ReifegradsForm;
import com.saturn.ph.form.p7.FV9_72BeschlussDataset;
import com.saturn.ph.form.p7.FV9_72UeberZuTerDataset;
import com.saturn.ph.form.pbackup.FV9BackUpDataset;
import com.saturn.tc.utils.WorkspaceUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class FormManager {

	private static Map<String, Form> forms = new HashMap<String, Form>();

	static {
		inital();
	}

	private FormManager() {
	}

	public static Map<String, Object> getFormValue(String uid, boolean refresh) {
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);

		if (object != null) {
			String type = object.getType().getName();
			if (type.equalsIgnoreCase(WorkspaceUtils.DatasetType) ||
					type.equalsIgnoreCase(WorkspaceUtils.BackUpType)) {
				try {
					if(object.getProperty(WorkspaceUtils.DatasetPageName) != null){
						type = object.getProperty(WorkspaceUtils.DatasetPageName)
						.getDisplayableValue();
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
			
			return getFormValue(type, uid, refresh);
		}
		
		return new HashMap<String, Object>();
	}
	
	public static String getFormType(String uid, boolean refresh) {
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);

		if (object != null) {
			String type = object.getType().getName();
			if (type.equalsIgnoreCase(WorkspaceUtils.DatasetType)) {
				try {
					if(object.getProperty(WorkspaceUtils.DatasetPageName) != null){
						type = object.getProperty(WorkspaceUtils.DatasetPageName)
						.getDisplayableValue();
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
			
			if (type.equalsIgnoreCase(WorkspaceUtils.BackUpType)) {
				type = "FV9PHBackup";
			}
			
			return type;
		}
		
		return null;
	}

	public static Map<String, Object> getFormValue(String type, String uid,
			boolean refresh) {
		if (forms.containsKey(type)) {
			return forms.get(type).getValue(uid, refresh);
		}

		return new HashMap<String, Object>();
	}

	public static String getJspPath(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getJspPath();
		}

		return "/app/pep/index.jsp";
	}

	public static String getFormTitle(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getTitle();
		}

		return "";
	}

	public static void add(Form form) {
		forms.put(form.getType(), form);
	}

	private static void inital() {
		add(new FV9_11ProjectTerminForm());
		add(new FV9_11AnlaufuebersichtDataset());
		add(new FV9_11AnlaufueberForm());
		add(new FV9_11VorserienTerForm());
		add(new FV9_12AktionspunkteForm());
		add(new FV9_13AnlauforganisationDataset());
		add(new FV9_14AnlaufkurveDataset());
		add(new FV9_15BauprogVFF());
		add(new FV9_15BauprogPVS());
		add(new FV9_15Bauprog0S());
		add(new FV9_15FahrzeugaufZP5Form());
		add(new FV9_15FahrzeugaufZP8Form());
		add(new FV9_15ProgrammpunkteForm());

		add(new FV9_21PBFreigBMGForm());
		add(new FV9_21PFreigabeForm());
		add(new FV9_21PFAbarbueberscForm());
		add(new FV9_21BFreigabeForm());
		add(new FV9_21BFAbarbueberscForm());
		add(new FV9_21BMGForm());
		add(new FV9_21BMGAbarbuebersForm());
		add(new FV9_22ErprobDauerForm());
		add(new FV9_23FehlerabbaustatusDataset());
		add(new FV9_23SoftwarefehlerentwicklungDataset());
		add(new FV9_24StatusAEKOForm());
		add(new FV9_24AEKOUmsetzForm());

		add(new FV9_31PrufMBCubForm());
		add(new FV9_32FugenRadForm());
		add(new FV9_33BaubarkeitGesamtfahrzeug1Dataset());
		add(new FV9_33BaubarkeitGesamtfahrzeug2Dataset());
		add(new FV9_33ProblemblattDataset());
		add(new FV9_34FuntionsmasseForm());
		add(new FV9_34FuntNachBautForm());
		add(new FV9_34FuntAussTolForm());
		add(new FV9_35AuditNoteZP8Form());
		add(new FV9_35FehlerDenGewForm());
		add(new FV9_35NachareitPunkForm());
		add(new FV9_35MassnAbarBFForm());
		add(new FV9_35MassVerAudForm());
		add(new FV9_35AuditZP8PressForm());
		add(new FV9_35AuditZP8KarossForm());
		add(new FV9_35AuditZP8LackForm());
		add(new FV9_35AuditZP8MontForm());
		add(new FV9_35AuditZP8KaufForm());
		add(new FV9_35NachAbbausForm());
		add(new FV9_36Vorch2TagForm());

		add(new FV9_41NominLieferForm());
		add(new FV9_42TeilequalitaetZP5HTDataset());
		add(new FV9_42TeileStatVFFHTForm());
		add(new FV9_42TeileStatPVSHTForm());
		add(new FV9_42TeileStat0SHTForm());
		add(new FV9_42TerminubersichtZP5HTDataset());
		add(new FV9_42ProblemblattZP5HTDataset());

		add(new FV9_42TeilequalitaetZP5KTDataset());
		add(new FV9_42TeileStatVFFKTForm());
		add(new FV9_42TeileStatPVSKTForm());
		add(new FV9_42TeileStat0SKTForm());
		add(new FV9_42TerminubersichtZP5KTDataset());
		add(new FV9_42ProblemblattZP5KTDataset());

		add(new FV9_43TeilequalitaetZP7KTDataset());
		add(new FV9_43TeileStatVFFKTForm());
		add(new FV9_43TeileStatPVSKTForm());
		add(new FV9_43TeileStat0SKTForm());
		add(new FV9_43TerminubersichtZP7KTDataset());
		add(new FV9_43ProblemblattZP7KTDataset());

		add(new FV9_44AggregateverfuegbarkeitDataset());

		add(new FV9_51KarosserStatForm());
		add(new FV9_51PrKarLacMonForm());
		add(new FV9_52LogistikkonzeptForm());

		add(new FV9_61LaunchplanungDataset());

		add(new FV9_71ReifegradsForm());
		add(new FV9_72BeschlussDataset());
		add(new FV9_72UeberZuTerDataset());
		
/*		add(new FV9BackUp1Dataset());
		add(new FV9BackUp2Dataset());
		add(new FV9BackUp3Dataset());
		add(new FV9BackUp4Dataset());
		add(new FV9BackUp5Dataset());
		add(new FV9BackUp6Dataset());
		add(new FV9BackUp7Dataset());*/
		add(new FV9BackUpDataset());

	}
}
