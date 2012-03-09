package com.saturn.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.saturn.tc.utils.DateUtils;

public class Web {


	public static String compareByKW(List<String> list) {
		if (list == null) {
			return "[]";
		}

		if (list != null && list instanceof List) {
			List<Integer> newList = new ArrayList<Integer>();

			for (int i = 1; i < list.size(); i++) {
				newList.add(Integer.parseInt(list.get(i))
						- Integer.parseInt(list.get(i - 1)));
			}

			return ((List) newList).toString();
		}

		return list + "";
	}

	public static List<String> SumList(List<String> green, List<String> yellow,
			List<String> red) {

		if (green == null || yellow == null || red == null) {
			return null;
		}

		if (green != null && yellow != null && red != null) {
			List<String> sumList = new ArrayList<String>();

			for (int i = 0; i < green.size(); i++) {
				String sum = Integer.parseInt(green.get(i))
						+ Integer.parseInt(yellow.get(i))
						+ Integer.parseInt(red.get(i)) + "";
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
			for (int i = 0; i < ((ArrayList) list).size(); i++) {
				sum += Integer.parseInt((String) ((ArrayList) list).get(i));
				newList.add(sum);
			}
			return ((List) newList).toString();
		}

		return list + "";
	}

	public static String getStrFromIntArray(int[] list) {
		String str = "[";
		if (list.length > 0) {
			for (int i = 0; i < list.length - 1; i++) {
				str += list[i] + ",";
			}
			str += list[list.length - 1];
		}
		str += "]";
		return str;
	}

	public static String getStrFromStringArray(String[] list) {
		String str = "[";
		if (list.length > 0) {
			for (int i = 0; i < list.length - 1; i++) {
				String nrestr = replaceSpecial(list[i]);
				str += "\"" + nrestr + "\", ";
			}
			str += "\"" + list[list.length - 1] + "\"";
		}
		str += "]";
		return str;
	}

	public static String getNumberListStr(Object list) {
		if (list == null) {
			return "[]";
		}

		if (list instanceof List) {
			return replaceSpecial((((List) list).toString()));
		}

		return list + "";
	}

	public static String getNumberListStrSubFirst(Object list) {
		if (list == null) {
			return "[]";
		}

		if (list instanceof List) {
			if (((List) list).size() > 0) {
				list = ((List) list).subList(1, ((List) list).size());
				return ((List) list).toString();
			}
		}

		return list + "";
	}

	public static String getStrListStr(Object list) {
		if (list == null) {
			return "[]";
		}

		if ((list instanceof List) && ((List) list).size() > 0) {
			StringBuffer buffer = new StringBuffer("[");

			for (Object value : (List) list) {
				buffer.append("\"" + replaceSpecial((String)value) + "\",");
			}

			buffer.deleteCharAt(buffer.length() - 1);
			buffer.append("]");
			return buffer.toString();
		}

		return list + "";
	}

	public static int[] getIntArrByStringlist(List<String> list) {
		int[] result = null;

		if (list == null || list.size() == 0) {
			return null;
		}

		if (list instanceof List) {
			result = new int[list.size()];
			for (int i = 0; i < result.length; i++) {
				result[i] = Integer.parseInt(((List<String>) list).get(i));
			}
		}

		return result;
	}

	@SuppressWarnings("rawtypes")
	public static String getFormState(Map form) {
		if (form != null) {
			String isPublic = (String) form.get("fv9PreRelesed");
			List releaseList = (List) form.get("release_status_list");
			String isRelease = "";
			if (releaseList != null && releaseList.size() > 0) {
				isRelease = (String) releaseList.get(0);
				// 正式发布之后——数据冻结
				if ("TCM Released".equalsIgnoreCase(isRelease)) {
					return "<div id='no-state'>&nbsp;</div>";
				}
			}

			/*
			 * //预发布之前 if ("".equalsIgnoreCase(isPublic)) { return
			 * "<div id='no-state'>资料整理中...</div>"; }
			 */

			// 预发布之后
			if ("yes".equalsIgnoreCase(isPublic)) {
				return "<div id='no-state'>资料已发布</div>";
			}

		}

		return "";
	}

	public static int[] getMilepostArr(String start, String end) {
		int[] arr = null;

		if (start != null && end != null && !"".equals(start)
				&& !"".equals(end)) {
			int year = Integer.parseInt(start.substring(0, 4));
			int currwk = DateUtils.getMaxWeekNumOfYear(year);

			int s = DateUtils.getWeekOfYear(start);
			int e = DateUtils.getWeekOfYear(end);

			if (s > 0 && e > 0) {
				if (e > s) {
					int size = e - s + 1;
					arr = new int[size];

					for (int i = 0; i < size; i++) {
						arr[i] = s + i;
					}
				} else {
					int size1 = currwk - s + 1;
					int size2 = e;
					int size = size1 + size2;
					arr = new int[size];

					for (int i = 0; i < size1; i++) {
						arr[i] = s + i;
					}
					for (int j = 0; j < e; j++) {
						arr[size1 + j] = j + 1;
					}
				}
			}
		}
		return arr;
	}

	public static int getNum(int[] milepostArr, int[] wkArr) {
		int result = 0;

		if (milepostArr == null || wkArr == null) {
			return result;
		}

		int size1 = milepostArr.length;
		int size2 = wkArr.length;
		if (milepostArr != null && wkArr != null && size1 > 0 && size2 > 0) {
			int milepostMax = milepostArr[size1 - 1];
			int milepostMin = milepostArr[0];
			int wkMax = wkArr[size2 - 1];
			int wkMin = wkArr[0];

			/*
			 * if(milepostMin < wkMin && milepostMax < wkMin){ return result; }
			 * else if(milepostMin > wkMax && milepostMax > wkMax){ return
			 * result; } else if(milepostMin < wkMin && milepostMax > wkMax){
			 * result = size2; } else {
			 */
			for (int i = 0; i < size1; i++) {
				for (int j = 0; j < size2; j++) {
					if (milepostArr[i] == wkArr[j]) {
						result = result + 1;
					}
				}
			}
			// }
		}
		return result;
	}

	public static int getMax(List<String> p) {
		int max = 0;

		if (p != null && p.size() > 0) {
			for (int i = 0; i < p.size(); i++) {
				int value = 0;
				if (p.get(i) != null) {
					value = Integer.parseInt(p.get(i));
					if (value >= max) {
						max = value;
					}
				}
			}
		}

		return max;
	}

	public static Boolean getListYesOrNo(List<String> list) {
		if (list != null && list.size() > 0) {
			return true;
		}
		return false;
	}
	
	public static boolean getObjectYesOrNo(Object obj) {
		if (obj != null && !"".equals((String)obj)) {
			return true;
		}
		return false;
	}

	public static Boolean getDateStrNotNull(String date) {
		if (date != null) {
			if (!"".equals(date)) {
				if (!date.toString().startsWith("1900")) {
					return true;
				}
			}
		}
		return false;
	}
	
	
	public static Boolean getDateLisNotNull(List<String> date) {
		if (date != null) {
			for(String d : date){
				if (!d.toString().startsWith("1900")) {
					return true;
				}
			}
		}
		return false;
	}
	
	public static List<Map<String,String>> getHeBingLichengbeiList(List<Map<String,String>> list){
		List<Map<String,String>> result = null;
		
		if(list!= null && list.size() > 0 ){
			result = new ArrayList<Map<String,String>>();
			Map<String,List<Map<String,String>>> dateKeytemp = new HashMap<String, List<Map<String,String>>>();
			
			for(Map<String,String> map : list){
				String key = map.get("date").substring(0, 7).toString();
				if(getDateStrNotNull(key)){
					List<Map<String,String>> templist = new ArrayList<Map<String,String>>();
					if(dateKeytemp.containsKey(key)){
						dateKeytemp.get(key).add(map);
					} else {
						templist.add(map);
						dateKeytemp.put(key, templist);
					}
				}
			}
			
			Iterator<String> iterator = dateKeytemp.keySet().iterator();
			
			while(iterator.hasNext()){
				String key = iterator.next();
				List<Map<String,String>> value = dateKeytemp.get(key);
				String tempLCB = "";
				
				Map<String,String> tt = new HashMap<String, String>(); 
				
				for(int i=0 ; i< value.size(); i++){
					if(value.size() > 1){
						tempLCB = tempLCB + "<br>" + value.get(i).get("lichengbei");
						if(i == value.size()-1){
							tempLCB = tempLCB.replaceFirst("<br>","");
						}
					} else {
						tempLCB = tempLCB + value.get(i).get("lichengbei");
					}
					
					tt.put("lichengbei", tempLCB); 
					tt.put("date", value.get(i).get("date"));
					tt.put("org",  value.get(i).get("org"));
				}
			
				result.add(tt);
			}
		}
		return result;
	}
	
	public static String replaceSpecial(String str) {
		return str.replaceAll("\n", "<br>").replaceAll("\"", "\\\"")
			.replaceAll("”", "\\\"").replaceAll("\'", "\\\'");
	}
}
