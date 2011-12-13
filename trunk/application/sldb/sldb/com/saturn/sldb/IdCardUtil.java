package com.saturn.sldb;

import java.util.regex.*;

public class IdCardUtil {

	private static final char[] checkBit = { '1', '0', 'X', '9', '8', '7', '6',
			'5', '4', '3', '2' };

	private IdCardUtil() {

	}

	/**
	 * 15位身份证号码转化为18位的身份证。如果是18位的身份证则直接返回，不作任何变化。
	 * 
	 * @param idCard
	 *            ,15位的有效身份证号码
	 * @return idCard18 返回18位的有效身份证
	 */
	public static String to18(String id) {
		if (id == null) {
			return "";
		}

		id = id.trim();

		int sum = 0;
		// 15位的身份证
		if (id.length() == 15) {
			StringBuffer buffer = new StringBuffer(id);
			buffer.insert(6, "19");
			
			int size = buffer.length();
			for (int i = 0; i < size; i++) {
				char c = buffer.charAt(i);
				int ai = c - '0';
				int wi = ((int) Math.pow(2, size - i)) % 11;
				sum = sum + ai * wi;
			}
			
			return buffer.append(checkBit[sum % 11]).toString();
		}

		return id;
	}

	/**
	 * 转化18位身份证位15位身份证。如果输入的是15位的身份证则不做任何转化，直接返回。
	 * 
	 * @param id
	 *            18位身份证号码
	 * @return idCard15
	 */
	public static String to15(String id) {
		if (id == null) {
			return "";
		}
		
		id = id.trim();
		
		if (id.length() == 18) {
			StringBuffer buffer = new StringBuffer(id);
			buffer.delete(17, 18);
			buffer.delete(6, 8);
			
			return buffer.toString();
		}

		return id;
	}

	/**
	 * 校验是否是一个有效的身份证。如果是18的身份证，则校验18位的身份证。15位的身份证不校验，也无法校验
	 * 
	 * @param idCart
	 * @return
	 */
	public static boolean checkIDCard(String id) {
		Pattern pattern = Pattern.compile("\\d{15}|\\d{17}[x,X,0-9]");
		Matcher matcher = pattern.matcher(id);
		
		if (matcher.matches()) {// 可能是一个身份证
			if (id.length() == 18) {// 如果是18的身份证，则校验18位的身份证。15位的身份证暂不校验
				String IdCard15 = to15(id);
				String IdCard18 = to18(IdCard15);
				if (!id.equals(IdCard18)) {
					return false;
				}
			} else if (id.length() == 15) {
				return true;
			} else {
				return false;
			}
		}

		return false;
	}
	
	public static String filterStr(String str) {
		if (str != null) {
			int size = str.length();
			
			StringBuffer buffer = new StringBuffer();
			for (int i = 0; i < size; ++i) {
				char c = str.charAt(i);
				
				if ('0' <= c && c <= '9' || c == 'X' || c == 'x') {
					buffer.append(c);
				}
			}
			
			return buffer.toString();
		}
	
		return "";
	}
}
