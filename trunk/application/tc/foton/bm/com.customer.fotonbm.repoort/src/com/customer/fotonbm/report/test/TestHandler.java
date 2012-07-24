package com.customer.fotonbm.report.test;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class TestHandler extends AbstractHandler {

	public Object execute(ExecutionEvent event) throws ExecutionException {
		//获取当前应用
		AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
		//调用Action
		TestAction action = new TestAction(app, null);
		new Thread(action).start();
		return null;
	}
}