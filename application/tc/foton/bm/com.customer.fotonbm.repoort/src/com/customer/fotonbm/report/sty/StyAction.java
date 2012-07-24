package com.customer.fotonbm.report.sty;

import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;

public class StyAction extends AbstractAIFAction {

	public StyAction(AbstractAIFUIApplication app, String s) {
		super(app, s);
	}

	@Override
	public void run() {
		/*
		 * 调用Command
		 */
		AbstractAIFCommand abstractAIFCommand = new StyCommand(
				application, parent);
		try {
			abstractAIFCommand.executeModal();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}