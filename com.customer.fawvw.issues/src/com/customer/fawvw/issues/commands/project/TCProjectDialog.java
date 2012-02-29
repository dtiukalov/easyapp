package com.customer.fawvw.issues.commands.project;

import java.awt.Cursor;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.common.lov.LOVComboBox;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.DateButton;
import com.teamcenter.rac.util.FilterDocument;
import com.teamcenter.rac.util.HorizontalLayout;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Painter;
import com.teamcenter.rac.util.PropertyLayout;
import com.teamcenter.rac.util.Registry;
import com.teamcenter.rac.util.VerticalLayout;

public class TCProjectDialog extends AbstractTCCommandDialog implements
		InterfaceAIFOperationListener, PropertyChangeListener {

	private JPanel inputPanel;

	private JPanel leftPanel;

	private JLabel platformLabel;

	private LOVComboBox platformComboBox;

	private JLabel levelLabel;

	private LOVComboBox levelComboBox;

	private JLabel typeLabel;

	private LOVComboBox typeComboBox;

	private JButton stopButton;
	
	private InterfaceAIFComponent[] pasteTargets;

	private TCSession session;

	private Registry registry;
	
	public  final String LOV_PLATFORM = "FV9PlatformType"; //$NON-NLS-1$
	
	public  final String LOV_LEVEL = "FV9CarRank"; //$NON-NLS-1$
	
	public  final String LOV_TYPE = "FV9DevelopmentType"; //$NON-NLS-1$

	private JLabel modelCode;

	private LOVComboBox modelCodeComboBox;

	private JLabel intProjName;

	private JTextField intProjNameField;

	private JLabel SOPPlTimeLabel;

	private DateButton SOPPlTime;

	private JLabel SOPActTimeLabel;

	private DateButton SOPActTime;

	public TCProjectDialog(AbstractFawvwPepCommand command) {
		super(command.getFrame(), command);
		this.session = command.getSession();
		this.registry = Registry.getRegistry(TCProjectDialog.class);
		pasteTargets = command.getTargetArray();
		initUI(pasteTargets);
	}

	private static final long serialVersionUID = -8124904173460000037L;


	public void initUI(InterfaceAIFComponent[] projectInfos) {
		super.initUI();
		stopTimer();
		setTitle(this.getTitle());
		inputPanel = new JPanel(new PropertyLayout());

		try {
			TCComponentProject projectInfo = (TCComponentProject)projectInfos[0];
			
			String fv9PrjProductNo = projectInfo.getProperty("fv9PrjProductNo"); //$NON-NLS-1$
			System.out.println("原产品编号：" + fv9PrjProductNo); //$NON-NLS-1$
			
			String fv9PrjPlatform = projectInfo.getProperty("fv9PrjPlatform"); //$NON-NLS-1$
			System.out.println("原所属平台：" + fv9PrjPlatform); //$NON-NLS-1$
			
			String fv9PrjProductName = projectInfo.getProperty("fv9PrjProductName"); //$NON-NLS-1$
			System.out.println("原产品名称：" + fv9PrjProductName); //$NON-NLS-1$
			
			String fv9PrjProductRank = projectInfo.getProperty("fv9PrjProductRank");  //$NON-NLS-1$
			System.out.println("原车型级别：" + fv9PrjProductRank); //$NON-NLS-1$
			
			String fv9PrjDevelopmentType = projectInfo.getProperty("fv9PrjDevelopmentType"); //$NON-NLS-1$
			System.out.println("原项目类型：" + fv9PrjDevelopmentType); //$NON-NLS-1$
			
			String fv9ModelCode = projectInfo.getProperty("fv9ModelCode"); //$NON-NLS-1$
			System.out.println("原车型代码：" + fv9ModelCode); //$NON-NLS-1$
			
			String fv9IntProjName = projectInfo.getProperty("fv9IntProjName"); //$NON-NLS-1$
			System.out.println("原项目内部名称：" + fv9IntProjName); //$NON-NLS-1$
			
			Date fv9SOPPlTime = projectInfo.getDateProperty("fv9SOPPlTime"); //$NON-NLS-1$
			System.out.println("SOP计划时间：" + fv9SOPPlTime); //$NON-NLS-1$
			
			Date fv9SOPActTime = projectInfo.getDateProperty("fv9SOPActTime"); //$NON-NLS-1$
			System.out.println("SOP实际完成时间：" + fv9SOPActTime); //$NON-NLS-1$

			/* 所属平台 */
			platformLabel = new JLabel("所属平台："); //$NON-NLS-1$
			platformComboBox = new LOVComboBox(session,this.LOV_PLATFORM);
			if (!"".equals(fv9PrjPlatform)) { //$NON-NLS-1$
				platformComboBox.setSelectedString(fv9PrjPlatform);
			}
			
			/*车型代码*/
			modelCode = new JLabel("车型代码："); //$NON-NLS-1$
			modelCodeComboBox = new LOVComboBox(session, "FV9ModelCode"); //$NON-NLS-1$
			if (!"".equals(fv9ModelCode)) { //$NON-NLS-1$
				modelCodeComboBox.setSelectedString(fv9ModelCode);
			}
			
			/*项目内部名称*/
			intProjName = new JLabel("项目内部名称："); //$NON-NLS-1$
			if (!"".equals(fv9IntProjName)) { //$NON-NLS-1$
				intProjNameField = createTextField(fv9IntProjName, 20, TCConstants
						.getDefaultMaxNameSize(session), false);	
			} else {
				intProjNameField = createTextField("", 20, TCConstants //$NON-NLS-1$
						.getDefaultMaxNameSize(session), false);	
			}

			/* 车型级别 */
			levelLabel = new JLabel("车型级别：");	 //$NON-NLS-1$
			levelComboBox = new LOVComboBox(this.session,this.LOV_LEVEL);
			if (!"".equals(fv9PrjProductRank)) { //$NON-NLS-1$
				levelComboBox.setSelectedString(fv9PrjProductRank);
			} 

			/* 项目类型 */
			typeLabel = new JLabel("项目类型："); //$NON-NLS-1$
			typeComboBox = new LOVComboBox(this.session,this.LOV_TYPE);
			if (!"".equals(fv9PrjDevelopmentType)) { //$NON-NLS-1$
				typeComboBox.setSelectedString(fv9PrjDevelopmentType);
			}
			
			/*SOP计划时间*/
			SOPPlTimeLabel = new JLabel("SOP计划时间："); //$NON-NLS-1$
			SOPPlTime = new DateButton(new SimpleDateFormat("yyyy-MM-dd")); //$NON-NLS-1$
			if (fv9SOPPlTime != null) { //$NON-NLS-1$
				SOPPlTime.setDate(fv9SOPPlTime);
			}
			
			/*SOP实际完成时间*/
			SOPActTimeLabel = new JLabel("SOP实际完成时间："); //$NON-NLS-1$
			SOPActTime = new DateButton(new SimpleDateFormat("yyyy-MM-dd")); //$NON-NLS-1$
			if (fv9SOPActTime != null) { //$NON-NLS-1$
				SOPActTime.setDate(fv9SOPActTime);
			}

		} catch (TCException e) {
			// TODO Auto-generated catch block
			System.out.println("------------------load TCProject error--------------------"); //$NON-NLS-1$
			e.printStackTrace();
		}

		stopButton = new JButton(registry.getString("stop")); //$NON-NLS-1$
		stopButton.setVisible(false);
		stopButton.setMnemonic(registry.getString("stop.MNEMONIC").charAt(0)); //$NON-NLS-1$
		stopButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent actionevent) {
				stopPressed();
			}
		});

		inputPanel.add("1.1.right.top.preferred.preferred", platformLabel); //$NON-NLS-1$
		inputPanel.add("1.2.center.center.preferred.preferred", //$NON-NLS-1$
				platformComboBox);
		
		inputPanel.add("2.1.right.top.preferred.preferred", modelCode); //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", //$NON-NLS-1$
				modelCodeComboBox);
		
		inputPanel.add("3.1.right.top.preferred.preferred", intProjName); //$NON-NLS-1$
		inputPanel.add("3.2.center.center.preferred.preferred", //$NON-NLS-1$
				intProjNameField);
		
		inputPanel.add("4.1.right.top.preferred.preferred", levelLabel); //$NON-NLS-1$
		inputPanel.add("4.2.center.center.preferred.preferred", levelComboBox); //$NON-NLS-1$
		
		inputPanel.add("5.1.right.top.preferred.preferred", typeLabel); //$NON-NLS-1$
		inputPanel.add("5.2.center.center.preferred.preferred", typeComboBox); //$NON-NLS-1$
	
		inputPanel.add("6.1.right.top.preferred.preferred", SOPPlTimeLabel); //$NON-NLS-1$
		inputPanel.add("6.2.center.center.preferred.preferred", SOPPlTime); //$NON-NLS-1$
		
		inputPanel.add("7.1.right.top.preferred.preferred", SOPActTimeLabel); //$NON-NLS-1$
		inputPanel.add("7.2.center.center.preferred.preferred", SOPActTime); //$NON-NLS-1$
		
		buttonPanel.add(stopButton);
		leftPanel = new JPanel(new VerticalLayout());
		leftPanel.add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
		mainPanel.setLayout(new HorizontalLayout());
		mainPanel.add("unbound.bind.left.top", leftPanel); //$NON-NLS-1$

		pack();
		centerToScreen(1.0D, 0.75D);
//		nameTextField.requestFocusInWindow();
		startTimer();
	}

	/* 验证的对话框 */
	private JTextField createTextField(String s, int i, int j, boolean flag) {
		int k = i;
		if (k <= 0) {
			k = 10;
		}
		String s1 = s;
		if (s1 == null) {
			s1 = ""; //$NON-NLS-1$
		}

		FilterDocument filterdocument = new FilterDocument(j, TCSession
				.getServerEncodingName(session));

		if (flag) {
			return new JTextField(filterdocument, s1, k) {
				private static final long serialVersionUID = -1096092937246723413L;

				public void paint(Graphics g) {
					super.paint(g);
					Painter.paintIsRequired(this, g);
				}
			};
		} else {
			return new JTextField(filterdocument, s1, k);
		}
	}

	@Override
	public boolean showCloseButton() {
		return false;
	}

	@Override
	/* 点击确定和应用触发的事件 */
	public void startCommandOperation() {
		
		Job job = new Job("工作中...") {  //$NON-NLS-1$
			protected IStatus run(IProgressMonitor monitor) {
				try {
					if(doValidate()){
						
						//判断当前用户是否具备写入权限
						if (doOperation()) {
							MessageBox.post("程序执行成功", "项目属性扩展", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
						} else {
							MessageBox.post("您不具备此项目的写入权限！", "项目属性扩展", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
						}
						
						if(okOrApply == 0){
							disposeDialog();
						}
					}
					
				} catch (Exception e) {
					MessageBox.post(e.getMessage(),"错误", MessageBox.ERROR);    //$NON-NLS-1$
				}

				return Status.OK_STATUS;
			}
		};
		job.schedule();
		
	}
	/*
	 * 开始执行处理逻辑
	 * 
	 * */
	private boolean doOperation() {
		try {
//			System.out.println("TCComponentProject--"+((TCComponentProject)pasteTargets[0]).getType()); //$NON-NLS-1$
//			TCComponentProject currentPro = (TCComponentProject)pasteTargets[0];
//			TCComponentUser paUser = currentPro.getPAUser(); //创建项目的用户
//			TCComponentUser currUser = session.getUser();  //当前用户
			//创建项目的用户才具有写权限
//			if (paUser == currUser) {
//				System.out.println("--------yes--------"); //$NON-NLS-1$
//				System.out.println(Messages.TCProjectDialog_32);
//				
//				((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjProductNo", IdTextField.getText().trim()); //$NON-NLS-1$
//				((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjPlatform", platformComboBox.getSelectedItem().toString().trim()); //$NON-NLS-1$
//				((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjProductName", nameTextField.getText().trim()); //$NON-NLS-1$
//				((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjProductRank", levelComboBox.getSelectedItem().toString().trim()); //$NON-NLS-1$
//				((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjDevelopmentType", typeComboBox.getSelectedItem().toString().trim()); //$NON-NLS-1$
//				
//				System.out.println("----------successful---------------"); //$NON-NLS-1$
//				return true;
//				
//			} else {
//				System.out.println("-------error---------"); //$NON-NLS-1$
//				System.out.println(Messages.TCProjectDialog_39);
//				return false;
//			}
			System.out.println("新所属平台：" + platformComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			System.out.println("新的车型代码：" + modelCodeComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			System.out.println("新的项目内部名称：" + intProjNameField.getText()); //$NON-NLS-1$
			System.out.println("新车型等级：" + levelComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			System.out.println("新项目类型：" + typeComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			System.out.println("SOP计划时间：" + SOPPlTime.getDateString()); //$NON-NLS-1$
			System.out.println("SOP实际完成时间：" + SOPActTime.getDateString()); //$NON-NLS-1$
			
			((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjPlatform", platformComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			((TCComponentProject)pasteTargets[0]).setProperty("fv9ModelCode", modelCodeComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			((TCComponentProject)pasteTargets[0]).setProperty("fv9IntProjName", intProjNameField.getText()); //$NON-NLS-1$
			((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjProductRank", levelComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			((TCComponentProject)pasteTargets[0]).setProperty("fv9PrjDevelopmentType", typeComboBox.getSelectedItem().toString()); //$NON-NLS-1$
			
			if (SOPPlTime.getDate() != null) {
				((TCComponentProject)pasteTargets[0]).setDateProperty("fv9SOPPlTime", SOPPlTime.getDate()); //$NON-NLS-1$
			} else {
				((TCComponentProject)pasteTargets[0]).setDateProperty("fv9SOPPlTime", null); //$NON-NLS-1$
			}
			
			if (SOPActTime.getDate() != null) {
				((TCComponentProject)pasteTargets[0]).setDateProperty("fv9SOPActTime", SOPActTime.getDate()); //$NON-NLS-1$
			} else {
				((TCComponentProject)pasteTargets[0]).setDateProperty("fv9SOPActTime", null); //$NON-NLS-1$
			}
			
			
			System.out.println("写入成功"); //$NON-NLS-1$
			
			return true;
			
		} catch (TCException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	
	public void propertyChange(PropertyChangeEvent evt) {
		String s = evt.getPropertyName();
		if (s.equals("Tc Stop Operation")) { //$NON-NLS-1$
			Thread thread = new Thread() {

				public void run() {
					stopButton.setEnabled(true);
					stopButton.doClick();
				}

			};
			thread.start();
		}
	}

	/* 验证 */
	public boolean isPerformable() {
//		return nameTextField.getText().length() > 0;
		
		return true;
	}

	/* 取消按钮 */
	public void stopPressed() {
		Registry registry = Registry.getRegistry(this);

		stopButton.setText(registry.getString("aborting")); //$NON-NLS-1$
		stopButton.setEnabled(false);
		setCursor(Cursor.getPredefinedCursor(3));

//		nameTextField.setEnabled(false);
		setCursor(Cursor.getPredefinedCursor(0));

		MessageBox.post(parentFrame, registry.getString("aborted"), registry //$NON-NLS-1$
				.getString("aborted.TITLE"), MessageBox.INFORMATION); //$NON-NLS-1$

		fireStopOperation();
		disposeDialog();
	}

	/* 关闭窗体的对话框 */
	public void windowClosingPressed() {
		if (stopButton.isVisible()) {
			stopButton.doClick();
		} else {
			cancelButton.doClick();
		}
	}
	
	/*执行操作前的验证
	 * 
	 * 1、是否选中要操作的工程对象
	 * 2、？？LOV的控件是否能获得系统数据
	 * 3、选中的工程属性是否可以修改
	 * */
	public boolean doValidate() {
		//必须选中一个项目
		if(pasteTargets.length!=1){
			MessageBox.post("请选择要扩展的项目", "提示", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
			return false;
		}
		
		//所属平台不能为空
		if ("".equals(platformComboBox.getSelectedItem().toString()) ||  //$NON-NLS-1$
				platformComboBox.getSelectedItem().toString() == null) {
			MessageBox.post(
					"请选择项目所属平台",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		//车型代码不能为空
		if ("".equals(modelCodeComboBox.getSelectedItem().toString()) || //$NON-NLS-1$
				modelCodeComboBox.getSelectedItem().toString() == null) {
			MessageBox.post(
					"请选择项目车型代码",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		//车型级别不能为空
		if ("".equals(levelComboBox.getSelectedItem().toString()) || //$NON-NLS-1$
				levelComboBox.getSelectedItem().toString() == null) {
			MessageBox.post(
					"请选择项目车型级别",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		//项目类型不能为空
		if ("".equals(typeComboBox.getSelectedItem().toString()) || //$NON-NLS-1$
				typeComboBox.getSelectedItem().toString() == null) {
			MessageBox.post(
					"请选择项目类型",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		return true;
	}
	
//	public void endOperation() {
//		
//			if (okOrApply == 0) {
//				disposeDialog();
//			}
//		
//	}
	
	public String getTitle() {
		return "项目属性扩展"; //$NON-NLS-1$
	}
	
}
