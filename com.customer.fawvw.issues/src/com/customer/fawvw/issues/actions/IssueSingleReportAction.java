package com.customer.fawvw.issues.actions;

import java.awt.Frame;

import com.customer.fawvw.issues.commands.issuesingle.IssueSingleReportCommand;
import com.customer.fawvw.issues.utils.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;
import com.teamcenter.rac.util.MessageBox;

public class IssueSingleReportAction  extends AbstractAIFAction {

    public IssueSingleReportAction(AbstractAIFApplication arg0, Frame arg1, String arg2)
    {
        super(arg0, arg1, arg2);
        app = null;
        app = arg0;
    }

    public void run()
    {

    	IssueSingleReportCommand command = new IssueSingleReportCommand(app);
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
