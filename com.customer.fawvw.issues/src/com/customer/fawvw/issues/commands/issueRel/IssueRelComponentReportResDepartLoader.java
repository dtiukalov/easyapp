package com.customer.fawvw.issues.commands.issueRel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class IssueRelComponentReportResDepartLoader {

	private static HashMap<String, Object> departments = new HashMap<String, Object>();
	
    private static Map<String, Integer> PL = new HashMap<String, Integer>();
    private static Map<String, Integer> QAPP = new HashMap<String, Integer>();
    private static Map<String, Integer> LO = new HashMap<String, Integer>();
    private static Map<String, Integer> BS = new HashMap<String, Integer>();
    private static Map<String, Integer> PA = new HashMap<String, Integer>();
	private static Map<String, Integer> SU = new HashMap<String, Integer>();
	private static Map<String, Integer> VSC = new HashMap<String, Integer>();
	private static Map<String, Integer> CA = new HashMap<String, Integer>();
	private static Map<String, Integer> TE = new HashMap<String, Integer>();
	
	
	public static  HashMap<String,Object> load(ArrayList<HashMap<String, Object>> values){
		PL.put("red", 0); 
		PL.put("green", 0); 
		PL.put("yellow", 0); 
		
		QAPP.put("red", 0); 
		QAPP.put("green", 0); 
		QAPP.put("yellow", 0); 
		
		LO.put("red", 0); 
		LO.put("green", 0); 
		LO.put("yellow", 0); 
		
		BS.put("red", 0); 
		BS.put("green", 0); 
		BS.put("yellow", 0); 
		
		PA.put("red", 0); 
		PA.put("green", 0); 
		PA.put("yellow", 0); 
		
		SU.put("red", 0); 
		SU.put("green", 0); 
		SU.put("yellow", 0); 
		
		VSC.put("red", 0); 
		VSC.put("green", 0); 
		VSC.put("yellow", 0); 
		
		CA.put("red", 0); 
		CA.put("green", 0); 
		CA.put("yellow", 0); 
		
		TE.put("red", 0); 
		TE.put("green", 0); 
		TE.put("yellow", 0); 
		
		for (int k=0; k<values.size(); k++) {
			if (!"".equals((String)(values.get(k)).get("fv9SolutionBS"))) {   
				BS = sumLightStatue(BS,(String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCA"))) {   
				CA = sumLightStatue(CA,(String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionLO"))) {   
				LO = sumLightStatue(LO,(String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionPA"))){ 
				PA = sumLightStatue(PA, (String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionPL"))) { 
				PL = sumLightStatue(PL, (String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionQAPP"))){ 
				QAPP = sumLightStatue(QAPP, (String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionSU"))) { 
				SU = sumLightStatue(SU, (String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionVSC"))){ 
				VSC = sumLightStatue(VSC, (String)(values.get(k)).get("RGStatus")); 
			}
			if (!"".equals((String)(values.get(k)).get("fv9SolutionTE"))){ 
				TE = sumLightStatue(TE, (String)(values.get(k)).get("RGStatus")); 
			}
			
		}

		departments.put("BS", BS); 
		departments.put("CA", CA); 
		departments.put("LO", LO); 
		departments.put("PA", PA); 
		departments.put("PL", PL); 
		departments.put("QAPP", QAPP); 
		departments.put("SU", SU); 
		departments.put("VSC", VSC); 
		departments.put("TE", TE); 
		
		return departments;
				
	} 
	
	
	public static Map<String,Integer> sumLightStatue (Map<String,Integer> parts,String lightStatue){
		
		if ("ºì".equals(lightStatue)) {
			parts.put("red", (Integer)parts.get("red")+1);  
		}
		if ("»Æ".equals(lightStatue)) {
			parts.put("yellow", (Integer)parts.get("yellow")+1);  
		}
		if ("ÂÌ".equals(lightStatue)) {
			parts.put("green", (Integer)parts.get("green")+1); 
		}
		
		return parts;
	}
}
