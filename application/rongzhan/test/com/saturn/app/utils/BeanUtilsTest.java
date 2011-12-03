package com.saturn.app.utils;

import static org.junit.Assert.assertEquals;

import javax.servlet.http.HttpServletRequest;

import org.easymock.EasyMock;
import org.junit.Test;

public class BeanUtilsTest {

	@Test
	public void testGetBean() {
		HttpServletRequest request = EasyMock.createMock(HttpServletRequest.class);
		EasyMock.expect(request.getParameter("id")).andReturn("11");
		EasyMock.expect(request.getParameter("name")).andReturn("test");
		EasyMock.replay(request);
		
		TestData data = BeanUtils.getBean(request, TestData.class);
		
		assertEquals("11", data.getId());
		assertEquals("test", data.getName());
	}

}
