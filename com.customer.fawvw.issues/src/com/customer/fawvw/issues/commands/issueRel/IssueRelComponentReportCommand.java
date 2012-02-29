package com.customer.fawvw.issues.commands.issueRel;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.util.MessageBox;

public class IssueRelComponentReportCommand  extends AbstractFawvwPepCommand {

	private AbstractAIFApplication application;
	private InterfaceAIFComponent[] targetArray;
	
	public IssueRelComponentReportCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
		// TODO Auto-generated constructor stub
	}

	@Override
	public IssueRelComponentReportDialog getCommandDialog() {
		// TODO Auto-generated method stub

		if (doValidate(this)) {
			return new IssueRelComponentReportDialog(this);
		} 		
		return null;
		
	}
	
	public boolean doValidate(AbstractFawvwPepCommand command) {
		
System.out.println("------in doValidate-----");		 //$NON-NLS-1$
	
		if (command.getTargetArray().length > 0) {
		System.out.println("-----------targetArray is not null-----------"); //$NON-NLS-1$
			try {
				targetArray = command.getTargetArray();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (int i = 0; i < targetArray.length; i++) {
			System.out.println("targetArray[i].getType(): " + targetArray[i].getType()); //$NON-NLS-1$
				if (!"FV9SubSystem".equals(targetArray[i].getType()) &&  //$NON-NLS-1$
					!"FV9SubSystemRevision".equals(targetArray[i].getType()) && //$NON-NLS-1$
					!"FV9Component".equals(targetArray[i].getType()) && //$NON-NLS-1$
					!"FV9ComponentRevision".equals(targetArray[i].getType()) //$NON-NLS-1$
				){ //$NON-NLS-1$
					MessageBox.post("请选择子系统或总成",  //$NON-NLS-1$
							"与专业编码相关的问题报表",  //$NON-NLS-1$
							MessageBox.INFORMATION);
					return false;
				}
			}
		} else {
		System.out.println("--------targetArray is null-------------"); //$NON-NLS-1$
			MessageBox.post("请选择子系统或总成",  //$NON-NLS-1$
					"与专业编码相关的问题报表",  //$NON-NLS-1$
					MessageBox.INFORMATION);
			return false;
		}
		
		
		return true;
	}

}
