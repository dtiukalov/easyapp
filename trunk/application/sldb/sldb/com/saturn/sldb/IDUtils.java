package com.saturn.sldb;

public class IDUtils {

	private static int[] mod = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1};
	private static char[] valid = { '1', '0', 'x', '9', '8', '7', '6', '5',
			'4', '3', '2' };

	public static String to18(String id15) {
		if (id15 == null || id15.length() != 15) {
			return id15;
		}
		
//		String id18 = new StringBuffer(id15).insert(arg0, arg1)
		return null;
	}
}
