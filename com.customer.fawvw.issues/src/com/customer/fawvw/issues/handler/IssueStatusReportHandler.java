package com.customer.fawvw.issues.handler;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.IHandler;

import com.customer.fawvw.issues.actions.IssueStatusReportAction;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class IssueStatusReportHandler extends AbstractHandler implements IHandler{

	public IssueStatusReportHandler(){
		
	}
	
	public Object execute(ExecutionEvent arg0) throws ExecutionException {
		// TODO Auto-generated method stub
		try
        {
            com.teamcenter.rac.aif.AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
            IssueStatusReportAction action = new IssueStatusReportAction(app, null, null);
            (new Thread(action)).start();
        }
        catch(Exception _ex) { }
        return null;
	}

}
