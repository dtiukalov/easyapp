package com.saturn.ph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PHManager {

	private static final String[] VFF = {
		"FV9_12Aktionspunkte",
		"FV9_15Programmpunkte"
	};
	
	private static final Map<String, String[]> roadmaps = new HashMap<String, String[]>();
	
	static {
		inital();
	}
	
	private static void inital() {
		roadmaps.put("VFF", VFF);
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getIndexes(String roadmap, Map<String, Object> forms) {
		List<String> indexes = new ArrayList<String>(); 
		
		if (roadmaps.containsKey(roadmap)) {
			String[] types = roadmaps.get(roadmap);
			
			for (String type : types) {
				String path = FormManager.getJspPath(type);
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
				} else {
					indexes.add(path);
				}
			}
		}
		
		return indexes;
	}
}
