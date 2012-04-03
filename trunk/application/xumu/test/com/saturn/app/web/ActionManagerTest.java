package com.saturn.app.web;

import static org.junit.Assert.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

public class ActionManagerTest {

	@Test
	public void testGet() {
		ActionManager.add("test.actionKey", new IAction() {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				return null;
			}

			public String requestMapping() {
				return "";
			}
		});
		
		assertNotNull(ActionManager.get("test.actionKey"));
	}

}
