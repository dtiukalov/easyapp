package com.saturn.app.utils;

import static org.junit.Assert.*;

import org.junit.Test;

public class CodeUtilsTest {

	@Test
	public void testEncode() {
		String psw = "111111";
		assertEquals("lueSGJZetyySpUndWjMBEg==", CodeUtils.encode(psw));
		
		psw = "rongzhan";
		assertEquals("0N495lkCGCREg87rx9tGew==", CodeUtils.encode(psw));
	}

}
