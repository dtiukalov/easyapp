package com.customer.fotonbm.report.test;

import java.awt.Frame;

import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aifrcp.AIFUtility;
import com.teamcenter.rac.classification.common.G4MUserAppContext;
import com.teamcenter.rac.kernel.TCClassificationService;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentICO;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.kernel.ics.ICSApplicationObject;
import com.teamcenter.rac.kernel.ics.ICSProperty;

public class TestOperation extends AbstractAIFOperation {
	
	private AbstractAIFUIApplication app;
	private TCSession session;
	private Frame frame;
	private PrintLog printlog;
	private TCComponent tcComponent;

	public TestOperation(AbstractAIFApplication app, Frame frame,PrintLog printlog){
		this.app = (AbstractAIFUIApplication) app;
		this.session = (TCSession) app.getSession();
		this.frame = frame;
		this.printlog = printlog;
		this.tcComponent = (TCComponent) app.getTargetComponent();
	}


	@Override
	public void executeOperation() throws Exception {
	
		if(tcComponent != null){
			if(tcComponent instanceof TCComponentItemRevision){
				TCComponentItemRevision itemRevision = (TCComponentItemRevision)tcComponent;
				TCComponentICO[] icos = itemRevision.getClassificationObjects();
				System.out.println("icos="+icos.length);
				if(icos!=null){
				//	for (int j = 0;j < icos.length;j++) {
				//		ICSProperty[] properties = icos[j].getICSProperties(false);
				//		TCComponentItemRevision itemRevision = (TCComponentItemRevision)component;
						
					
					
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
				//	}	
				}
			}
		}
		
	}
}
