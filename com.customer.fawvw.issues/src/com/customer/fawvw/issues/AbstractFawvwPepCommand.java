package com.customer.fawvw.issues;

import java.awt.Frame;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

import com.customer.fawvw.issues.utils.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Utilities;

public abstract class AbstractFawvwPepCommand  extends
		AbstractAIFCommand implements PropertyChangeListener {

	private PropertyChangeSupport propertySupport;

	private TCSession session;

	private Frame frame;

	private AbstractAIFApplication application;

	private InterfaceAIFComponent targetArray[];

	public AbstractFawvwPepCommand(
			AbstractAIFApplication abstractaifapplication) {

		this.frame = Utilities.getCurrentFrame();
		this.application = abstractaifapplication;
		this.session = (TCSession) application.getSession();

		try {
			targetArray = super.checkComponents(application
					.getTargetComponents());
		} catch (Exception exception) {
			MessageBox.post(this.frame, exception);
		}

		try {
			AbstractTCCommandDialog commandReportDialog = this.getCommandDialog();
			if(commandReportDialog!=null){
				commandReportDialog
						.addPropertyChangeListener(this);
				propertySupport = new PropertyChangeSupport(this);
				setRunnable(commandReportDialog);
				}
		} catch (Exception exception) {
			MessageBox.post(this.frame, ExceptionUtils.getExMessage(exception), "错误", MessageBox.ERROR); 
		}
	}
	
	/**
	 * 获得执行该命令的对话框
	 * 
	 * @return @see {@link AbstractTCCommandDialog}
	 */
	public abstract AbstractTCCommandDialog getCommandDialog();
	
	/**
	 * 获得选择目标列表
	 * 
	 * @return 目标列表
	 */
	public InterfaceAIFComponent[] getTargetArray() {
		return targetArray;
	}
	
	public TCSession getSession() {
		return session;
	}

	public Frame getFrame() {
		return frame;
	}

	public void propertyChange(PropertyChangeEvent propertychangeevent) {
		propertySupport.firePropertyChange("Tc Stop Operation", null, null); //$NON-NLS-1$
	}

	public void addPropertyChangeListener(
			PropertyChangeListener propertychangelistener) {
		propertySupport.addPropertyChangeListener(propertychangelistener);
	}

	public void removePropertyChangeListener(
			PropertyChangeListener propertychangelistener) {
		propertySupport.removePropertyChangeListener(propertychangelistener);
	}
}
