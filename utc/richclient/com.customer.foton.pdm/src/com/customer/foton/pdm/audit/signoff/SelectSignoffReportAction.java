package com.customer.foton.pdm.audit.signoff;

import java.awt.Frame;

import com.customer.foton.pdm.utils.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.common.actions.AbstractAIFAction;
import com.teamcenter.rac.util.MessageBox;

public class SelectSignoffReportAction extends AbstractAIFAction{
	
	public SelectSignoffReportAction(AbstractAIFApplication arg0, Frame arg1, String arg2)
    {
        super(arg0, arg1, arg2);
        app = null;
        app = arg0;
    }

    public void run()
    {

    	SelectSignoffReportCommand command = new SelectSignoffReportCommand(app);
        try {
            command.executeModal();
        } catch(Exception e) {
        	MessageBox.post(ExceptionUtils.getExMessage(e), "Exception", MessageBox.INFORMATION);
        }
    }

    public AbstractAIFApplication app;

}
