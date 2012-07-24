package com.customer.fotonbm.report.createbom;

import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;

public class CreateBOMAction extends AbstractAIFAction {

	public CreateBOMAction(AbstractAIFUIApplication app, String s) {
		super(app, s);
	}

	@Override
	public void run() {

		AbstractAIFCommand abstractAIFCommand = new CreateBOMCommand(
				application, parent);
		try {
			abstractAIFCommand.executeModal();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}