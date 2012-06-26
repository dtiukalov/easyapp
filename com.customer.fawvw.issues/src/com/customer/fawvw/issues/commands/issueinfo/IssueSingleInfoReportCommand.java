package com.customer.fawvw.issues.commands.issueinfo;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.IOException;
import java.util.Random;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Utilities;

public class IssueSingleInfoReportCommand extends AbstractAIFCommand implements
		PropertyChangeListener {
	
	private AbstractAIFApplication application;
	private TCSession session;
	private InterfaceAIFComponent[] targetArray;
	

	public IssueSingleInfoReportCommand(
			AbstractAIFApplication currentApplication) throws Exception{
		
		this.application = currentApplication;
		this.session = (TCSession) application.getSession();
		try {
			targetArray = super.checkComponents(application
					.getTargetComponents());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}
		
		Job job = new Job("") { //$NON-NLS-1$
			protected IStatus run(IProgressMonitor monitor) {
			try {
				
				//验证选中条件是否符合
				System.out.println("单个问题信息报表"); //$NON-NLS-1$
				if(doValidate()){
					createExcel(targetArray[0]);
					MessageBox.post("程序成功完成", "问题报表", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
				} 
			} catch (Exception exception) {
				MessageBox.post(Utilities.getCurrentFrame(), exception);
			}
			return Status.OK_STATUS;
			}
		};
		job.schedule();
	}

	private void createExcel(InterfaceAIFComponent targetcompontent) throws Exception{
		try {
			
//			String tempPath = System.getProperty("java.io.tmpdir"); //$NON-NLS-1$
			String file = System.getenv("TPR") + "\\temp\\" + session.getUserName() + "_ProblemReport" + Math.abs(new Random().nextInt())+ ".xls";  //$NON-NLS-1$ //$NON-NLS-2$
			
			if (targetcompontent instanceof TCComponentItem) {
				targetcompontent = (TCComponentItem)targetcompontent;
			}
			
			if (targetcompontent instanceof TCComponentItemRevision) {
				targetcompontent = ((TCComponentItemRevision)targetcompontent).getItem();
			}
			
			CreateIssueSingleInfoExcel.createExcel(targetcompontent, file, session);
			file = "\"" + file + "\"";
			Runtime.getRuntime().exec("cmd  /c " + file); //$NON-NLS-1$

		} catch (TCException e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		} 
		
		
	}
	private Boolean doValidate() throws Exception {
		
		if(targetArray.length > 1){
			MessageBox.post(
					"",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION); //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
			return false;
		}
		if (targetArray.length < 1) {
			MessageBox.post(
					"",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION); //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
			return false;
		}
		if (!"FV9Issue".equals(targetArray[0].getType()) && !"FV9IssueRevision".equals(targetArray[0].getType())){ //$NON-NLS-1$ //$NON-NLS-2$
			MessageBox.post(
					"",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION); //$NON-NLS-1$
			return false;
		}
		
		return true;
	}

	public void propertyChange(PropertyChangeEvent arg0) {
		// TODO Auto-generated method stub

	}
	
	public String getTitle() {
		return "单个问题信息报表"; //$NON-NLS-1$
	}

}
