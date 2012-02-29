package com.customer.fawvw.issues.commands.issuestatistic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PartTypeStatusLoader {

	private static Map<String, Object> partType = new HashMap<String, Object>();
	
    private static Map<String, Integer> partStatus = new HashMap<String, Integer>(); //零件状态
    private static Map<String, Integer> bodySize = new HashMap<String, Integer>(); //车身尺寸
    private static Map<String, Integer> techAndEqu = new HashMap<String, Integer>(); //工艺及设备
    private static Map<String, Integer> partMatch = new HashMap<String, Integer>(); //零件匹配
    private static Map<String, Integer> pdm = new HashMap<String, Integer>(); //PDM
	
	public static  Map<String,Object> load(ArrayList<HashMap<String, Object>> values){
		
		partStatus.put("red", 0); //$NON-NLS-1$
		partStatus.put("green", 0); //$NON-NLS-1$
		partStatus.put("yellow", 0); //$NON-NLS-1$
		
		bodySize.put("red", 0); //$NON-NLS-1$
		bodySize.put("green", 0); //$NON-NLS-1$
		bodySize.put("yellow", 0); //$NON-NLS-1$
		
		techAndEqu.put("red", 0); //$NON-NLS-1$
		techAndEqu.put("green", 0); //$NON-NLS-1$
		techAndEqu.put("yellow", 0); //$NON-NLS-1$
		
		partMatch.put("red", 0); //$NON-NLS-1$
		partMatch.put("green", 0); //$NON-NLS-1$
		partMatch.put("yellow", 0); //$NON-NLS-1$
		
		pdm.put("red", 0); //$NON-NLS-1$
		pdm.put("green", 0); //$NON-NLS-1$
		pdm.put("yellow", 0); //$NON-NLS-1$
		
		for (int k=0; k<values.size(); k++) {
			String parttype = (String)(values.get(k)).get("fv9IssueType");
			if ("零件状态".equals(parttype)) {  //$NON-NLS-2$ //$NON-NLS-1$
				partStatus = sumLightStatue(partStatus, (String)(values.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			if ("车身尺寸".equals(parttype)) {  //$NON-NLS-2$ //$NON-NLS-1$
				bodySize = sumLightStatue(bodySize, (String)(values.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			if ("工艺及设备".equals(parttype)) {  //$NON-NLS-2$ //$NON-NLS-1$
				techAndEqu = sumLightStatue(techAndEqu, (String)(values.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			if ("零件匹配".equals(parttype)) { //$NON-NLS-1$ //$NON-NLS-2$
				partMatch = sumLightStatue(partMatch, (String)(values.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			if ("PDM".equals(parttype)) { //$NON-NLS-1$ //$NON-NLS-2$
				pdm = sumLightStatue(pdm, (String)(values.get(k)).get("fv9RGStatus")); //$NON-NLS-1$
			}
			
		}
		
		partType.put("partStatus", partStatus); //$NON-NLS-1$
		partType.put("bodySize", bodySize); //$NON-NLS-1$
		partType.put("techAndEqu", techAndEqu); //$NON-NLS-1$
		partType.put("partMatch", partMatch); //$NON-NLS-1$
		partType.put("pdm", pdm); //$NON-NLS-1$
		
		return partType;
				
	} 
	
	public static Map<String,Integer> sumLightStatue (
			Map<String,Integer> parts, 
			String lightStatue){
		
		if ("红".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("red", (Integer)parts.get("red")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("黄".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("yellow", (Integer)parts.get("yellow")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		if ("绿".equals(lightStatue)) { //$NON-NLS-1$
			parts.put("green", (Integer)parts.get("green")+1); //$NON-NLS-1$ //$NON-NLS-2$
		}
		
		return parts;
	}
}
