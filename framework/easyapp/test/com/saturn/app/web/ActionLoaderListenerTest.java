package com.saturn.app.web;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

public class ActionLoaderListenerTest {

	@Test
	public void testLoadAction() {
		ActionLoaderListener actionLoaderListener = new ActionLoaderListener();
		
		List<String> className = actionLoaderListener.loadActionClass("/com/saturn/app/web/test");
		assertEquals("com.saturn.app.web.test.TestAction1", className.get(0));
		assertEquals("com.saturn.app.web.test.TestAction2", className.get(1));
	}
}
