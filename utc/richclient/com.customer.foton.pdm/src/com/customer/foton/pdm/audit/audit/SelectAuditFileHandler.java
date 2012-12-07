package com.customer.foton.pdm.audit.audit;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.IHandler;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.handlers.HandlerUtil;

import com.teamcenter.rac.aifrcp.AIFUtility;

public class SelectAuditFileHandler extends AbstractHandler implements IHandler  {
	
	public SelectAuditFileHandler(){}
	
	public Object execute(ExecutionEvent event) throws ExecutionException {
		try
        {
            com.teamcenter.rac.aif.AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
            SelectAuditFileAction action = new SelectAuditFileAction(app, null, null);
            (new Thread(action)).start();
        }
        catch(Exception _ex) { }
        return null;
	}

}
