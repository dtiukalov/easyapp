package com.saturn.ph.views.table.ui;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.text.JTextComponent;

import com.saturn.ph.views.table.ArrayPropertyTableCellEditor;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.util.iTextArea;

public class CellPopupEditor extends AbstractAIFDialog {
	JLabel label;
	iTextArea textArea;
	JComponent component;
	JLabel displayText;
	ArrayPropertyTableCellEditor cellEditor;
	String origialText;

	public CellPopupEditor(String title) {
		super(true);
		setTitle(title);
		this.origialText = "";

		initialize();
	}

	private void initialize() {
		this.component = null;
		this.label = new JLabel("");
		JPanel labelPanel = new JPanel(new FlowLayout(0));
		labelPanel.add(this.label);

		this.textArea = new iTextArea(6, 45);
		this.textArea.setAutoscrolls(true);
		this.textArea.setLineWrap(true);

		JPanel btnPanel = new JPanel(new FlowLayout());
		JButton okBtn = new JButton("确定");
		okBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				CellPopupEditor.this.setValue();
				CellPopupEditor.this.close();
			}
		});
		JButton cancelBtn = new JButton("取消");
		cancelBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				CellPopupEditor.this.cancelValue();
				CellPopupEditor.this.close();
			}
		});
		btnPanel.add(okBtn);
		btnPanel.add(cancelBtn);

		Container c = getContentPane();
		c.setLayout(new BorderLayout());

		c.add("North", labelPanel);
		c.add("Center", new JScrollPane(this.textArea));
		c.add("South", btnPanel);

		addWindowListener(new WindowAdapter() {
			public void windowClosed(WindowEvent windowevent) {
				CellPopupEditor.this.cancelValue();
				CellPopupEditor.this.cellEditor.stopCellEditing();
			}
		});
		pack();
		centerToScreen();
	}

	public void cancelValue() {
		if (!(this.component instanceof JTextComponent))
			return;
		JTextComponent textComp = (JTextComponent) this.component;
		textComp.setText(this.origialText);
	}

	public void display() {
		if (this.component instanceof JTextComponent) {
			JTextComponent textComp = (JTextComponent) this.component;
			this.textArea.setText(textComp.getText());
			this.origialText = textComp.getText();
		}

		this.label.setText(this.displayText.getText());
		setVisible(true);
	}

	public iTextArea getTextComponent() {
		return this.textArea;
	}

	public void setRequired(boolean flag) {
		this.textArea.setRequired(flag);
	}

	public void setText(String text) {
		this.label.setText(text);
	}

	public void setRelatedComponent(JComponent component) {
		this.component = component;
	}

	public void setDisplay(JLabel label) {
		this.displayText = label;
	}

	public void setValue() {
		String value = this.textArea.getText().trim();
		if (this.component == null)
			return;
		if (!(this.component instanceof JTextComponent))
			return;
		JTextComponent textComp = (JTextComponent) this.component;
		textComp.setText(value);
	}

	public void setCellEditor(ArrayPropertyTableCellEditor cellEditor) {
		this.cellEditor = cellEditor;
	}

	public void close() {
		this.cellEditor.stopCellEditing();
		setVisible(false);
	}
}
