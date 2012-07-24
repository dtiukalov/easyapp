package com.customer.fotonbm.report.sty;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class StyHandler extends AbstractHandler {

	public Object execute(ExecutionEvent event) throws ExecutionException {
		//获取当前应用
		AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
		//调用Action
		StyAction action = new StyAction(app, null);
		new Thread(action).start();
		return null;
	}
}