package com.saturn.web;

import java.util.List;

public class Web {
	
	public static String getNumberListStr(Object list) {
		if (list == null) {
			return "[]";
		}
		
		if (list instanceof List) {
			return ((List)list).toString();
		}
		
		return list + "";
	}
	
	public static String getStrListStr(Object list) {
		if (list == null) {
			return "[]";
		}
		
		if (list instanceof List) {
			StringBuffer buffer = new StringBuffer("[");
			
			for (Object value : (List)list) {
				buffer.append("\"" + value + "\",");
			}
			
			buffer.deleteCharAt(buffer.length()-1);
			buffer.append("]");
			return buffer.toString();
		}
		
		return list + "";
	}
}
