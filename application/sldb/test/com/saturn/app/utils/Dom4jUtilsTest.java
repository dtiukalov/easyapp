package com.saturn.app.utils;

import static org.junit.Assert.assertNotNull;

import java.io.InputStreamReader;

import org.junit.Test;

public class Dom4jUtilsTest {

	@Test
	public void testGetDocmentInputStream() {
		assertNotNull(Dom4jUtils.getDocment(Dom4jUtilsTest.class.getResourceAsStream("dom4jtest.xml")));
	}

	@Test
	public void testGetDocmentReader() {
		assertNotNull(Dom4jUtils.getDocment(new InputStreamReader(Dom4jUtilsTest.class.getResourceAsStream("dom4jtest.xml"))));
	}

}
