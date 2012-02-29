package com.customer.fawvw.issues.commands.shift;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class IssueShiftReportCommand extends AbstractFawvwPepCommand {

	public IssueShiftReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
		// TODO Auto-generated constructor stub
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		// TODO Auto-generated method stub
		return new IssueShiftReportDialog(this);
	}

}
