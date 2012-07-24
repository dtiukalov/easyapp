package com.customer.foton.picture.handler;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.IHandler;

import com.customer.foton.picture.actions.PictureUploadAction;
import com.teamcenter.rac.aifrcp.AIFUtility;

public class PictureUploadHandler extends AbstractHandler implements IHandler {

	public PictureUploadHandler() {
		
	}
	
	@Override
	public Object execute(ExecutionEvent arg0) throws ExecutionException {
		try
        {
            com.teamcenter.rac.aif.AbstractAIFUIApplication app = AIFUtility.getCurrentApplication();
            PictureUploadAction action = new PictureUploadAction(app, null, null);
            (new Thread(action)).start();
        }
        catch(Exception _ex) { }
        return null;		
	}

}
