package com.customer.fawvw.issues.commands.issuestatistic;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.customer.fawvw.issues.AbstractFawvwPepDialog;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.kernel.TCUserService;
import com.teamcenter.rac.util.DateButton;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;

public class IssueReportDialog extends AbstractFawvwPepDialog {

	/**
	 * 
	 */
	private JPanel inputPanel;
	
	private JLabel projectLabel;

	private JComboBox projectComboBox;

	private JLabel startTimeLabel;

	private DateButton startTime;

	private JLabel endTimeLabel;

	private DateButton endTime;

	private AbstractFawvwPepCommand command;
	
	private String path;

	private JLabel savePathLabel;

	private JTextField savePathTextField;

	private JButton savePathButton;

	public IssueReportDialog(AbstractFawvwPepCommand command) {
		super(command);
		this.command = command;
	}

	@Override
	public void doInitUI() {
		/* 所属平台 */
		inputPanel = new JPanel(new PropertyLayout());
		
		projectLabel = new JLabel("选择项目");  //$NON-NLS-1$
		projectComboBox = new JComboBox();
		ComponentUtils.initializeProject(super.getSession(), projectComboBox);

		/* 开始时间 */
		startTimeLabel = new JLabel("开始时间");  //$NON-NLS-1$
		startTime = new DateButton(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")); //$NON-NLS-1$

		/* 结束时间 */
		endTimeLabel = new JLabel("结束时间");  //$NON-NLS-1$
		endTime = new DateButton(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")); //$NON-NLS-1$
		
		/* 保存位置 */
		savePathLabel = new JLabel("保存路径"); //$NON-NLS-1$
		savePathTextField = createTextField("", 30, TCConstants  //$NON-NLS-1$
				.getDefaultMaxNameSize(super.getSession()), true);
		savePathTextField.setEditable(false);
		savePathButton = new JButton("浏览"); //$NON-NLS-1$
		savePathButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jChooser = new JFileChooser();
				jChooser.setCurrentDirectory(new File("D:/")); //$NON-NLS-1$
				jChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);// 只能打开文件夹
				int index = jChooser.showDialog(null,
						"打开"); //$NON-NLS-1$
				if (index == JFileChooser.APPROVE_OPTION) {
					savePathTextField.setText(jChooser.getSelectedFile()
							.getAbsolutePath());
				}

			}
		});

		inputPanel.add("1.1.right.top.preferred.preferred", projectLabel); //$NON-NLS-1$
		inputPanel.add("1.2.center.center.preferred.preferred", projectComboBox); //$NON-NLS-1$
		inputPanel.add("2.1.right.top.preferred.preferred", startTimeLabel); //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", startTime); //$NON-NLS-1$
		inputPanel.add("3.1.right.top.preferred.preferred", endTimeLabel); //$NON-NLS-1$
		inputPanel.add("3.2.center.center.preferred.preferred", endTime); //$NON-NLS-1$

		inputPanel.add("4.1.right.top.preferred.preferred", savePathLabel);  //$NON-NLS-1$
		inputPanel.add("4.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel.add("4.3.right.top.preferred.preferred", savePathButton);  //$NON-NLS-1$
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
	}
	
	@Override
	public boolean doValidate() {
	
		if (this.projectComboBox.getSelectedItem() == null) {
			MessageBox.post("请选择项目",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		this.path = getSavePathTextField().getText().trim();
		if ("".equals(this.path) || this.path == null) {  //$NON-NLS-1$
			MessageBox.post(
					"请选择保存位置",  //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		return true;
	}

	@Override
	public void generateExcel() throws Exception {

		System.out.println("问题统计报表"); //$NON-NLS-1$
			
//		应用RichClient方式获取问题列表
		try {
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			String path = getSavePathTextField().getText().trim()
					+ "\\" + super.getSession().getUser().getUserId() + "_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls";  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
			parameters.put("projectInfo", this.projectComboBox.getSelectedItem()); //$NON-NLS-1$
			parameters.put("startTime", startTime.getText().trim()); //$NON-NLS-1$
			parameters.put("endTime", endTime.getText().trim()); //$NON-NLS-1$
			parameters.put("session", this.command.getSession()); //$NON-NLS-1$
			
			//打开报表
			if (CreateIssueExcelByRichiClient.createExcel(parameters, path, super.getSession())) {
				path = "\"" + path + "\""; //$NON-NLS-1$ //$NON-NLS-2$
				Runtime.getRuntime().exec("cmd  /c  start excel " + path); //$NON-NLS-1$
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}

	@Override
	public String getTitle() {
		return "问题统计报表";  //$NON-NLS-1$
	}

	public JTextField getSavePathTextField() {
		return savePathTextField;
	}
}
