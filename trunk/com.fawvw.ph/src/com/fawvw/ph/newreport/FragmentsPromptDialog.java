package com.fawvw.ph.newreport;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;

import tc.util.ui.UIUtil;

import com.teamcenter.rac.util.ButtonLayout;

public class FragmentsPromptDialog extends JFrame implements Runnable {

	private static final long serialVersionUID = 1L;

	public final NewPhReportOp op;

	protected final FragsTableModel fragsTable;

	public FragmentsPromptDialog(NewPhReportOp op) {
		super("新建PH报告");

		this.op = op;
		this.fragsTable = new FragsTableModel(op.reportCI.fragments);

		JTable t = new JTable(fragsTable);
		JScrollPane fragsTableSP = new JScrollPane(t);
		fragsTableSP.setPreferredSize(new Dimension(600, 450));

		JPanel mainPanel = new JPanel(new BorderLayout());
		mainPanel.setBorder(new EmptyBorder(10, 10, 10, 10));
		mainPanel.add(BorderLayout.CENTER, fragsTableSP);

		JPanel btnsPanel = new JPanel(new ButtonLayout());
		btnsPanel.add(UIUtil.createTextButton("确定", "创建PH报告",
				new ActionListener() {
					@Override
					public void actionPerformed(ActionEvent arg0) {
						startCreation();
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
		cp.add(BorderLayout.CENTER, fragsTableSP);
		cp.add(BorderLayout.SOUTH, btnsPanel);

		super.setBackground(Color.WHITE);
		UIUtil.setNonOpaque(cp);
	}

	protected void startCreation() {
		op.config.rootTemplate.getSession().queueOperation(op);
		dispose();
	}

	@Override
	public void run() {
		pack();
		setLocationRelativeTo(null);
		setVisible(true);
	}

}
