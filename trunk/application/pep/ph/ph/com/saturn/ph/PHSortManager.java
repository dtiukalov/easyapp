package com.saturn.ph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;
public class PHSortManager {
	public static List<String> getIndexs(List<Map<String, Object>> list) {
		String path = "/app/pep/do/preview.do";
		List<String> indexes = new ArrayList<String>();
		indexes.add("/app/pep/titlePage.jsp");
		Map<String, Object> currentIds = list.get(0);
		Map<String, Object> backUpIds = list.get(1);
		Map<String, Object> pageNameNullIds = list.get(2);
		
		TreeSet<String> currentkeys = sortFormKeySet(currentIds);//对currentIds进行key排序
		TreeSet<String> backUpkeys = sortFormKeySet(backUpIds);	//对backUpIds进行key排序
		
		sort(path, indexes, currentIds, currentkeys);//对currentIds里value 是list类型的数据进行排序 
		sort(path, indexes, backUpIds, backUpkeys);//对backUpIds里value 是list类型的数据进行排序 

		if(pageNameNullIds.size() > 0) {//对fv9pageName是Null或者没填值的用户放在最后边
			Iterator<String> keys = pageNameNullIds.keySet().iterator();
			while(keys.hasNext()){
				String key = keys.next();
				indexes.add(path + "?uid=" + pageNameNullIds.get(key)+ " key : " + key);
			}
		}

		return indexes;
	}
	/*		
	for(String key : backUpkeys){
		Object object = backUpIds.get(key);
		if (object != null) {
			if (object instanceof String) {
				indexes.add(path + "?uid=" + object.toString()+ " key : " + key);
			} else if (object instanceof List) {
				List<String> ids = (List<String>) object;
				for (String id : ids) {
					indexes.add(path + "?uid=" + id+ " key : " + key);
				}
			}
		}
	}*/
	/*		List<Map<Integer,Object>> list = sortFormKeys(forms);
	
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
	}*/

	private static void sort(String path, List<String> indexes,
			Map<String, Object> currentIds, TreeSet<String> currentkeys) {
		for(String key : currentkeys){
			Object object = currentIds.get(key);
			if (object != null) {
				if (object instanceof String) {
					indexes.add(path + "?uid=" + object.toString() + " key : " + key);
				} else if (object instanceof List) {
					List<String> ids = (List<String>) object;
					Map<String, Object> sortNums = new HashMap<String,Object>(); //用fv9SortNum这个属性进行排序
					Map<String, Object> sortNumNulls = new HashMap<String,Object>(); //fv9SortNum是空的排在最后
					int sortnumtempCont = 0; 
					
					for (String id : ids) {
						ModelObject modelObject = PH.getDataService().loadModelObjectRefresh(id);
						PH.getDataService().getProperties(modelObject, "fv9SortNum");
						String fv9sortnum = null;
						try {
						    fv9sortnum = modelObject.getProperty("fv9SortNum").getStringValue();
						} catch (NotLoadedException e) {
							e.printStackTrace();
						}//获取排序属性值
						
						if(fv9sortnum != null && !"".equalsIgnoreCase(fv9sortnum)){
							sortNums.put(fv9sortnum, id);
						} else {
							sortnumtempCont++;
							sortNumNulls.put("sortnumNull " + sortnumtempCont, id);
						}
					} 
					TreeSet<String> sortNumkeys = sortFormKeySet(sortNums);//对sortNums进行排序
					for(String sortNumkey: sortNumkeys){
						Object o = sortNums.get(sortNumkey);
						if (o != null) {
							if (o instanceof String) {
								indexes.add(path + "?uid=" + o.toString() + " key : " + sortNumkey);
							}
						}
					}
					if(sortNumNulls.size() > 0){//将sortNums没填的放在最后
						Iterator<String> keys = sortNumNulls.keySet().iterator();
						while(keys.hasNext()){
							String sortNumNullkey = keys.next();
							indexes.add(path + "?uid=" + sortNumNulls.get(sortNumNullkey)+ " key : " + sortNumNullkey);
						}
					}
				}
			}
		}
	}
	
	

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
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> currentIds =new HashMap<String, Object>();
		Map<String, Object> backUpIds =new HashMap<String, Object>();

		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		currentIds.put("", "uid");
		List<String> uids = new ArrayList<String>();
		uids.add("uid1");
		uids.add("uid3");
		uids.add("uid2");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		
		
		currentIds.put("3.5.1", "uid");
		currentIds.put("3.5", "uid");
		currentIds.put("3.5.7", "uid");
		currentIds.put("1.1.1", "uid");
		currentIds.put("1.1.3", "uid");
		currentIds.put("1.1.2", "uid");
		currentIds.put("2.1.1", "uid");
		currentIds.put("2.1.3", "uid");
		currentIds.put("2.1.4", "uid");
		currentIds.put("2.1.2", "uid");
		currentIds.put("7.1.1", "uid");
		currentIds.put("1.5.1", "uid");
		currentIds.put("1.5.3", "uid");
		currentIds.put("1.5.2", "uid");
		backUpIds.put("1.2.1", "uid");
		backUpIds.put("1.2.2", "uid");
		backUpIds.put("1.2.4", "uid");
		backUpIds.put("1.2.3 ", "uid");
		backUpIds.put("1.1.2", "uid");
		backUpIds.put("1.5.1", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");
		backUpIds.put("", "uid");

		list.add(currentIds);
		list.add(backUpIds);
		
		List<String> re = getIndexs(list);
		for (String r : re) {
			System.out.println(r);
		}
	}
}
