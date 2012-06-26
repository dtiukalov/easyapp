package com.customer.fawvw.issues.commands.forpre;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.swing.AbstractButton;
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
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;

/*
 * 预批量车问题报表Dialog 
 * 
 *  @author emily
 */
public class IssueForPreReportDialog extends AbstractFawvwPepDialog {

	private static final long serialVersionUID = 1L;

	private JPanel inputPanel;
	private JLabel carNumberLabel;
	private JTextField carNumberTextField;
	private String carNumber;
	private String path;
	private JLabel projectLabel;
	private JComboBox projectComboBox;
	private JLabel savePathLabel;
	private JTextField savePathTextField;

	private AbstractButton savePathButton;

	public IssueForPreReportDialog(AbstractFawvwPepCommand command) {
		super(command);
	}

	/*
	 * 初始化 预批量车问题报表 对话框
	 */
	@Override
	public void doInitUI() {
		this.inputPanel = new JPanel(new PropertyLayout());
		this.carNumberLabel = new JLabel("预批量车编号"); //$NON-NLS-1$
		this.carNumberTextField = super.createTextField("", 20, TCConstants  //$NON-NLS-1$
				.getDefaultMaxNameSize(super.getSession()), true);
		
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
		inputPanel.add("1.1.right.top.preferred.preferred", projectLabel);  //$NON-NLS-1$
		inputPanel.add("1.2.center.center.preferred.preferred", projectComboBox); //$NON-NLS-1$
		
		inputPanel.add("2.1.right.top.preferred.preferred", carNumberLabel);  //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", carNumberTextField); //$NON-NLS-1$
		
		inputPanel.add("3.1.right.top.preferred.preferred", savePathLabel);  //$NON-NLS-1$
		inputPanel.add("3.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel.add("3.3.right.top.preferred.preferred", savePathButton);  //$NON-NLS-1$

		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
	}
	/*
	 * 验证预批量车编号不能为空 、保存路径不能为空
	 */
	@Override
	public boolean doValidate() {
		this.carNumber = carNumberTextField.getText().trim();
		this.path = getSavePathTextField().getText().trim();
		
		if (this.projectComboBox.getSelectedItem() == null) {
			MessageBox.post(
					"请选择项目",  //$NON-NLS-1$
					getTitle(), 
					MessageBox.INFORMATION);
			return false;
		}
		
		if ("".equals(this.carNumber) || this.carNumber == null) { //$NON-NLS-1$
			MessageBox.post(
					"请输入预批车辆编号", //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		if ("".equals(this.path) || this.path == null) {  //$NON-NLS-1$
			MessageBox.post("请选择保存位置", //$NON-NLS-1$
					getTitle(),
					MessageBox.INFORMATION);
			return false;
		}
		
		return true;
	}
	/*
	 * 生成预批量车报表
	 */
	@Override
	public void generateExcel() throws Exception {
		System.out.println("预批量车问题报表"); //$NON-NLS-1$
		
		HashMap<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("carNumber", this.carNumber); //$NON-NLS-1$
		parameters.put("path", this.path);  //$NON-NLS-1$
		parameters.put("session", super.getSession());  //$NON-NLS-1$
		parameters.put("project_id",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id")); //$NON-NLS-1$
		parameters.put("project_name",  //$NON-NLS-1$
				((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_name")); //$NON-NLS-1$
		
		this.path = this.path + "\\" + super.getSession().getUserName() + "_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls";  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$

		//创建报表
		Boolean flag = CreateIssueForPreExcel.createExcel(parameters, this.path);
		if (flag == true) {
			this.path = "\"" + this.path + "\""; //$NON-NLS-1$ //$NON-NLS-2$
			//打开报表
			Runtime.getRuntime().exec("cmd  /c" + this.path);  //$NON-NLS-1$
		} 
		
	}

	public String getTitle() {
		return "预批量车报表"; //$NON-NLS-1$
	}
	
	public JTextField getSavePathTextField() {
		return savePathTextField;
	}
}
