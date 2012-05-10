package com.saturn.ph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.Property;
import com.teamcenter.soa.client.model.Type;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class PHManager {

	private static final String[] ALL = {
			"Agenda",
			"FV9_11ProjectTermin",
			"1.1 Anlaufuebersicht",
			// "FV9_11Anlaufueber",
			"FV9_11VorserienTer", 
			"FV9_12Aktionspunkte",
			"1.3 Anlauforganisation - Fahrzeugbau", "1.4 Anlaufkurve",
			"FV9_15FahrzeugaufZP5", "FV9_15FahrzeugaufZP8",
			"FV9_15BauprogVFF", "FV9_15BauprogPVS", "FV9_15Bauprog0S", 
			"FV9_15Programmpunk",

			"FV9_21PBFreigBMG", "FV9_21PFreigabe", "FV9_21PFAbarbuebersc",
			"FV9_21BFreigabe", "FV9_21BFAbarbuebersc", "FV9_21BMG",
			"FV9_21BMGAbarbuebers", "FV9_22ErprobDauer",
			"2.3 Fehlerabbaustatus Software",
			"FV9_24StatusAEKO", 
//			"2.4 Status AEKO",
			"FV9_24AEKOUmsetz",

			"FV9_31PrufMBCub", "FV9_32FugenRad",
			"3.3 Baubarkeit Gesamtfahrzeug", "3.3 Baubarkeit Gesamtfahrzeug\n",
			"3.3 Problemblatt", "FV9_34Funtionsmasse", "FV9_34FuntNachBaut",
			"FV9_34FuntAussTol", 
	//		"3.4 Funktionsmasse ausserhalb der Toleranz",
			"FV9_35AuditNoteZP8", "FV9_35FehlerDenGew",
			"3.5 Audit Reduzierungsprognose", "3.5 Fehlerpunkte in den Gewerken",
			"FV9_35NachareitPunk", "FV9_35MassnAbarBF", "FV9_35MassVerAud",
			"FV9_35AuditZP8Press", "FV9_35AuditZP8Kaross",
			"FV9_35AuditZP8Lack", "FV9_35AuditZP8Mont", "FV9_35AuditZP8Kauf",
			"FV9_35NachAbbaus", "FV9_36Vorch2Tag",

			"FV9_41NominLiefer", "4.2 Teilequalitaet ZP5 (HT)",
			"FV9_42TeileStatVFFHT", "FV9_42TeileStatPVSHT",
			"FV9_42TeileStat0SHT", "4.2 Terminuebersicht ZP5 (HT)",
			"4.2 Problemblatt",

			"4.2 Teilequalitaet ZP5 (KT)", "FV9_42TeileStatVFFKT",
			"FV9_42TeileStatPVSKT", "FV9_42TeileStat0SKT",
			"4.2 Terminubersicht ZP5 (KT)", "4.2 Problemblatt\n",

			"4.3 Teilequalitaet ZP7 (KT)", 
			"FV9_43TeileStatVFFKT",
		//	"4.3 Teilestatus zu VFF ZP7 (KT)",
			"FV9_43TeileStatPVSKT", "FV9_43TeileStat0SKT",
			"4.3 Terminubersicht ZP7 (KT)", "4.3 Problemblatt",

			"4.4 Aggregateverfuegbarkeit ZP3/ZP4",

			"FV9_51PrKarLacMon", 
		//	"FV9_51KarosserStat", 
			"5.1 Status Karosseriebau",
			"FV9_52Logiskonzept",

			"6.1 Launchplanung",

			"FV9_71Reifegrads", 
//			"7.2 Beschluss",
			"FV9_72Beschluss",
			"7.2 Uebersicht zukunftige Termine",

			"FV9PHBackup" };

	private static final Map<String, String[]> roadmaps = new HashMap<String, String[]>();

	static {
		inital();
	}

	private static void inital() {
		/*
		 * roadmaps.put("BF", BF); roadmaps.put("LF", LF); roadmaps.put("VFF",
		 * VFF); roadmaps.put("PVS", PVS); roadmaps.put("0-S", OS);
		 * roadmaps.put("SOP", SOP);
		 */
		roadmaps.put("ALL", ALL);
	}

	@SuppressWarnings("unchecked")
	public static List<String> getIndexes(String roadmap,
			Map<String, Object> forms) {
		String path = "/app/pep/do/preview.do";// FormManager.getJspPath(type);
		//	String path = "/app/pep/do/bufferview.do";// FormManager.getJspPath(type);
		
		List<String> indexes = new ArrayList<String>();
		
		indexes.add("/app/pep/titlePage.jsp");
		// if (roadmaps.containsKey(roadmap)) {
		String[] types = roadmaps.get("ALL");

		for (String type : types) {
			
			Object object = forms.get(type);

			if (object != null) {
				if (object instanceof String) {
					
					addIndex(indexes, object.toString(), path);
					
				} else if (object instanceof List) {
					List<String> ids = (List<String>) object;

					for (String id : ids) {
//						indexes.add(path + "?uid=" + id);
						addIndex(indexes, id, path);
					}
										
				}
			}
		}
		// }

		return indexes;
	}
	
	/*
	 * indexes为页面索引
	 * object为某个类型的数据对象 1-n个
	 * path 页面路径
	 * */
	public static void addIndex(List<String> indexes, String uid, String path) {
		try {
			//根据UID获取对象
			ModelObject form = PH.getDataService().loadModelObjectRefresh(uid);
			String form_type = form.getProperty("object_type").getStringValue();
			//FV9PHImage 和 FV9PHBackup  不做任何处理
			if ("FV9PHImage".equals(form_type) || "FV9PHBackup".equals(form_type)) {
				indexes.add(path + "?uid=" + uid);
			} else {
				//非FV9PHImage 和 FV9PHBackup 要判断关系下是否存在数据集
				PH.getDataService().getProperties(form, "fv9DisplayRule", "FV9Options");
				
				String displayRules = (String)form.getPropertyDisplayableValue("fv9DisplayRule");
				//显示规则为Form或者为空,只显示Form
				//显示规则为Image,只显示数据集
				//显示规则为Both,先显示Form,再显示数据集
				if ("Image".equals(displayRules)) {
					ModelObject[] images = form.getProperty("FV9Options").getModelObjectArrayValue();
					PH.getDataService().getProperties(images, "object_type", "fv9PreRelesed");
					
					for (ModelObject model : images){
						//FV9Options关系下的对象为FV9PHImage类型 且 已经预发布
						PH.getDataService().refreshObjects(model);
						if ("FV9PHImage".equals(model.getProperty("object_type").getStringValue()) &&
								"Yes".equalsIgnoreCase(model.getPropertyDisplayableValue("fv9PreRelesed"))) {
							indexes.add(path + "?uid=" + model.getUid());
						}
					}
					
				} else if ("Both".equals(displayRules)) {
					
					indexes.add(path + "?uid=" + uid);
					
					ModelObject[] images = form.getProperty("FV9Options").getModelObjectArrayValue();
					PH.getDataService().getProperties(images, "object_type", "fv9PreRelesed");
					
					for (ModelObject model : images){
						PH.getDataService().refreshObjects(model);
						//FV9Options关系下的对象为FV9PHImage类型 且 已经预发布
						if ("FV9PHImage".equals(model.getProperty("object_type").getStringValue()) &&
								"Yes".equalsIgnoreCase(model.getPropertyDisplayableValue("fv9PreRelesed"))) {
							indexes.add(path + "?uid=" + model.getUid());
						}
					}
				} else {
					indexes.add(path + "?uid=" + uid);
				}

			}
			
		} catch (NotLoadedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void doBuffer(Map<String, Object> forms, PHBuffer buffer) {
		String[] types = roadmaps.get("ALL");

		for (String type : types) {
			Object uid = forms.get(type);

			if (uid != null) {
				if (uid instanceof String) {
					String formUid = (String)uid;
					buffer.addBuffer(formUid, getBufferValue(formUid));
				} else if (uid instanceof List) {
					List<String> ids = (List<String>) uid;

					for (String id : ids) {
						buffer.addBuffer(id, getBufferValue(id));
					}
				}
			}
		}
	}
	
	public static Map<String, Object> getBufferValue(String formUid) {
		Map<String, Object> bufferForm = new HashMap<String, Object>();
		String type = FormManager.getFormType(formUid, true);
		bufferForm.put("uid", formUid);
		bufferForm.put("type", type);
		bufferForm.put("form", FormManager.getFormValue(type, formUid, true));
		
		return bufferForm;
	}
}
