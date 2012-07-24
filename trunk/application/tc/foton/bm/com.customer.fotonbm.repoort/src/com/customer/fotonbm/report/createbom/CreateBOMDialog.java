package com.customer.fotonbm.report.createbom;

import java.awt.Dimension;
import java.awt.Frame;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

import com.customer.fotonbm.report.utils.PrintLog;
import com.customer.fotonbm.report.utils.tc.ComponentUtils;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.AbstractAIFCommand;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.aif.AbstractAIFUIApplication;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.commands.newdataset.NewDatasetOperation;
import com.teamcenter.rac.common.lov.LOVComboBox;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

@SuppressWarnings("serial")
public class CreateBOMDialog  extends AbstractAIFDialog implements
InterfaceAIFOperationListener {
	public AbstractAIFUIApplication app;
	public TCSession session = null;
	
	public PrintLog printlog;//日志
	
	public JPanel parentPanel = new JPanel(null);

	public JLabel name; /* 名称 */
	public TextField nameText;
	public LOVComboBox carTemplateComboBox;//模版LOV
	private JLabel carTemplateLabel;

	public static final String OPENAFTERCREATEPREF = "OpenAfterCreatePref"; 
	public static final String OPENONCREATE_ON = "1"; 
	public static final String OPENONCREATE_OFF = "0"; 

	public NewDatasetOperation newDatasetOp;
	public InterfaceAIFComponent pasteTargets[];
	public Frame frame;

	public static final String BM_TEMPLATES_LOV = "FV9FAWBM_CarTemp"; 
	
	
	public CreateBOMDialog(AbstractAIFCommand command, Frame frame, AbstractAIFApplication app,
			InterfaceAIFComponent pasteTargets[], PrintLog p) {
		super(true);
		this.app = (AbstractAIFUIApplication) app;
		this.session = (TCSession) app.getSession();
		this.frame = frame;
		this.pasteTargets = pasteTargets;
		this.printlog = p;
		initUI();
	}

	private void initUI() {
		setTitle(this.getTitle());
		setPreferredSize(new Dimension(300, 180));
		/* 车型代号 */
		name = new JLabel("车型代号");
		name.setBounds(10, 20, 80, 25);// x, y , width, height
		nameText = new TextField("newBora");
		nameText.setBounds(80, 20, 180, 25);
		parentPanel.add(name);
		parentPanel.add(nameText);
		/* 模版 */
		this.carTemplateLabel = new JLabel("模版");
		carTemplateComboBox = new LOVComboBox(session, BM_TEMPLATES_LOV); //$NON-NLS-1$
		carTemplateLabel.setBounds(10, 60, 80, 25);
		carTemplateComboBox.setBounds(80, 60, 180, 25);
		parentPanel.add(carTemplateLabel);
		parentPanel.add(carTemplateComboBox);
		
		/* 确定 取消 */
		JButton btnOK = new JButton("确定");
		btnOK.setBounds(60, 120, 80, 25);
		JButton btnCancel = new JButton("取消");
		btnCancel.setBounds(160, 120, 80, 25);
		// 确定按钮的监听事件
		btnOK.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				
				String selectCarMajor = getLOVSelectDescValue(carTemplateComboBox);
				if (selectCarMajor == null) {
					MessageBox.post("请选择一个车型模版","提示", MessageBox.INFORMATION); 
					return;
				}
				
				String prefix = nameText.getText();
				if(prefix.equalsIgnoreCase("")&& prefix == null){
					MessageBox
					.post("请输入车型代号","提示", MessageBox.INFORMATION); 
					return;
				}
				
				if (prefix.indexOf("-") >= 0) { //$NON-NLS-1$
					MessageBox
							.post("车型代号不能包括-","提示", MessageBox.INFORMATION); 
					return;
				}
				
				InterfaceAIFComponent component = ComponentUtils
						.findTCComponentItemById(session, prefix
								+ selectCarMajor);
				if (component != null) {
					MessageBox.post("拆车BOM已经存在 ，id : "+ prefix + selectCarMajor, 
							"提示", MessageBox.INFORMATION); 
					return;
				}
				InterfaceAIFComponent template = ComponentUtils
						.findTCComponentItemById(session, selectCarMajor);

				if (template == null) {
					MessageBox.post("所选模版不存在，模版名称  ：" + selectCarMajor, "提示", //$NON-NLS-1$ //$NON-NLS-2$
							MessageBox.INFORMATION);
					return;
				}
				
				// 执行operation
				CreateBOMOperation operation = new CreateBOMOperation(session, prefix, template,frame, pasteTargets,printlog);
				operation.addOperationListener(CreateBOMDialog.this);
				session.queueOperation(operation);
				//closePanel(); // 关闭主对话框
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

	@Override
	public void endOperation() {
		super.dispose();
	}

	@Override
	public void startOperation(String paramString) {
		session.setStatus(paramString);
	}

	
	// 关闭主对话框
	private void closePanel() {
		setVisible(false);
		dispose();
	}

	/**
	 * 获得对话框的名称
	 */
	public String getTitle(){
		return "竞品车拆车";
	}
	
	/**
	 * 获取选择LOV的描述信息
	 * 
	 * @param comboBox
	 *            对应LOVCombox
	 * 
	 * @return 描述信息
	 */
	private String getLOVSelectDescValue(LOVComboBox comboBox) {
		int index = comboBox.getSelectedIndex();

		if (index < 0) {
			return null;
		}

		String selectDescValue = null;
		try {
			selectDescValue = comboBox.getLovComponent().getListOfValues()
					.getDescriptions()[index];
		} catch (TCException e) {
			e.printStackTrace();
		}

		return selectDescValue;
	}
	

}
