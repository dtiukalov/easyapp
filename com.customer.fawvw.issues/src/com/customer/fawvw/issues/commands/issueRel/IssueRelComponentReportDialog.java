package com.customer.fawvw.issues.commands.issueRel;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

import com.customer.fawvw.issues.AbstractFawvwPepCommand;
import com.customer.fawvw.issues.AbstractFawvwPepDialog;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;

public class IssueRelComponentReportDialog  extends AbstractFawvwPepDialog{

	private AbstractFawvwPepCommand command;
	
	private static final long serialVersionUID = 1L;

	private JPanel inputPanel;
	private JLabel projectLabel;
	private JLabel structNoLabel;
	private JComboBox projectComboBox;
//	private JTextField structNo;
//	private JButton selectStructNo;
	private JList infoList;
	private JLabel savePathLabel;
	private JTextField savePathTextField;
	private JButton savePathButton;
	
	private String path = ""; //$NON-NLS-1$
	
	private TCSession session = null;
	private InterfaceAIFComponent[] targets;
	
	ArrayList<String> structNoList = new ArrayList<String>();

	
	
	public IssueRelComponentReportDialog(AbstractFawvwPepCommand command) {
		super(command);
		this.command = command;
		this.session = command.getSession();
		this.targets = command.getTargetArray();
		
	}
	
	public void doInitUI() {	
		
		inputPanel = new JPanel(new PropertyLayout());
		inputPanel.setPreferredSize(new Dimension(380, 380));
		
		/*选择项目 */
		projectLabel = new JLabel("选择项目"); //$NON-NLS-1$
		projectComboBox = new JComboBox();
		ComponentUtils.initializeProject(super.getSession(), projectComboBox);
		
		/*专业编码 */
		structNoLabel = new JLabel("专业编码"); //$NON-NLS-1$
		structNoList = IssueRelComponentReportQueryStructNo.queryStructNo(super.targets);
		infoList = new JList(structNoList.toArray());
		infoList.setEnabled(true);
		JScrollPane competeListScroller = new JScrollPane(infoList);
		competeListScroller.setPreferredSize(new Dimension(200, 300));
		competeListScroller.setEnabled(true);

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
		inputPanel.add("2.1.right.top.preferred.preferred", structNoLabel); //$NON-NLS-1$
		inputPanel.add("2.2.center.center.preferred.preferred", competeListScroller); //$NON-NLS-1$
		inputPanel.add("3.1.right.top.preferred.preferred", savePathLabel); //$NON-NLS-1$
		inputPanel.add("3.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel.add("3.3.right.top.preferred.preferred", savePathButton); //$NON-NLS-1$
		super.getLeftPanel().add("unbound.bind.center.top", inputPanel); //$NON-NLS-1$
	}
	
	public boolean doValidate() {
		System.out.println("IssueRelComponentReport doValidate"); //$NON-NLS-1$

		try {
			
			if (this.projectComboBox.getSelectedItem() == null) { //$NON-NLS-1$
				MessageBox.post(
						"请选择项目",  //$NON-NLS-1$
						getTitle(), 
						MessageBox.INFORMATION);
				return false;
			}
			
			if (infoList.getSelectedValues().length <= 0) {
				MessageBox.post(
						"请选择专业编码",  //$NON-NLS-1$
						getTitle(), 
						MessageBox.INFORMATION);
				return false;
			}

			this.path = getSavePathTextField().getText().trim();
			if ("".equals(this.path) || this.path == null) { //$NON-NLS-1$
				MessageBox.post(
						"请选择保存位置",  //$NON-NLS-1$
						getTitle(), 
						MessageBox.INFORMATION);
				return false;
			}
			
			
			
			String projectID = ((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id"); //$NON-NLS-1$
			
			for (InterfaceAIFComponent target : super.targets) {
				try {
					//选中的对象为Item
					if (target instanceof TCComponentItem){
						TCComponentItemRevision itemRevision = ((TCComponentItem)target).getLatestItemRevision();
						String projectIds = (String)itemRevision.getProperty("project_ids"); //$NON-NLS-1$
						if (!projectIds.contains(projectID)) {
							MessageBox.post(
									"选中的子系统或总成不属于选中项目",  //$NON-NLS-1$
									getTitle(), 
									MessageBox.INFORMATION);
							return false;
						}
					}
					//选中的对象为ItemRevision
					if (target instanceof TCComponentItemRevision){
						String projectIds = (String)target.getProperty("project_ids"); //$NON-NLS-1$
						if (!projectIds.contains(projectID)) {
							MessageBox.post(
									"选中的子系统或总成不属于选中项目",  //$NON-NLS-1$
									getTitle(), 
									MessageBox.INFORMATION);
							return false;
						}
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		} catch (TCException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	public void generateExcel() throws Exception {
		System.out.println("IssueRelComponentReport generateExcel"); //$NON-NLS-1$
		
		String file = path + "\\" + super.getSession().getUser().getUserId() + "_ProblemReport" + Math.abs(new Random().nextInt()) + ".xls"; //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		String structNo = ""; //$NON-NLS-1$
		Object[] objs = this.infoList.getSelectedValues();
		for (int i = 0; i < objs.length; i++) {
			System.out.println("obj = " + objs[i].toString()); //$NON-NLS-1$
			structNo += objs[i].toString().split(" ")[0] + ";"; //$NON-NLS-1$ //$NON-NLS-2$
			
		}
		
		System.out.println("structNo = " + structNo);	 //$NON-NLS-1$

		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("file", file); //$NON-NLS-1$
		parameters.put("session", session); //$NON-NLS-1$
		parameters.put("structNo", structNo); //$NON-NLS-1$
		parameters.put("project_name", ((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_name")); //$NON-NLS-1$ //$NON-NLS-2$
		parameters.put("project_id", ((TCComponentProject)this.projectComboBox.getSelectedItem()).getProperty("project_id")); //$NON-NLS-1$ //$NON-NLS-2$
		
		IssueRelComponentReportLoader loader = new IssueRelComponentReportLoader();
		ArrayList<HashMap<String, Object>> excelList = loader.getDataByCondition(parameters);
		
		if (excelList.size() == 0 || excelList == null) {
			MessageBox.post("不存在符合条件的问题", getTitle(), MessageBox.INFORMATION); //$NON-NLS-1$
		} else {
			IssueRelComponentReportExcel.createExcel(excelList, parameters);
			file = "\"" + file + "\""; //$NON-NLS-1$ //$NON-NLS-2$
			Runtime.getRuntime().exec("cmd  /c  start excel " + file);  //$NON-NLS-1$
		}
	}
	
	public String getTitle() {
		return "与专业编码相关的问题报表"; //$NON-NLS-1$
	}
		
	public JTextField getSavePathTextField() {
		return savePathTextField;
	}
}
