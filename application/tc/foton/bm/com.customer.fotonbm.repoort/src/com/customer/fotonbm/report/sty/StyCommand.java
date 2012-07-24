package com.customer.fotonbm.report.sty;

import java.awt.Frame;
import java.util.Date;

import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class StyCommand  extends AbstractAIFCommand{
	public PrintLog pirintlog = null ;	//日志输出对象
	private InterfaceAIFComponent pasteTargets[];  //当前选中位置
	
	public StyCommand(AbstractAIFApplication app, Frame frame){
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
		AbstractAIFDialog abstractAIFDialog = new StyDialog(this, frame, app,pasteTargets,pirintlog);
		super.setRunnable(abstractAIFDialog);
	}
}

/*		TCComponentICO[] icos = itemRevision.getClassificationObjects();
System.out.println("icos="+icos.length);
if(icos!=null){
for (int j = 0;j < icos.length;j++) {

ICSProperty[] properties = icos[j].getICSProperties();*/
/*
TCComponentItemRevision itemRevision = (TCComponentItemRevision)component;
String id = itemRevision.getClassificationClass();    
        //new application context
        G4MUserAppContext G4 = new G4MUserAppContext(AIFUtility.getCurrentApplication(), id);

TCClassificationService tccs = G4.getClassificationService();

           // ICSAdminClass adminClass = tccs.newICSAdminClass();
        ICSApplicationObject appObject = tccs.newICSApplicationObject("ICM");
        int s=appObject.searchById(itemRevision.getItem().getProperty("item_id")+"/"+itemRevision.getProperty("item_revision_id"),itemRevision.getUid());
System.out.println("s="+s);
if (s > 0) {
appObject.read(1);
appObject.edit();
appObject.setView(id);
}else{
System.out.println("没有找到该分类");
return;
}
*/