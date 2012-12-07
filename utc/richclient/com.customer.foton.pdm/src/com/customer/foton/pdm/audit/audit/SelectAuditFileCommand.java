package com.customer.foton.pdm.audit.audit;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.Map;
import java.util.Random;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;

import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Utilities;

public class SelectAuditFileCommand extends AbstractAIFCommand 
	implements PropertyChangeListener{
	
	private AbstractAIFApplication application;
	private TCSession session;
	private InterfaceAIFComponent targetArray[];
	
	public SelectAuditFileCommand(AbstractAIFApplication currentApplication) {
		
		this.application = currentApplication;
		this.session = (TCSession) application.getSession();
		
		try {
			targetArray = super.checkComponents(application
					.getTargetComponents());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Job job = new Job("工作中...") { 
			protected IStatus run(IProgressMonitor monitor) {
				try {
					if (doValidate()) {
						operation(targetArray[0]);
						MessageBox.post(
								"成功完成", 
								getTitle(), 
								MessageBox.INFORMATION); 
					}
					
				} catch (Exception exception) {
					MessageBox.post(Utilities.getCurrentFrame(), exception);
				}
				
				return Status.OK_STATUS;
			}
		};
		job.schedule();
	}
	
	private void operation(InterfaceAIFComponent target) {
		if (target instanceof TCComponentItemRevision) {
			TCComponentItemRevision itemrevision = (TCComponentItemRevision)target;
			try {
//				获取审计文件的字符串
				String audit = itemrevision.getAuditInfo(true);
				System.out.println(audit);
//				解析审计文件的字符串
//				todo
				
			} catch (TCException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	private Boolean doValidate(){
		if(targetArray.length > 1){
			MessageBox.post(
					"只能选择一个对象", 
					getTitle(), 
					MessageBox.INFORMATION); 
			return false;
		}
		
		if (targetArray.length < 1) {
			MessageBox.post(
					"请选择一个对象后使用本功能", 
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
				
		return true;
	}

	public void propertyChange(PropertyChangeEvent arg0) {
		// TODO Auto-generated method stub

	}
	
	public String getTitle() {
		return "审计文件"; //$NON-NLS-1$
	}

}
