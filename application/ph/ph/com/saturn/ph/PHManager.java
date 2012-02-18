package com.saturn.ph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PHManager {

	private static final String[] BF = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"1.4 Anlaufkurve",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",

		"FV9_32FugenRad",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		
		"FV9_41NominLiefer",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] LF = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.3 Anlauforganisation – Fahrzeugbau",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"FV9_31PrufMBCub",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		
		"FV9_41NominLiefer",
		"4.2 Teilequalitaet ZP5 (HT)",
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFF",
		"FV9_42TeileStatPVS",
		"FV9_42TeileStat0S",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5",
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFF",
		"FV9_43TeileStatPVS",
		"FV9_43TeileStat0S",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_51PrKarLacMon",
		"FV9_51KarosserStat",
		"FV9_52Logiskonzept",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] VFF = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"FV9_31PrufMBCub",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		"FV9_34Funtionsmasse",
		"FV9_34FuntNachBaut",
		"FV9_34FuntAussTol",
		"3.4 Stellblaetter zu Konzept/Funktionsmassen",
		"FV9_35AuditNoteZP8",
		"FV9_35FehlerDenGew",
		"FV9_35NachareitPunk",
		"FV9_35MassnAbarBF",
		"FV9_35MassVerAud",
		"FV9_35AuditZP8Press",
		"FV9_35AuditZP8Kaross",
		"FV9_35AuditZP8Lack",
		"FV9_35AuditZP8Mont",
		"FV9_35AuditZP8Kauf",
		"FV9_35NachAbbaus",
		
		"FV9_41NominLiefer",
		"4.2 Teilequalitaet ZP5 (HT)",
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFF",
		"FV9_42TeileStatPVS",
		"FV9_42TeileStat0S",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5",
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFF",
		"FV9_43TeileStatPVS",
		"FV9_43TeileStat0S",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_51PrKarLacMon",
		"FV9_51KarosserStat",
		"FV9_52Logiskonzept",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] PVS = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"2.3 Softwarefehlerentwicklung",
		"2.3 Fehlerabbaustatus",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"FV9_31PrufMBCub",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		"FV9_34Funtionsmasse",
		"FV9_34FuntNachBaut",
		"FV9_34FuntAussTol",
		"3.4 Stellblaetter zu Konzept/Funktionsmassen",
		"FV9_35AuditNoteZP8",
		"FV9_35FehlerDenGew",
		"FV9_35NachareitPunk",
		"FV9_35MassnAbarBF",
		"FV9_35MassVerAud",
		"FV9_35AuditZP8Press",
		"FV9_35AuditZP8Kaross",
		"FV9_35AuditZP8Lack",
		"FV9_35AuditZP8Mont",
		"FV9_35AuditZP8Kauf",
		"FV9_35NachAbbaus",
		"FV9_36Vorch2Tag",
		
		"FV9_41NominLiefer",
		"4.2 Teilequalitaet ZP5 (HT)",
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFF",
		"FV9_42TeileStatPVS",
		"FV9_42TeileStat0S",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5",
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFF",
		"FV9_43TeileStatPVS",
		"FV9_43TeileStat0S",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_51PrKarLacMon",
		"FV9_51KarosserStat",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] OS = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"2.3 Softwarefehlerentwicklung",
		"2.3 Fehlerabbaustatus",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"FV9_31PrufMBCub",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		"FV9_34Funtionsmasse",
		"FV9_34FuntNachBaut",
		"FV9_34FuntAussTol",
		"3.4 Stellblaetter zu Konzept/Funktionsmassen",
		"FV9_35AuditNoteZP8",
		"FV9_35FehlerDenGew",
		"FV9_35NachareitPunk",
		"FV9_35MassnAbarBF",
		"FV9_35MassVerAud",
		"FV9_35AuditZP8Press",
		"FV9_35AuditZP8Kaross",
		"FV9_35AuditZP8Lack",
		"FV9_35AuditZP8Mont",
		"FV9_35AuditZP8Kauf",
		"FV9_35NachAbbaus",
		
		"4.2 Teilequalitaet ZP5 (HT)",
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFF",
		"FV9_42TeileStatPVS",
		"FV9_42TeileStat0S",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5",
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFF",
		"FV9_43TeileStatPVS",
		"FV9_43TeileStat0S",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_51PrKarLacMon",
		"FV9_51KarosserStat",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] SOP = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"2.3 Softwarefehlerentwicklung",
		"2.3 Fehlerabbaustatus",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		"FV9_34Funtionsmasse",
		"FV9_34FuntNachBaut",
		"FV9_34FuntAussTol",
		"3.4 Stellblaetter zu Konzept/Funktionsmassen",
		"FV9_35AuditNoteZP8",
		"FV9_35FehlerDenGew",
		"FV9_35NachareitPunk",
		"FV9_35MassnAbarBF",
		"FV9_35MassVerAud",
		"FV9_35AuditZP8Press",
		"FV9_35AuditZP8Kaross",
		"FV9_35AuditZP8Lack",
		"FV9_35AuditZP8Mont",
		"FV9_35AuditZP8Kauf",
		"FV9_35NachAbbaus",
		"FV9_36Vorch2Tag",
		
		"4.2 Teilequalitaet ZP5 (HT)",
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFF",
		"FV9_42TeileStatPVS",
		"FV9_42TeileStat0S",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5",
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFF",
		"FV9_43TeileStatPVS",
		"FV9_43TeileStat0S",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7",
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final String[] TEST = {
		"FV9_11ProjectTermin",
		"FV9_11Anlaufueber",
		"FV9_11VorserienTer",
		"FV9_12Aktionspunkte",
		"1.3 Anlauforganisation – Fahrzeugbau",
		"1.4 Anlaufkurve",
		"FV9_15BauprogVFF",
		"FV9_15BauprogPVS",
		"FV9_15Bauprog0S",
		"FV9_15FahrzeugaufZP5",
		"FV9_15FahrzeugaufZP8",
		"FV9_15Programmpunk",

		"FV9_21PBFreigBMG",
		"FV9_21PFreigabe",
		"FV9_21PFAbarbuebersc",
		"FV9_21BFreigabe",
		"FV9_21BFAbarbuebersc",
		"FV9_21BMG",
		"FV9_21BMGAbarbuebers",
		"FV9_22ErprobDauer",
		"2.3 Softwarefehlerentwicklung",
		"2.3 Fehlerabbaustatus",
		"FV9_24StatusAEKO",
		"FV9_24AEKOUmsetz",

		"FV9_31PrufMBCub",
		"FV9_32FugenRad",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Baubarkeit Gesamtfahrzeug",
		"3.3 Problemblatt",
		"FV9_34Funtionsmasse",
		"FV9_34FuntNachBaut",
		"FV9_34FuntAussTol",
		"3.4 Stellblaetter zu Konzept/Funktionsmassen",
		"FV9_35AuditNoteZP8",
		"FV9_35FehlerDenGew",
		"FV9_35NachareitPunk",
		"FV9_35MassnAbarBF",
		"FV9_35MassVerAud",
		"FV9_35AuditZP8Press",
		"FV9_35AuditZP8Kaross",
		"FV9_35AuditZP8Lack",
		"FV9_35AuditZP8Mont",
		"FV9_35AuditZP8Kauf",
		"FV9_35NachAbbaus",
		"FV9_36Vorch2Tag",
		
		"FV9_41NominLiefer",
		"4.2 Teilequalitaet ZP5 (HT)",
		"FV9_42TeileStatVFFHT",
		"FV9_42TeileStatPVSHT",
		"FV9_42TeileStat0SHT",
		"4.2 Terminübersicht ZP5(HT)",
		"4.2 Problemblatt ZP5 HT",
		
		"4.2 Teilequalitaet ZP5 (KT)",
		"FV9_42TeileStatVFFKT",
		"FV9_42TeileStatPVSKT",
		"FV9_42TeileStat0SKT",
		"4.2 Terminübersicht ZP5(KT)",
		"4.2 Problemblatt ZP5 KT",
		
		"4.3 Teilequalitaet ZP7 KT",
		"FV9_43TeileStatVFFKT",
		"FV9_43TeileStatPVSKT",
		"FV9_43TeileStat0SKT",
		"4.3 Terminübersicht ZP7(KT)",
		"4.3 Problemblatt ZP7 KT",
		
		"4.4 Aggregateverfügbarkeit ZP3/ZP4",

		"FV9_51PrKarLacMon",
		"FV9_51KarosserStat",
		"FV9_52Logiskonzept",

		"6.1 Launchplanung",

		"FV9_71Reifegrads",
		"7.2 Beschluss",
		"7.2 Übersicht zukünftige Termine"
	};
	
	private static final Map<String, String[]> roadmaps = new HashMap<String, String[]>();
	
	static {
		inital();
	}
	
	private static void inital() {
		roadmaps.put("BF", BF);
		roadmaps.put("LF", LF);
		roadmaps.put("VFF", VFF);
		roadmaps.put("PVS", PVS);
		roadmaps.put("0-S", OS);
		roadmaps.put("SOP", SOP);
		roadmaps.put("TEST", TEST);
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getIndexes(String roadmap, Map<String, Object> forms) {
		List<String> indexes = new ArrayList<String>(); 
		
		if (roadmaps.containsKey(roadmap)) {
			String[] types = roadmaps.get(roadmap);
			
			for (String type : types) {
				String path = "/app/pep/do/preview.do";//FormManager.getJspPath(type);
				Object object = forms.get(type);
				
				if (object != null) {
					if (object instanceof String) {
						indexes.add(path + "?uid=" + object);
					} else if (object instanceof List) {
						List<String> ids = (List<String>) object;
						
						for (String id : ids) {
							indexes.add(path + "?uid=" + id);
						}
					}
				} /*else {
					indexes.add(path);
				}*/
			}
		}
		
		return indexes;
	}
}
