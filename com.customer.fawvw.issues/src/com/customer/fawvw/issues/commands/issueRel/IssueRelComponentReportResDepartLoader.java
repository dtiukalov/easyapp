package com.customer.fawvw.issues.commands.issueRel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class IssueRelComponentReportResDepartLoader {

	private static HashMap<String, Object> departments = new HashMap<String, Object>();
	
	private static Map<String, Object> plDePartment = new HashMap<String, Object>(); 
	private static Map<String, Object> qaDePartment = new HashMap<String, Object>(); 
    private static Map<String, Object> meDepartment = new HashMap<String, Object>();
	
    private static Map<String, Integer> pms = new HashMap<String, Integer>();
    private static Map<String, Integer> sus = new HashMap<String, Integer>();
    private static Map<String, Integer> pes = new HashMap<String, Integer>();
    private static Map<String, Integer> mes = new HashMap<String, Integer>();
    private static Map<String, Integer> pls = new HashMap<String, Integer>();
	private static Map<String, Integer> qas = new HashMap<String, Integer>();
	private static Map<String, Integer> vscs = new HashMap<String, Integer>();
	private static Map<String, Integer> los = new HashMap<String, Integer>();
	
	
	public static  HashMap<String,Object> load(ArrayList<HashMap<String, Object>> values){
		//质保部
		qaDePartment.put("内饰质保科", "QA");  //$NON-NLS-2$
		qaDePartment.put("电子电器质保科", "PL");   //$NON-NLS-2$
		qaDePartment.put("车身底盘质保科", "PL");  //$NON-NLS-2$
		//规划部
		plDePartment.put("冲压规划科", "PL");   //$NON-NLS-2$
		plDePartment.put("焊装规划科", "PL");   //$NON-NLS-2$
		plDePartment.put("涂装规划科", "PL");   //$NON-NLS-2$
		plDePartment.put("总装规划科", "PL");   //$NON-NLS-2$
		//厂家
		meDepartment.put("一厂冲压", "ME");   //$NON-NLS-2$
		meDepartment.put("一厂焊装", "ME");  //$NON-NLS-2$
		meDepartment.put("一厂涂装", "ME");  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
		meDepartment.put("一厂总装", "ME");  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
		
		meDepartment.put("二厂冲压", "ME");   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
		meDepartment.put("二厂焊装", "ME");   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
		meDepartment.put("二厂涂装", "ME");    //$NON-NLS-2$ //$NON-NLS-1$
		meDepartment.put("二厂总装", "ME");   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
		
		pms.put("red", 0);  //$NON-NLS-1$
		pms.put("green", 0);  //$NON-NLS-1$
		pms.put("yellow", 0);  //$NON-NLS-1$
		
		sus.put("red", 0);  //$NON-NLS-1$
		sus.put("green", 0);  //$NON-NLS-1$
		sus.put("yellow", 0);  //$NON-NLS-1$
		
		pes.put("red", 0);  //$NON-NLS-1$
		pes.put("green", 0);  //$NON-NLS-1$
		pes.put("yellow", 0);  //$NON-NLS-1$
		
		qas.put("red", 0);  //$NON-NLS-1$
		qas.put("green", 0);  //$NON-NLS-1$
		qas.put("yellow", 0); //$NON-NLS-1$
		
		los.put("red", 0);  //$NON-NLS-1$
		los.put("green", 0);  //$NON-NLS-1$
		los.put("yellow", 0); //$NON-NLS-1$
		
		mes.put("red", 0);  //$NON-NLS-1$
		mes.put("green", 0);  //$NON-NLS-1$
		mes.put("yellow", 0);  //$NON-NLS-1$
		
		pls.put("red", 0);  //$NON-NLS-1$
		pls.put("green", 0);  //$NON-NLS-1$
		pls.put("yellow", 0);  //$NON-NLS-1$
		
		vscs.put("red", 0);  //$NON-NLS-1$
		vscs.put("green", 0);  //$NON-NLS-1$
		vscs.put("yellow", 0); //$NON-NLS-1$
		

		for (int k=0; k<values.size(); k++) {
			if ("产品管理部".equals((String)(values.get(k)).get("SlResDep1"))) {   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				pms = sumLightStatue(pms,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if ("采购部".equals((String)(values.get(k)).get("SlResDep1"))) {   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				sus = sumLightStatue(sus,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if ("技术开发部".equals((String)(values.get(k)).get("SlResDep1"))) {   //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				pes = sumLightStatue(pes,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if (meDepartment.containsKey((String)(values.get(k)).get("SlResDep1"))) {  //$NON-NLS-1$
				mes = sumLightStatue(mes,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if (plDePartment.containsKey((String)(values.get(k)).get("SlResDep1"))) {  //$NON-NLS-1$
				pls = sumLightStatue(pls,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if (qaDePartment.containsKey((String)(values.get(k)).get("SlResDep1"))) {  //$NON-NLS-1$
				qas = sumLightStatue(qas,(String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if ("VSC".equals((String)(values.get(k)).get("SlResDep1"))){  //$NON-NLS-1$ //$NON-NLS-2$
				vscs = sumLightStatue(vscs, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			if ("LO".equals((String)(values.get(k)).get("SlResDep1"))) {  //$NON-NLS-1$ //$NON-NLS-2$
				los = sumLightStatue(los, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
		}
		
		departments.put("PM", pms);  //$NON-NLS-1$
		departments.put("SU", sus);  //$NON-NLS-1$
		departments.put("PE", pes);  //$NON-NLS-1$
		departments.put("ME", mes);  //$NON-NLS-1$
		departments.put("PL", pls);  //$NON-NLS-1$
		departments.put("QA", qas);  //$NON-NLS-1$
		departments.put("VSC", vscs); //$NON-NLS-1$
		departments.put("LO", los);  //$NON-NLS-1$
		
		return departments;
				
	} 
	
	
	public static Map<String,Integer> sumLightStatue (Map<String,Integer> parts,String lightStatue){
		
		if ("红".equals(lightStatue)) {
			parts.put("red", (Integer)parts.get("red")+1);  //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("黄".equals(lightStatue)) {
			parts.put("yellow", (Integer)parts.get("yellow")+1);  //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("绿".equals(lightStatue)) {
			parts.put("green", (Integer)parts.get("green")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		
		return parts;
	}
}
