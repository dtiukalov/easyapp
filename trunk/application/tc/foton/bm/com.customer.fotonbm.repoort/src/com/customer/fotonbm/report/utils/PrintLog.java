package com.customer.fotonbm.report.utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class PrintLog {

	public PrintWriter p = null;

	public PrintLog() {
		try {
			p = new PrintWriter(new FileOutputStream(System
					.getProperty("java.io.tmpdir")
					+ "\\竞品车输出日志.log"), true);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void println(String infoMessage) {
		p.println("【信息】" + infoMessage);
		closeflus();
	}

	public void closeflus() {
		p.flush();
	}

}
