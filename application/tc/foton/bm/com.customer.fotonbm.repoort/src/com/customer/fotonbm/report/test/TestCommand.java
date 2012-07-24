package com.customer.fotonbm.report.test;

import java.awt.Frame;
import java.util.Date;

import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class TestCommand  extends AbstractAIFCommand{
	public PrintLog pirintlog = null ;	//日志输出对象
	private InterfaceAIFComponent pasteTargets[];  //当前选中位置
	
	public TestCommand(AbstractAIFApplication app, Frame frame){
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
		//调用Dialog
		TestOperation operation = new TestOperation(app, frame,pirintlog);
		
		super.setRunnable(operation);
	}
}

