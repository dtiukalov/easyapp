package com.customer.fawvw.issues.commands.common.loader;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DeptLoader {

private static Map<String, Object> departments = new HashMap<String, Object>();
	
    private static Map<String, Integer> PL = new HashMap<String, Integer>();
    private static Map<String, Integer> QAPP = new HashMap<String, Integer>();
    private static Map<String, Integer> LO = new HashMap<String, Integer>();
    private static Map<String, Integer> TE = new HashMap<String, Integer>();
	private static Map<String, Integer> SU = new HashMap<String, Integer>();
	private static Map<String, Integer> VSC = new HashMap<String, Integer>();
	private static Map<String, Integer> ME1 = new HashMap<String, Integer>();
	private static Map<String, Integer> BS1 = new HashMap<String, Integer>();
	private static Map<String, Integer> PA1 = new HashMap<String, Integer>();
	private static Map<String, Integer> CA1 = new HashMap<String, Integer>();
	private static Map<String, Integer> ME2 = new HashMap<String, Integer>();
	private static Map<String, Integer> BS2 = new HashMap<String, Integer>();
	private static Map<String, Integer> PA2 = new HashMap<String, Integer>();
	private static Map<String, Integer> CA2 = new HashMap<String, Integer>();
	
	public static  Map<String,Object> load(ArrayList<HashMap<String, Object>> values){
		
		PL.put("red", 0); 
		PL.put("green", 0); 
		PL.put("yellow", 0); 
		
		QAPP.put("red", 0); 
		QAPP.put("green", 0); 
		QAPP.put("yellow", 0); 
		
		LO.put("red", 0); 
		LO.put("green", 0); 
		LO.put("yellow", 0); 
		
		SU.put("red", 0); 
		SU.put("green", 0); 
		SU.put("yellow", 0); 
		
		VSC.put("red", 0); 
		VSC.put("green", 0); 
		VSC.put("yellow", 0); 
		
		TE.put("red", 0); 
		TE.put("green", 0); 
		TE.put("yellow", 0); 
		
		ME1.put("red", 0); 
		ME1.put("green", 0); 
		ME1.put("yellow", 0); 
		
		BS1.put("red", 0); 
		BS1.put("green", 0); 
		BS1.put("yellow", 0); 
		
		PA1.put("red", 0); 
		PA1.put("green", 0); 
		PA1.put("yellow", 0); 
		
		CA1.put("red", 0); 
		CA1.put("green", 0); 
		CA1.put("yellow", 0); 
		
		ME2.put("red", 0); 
		ME2.put("green", 0); 
		ME2.put("yellow", 0); 
		
		BS2.put("red", 0); 
		BS2.put("green", 0); 
		BS2.put("yellow", 0); 
		
		PA2.put("red", 0); 
		PA2.put("green", 0); 
		PA2.put("yellow", 0); 
		
		CA2.put("red", 0); 
		CA2.put("green", 0); 
		CA2.put("yellow", 0); 
		
		for (int k=0; k<values.size(); k++) {
			if (!"".equals((String)(values.get(k)).get("fv9SolutionTE")))   
				TE = sumLightStatue(TE,(String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionLO")))   
				LO = sumLightStatue(LO,(String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionPL"))) 
				PL = sumLightStatue(PL, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionQAPP")))
				QAPP = sumLightStatue(QAPP, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionSU"))) 
				SU = sumLightStatue(SU, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionVSC")))
				VSC = sumLightStatue(VSC, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCP1_ME")))
				ME1 = sumLightStatue(ME1, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionPA")))
				PA1 = sumLightStatue(PA1, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionBS")))   
				BS1 = sumLightStatue(BS1,(String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCA")))   
				CA1 = sumLightStatue(CA1,(String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCP2_ME")))
				ME2 = sumLightStatue(ME2, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCP2PA")))
				PA2 = sumLightStatue(PA2, (String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCP2BS")))   
				BS2 = sumLightStatue(BS2,(String)(values.get(k)).get("fv9RGStatus")); 
			if (!"".equals((String)(values.get(k)).get("fv9SolutionCP2CA")))   
				CA2 = sumLightStatue(CA2,(String)(values.get(k)).get("fv9RGStatus")); 
		}
		
		departments.put("LO", LO); 
		departments.put("PL", PL); 
		departments.put("QAPP", QAPP); 
		departments.put("SU", SU); 
		departments.put("VSC", VSC); 
		departments.put("TE", TE); 
		departments.put("ME1", ME1); 
		departments.put("BS1", BS1); 
		departments.put("CA1", CA1); 
		departments.put("PA1", PA1); 
		departments.put("ME2", ME2); 
		departments.put("BS2", BS2); 
		departments.put("CA2", CA2); 
		departments.put("PA2", PA2); 
		
		System.out.println("按责任部门统计" 
				+ "\r\n" + "LO:" + departments.get("LO") 
				+ "\r\n" + "PL:" + departments.get("PL") 
				+ "\r\n" + "QAPP:" + departments.get("QAPP") 
				+ "\r\n" + "SU:" + departments.get("SU") 
				+ "\r\n" + "VSC" + departments.get("VSC")
				+ "\r\n" + "ME1:" + departments.get("ME1")  
				+ "\r\n" + "BS1:" + departments.get("BS1")  
				+ "\r\n" + "CA1:" + departments.get("CA1") 
				+ "\r\n" + "PA1:" + departments.get("PA1")
				+ "\r\n" + "ME2:" + departments.get("ME2")  
				+ "\r\n" + "BS2:" + departments.get("BS2")  
				+ "\r\n" + "CA2:" + departments.get("CA2") 
				+ "\r\n" + "PA2:" + departments.get("PA2")
		);
		
		return departments;
				
	} 
	
	public static Map<String,Integer> sumLightStatue (Map<String,Integer> parts,String lightStatue){
		
		if ("红".equals(lightStatue))
			parts.put("red", (Integer)parts.get("red")+1);  
		if ("黄".equals(lightStatue)) 
			parts.put("yellow", (Integer)parts.get("yellow")+1);  
		if ("绿".equals(lightStatue))  
			parts.put("green", (Integer)parts.get("green")+1);  
		
		return parts;
	}
	
}
