package com.customer.fawvw.issues.commands.issueStatus;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeListener;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;
import org.omg.CORBA.PRIVATE_MEMBER;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.customer.fawvw.issues.AbstractFawvwPepDialog;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.common.lov.LOVComboBox;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class IssueStatusReportDialog extends AbstractFawvwPepDialog{

	private JPanel inputPanel;
	private JLabel timeLabel;
	private JTextField timeValue;
	private JLabel projectLabel;
	private JComboBox projectComboBox;
	private JLabel mileStoneLabel;
	private LOVComboBox mileStoneLov;
	private JLabel forecastLabel;
	private JTextField forecastValue;
	private JLabel savePathLabel;
	private JTextField savePathTextField;
	private JButton savePathButton;
	private JButton updateButton;
	private JButton shutButton;
	
	private String path = ""; 
	
	public IssueStatusReportDialog(AbstractFawvwPepCommand command) {
		super(command);
	}
	
	public void doInitUI() {

		/* 所属平台 */
		inputPanel = new JPanel(new PropertyLayout());
		timeLabel = new JLabel("当前时间");
		timeValue = createTextField("", 30, TCConstants 
				.getDefaultMaxNameSize(super.getSession()), true);
		timeValue.disable();
		timeValue.setText(getCurrentTime());
		
		projectLabel = new JLabel("选择项目");
		projectComboBox = new JComboBox();
		ComponentUtils.initializeProject(super.getSession(), projectComboBox);
		
		mileStoneLabel = new JLabel("里程碑");
		mileStoneLov = new LOVComboBox(super.getSession(), "FV9VSCPhase"); 
		
		forecastLabel = new JLabel("预测显示周数");
		forecastValue = createTextField("", 30, TCConstants 
				.getDefaultMaxNameSize(super.getSession()), true);
		forecastValue.setText("0"); 
		
		savePathLabel = new JLabel("保存路径");
		savePathTextField = createTextField("", 30, TCConstants 
				.getDefaultMaxNameSize(super.getSession()), true);
		savePathButton = new JButton("浏览");
		savePathButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jChooser = new JFileChooser();
				jChooser.setCurrentDirectory(new File("D:/")); 
				jChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);// 只能打开文件夹
				int index = jChooser.showDialog(null,
						"打开");
				if (index == JFileChooser.APPROVE_OPTION) {
					savePathTextField.setText(jChooser.getSelectedFile()
							.getAbsolutePath());
				}

			}
		});
		
		updateButton = new JButton("更新"); 
		updateButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent actionevent)
            {
            	Job job = new Job("报表生成中...") {
        			protected IStatus run(IProgressMonitor monitor) {
    					if (doValidate()) {
    						disposeDialog();
    						try {
								generateExcel();
								MessageBox.post("程序执行成功", 
										getTitle(), MessageBox.INFORMATION);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								MessageBox.post("程序执行失败，请参考日志", 
										getTitle(), MessageBox.ERROR);
							}
    						
    					}

        				return Status.OK_STATUS;
        			}
        		};
        		job.schedule();
            }

        });
		
		shutButton = new JButton("取消"); 
		shutButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent actionevent) {
				disposeDialog();
			}
		});
		
		buttonPanel.remove(okButton);
		buttonPanel.remove(applyButton);
		buttonPanel.remove(cancelButton);
		buttonPanel.add(updateButton);
		buttonPanel.add(shutButton);
		
		inputPanel.add("1.1.right.top.preferred.preferred", timeLabel); 
		inputPanel.add("1.2.center.center.preferred.preferred", timeValue); 
		inputPanel.add("2.1.right.top.preferred.preferred", projectLabel); 
		inputPanel.add("2.2.center.center.preferred.preferred", projectComboBox); 
		inputPanel.add("3.1.right.top.preferred.preferred", mileStoneLabel); 
		inputPanel.add("3.2.center.center.preferred.preferred", mileStoneLov); 
		inputPanel.add("4.1.right.top.preferred.preferred", forecastLabel); 
		inputPanel.add("4.2.center.center.preferred.preferred", forecastValue); 
		inputPanel.add("5.1.right.top.preferred.preferred", savePathLabel); 
		inputPanel.add("5.2.center.center.preferred.preferred", savePathTextField); 
		inputPanel.add("5.3.center.center.preferred.preferred", savePathButton); 
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel);  
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); 
		parentPanel.add("bottom.bind.center.top", buttonPanel); 
	}
	
	public String getCurrentTime() {
//		String currentTime = "22-2012"; 
		String year = DateUtil.getCurrentYear();
		String week = DateUtil.getWeekOfYear2(DateUtil.getSystTime()) + ""; 
		return week + "-" + year; 
	}
	
	public boolean doValidate() {
		this.path = getSavePathTextField().getText().trim();
		if ("".equals(this.path) || this.path == null) {  
			MessageBox.post("请选择保存位置", 
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		if ("".equals(this.mileStoneLov.getSelectedItem().toString()) || 
				this.mileStoneLov.getSelectedItem().toString() == null) {
			MessageBox.post("请选择里程碑", 
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		if ("".equals(this.forecastValue.getText()) ||  //$NON-NLS-1$
				this.forecastValue.getText() == null){
			MessageBox.post("请填写报表预测显示周数", 
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		return true;
	}
	
	public void generateExcel() throws Exception {
		System.out.println("generateExcel"); 
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("week", getCurrentTime()); 
//		parameters.put("week", "45-2012"); 
		parameters.put("project_id", ((TCComponentProject)this.projectComboBox.getSelectedItem()) 
				.getProperty("project_id")); 
		parameters.put("project_name", ((TCComponentProject)this.projectComboBox.getSelectedItem()) 
				.getProperty("project_name")); 
		parameters.put("mile_stone", this.mileStoneLov.getSelectedItem().toString()); 
		parameters.put("session", super.getSession()); 
		parameters.put("forecast", forecastValue.getText()); 
		
//		用户ID_IssueStatusReport_项目ID.xls
		String projectID = ((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id");
		projectID = projectID.replaceAll("\\\\", "-");
		projectID = projectID.replaceAll("/", "-");
		

		this.path = getSavePathTextField().getText().trim()
			+ "\\" + super.getSession().getUser().getUserId() + "_IssueStatusReport_"
			+ projectID;
		String path1 = this.path + "_" + Math.abs(new Random().nextInt()) + ".xls"; 
		String path2 = this.path + "_" + Math.abs(new Random().nextInt()) + ".xls"; 
		
		if (CreateIssueExcel.createExcel(parameters, path1, path2, projectID)) {
			path1 = "\"" + path1 + "\"";   
			path2 = "\"" + path2 + "\"";   
			Runtime.getRuntime().exec("cmd  /c  start excel " + path1); 
			Runtime.getRuntime().exec("cmd  /c  start excel " + path2); 
			
		}

	}
	
	public String getTitle() {
		return "问题状态统计报表";
	}
	
	public JTextField getSavePathTextField() {
		return savePathTextField;
	}
	
}
