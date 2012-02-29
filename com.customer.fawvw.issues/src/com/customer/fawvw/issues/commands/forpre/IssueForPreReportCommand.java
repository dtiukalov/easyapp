package com.customer.fawvw.issues.commands.forpre;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class IssueForPreReportCommand extends AbstractFawvwPepCommand {

	public IssueForPreReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		// TODO Auto-generated method stub
		return new IssueForPreReportDialog(this);
	}

}
