package com.customer.fawvw.issues.commands.issueStatus;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;

public class IssueStatusReportCommand extends AbstractFawvwPepCommand {

	public IssueStatusReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
	}

	@Override
	public IssueStatusReportDialog getCommandDialog() {
		return new IssueStatusReportDialog(this);
	}
}
