package com.customer.fawvw.issues.commands.issueRel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class IssueRelComponentReportAssPlacementLoader {

private static HashMap<String, Object> assPlacement = new HashMap<String, Object>();
	
	private static Map<String, Integer> front; //前端 Vor-derwagen
	private static Map<String, Integer> behind; //后端 Heck
	private static Map<String, Integer> door; // 车门 Türen
	private static Map<String, Integer> inner; //内饰 Innenraum
	private static Map<String, Integer> chassis; //底盘 Boden
	private static Map<String, Integer> driver; //驾驶模块 Cockpit
	private static Map<String, Integer> electronik; //电器 Elektronik
	
	public static  HashMap<String,Object> load(ArrayList<HashMap<String, Object>> values){
		
		front = new HashMap<String, Integer>();
		behind = new HashMap<String, Integer>();
		door = new HashMap<String, Integer>();
		inner = new HashMap<String, Integer>();
		chassis = new HashMap<String, Integer>();
		driver = new HashMap<String, Integer>();
		electronik = new HashMap<String, Integer>();
		
		front.put("red", 0);  //$NON-NLS-1$
		front.put("green", 0);  //$NON-NLS-1$
		front.put("yellow", 0);  //$NON-NLS-1$

		behind.put("red", 0);  //$NON-NLS-1$
		behind.put("green", 0);  //$NON-NLS-1$
		behind.put("yellow", 0);  //$NON-NLS-1$

		door.put("red", 0);  //$NON-NLS-1$
		door.put("green", 0);  //$NON-NLS-1$
		door.put("yellow", 0);  //$NON-NLS-1$

		inner.put("red", 0);  //$NON-NLS-1$
		inner.put("green", 0);  //$NON-NLS-1$
		inner.put("yellow", 0);  //$NON-NLS-1$

		chassis.put("red", 0);  //$NON-NLS-1$
		chassis.put("green", 0);  //$NON-NLS-1$
		chassis.put("yellow", 0);  //$NON-NLS-1$

		driver.put("red", 0);  //$NON-NLS-1$
		driver.put("green", 0);  //$NON-NLS-1$
		driver.put("yellow", 0); //$NON-NLS-1$
		
		electronik.put("red", 0);  //$NON-NLS-1$
		electronik.put("green", 0); //$NON-NLS-1$
		electronik.put("yellow", 0); //$NON-NLS-1$
		
		for(int k=0; k<values.size(); k++) {
			
			if ("前端 Vor-derwagen".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				front = sumLightStatue(front, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("后端 Heck".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				behind = sumLightStatue(behind, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("车门 Türen".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				door = sumLightStatue(door, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("内饰 Innenraum".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				inner = sumLightStatue(inner, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("底盘 Boden".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				chassis = sumLightStatue(chassis, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("驾驶模块 Cockpit".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				driver = sumLightStatue(driver, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
			if ("电器 Elektronik".equals((String)(values.get(k)).get("assPlacement"))) { //$NON-NLS-2$ //$NON-NLS-1$
				electronik = sumLightStatue(electronik, (String)(values.get(k)).get("RGStatus")); //$NON-NLS-1$
			}
			
		}
		
		assPlacement.put("front", front);  //$NON-NLS-1$
		assPlacement.put("behind", behind);  //$NON-NLS-1$
		assPlacement.put("door", door);  //$NON-NLS-1$
		assPlacement.put("inner", inner);  //$NON-NLS-1$
		assPlacement.put("chassis", chassis);  //$NON-NLS-1$
		assPlacement.put("driver", driver);  //$NON-NLS-1$
		assPlacement.put("electronik", electronik);  //$NON-NLS-1$
		
		return assPlacement;
	}
	
	public static Map<String,Integer> sumLightStatue (Map<String,Integer> parts, String lightStatue){
		
		if ("红".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("red", (Integer)parts.get("red")+1);  //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("黄".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("yellow", (Integer)parts.get("yellow")+1);  //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("绿".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("green", (Integer)parts.get("green")+1);  //$NON-NLS-1$ //$NON-NLS-2$
		}
		
		return parts;
	}
}
