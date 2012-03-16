package com.customer.fawvw.issues.commands.issueStatus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class IssueStatusStatistics {

	private static HashMap<String, Object> assPlacement = new HashMap<String, Object>();
	
	private static Map<String, Integer> front; //Ç°¶Ë Vor-derwagen
	private static Map<String, Integer> behind; //ºó¶Ë Heck
	private static Map<String, Integer> door; // ³µÃÅ Tueren
	private static Map<String, Integer> inner; //ÄÚÊÎ Innenraum
	private static Map<String, Integer> chassis; //µ×ÅÌ Boden
	private static Map<String, Integer> driver; //¼ÝÊ»Ä£¿é Cockpit
	private static Map<String, Integer> electronik; //µçÆ÷ Elektronik
	
	public static HashMap<String, Integer> getStatusStatistics(
			ArrayList<HashMap<String, Object>> issueInfo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int red_sum = 0;
		int yellow_sum = 0;
		int green_sum = 0;
		
		for (int i = 0; i < issueInfo.size(); i++) {
			String status = (String)(issueInfo.get(i)).get("fv9RGStatus"); //$NON-NLS-1$
			if ("ºì".equals(status)){ //$NON-NLS-1$
				red_sum = red_sum + 1;
			}
			
			if ("»Æ".equals(status)) { //$NON-NLS-1$
				yellow_sum = yellow_sum + 1;
			}
			
			if ("ÂÌ".equals(status)) { //$NON-NLS-1$
				green_sum = green_sum + 1;
			}
		}
		
		map.put("red", red_sum); //$NON-NLS-1$
		map.put("yellow", yellow_sum); //$NON-NLS-1$
		map.put("green", green_sum); //$NON-NLS-1$
		map.put("sum", red_sum + yellow_sum + green_sum); //$NON-NLS-1$
		
		return map;
		
	}
	
	
	public static HashMap<String, Object> getAssplacementStatistics(
			ArrayList<HashMap<String, Object>> issueInfo) {

		front = new HashMap<String, Integer>();
		behind = new HashMap<String, Integer>();
		door = new HashMap<String, Integer>();
		inner = new HashMap<String, Integer>();
		chassis = new HashMap<String, Integer>();
		driver = new HashMap<String, Integer>();
		electronik = new HashMap<String, Integer>();

		front.put("red", 0); //$NON-NLS-1$
		front.put("green", 0); //$NON-NLS-1$
		front.put("yellow", 0); //$NON-NLS-1$

		behind.put("red", 0); //$NON-NLS-1$
		behind.put("green", 0); //$NON-NLS-1$
		behind.put("yellow", 0); //$NON-NLS-1$

		door.put("red", 0); //$NON-NLS-1$
		door.put("green", 0); //$NON-NLS-1$
		door.put("yellow", 0); //$NON-NLS-1$

		inner.put("red", 0); //$NON-NLS-1$
		inner.put("green", 0); //$NON-NLS-1$
		inner.put("yellow", 0); //$NON-NLS-1$

		chassis.put("red", 0); //$NON-NLS-1$
		chassis.put("green", 0); //$NON-NLS-1$
		chassis.put("yellow", 0); //$NON-NLS-1$

		driver.put("red", 0); //$NON-NLS-1$
		driver.put("green", 0); //$NON-NLS-1$
		driver.put("yellow", 0); //$NON-NLS-1$
		
		electronik.put("red", 0); //$NON-NLS-1$
		electronik.put("green", 0); //$NON-NLS-1$
		electronik.put("yellow", 0); //$NON-NLS-1$
		
		for(int k=0; k < issueInfo.size(); k++) {
			
			if ("Ç°¶Ë Vor-derwagen".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				front = sumLightStatue(front, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("ºó¶Ë Heck".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				behind = sumLightStatue(behind, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("³µÃÅ Tueren".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				door = sumLightStatue(door, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("ÄÚÊÎ Innenraum".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) {  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				inner = sumLightStatue(inner, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("µ×ÅÌ Boden".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) {  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				chassis = sumLightStatue(chassis, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("¼ÝÊ»Ä£¿é Cockpit".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				driver = sumLightStatue(driver, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
			if ("µçÆ÷ Elektronik".equals((String)(issueInfo.get(k)).get("fv9AssPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
				electronik = sumLightStatue(electronik, (String)(issueInfo.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
		}
		assPlacement.put("front", front); //$NON-NLS-1$
		assPlacement.put("behind", behind); //$NON-NLS-1$
		assPlacement.put("door", door); //$NON-NLS-1$
		assPlacement.put("inner", inner); //$NON-NLS-1$
		assPlacement.put("chassis", chassis); //$NON-NLS-1$
		assPlacement.put("driver", driver); //$NON-NLS-1$
		assPlacement.put("electronik", electronik); //$NON-NLS-1$
		
		return assPlacement;
		
	}
	
	public static Map<String,Integer> sumLightStatue (Map<String,Integer> parts, String lightStatue){
		
		if ("ºì".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("red", (Integer)parts.get("red")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("»Æ".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("yellow", (Integer)parts.get("yellow")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("ÂÌ".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("green", (Integer)parts.get("green")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		
		return parts;
	}
	
}
