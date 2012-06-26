package com.customer.fawvw.issues.commands.shift;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.swing.AbstractButton;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.text.JTextComponent;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.customer.fawvw.issues.AbstractFawvwPepDialog;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;

public class IssueShiftReportDialog extends AbstractFawvwPepDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private JPanel inputPanel;
	private JLabel partNumberLabel;
	private JTextField partNumberTextField;
	private AbstractFawvwPepCommand command;
	
	private String partNumber;
	private String path;
	
	private JLabel projectLabel;
	private JComboBox projectComboBox;

	private JLabel savePathLabel;
	private JTextField savePathTextField;
	private AbstractButton savePathButton;

	public IssueShiftReportDialog(AbstractFawvwPepCommand command) {
		super(command);
		this.command = command;
	}

	@Override
	public void doInitUI() {	
		inputPanel = new JPanel(new PropertyLayout());
		partNumberLabel = new JLabel("输入零件号");  //$NON-NLS-1$
		partNumberTextField = super.createTextField("", 20, TCConstants //$NON-NLS-1$
				.getDefaultMaxNameSize(super.getSession()), true);
		
		//项目
		projectLabel = new JLabel("选择项目"); //$NON-NLS-1$
		projectComboBox = new JComboBox();
		ComponentUtils.initializeProject(super.getSession(), projectComboBox);
		
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
		
		inputPanel.add("2.1.right.top.preferred.preferred", partNumberLabel); //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", partNumberTextField); //$NON-NLS-1$
		
		inputPanel.add("3.1.right.top.preferred.preferred", savePathLabel);  //$NON-NLS-1$
		inputPanel.add("3.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel.add("3.3.right.top.preferred.preferred", savePathButton);  //$NON-NLS-1$
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
	}

	@Override
	public boolean doValidate() {
		// TODO Auto-generated method stub
		if (this.projectComboBox.getSelectedItem() == null) {
			MessageBox.post(
					"请选择项目",  //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		this.partNumber = partNumberTextField.getText().trim();
		this.path = getSavePathTextField().getText().trim();
		
		if ("".equals(this.partNumber) || this.partNumber == null) { //$NON-NLS-1$
			MessageBox.post(
					"请输入零件号",  //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		if ("".equals(this.path) || this.path == null) {  //$NON-NLS-1$
			MessageBox.post(
					"请选择保存路径", //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		this.path = this.path + "\\" + super.getSession().getUserName() + "_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls";  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		
		return true;
	}

	@Override
	public void generateExcel() throws Exception {
		System.out.println("开始生成报表"); //$NON-NLS-1$
		
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		String path = getSavePathTextField().getText().trim()
		+"\\" + super.getSession().getUserName() + "_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls"; //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		
		parameters.put("carNumber", partNumberTextField.getText().trim()); //$NON-NLS-1$
		parameters.put("path", path); //$NON-NLS-1$
		parameters.put("session",command.getSession()); //$NON-NLS-1$
		parameters.put("project_id",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id")); //$NON-NLS-1$
		parameters.put("project_name",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_name")); //$NON-NLS-1$
		
		
		Boolean flag = CreateIssueShiftExcel.createExcel(parameters, path);//生成报表后自动打开
		if (flag == true) {
			path = "\"" + path + "\""; //$NON-NLS-1$ //$NON-NLS-2$
			Runtime.getRuntime().exec("cmd  /c " + path);  	 //$NON-NLS-1$
		}
		
	}

	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return "零件批次问题报表";  //$NON-NLS-1$
	}
	
	public JTextField getSavePathTextField() {
		return savePathTextField;
	}
}
