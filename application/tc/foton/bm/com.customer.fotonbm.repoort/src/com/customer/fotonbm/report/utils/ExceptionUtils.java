package com.customer.fotonbm.report.utils;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

/**
 * 用于获得异常的堆栈信息
 * 
 * @author LeslieGu
 */
public class ExceptionUtils {
	
	private ExceptionUtils() {
		
	}
	
	/**
	 * 获得异常的堆栈信息
	 */
	public static String getExMessage(Exception e) {
		String result = null;
		PrintWriter writer = null;
		try {
			Writer w = new StringWriter();
			writer = new PrintWriter(w);
			e.printStackTrace(writer);
			writer.flush();

			result = w.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			writer.close();
		}
		return result;
	}
}
