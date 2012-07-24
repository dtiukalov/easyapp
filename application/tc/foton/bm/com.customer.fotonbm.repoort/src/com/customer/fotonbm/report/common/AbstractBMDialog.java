package com.customer.fotonbm.report.common;

import java.awt.Dimension;
import java.awt.Frame;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import com.customer.fotonbm.report.qa.QAOperation;
import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.commands.newdataset.NewDatasetOperation;
import com.teamcenter.rac.kernel.TCSession;

@SuppressWarnings("serial")
public abstract class AbstractBMDialog extends AbstractAIFDialog implements
		InterfaceAIFOperationListener {

	public AbstractAIFUIApplication app;
	public TCSession session = null;
	private AbstractBmOperation bmOperation;
	
	public PrintLog printlog;//日志
	
	public JPanel parentPanel = new JPanel(null);

	public JLabel name; /* 名称 */
	public TextField nameText;
	public JLabel desc; /* 描述 */
	public TextField descText;
	public JList bmCompeteList; /* 竞品车 */
	public JLabel bmCompeteLabel; /* 竞品车 */
	public JCheckBox openOnCreateCheckBox;// 创建后打开

	public static final String OPENAFTERCREATEPREF = "OpenAfterCreatePref"; //$NON-NLS-1$
	public static final String OPENONCREATE_ON = "1"; //$NON-NLS-1$
	public static final String OPENONCREATE_OFF = "0"; //$NON-NLS-1$

	public NewDatasetOperation newDatasetOp;
	public InterfaceAIFComponent pasteTargets[];
	public Frame frame;
	
	public AbstractBMDialog(AbstractAIFCommand command, Frame frame, AbstractAIFApplication app,
			InterfaceAIFComponent pasteTargets[], PrintLog p) {
		super(true);
		this.app = (AbstractAIFUIApplication) app;
		this.session = (TCSession) app.getSession();
		this.frame = frame;
		this.pasteTargets = pasteTargets;
		this.printlog = p;
		this.bmOperation = this.createBmOpration(session);
		initUI();
	}

	private void initUI() {
		setTitle(this.getTitle());
		setPreferredSize(new Dimension(300, 360));
		/* 名称 */
		name = new JLabel("名称");
		name.setBounds(10, 20, 80, 25);// x, y , width, height
		nameText = new TextField(this.getTitle());
		nameText.setBounds(50, 20, 200, 25);
		parentPanel.add(name);
		parentPanel.add(nameText);
		/* 描述 */
		desc = new JLabel("描述");
		desc.setBounds(10, 60, 80, 25);
		descText = new TextField("");
		descText.setBounds(50, 60, 200, 35);
		parentPanel.add(desc);
		parentPanel.add(descText);
		
		/* 竞品车 */
		this.bmCompeteLabel = new JLabel("竞品车");
		this.bmCompeteList = new JList(GetBMVehicleCompeteKeys());
		JScrollPane competeListScroller = new JScrollPane(this.bmCompeteList);
		bmCompeteLabel.setBounds(10, 120, 80, 150);
		competeListScroller.setBounds(50, 120, 200, 150);
		parentPanel.add(bmCompeteLabel);
		parentPanel.add(competeListScroller);
		this.doInitUI();		
		/* 创建后打开 */
		openOnCreateCheckBox = new JCheckBox("创建后打开");
		boolean isOpenCreate = false;
		try {
			String s2 = session.getPreferenceService().getString(0,
					OPENAFTERCREATEPREF);
			isOpenCreate = s2.equalsIgnoreCase(OPENONCREATE_ON);
		} catch (Exception exception) {

		}
		openOnCreateCheckBox.setSelected(isOpenCreate);
		openOnCreateCheckBox.setBounds(200, 270, 150, 25);
		parentPanel.add(openOnCreateCheckBox);
		
		/* 确定 取消 */
		JButton btnOK = new JButton("确定");
		btnOK.setBounds(60, 300, 80, 25);
		JButton btnCancel = new JButton("取消");
		btnCancel.setBounds(160, 300, 80, 25);
		// 确定按钮的监听事件
		btnOK.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				doOperation();
				// closePanel(); // 关闭主对话框
			}
		});

		// 取消按钮的监听事件
		btnCancel.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// 调用方法，关闭主对话框
				closePanel();
			}
		});
	
		parentPanel.add(btnOK);
		parentPanel.add(btnCancel);
		getContentPane().add(parentPanel);
		pack();
		centerToScreen();
	}
	
	/*
	 * 获取竞品车key列表  TODO:暂时通过QAOperation来获取
	 */
	private Object[] GetBMVehicleCompeteKeys() {
		return new QAOperation(session,printlog)
		.getBmVehicleCompetes().keySet().toArray();
	}
	/*
	 * Operation 结束时的操作
	 */
	@Override
	public void endOperation() {
		super.dispose();
		bmCompeteList.setEnabled(true);
	}
	/*
	 * Operation 开始时的操作
	 */
	@Override
	public void startOperation(String paramString) {
		session.setStatus(paramString);
		bmCompeteList.setEnabled(false);
	}

	
	// 关闭主对话框
	private void closePanel() {
		setVisible(false);
		dispose();
	}

	public AbstractBmOperation getBmOperation() {
		return bmOperation;
	}

	/**
	 * 获得选择的竞品车组件List
	 */
	public List<InterfaceAIFComponent> getSelectedCompeteComponents() {
		Object[] selectCompeteVehicles = this.getBmCompeteVehicleList()
				.getSelectedValues();
		List<InterfaceAIFComponent> selectCompeteComponents = new ArrayList<InterfaceAIFComponent>();
		for (Object selectCompeteVehicle : selectCompeteVehicles) {
			selectCompeteComponents.add(getBmOperation().getBmVehicleCompetes().get(selectCompeteVehicle));
		}
		return selectCompeteComponents;
	}

	/**
	 * 获得竞品车组件List
	 */
	public JList getBmCompeteVehicleList() {
		return bmCompeteList;
	}

	/**
	 * 确定按钮触发操作
	 */
	public abstract void doOperation();
	/**
	 * 对于定义其他的swing组件,对话框作的额外初始化操作
	 */
	public abstract void doInitUI();
	
	/**
	 * 获得对话框的名称
	 */
	public abstract String getTitle();
	
	/**
	 * 创建对应业务的业务模型对象
	 * 
	 * @return {@link AbstractFawbmModel}
	 */
	public abstract AbstractBmOperation createBmOpration(TCSession session);
	
	
	
	

}
