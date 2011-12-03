package com.saturn.app.utils;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

public class LogManagerTest {

	@Test
	public void testGetLogger() {
		assertNotNull(LogManager.getLogger(null));
		assertNotNull(LogManager.getLogger(LogManager.LOG_KEY_APP));
	}

}
