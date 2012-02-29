package com.customer.fawvw.issues.commands.impart;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class ImPartIssueReportCommand  extends AbstractFawvwPepCommand {
	
//	private AbstractAIFApplication application;
//	private TCSession session;
//	private InterfaceAIFComponent[] targetArray;


	public ImPartIssueReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
		// TODO Auto-generated constructor stub
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		// TODO Auto-generated method stub
		return new ImPartIssueReportDialog(this);
	}
	
//	public ImPartIssueReportCommand(
//			AbstractAIFApplication currentApplication) {
//		
//		
//		this.application = currentApplication;
//		this.session = (TCSession) application.getSession();
//		try {
//			targetArray = super.checkComponents(application
//					.getTargetComponents());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		Job job = new Job(Messages.IssueSingleReportCommand_2) {
//			protected IStatus run(IProgressMonitor monitor) {
//			try {
//				if(doValidate()){
//					
//					createExcel();
//					MessageBox.post(com.customer.fawvw.pep.commands.impart.Messages.ImPartIssueReportCommand_0, com.customer.fawvw.pep.commands.impart.Messages.ImPartIssueReportCommand_3, MessageBox.INFORMATION);
//				} 
//			} catch (Exception exception) {
//				MessageBox.post(Utilities.getCurrentFrame(), exception);
//			}
//			return Status.OK_STATUS;
//			}
//		};
//		job.schedule();
//	}
//
//	private void createExcel() throws Exception{
//		System.out.println(Messages.ImPartIssueReportCommand_6);
//		
//		String tempPath = System.getProperty("java.io.tmpdir"); //$NON-NLS-1$
//		String file = tempPath + session.getUserName() + "_ProblemReport" + Math.abs(new Random().nextInt())+ ".xls";  //$NON-NLS-1$ //$NON-NLS-2$
//		
//		try {
//			
//			if (CreateImPartIssuesExcel.createExcel(this.session, file)){
//				Runtime.getRuntime().exec("cmd  /c  start excel " + file); //$NON-NLS-1$
//			} else {
//				MessageBox.post(Messages.ImPartIssueReportCommand_not_exist_data, 
//						getTitle(), 
//						MessageBox.INFORMATION);
//			}
//			
//			
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			throw new FawvmLoaderException(Messages.ImPartIssueReportCommand_4);
//		} 
//	}
//	private Boolean doValidate(){
//		if (this.session.getCurrentProject() == null) {
//			MessageBox.post(com.customer.fawvw.pep.commands.impart.Messages.ImPartIssueReportCommand_1,com.customer.fawvw.pep.commands.impart.Messages.ImPartIssueReportCommand_2,
//					MessageBox.INFORMATION);
//			return false;
//		}
//		return true;
//	}
//	public void propertyChange(PropertyChangeEvent evt) {
//		// TODO Auto-generated method stub
//		
//	}
//	
//	public String getTitle() {
//		return Messages.ImPartIssueReportCommand_impart_issue;
//	}
}