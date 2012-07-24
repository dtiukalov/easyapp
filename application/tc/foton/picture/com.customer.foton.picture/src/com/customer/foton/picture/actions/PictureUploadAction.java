package com.customer.foton.picture.actions;

import java.awt.Frame;


import com.customer.foton.picture.stylepicture.PictureUploadCommand;
import com.customer.foton.picture.util.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;
import com.teamcenter.rac.util.MessageBox;

public class PictureUploadAction extends AbstractAIFAction {
	
    public PictureUploadAction(AbstractAIFApplication arg0, Frame arg1, String arg2)
    {
        super(arg0, arg1, arg2);
        app = null;
        app = arg0;
    }

	@Override	
    public void run()
    {

    	PictureUploadCommand command = new PictureUploadCommand(app);
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
