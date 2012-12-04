package com.saturn.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
/*	public static String getDoubleListStr(Object list) {
		if (list == null) {
			return "[]";
		}

		if (list instanceof List) {
			Double.parseDouble(arg0)
			return replaceSpecial((((List) list).toString()));
		}

		return list + "";
	}*/

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
			String isBackup = (String)form.get("fv9IsBackup");
			System.out.println("isBackup = " + isBackup);
			
			String isRelease = "";
			
			String formType = (String)form.get("object_type");
			System.out.println("formType = " + formType);
			
			// 正式发布之后——数据冻结
			boolean release = false;
			if (releaseList != null && releaseList.size() > 0) {
				for (Object obj : releaseList){
					if ("TCM Released".equalsIgnoreCase((String)obj) ||
							"Approved".equalsIgnoreCase((String)obj)) {
						release = true;
						break;
					}
				}
			}
			
			if (release == true) {
				//BackUp或是FV9PHBackup类型的数据
				if("yes".equalsIgnoreCase(isBackup) || "FV9PHBackup".equalsIgnoreCase(formType)){
					return "<div id='backup'><br><br><img width='190' height='80' src='/ph/app/pep/images/backup.png'></div>";
				}
				return "<div id='no-state'>&nbsp;</div>";
			}

			/*
			 * //预发布之前 if ("".equalsIgnoreCase(isPublic)) { return
			 * "<div id='no-state'>资料整理中...</div>"; }
			 */

			// 预发布之后
			if ("yes".equalsIgnoreCase(isPublic)) {
				//BackUp或是FV9PHBackup类型的数据
				if("yes".equalsIgnoreCase(isBackup) || "FV9PHBackup".equalsIgnoreCase(formType)){
					return "<div id='backup'>Pre-Release<br><br><img width='190' height='80' src='/ph/app/pep/images/backup.png'></div>";
				}
				return "<div id='no-state'>Pre-Release</div>";
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
		if (obj != null) {
			if(obj instanceof List){
				if(((List)obj).size() > 0){
					return true;
				}
			} else if(obj instanceof int[]){
				if(((int[])obj).length > 0){
					return true;
				}
			} else if (obj instanceof String){
				if( !"".equals((String)obj)){
					return true;
				}
			}
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
	
	private static int[] getArrNo0(int[] arr){
		int[] result =null;
		List<Integer> temp = new ArrayList<Integer>();
		
		if(arr != null && arr.length > 0){
			for(int i=0; i < arr.length; i++){
				if(arr[i] == 0){
					continue;
				} else {
					temp.add(arr[i]);
				}
			}
			
			if(temp.size() > 0){
				result = new int[temp.size()];
				for(int j=0; j<temp.size(); j++){
					result[j] = temp.get(j);
				}
			}
		}
		
		return result;
	}
	
	public static Map<String,Integer> getLCBNum(HttpServletRequest request, int[] arr){
		arr = getArrNo0(arr);
		Map<String,Integer>  result = new HashMap<String,Integer>();
		int vffqianNum = 0;
		int vffNum = 0;//柱子个数
		int pvsNum = 0;//柱子个数
		int osNum = 0;//柱子个数
		int sopNum = 0;//柱子个数
		
		if(arr != null && arr.length > 0){
		int size = arr.length;//一共有多少个柱子 
		if(size > 0){
			Object vff_start = request.getSession().getAttribute("DATE_VFF");
			Object pvs_start = request.getSession().getAttribute("DATE_PVS");
			Object os_start = request.getSession().getAttribute("DATE_0S");
			Object sop_start = request.getSession().getAttribute("DATE_SOP");
			Object me_start = request.getSession().getAttribute("DATE_ME");
			
			if(getObjectYesOrNo(vff_start)){
				vff_start = vff_start.toString();
			} else {
				vff_start = "";
			}
			if(getObjectYesOrNo(pvs_start)){
				pvs_start = pvs_start.toString();
			} else {
				pvs_start = ""; 
			}
			if(getObjectYesOrNo(os_start)){
				os_start = os_start.toString();
			} else {
				os_start = ""; 
			}
			if(getObjectYesOrNo(sop_start)){
				sop_start = sop_start.toString();
			} else {
				sop_start = ""; 
			}
			if(getObjectYesOrNo(me_start)){
				me_start = me_start.toString();
			} else {
				me_start = ""; 
			}
			
			int[] vffqianArr = null;
			int[] vffArr = Web.getMilepostArr(vff_start.toString(), pvs_start.toString()); //获取vff周 列表
			int[] pvsArr = Web.getMilepostArr(pvs_start.toString(), os_start.toString());
			int[] osArr = Web.getMilepostArr(os_start.toString(), sop_start.toString());
			int[] sopArr = Web.getMilepostArr(sop_start.toString(), me_start.toString());
			
			
			if(vffArr != null && vffArr.length > 1 && pvsArr != null && pvsArr.length > 1){
				int vffArrSize = vffArr.length;
				if(vffArr[vffArrSize-1]  == pvsArr[0]){
					vffArr = deleteLastValue(vffArr);
				}
			}
			
			if(pvsArr != null && pvsArr.length > 1 && osArr != null && osArr.length > 1){
				int pvsArrSize = pvsArr.length;
				if(pvsArr[pvsArrSize-1]  == osArr[0]){
					pvsArr = deleteLastValue(pvsArr);
				}
			}
			
			if(osArr != null && osArr.length > 1 && sopArr != null && sopArr.length > 1){
				int osArrSize = osArr.length;
				if(osArr[osArrSize-1]  == sopArr[0]){
					osArr = deleteLastValue(osArr);
				}
			}
			
			vffNum =  Web.getNum(vffArr,arr);//柱子个数
			pvsNum = Web.getNum(pvsArr,arr);//柱子个数
			osNum =  Web.getNum(osArr,arr);//柱子个数
			sopNum =  Web.getNum(sopArr,arr);//柱子个数
			vffqianNum =  size - vffNum - pvsNum - osNum - sopNum;//柱子个数
			
		}
		}
		result.put("vffqianNum", vffqianNum);
		result.put("vffNum", vffNum);
		result.put("pvsNum", pvsNum);
		result.put("osNum", osNum);
		result.put("sopNum", sopNum);
		
		return result;
	}
	
	public static int[] deleteLastValue(int[] arr){
		int[] result = null; 
		if(getObjectYesOrNo(arr)){
			result = new int[arr.length - 1];
			
			for(int i=0; i < arr.length - 1;  i++ ){
				result[i] = arr[i];
			}
		} else if(result == null){
			result = arr;
		}
		return result;
	}
	
	public static Map<String,Double> getLCBPillar (Map<String,Integer> lichengbeiNum, int[] arr, double totalW){
		int totalzhuziNum = arr.length;
		arr = getArrNo0(arr);
		Map<String,Double>  result = new HashMap<String,Double>();
		
		int vffqianPillarNum = lichengbeiNum.get("vffqianNum");//柱子个数
		int vffPillarNum = lichengbeiNum.get("vffNum");//柱子个数
		int pvsPillarNum = lichengbeiNum.get("pvsNum");//柱子个数
		int osPillarNum = lichengbeiNum.get("osNum");//柱子个数
		int sopPillarNum = lichengbeiNum.get("sopNum");//柱子个数
		
		double value0 = 0 ; 
		double value1 = 0 ; 
		double value2 = 0;
		double value3 = 0;
		double value4 = 0;
		double pillar = 0.0;
		
		if(arr != null && arr.length > 0){
			int size = totalzhuziNum;//一共有多少个柱子 
			if(size > 0){
				double totalWidth = totalW;
				pillar = totalWidth/size; 
			}
			value0 = vffqianPillarNum * pillar ; 
			value1 = vffPillarNum * pillar ; 
			value2 = pvsPillarNum * pillar ;
			value3 = osPillarNum * pillar ;
			value4 = sopPillarNum* pillar ;
			
		/*	if(vffPillarNum > 0 && pvsPillarNum != 0){
				value2 = (pvsPillarNum - 1)* pillar ;
			} else {
				value2 = pvsPillarNum * pillar ;
			}
			if(pvsPillarNum > 0 && osPillarNum != 0){
				value3 = (osPillarNum - 1 )* pillar ;	
			} else {
				value3 = osPillarNum * pillar ;
			}
			if(osPillarNum > 0 && sopPillarNum != 0){
				value4 = (sopPillarNum - 1)* pillar ;			
			} else {
				value4 = sopPillarNum* pillar ;
			}*/
		}
		result.put("pillar", pillar);
		result.put("vffqianPillar", value0);
		result.put("vffPillar", value1);
		result.put("pvsPillar", value2);
		result.put("osPillar", value3);
		result.put("sopPillar", value4);
		
		return result;
	}
	
	public static String replaceSpecial(String str) {
		return str.replaceAll("\n", "<br>").replaceAll("\"", "\\\"")
			.replaceAll("”", "\\\"").replaceAll("\'", "\\\'");
	}
	
	//合并列
	public static Map<String,Object> getDisplaytd(int i,int size, int temp, List<String> list){
		Map<String,Object> result = new HashMap<String,Object>();
		String td = "";
		
		if(size == 1){
			td = "<td class=\"mytd\" width=\"150px\">" + list.get(i) + "</td>";
		} else {
			if(i == 0){
				for(int t=0; t < size-1-i; t++){
					if(list.get(t).equalsIgnoreCase(list.get(t+1))){
						temp++;
					} else {
						break;
					}
				}
				td = "<td class=\"mytd\" width=\"150px\" rowspan=\"" + temp +"\"> " + list.get(i) + "</td>";
			}
		
		    if(i > 0 && i < size-1){
		    	if(temp == 1){
		    		for(int t=i; t < size-1; t++){
						if(list.get(t).equalsIgnoreCase(list.get(t+1))){
							temp++;
						} else {
							break;
						}
					}
		    		td = "<td class=\"mytd\" width=\"150px\" rowspan=\"" + temp +"\"> " + list.get(i) + "</td>";
		    	} else {
		    		temp--;
		    	}
		    }
		    
		    if(i == size-1) {
		    	if(temp == 1){
		    		td = "<td class=\"mytd\" width=\"150px\" rowspan=\" " + temp +" \"> " + list.get(i) + "</td>";
		    	} else {
		    		temp--;
		    	}
		    }
		}
	    result.put("td", td);
	    result.put("temp", temp);
		return result;
	}
	
}
