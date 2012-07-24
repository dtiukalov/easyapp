package com.customer.fotonbm.report.createbom;

import java.awt.Frame;
import java.util.Date;

import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateBOMCommand  extends AbstractAIFCommand{
	public PrintLog pirintlog = null ;
	private InterfaceAIFComponent pasteTargets[];  //当前选中位置

	public CreateBOMCommand(AbstractAIFApplication app, Frame frame){
		pirintlog = new PrintLog() ;	
		pirintlog.println("【用户】"+((TCSession)app.getSession()).getUser());
		pirintlog.println("【时间】"+new Date());
		
		//获取当前鼠标选中位置
		try {
			pasteTargets = super.checkComponents(app
					.getTargetComponents());
		} catch (Exception exception) {
			MessageBox.post(frame, exception);
		}
		AbstractAIFDialog abstractAIFDialog = new CreateBOMDialog(this, frame, app,pasteTargets,pirintlog);
		super.setRunnable(abstractAIFDialog);
	}
}
