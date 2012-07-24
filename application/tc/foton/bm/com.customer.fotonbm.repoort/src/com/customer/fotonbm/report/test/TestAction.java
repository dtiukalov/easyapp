package com.customer.fotonbm.report.test;

import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;

public class TestAction extends AbstractAIFAction {

	public TestAction(AbstractAIFUIApplication app, String s) {
		super(app, s);
	}

	@Override
	public void run() {
		/*
		 * 调用Command
		 */
		AbstractAIFCommand abstractAIFCommand = new TestCommand(
				application, parent);
		try {
			abstractAIFCommand.executeModal();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}