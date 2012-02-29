package com.customer.fawvw.issues.actions;

import java.awt.Frame;

import com.customer.fawvw.issues.commands.issueStatus.IssueStatusReportCommand;
import com.customer.fawvw.issues.utils.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;
import com.teamcenter.rac.util.MessageBox;

public class IssueStatusReportAction extends AbstractAIFAction{

	   public IssueStatusReportAction(AbstractAIFApplication arg0, Frame arg1, String arg2)
	    {
	        super(arg0, arg1, arg2);
	        app = null;
	        app = arg0;
	    }

	    public void run()
	    {

	    	IssueStatusReportCommand command = new IssueStatusReportCommand(app);
	        try
	        {
	            command.executeModal();
	        }
	        catch(Exception e)
	        {
	        	MessageBox.post(ExceptionUtils.getExMessage(e), "Exception", MessageBox.INFORMATION);
	        }
	    }

	    public AbstractAIFApplication app;
}
