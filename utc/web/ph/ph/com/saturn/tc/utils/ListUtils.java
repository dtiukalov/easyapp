package com.saturn.tc.utils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class ListUtils {

	//去掉重复值
	public static List<Integer> removeDuplicate(List list) {
		Set set = new HashSet();  
		List newList = new ArrayList();  
		for (Iterator iter = list.iterator(); iter.hasNext();) {  
			Object element = iter.next();  
			if (set.add(element))  
				newList.add(element);  
		}  
		return newList;  
	}
	
}
