package com.customer.fotonbm.report.qa;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class QAHandler extends AbstractHandler {

	public Object execute(ExecutionEvent event) throws ExecutionException {
		//获取当前应用
		AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
		//调用Action
		QAAction action = new QAAction(app, null);
		new Thread(action).start();
		return null;
	}
}