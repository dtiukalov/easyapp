package com.customer.fawvw.issues.handler;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.IHandler;

import com.customer.fawvw.issues.actions.TCProjectAction;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class TCPprojectHandler extends AbstractHandler implements IHandler {

	
	public TCPprojectHandler()
    {
    }
	
	public Object execute(ExecutionEvent arg0) throws ExecutionException {
		try
        {
            com.teamcenter.rac.aif.AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
            TCProjectAction action = new TCProjectAction(app, null, null);
            (new Thread(action)).start();
        }
        catch(Exception _ex) { }
        return null;
	}




}
