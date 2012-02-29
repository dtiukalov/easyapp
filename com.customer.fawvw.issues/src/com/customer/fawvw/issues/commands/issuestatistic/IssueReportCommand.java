package com.customer.fawvw.issues.commands.issuestatistic;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class IssueReportCommand extends AbstractFawvwPepCommand {

	public IssueReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		return new IssueReportDialog(this);
	}

}
