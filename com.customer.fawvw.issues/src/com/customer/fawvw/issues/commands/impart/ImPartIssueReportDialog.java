package com.customer.fawvw.issues.commands.impart;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.customer.fawvw.issues.AbstractFawvwPepDialog;
import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;

public class ImPartIssueReportDialog extends AbstractFawvwPepDialog {

	private AbstractFawvwPepCommand command;
	private JPanel inputPanel;
	private JLabel projectLabel;
	private JComboBox projectComboBox;
	private JLabel savePathLabel;
	private JTextField savePathTextField;
	private JButton savePathButton;
	private String path;

	public ImPartIssueReportDialog(AbstractFawvwPepCommand command) {
		super(command);
		this.command = command;
	}
	
	public void doInitUI() {	
		inputPanel = new JPanel(new PropertyLayout());
		
		//项目
		projectLabel = new JLabel("选择项目");
		projectComboBox = new JComboBox();
		ComponentUtils.initializeProject(super.getSession(), projectComboBox);
		
		/* 保存位置 */
		savePathLabel = new JLabel("保存位置");
		savePathTextField = createTextField("", 30, TCConstants  //$NON-NLS-1$
				.getDefaultMaxNameSize(super.getSession()), true);
		savePathTextField.setEditable(false);
		savePathButton = new JButton("浏览");
		savePathButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jChooser = new JFileChooser();
				jChooser.setCurrentDirectory(new File("D:/")); //$NON-NLS-1$
				jChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);// 只能打开文件夹
				int index = jChooser.showDialog(null,
						"打开");
				if (index == JFileChooser.APPROVE_OPTION) {
					savePathTextField.setText(jChooser.getSelectedFile()
							.getAbsolutePath());
				}

			}
		});
		
		inputPanel.add("1.1.right.top.preferred.preferred", projectLabel); //$NON-NLS-1$
		inputPanel.add("1.2.center.center.preferred.preferred", projectComboBox); //$NON-NLS-1$
		
		inputPanel.add("2.1.right.top.preferred.preferred", savePathLabel);  //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel.add("2.3.right.top.preferred.preferred", savePathButton);  //$NON-NLS-1$
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
	}
	
	public boolean doValidate() {
		if (this.projectComboBox.getSelectedItem() == null) {
			MessageBox.post(
					"请选择项目", 
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		this.path = getSavePathTextField().getText().trim();
		if ("".equals(this.path) || this.path == null) {  //$NON-NLS-1$
			MessageBox.post(
					"请选择保存路径",
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		return true;
	}
	
	public void generateExcel() throws Exception {
		
		System.out.println("重点件验证问题报表");
		
		String tempPath = System.getProperty("java.io.tmpdir"); //$NON-NLS-1$
		
		String file = this.path
					+"\\" + command.getSession().getUserName() +  //$NON-NLS-1$
					"_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls";  //$NON-NLS-1$ //$NON-NLS-2$
		
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("file", file); //$NON-NLS-1$
		parameters.put("project_id",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id")); //$NON-NLS-1$
		parameters.put("project_name",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_name")); //$NON-NLS-1$
		
		try {
			
			if (CreateImPartIssuesExcel.createExcel(command.getSession(), parameters)){
				file = "\"" + file + "\""; //$NON-NLS-1$ //$NON-NLS-2$
				Runtime.getRuntime().exec("cmd  /c  start excel " + file); //$NON-NLS-1$
			} else {
				MessageBox.post(
						"不存在符合条件的数据", 
						getTitle(), 
						MessageBox.INFORMATION);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException("程序执行失败，请参考日志");
		} 
	}
	
	public String getTitle() {
		return "重点件验证问题报表"; //$NON-NLS-1$
	}
	
	public JTextField getSavePathTextField() {
		
		return savePathTextField;
	}
}
