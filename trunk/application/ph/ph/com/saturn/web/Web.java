package com.saturn.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Web {
	public static void main(String[] args) {
	
	}
	
	public static String compareByKW(List<String> list) {
		if (list == null) {
			return "[]";
		}
		
		if (list != null && list instanceof List) {
			List<Integer> newList = new ArrayList<Integer>();
			
			for (int i = 1; i < list.size(); i++) {
				newList.add(Integer.parseInt(list.get(i)) - Integer.parseInt(list.get(i-1)));
			}
			
			return ((List)newList).toString();
		}
		
		return list + "";
	}
	
	public static List<String> SumList(List<String> green, 
			List<String> yellow, List<String> red) {
		
		if (green == null || yellow == null || red == null) {
			return null;
		}
		
		if (green != null && yellow != null && red != null){
			List<String> sumList = new ArrayList<String>();
			
			for(int i=0; i<green.size(); i++) {
				String sum = Integer.parseInt(green.get(i)) + 
				Integer.parseInt(yellow.get(i)) +
				Integer.parseInt(red.get(i)) + "";
				sumList.add(sum);
			}
			return sumList;
		}
			
		return null;
	}
	
	public static String getSumNumberListStr(Object list) {
		if (list == null) {
			return "[]";
		}
		
		if (list != null && list instanceof List) {
			List<Integer> newList = new ArrayList<Integer>();
			int sum = 0;
			for (int i=0; i<((ArrayList)list).size(); i++){
				sum += Integer.parseInt((String)((ArrayList)list).get(i));
				newList.add(sum);
			}
			return ((List)newList).toString();
		}
		
		return list + "";
	}
	
	public static String getStrFromIntArray(int[] list) {
		String str = "[";
		if (list.length > 0) {
			for (int i = 0; i < list.length-1; i++) {
				str += list[i] + ",";
			}
			str += list[list.length-1];
		}
		str += "]";
		return str;
	}
	
	public static String getStrFromStringArray(String[] list) {
		String str = "[";
		if (list.length > 0) {
			for (int i = 0; i < list.length-1; i++) {
				str += "\"" + list[i] + "\", ";
			}
			str += "\"" + list[list.length-1] + "\"";
		}
		str += "]";
		return str;
	}
	
	public static String getNumberListStr(Object list) {
		if (list == null) {
			return "[]";
		}
		
		if (list instanceof List) {
			return ((List)list).toString();
		}
		
		return list + "";
	}
	
	public static String getNumberListStrSubFirst(Object list) {
		if (list == null) {
			return "[]";
		}
		
		if (list instanceof List) {
			list = ((List) list).subList(1, ((List) list).size());
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
	
	public static int[] getIntArrByStringlist(List<String> list) {
		int[] result = null;
		
		if (list == null) {
			return null;
		}
		
		if (list instanceof List) {
			result = new int[list.size()];
			for (int i=0; i< result.length; i++) {
				result[i] = Integer.parseInt(((List<String>) list).get(i));
			}
		}
		
		return result;
	}

	@SuppressWarnings("rawtypes")
	public static String getFormState(Map form) {
		if (form != null) {
			String isPublic = "yes";//form.get("XX");
			String isReleaze = "yes";//form.get("XX");
			
			if (!"yes11".equalsIgnoreCase(isPublic)) {
				return "<div id='no-state'>资料整理中...</div>";
			}
			
			if (!"yes".equalsIgnoreCase(isReleaze)) {
				return "<div id='no-state'>未发布</div>";
			}
		}
		
		return "";
	}
}
