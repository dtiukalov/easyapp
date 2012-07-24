package com.customer.fotonbm.report.qa;

import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;

public class QAAction extends AbstractAIFAction {

	public QAAction(AbstractAIFUIApplication app, String s) {
		super(app, s);
	}

	@Override
	public void run() {
		/*
		 * 调用QACommand
		 */
		AbstractAIFCommand abstractAIFCommand = new QACommand(
				application, parent);
		try {
			abstractAIFCommand.executeModal();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}