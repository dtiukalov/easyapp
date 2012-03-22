package com.fawvw.ph.newreport;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import tc.util.ui.UIUtil;

import com.fawvw.ph.policy.PHReportConfig;
import com.teamcenter.rac.common.lov.LOVUIComponent;
import com.teamcenter.rac.util.ButtonLayout;
import com.teamcenter.rac.util.PropertyLayout;

public class NewPHReportDialog extends JFrame implements Runnable {

	private static final long serialVersionUID = 1L;

	public final PHReportConfig config;

	protected final JComboBox msCB;
	protected final JComboBox typeCB;
	protected final JComboBox kwCB;
	protected final LOVUIComponent pfType;

	public NewPHReportDialog(PHReportConfig config) {
		super("新建PH报告");

		this.config = config;
		this.msCB = new JComboBox(config.milestones.toArray());
		this.typeCB = new JComboBox(config.allTypes.toArray());
		String[] kws = new String[53];
		for (int i = 0; i < kws.length; i++)
			kws[i] = "KW" + (i + 1);
		this.kwCB = new JComboBox(kws);
		this.pfType = new LOVUIComponent(config.rootTemplate.getSession(),
				"FV9PlatformType1");

		JPanel fieldsPanel = new JPanel(
				new PropertyLayout(5, 5, 20, 20, 10, 20));
		fieldsPanel.add("1.1.right.top", new JLabel("里程碑"));
		fieldsPanel.add("1.2.left.top", msCB);
		fieldsPanel.add("2.1.right.top", new JLabel("会议类型"));
		fieldsPanel.add("2.2.left.top", typeCB);
		fieldsPanel.add("3.1.right.top", new JLabel("周数"));
		fieldsPanel.add("3.2.left.top", kwCB);
		fieldsPanel.add("4.1.right.top", new JLabel("产品平台"));
		fieldsPanel.add("4.2.left.top", pfType);

		JPanel btnsPanel = new JPanel(new ButtonLayout());
		btnsPanel.add(UIUtil.createTextButton("确定", "显示创建信息",
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent arg0) {
						promptNextStep();
					}
				}));
		btnsPanel.add(UIUtil.createTextButton("取消", "关闭对话框",
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent arg0) {
						dispose();
					}
				}));
		btnsPanel.setBorder(new EmptyBorder(5, 5, 5, 5));

		Container cp = super.getContentPane();
		cp.add(BorderLayout.CENTER, fieldsPanel);
		cp.add(BorderLayout.SOUTH, btnsPanel);

		super.setBackground(Color.WHITE);
		UIUtil.setNonOpaque(cp);
	}

	protected void promptNextStep() {
		Object pfType = this.pfType.getSelectedObject();
		if (pfType == null) {
			System.err.println("尚未选择产品平台!");
			return;
		}
		NewPhReportOp op = new NewPhReportOp(config,
				(String) msCB.getSelectedItem(),
				(String) typeCB.getSelectedItem(),
				(String) kwCB.getSelectedItem(), "", pfType.toString());
		config.rootTemplate.getSession().queueOperation(op);
		dispose();
	}

	@Override
	public void run() {
		pack();
		setLocationRelativeTo(null);
		setVisible(true);
	}

}
