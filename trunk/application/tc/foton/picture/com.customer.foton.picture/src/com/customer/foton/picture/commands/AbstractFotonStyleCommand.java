package com.customer.foton.picture.commands;

import java.awt.Frame;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

import com.customer.foton.picture.util.ExceptionUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Utilities;

/**
 * 
 * TODO
 * <li>完成对TCSession的初始化操作;
 * <li>完成对选择目标的初始化操作
 * <li>执行对应业务的对话框
 * 
 * @author LeslieGu
 */
public abstract class AbstractFotonStyleCommand extends
		AbstractAIFCommand implements PropertyChangeListener {

	private PropertyChangeSupport propertySupport;

	private TCSession session;

	private Frame frame;

	private AbstractAIFApplication application;

	private InterfaceAIFComponent targetArray[];

	public AbstractFotonStyleCommand(
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
