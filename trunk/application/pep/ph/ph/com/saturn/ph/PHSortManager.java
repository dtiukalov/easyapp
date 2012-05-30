package com.saturn.ph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;


public class PHSortManager {

	public static List<String> getIndexes(Map<Integer, Object> forms) {
		String path = "/app/pep/do/preview.do";
		List<String> indexes = new ArrayList<String>();
		indexes.add("/app/pep/titlePage.jsp");
/*冒泡
		int[] myArray = sortFormKey(forms);
		for(int t=0; t<myArray.length; t++){
			Integer sortNum = myArray[t];
			Object object = forms.get(sortNum);
			
			if (object != null) {
				if (object instanceof String) {
					indexes.add(path + "?uid=" + object.toString());
				} else if (object instanceof List) {
					List<String> ids = (List<String>) object;
					for (String id : ids) {
						indexes.add(path + "?uid=" + id);
					}
				}
			}
			
		}
*/
//Collections.sort  
		List<Map<Integer,Object>> list = sortFormKeys(forms);
		
		for(Map<Integer,Object> l: list){
			Integer sortNum = l.keySet().iterator().next();
			Object object = forms.get(sortNum);
			
			if (object != null) {
				if (object instanceof String) {
					indexes.add(path + "?uid=" + object.toString());
				} else if (object instanceof List) {
					List<String> ids = (List<String>) object;
					for (String id : ids) {
						indexes.add(path + "?uid=" + id);
					}
				}
			}
		}
		
		return indexes;
	}
//冒泡   
	private static int[] sortFormKey(Map<Integer, Object> forms) {
		List<Integer> keys = new ArrayList<Integer>();
		Iterator<Integer> iterator = forms.keySet().iterator();
		while(iterator.hasNext()){
			keys.add(iterator.next());
		}
		int size = forms.keySet().size();
		int[] myArray = new int[size];
		if (forms != null && forms.keySet() != null) {
			for(int i=0; i<size; i++){
				myArray[i] = keys.get(i);
			}
		}
		Sort(myArray);
		return myArray;
	}
//Collections.sort  
	private static List<Map<Integer,Object>> sortFormKeys(Map<Integer, Object> forms) {
		List<Map<Integer, Object>> list = new ArrayList<Map<Integer, Object>>();
		
		Iterator<Integer> iterator = forms.keySet().iterator();
		while(iterator.hasNext()){
			Integer key = iterator.next();
			Map<Integer, Object> map = new HashMap<Integer, Object>();
			map.put(key, forms.get(key));
			list.add(map);
		}
		Collections.sort(list, new Comparator<Map<Integer,Object>>() {
			public int compare(Map<Integer,Object> map1, Map<Integer,Object> map2) {
				Integer key1 = map1.keySet().iterator().next();
				Integer key2 = map2.keySet().iterator().next();
				return key1.compareTo(key2);
			}
		});
		return list;
	}

	public static void Sort(int[] myArray) {
		// 取长度最长的词组 -- 冒泡法
		for (int j = 1; j < myArray.length; j++) {
			for (int i = 0; i < myArray.length - 1; i++) {
				// 如果 myArray[i] > myArray[i+1] ，则 myArray[i] 上浮一位
				if (myArray[i] > myArray[i + 1]) {
					int temp = myArray[i];
					myArray[i] = myArray[i + 1];
					myArray[i + 1] = temp;
				}
			}
		}
	}
//TreeSet 对字符串排序适用
	private static TreeSet<String> sortFormKeySet(Map<String, Object> forms) {
		TreeSet<String> set = new TreeSet<String>();

		if (forms != null && forms.keySet() != null) {
			Iterator<String> iterator = forms.keySet().iterator();
			while (iterator.hasNext()) {
				set.add(iterator.next());
			}
		}
		return set;
	}

	public static void main(String[] args) {
		Map<Integer, Object> forms = new HashMap<Integer, Object>();
		forms.put(111, "111");
		forms.put(99, "99");
		forms.put(7, "7");
		forms.put(88, "88");
		forms.put(9, "9");
		forms.put(100, "100");
		forms.put(5, "5");
		forms.put(44, "44");
		forms.put(3, "3");
		forms.put(11, "11");
		forms.put(2, "2");
		List<String> uids = new ArrayList<String>();
		uids.add("uid1");
		uids.add("uid3");
		uids.add("uid2");
		forms.put(22, uids);
		List<String> re = getIndexes(forms);

		for (String r : re) {
			System.out.println(r);
		}
	}
}
