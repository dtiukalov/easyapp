package com.saturn.app.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

import sun.misc.BASE64Encoder;

public class CodeUtils {
	private static Logger logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private static MessageDigest MD5 = null;
	
	static {
		try {
			MD5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException ex) {
			logger.debug(ex);
		}
	}
	
	public static String encode(String value) {
		String result = "";

		if (value == null) {
			return result;
		}

		BASE64Encoder baseEncoder = new BASE64Encoder();

		try {
			result = baseEncoder.encode(MD5.digest(value.getBytes("utf-8")));
		} catch (Exception ex) {
		}

		return result;
	}
}
