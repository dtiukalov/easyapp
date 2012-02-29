package com.customer.fawvw.issues.commands.project;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.util.MessageBox;

public class TCProjectCommand extends AbstractFawvwPepCommand {

	public TCProjectCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
		
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		try {
			if (super.getTargetArray().length != 1) {
				MessageBox.post("请选择当前要扩展的项目", "项目属性", MessageBox.INFORMATION);
			} else {
				InterfaceAIFComponent selected = (InterfaceAIFComponent)super.getTargetArray()[0];
				if (selected instanceof TCComponentProject) {
					
					
					TCComponentUser paUser = ((TCComponentProject)selected).getPAUser(); //创建项目的用户
					TCComponentUser currUser = this.getSession().getUser();  //当前用户
					//创建项目的用户才具有写权限
					if (paUser == currUser) {
						System.out.println("------------项目属性扩展-------------");  //$NON-NLS-1$
						System.out.println("你有写入权限"); //$NON-NLS-1$
						
						return new TCProjectDialog(this);
					} else {
						System.out.println("------------项目属性扩展-------------");   //$NON-NLS-1$
						System.out.println("你不具备写入权限"); //$NON-NLS-1$
						MessageBox.post("", "", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-2$
						
						return null;
					}
		
				} else{
					 MessageBox.post("请选择当前要扩展的项目", "项目属性", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
					 return null;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return null;
	}
}
