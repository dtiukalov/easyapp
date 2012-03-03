package com.customer.fawvw.issues.utils;

import java.util.Arrays;

public class StringUtil {
	
	public static boolean containsNo(String contents, String substr) {
		//contents不为空
		if (!" ".equals(contents)) { //$NON-NLS-1$
			//存在,不存在，
			if (contents.contains(",") && !contents.contains("，")) { //$NON-NLS-1$ //$NON-NLS-2$
				String arr[] = contents.split(","); //$NON-NLS-1$
				for (int i=0; i<arr.length; i++) {
					if (arr[i].equalsIgnoreCase(substr)){
						return true;
					}
				}
			}
			
			//不存在,存在，
			if (!contents.contains(",") && contents.contains("，")) { //$NON-NLS-1$ //$NON-NLS-2$
				String arr[] = contents.split("，"); //$NON-NLS-1$
				for (int i=0; i<arr.length; i++) {
					if (arr[i].equalsIgnoreCase(substr)){
						return true;
					}
				}
			}
			
			//不存在,也不存在，
			if (!contents.contains(",") && !contents.contains("，")) { //$NON-NLS-1$ //$NON-NLS-2$
				if (contents.equalsIgnoreCase(substr)){
					//包含子串
					return true;
				} else {
					//不包含子串
					return false;
				}
			}
			
			//存在,也存在，
			if (contents.contains(",") && contents.contains("，")) { //$NON-NLS-1$ //$NO"，","); //$NON-NLS-1$
				String arr[] = contents.split(","); //$NON-NLS-1$
				for (int i=0; i<arr.length; i++) {
					if (arr[i].equalsIgnoreCase(substr)) {
						return true;
					} else {
						String arr2[] = arr[i].split("，"); //$NON-NLS-1$
						for (int j=0; j<arr2.length; j++) {
							if (arr2[j].equalsIgnoreCase(substr)) {
								return true;
							}
						}
					}
					
				}
			}
			
		} else {
			return false;
		}
		
		return false;
	}
	
	public static String ArrayToString(String[] array) {
		String str = "";
		
		for (int i = 0; i < array.length; i++) {
			str += array[i] + ",";
		}
		
		if (!"".equals(str)) {
			str = str.substring(0, str.length()-1);
		}
		
		return str;
	}
}
