package com.saturn.ph.views.table.ui;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.table.TableModel;

import com.saturn.ph.views.table.ArrayPropertyTableModel;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.FilterDocument;
import com.teamcenter.rac.util.iTextArea;

public class PopupCell extends AbstractAIFDialog {
	TCSession session;
	JLabel label;
	iTextArea textArea;
	TableModel model;
	FilterDocument document;
	int row;
	int column;

	public PopupCell(TCSession session, String title) {
		super(true);
		this.session = session;
		setTitle(title);

		String encoding = TCSession.getServerEncodingName(session);
		this.document = new FilterDocument(512, encoding);

		initialize();
	}

	public void setTableModal(TableModel model) {
		this.model = model;
	}

	private void initialize() {
		this.label = new JLabel("");
		JPanel labelPanel = new JPanel(new FlowLayout(0));
		labelPanel.add(this.label);

		this.textArea = new iTextArea(6, 45);
		this.textArea.setAutoscrolls(true);
		this.textArea.setLineWrap(true);
		this.textArea.setDocument(this.document);

		JPanel btnPanel = new JPanel(new FlowLayout());
		JButton okBtn = new JButton("确定");
		okBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				PopupCell.this.setValue();
				PopupCell.this.close();
			}
		});
		JButton cancelBtn = new JButton("取消");
		cancelBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				PopupCell.this.close();
			}
		});
		btnPanel.add(okBtn);
		btnPanel.add(cancelBtn);

		Container c = getContentPane();
		c.setLayout(new BorderLayout());

		c.add("North", labelPanel);
		c.add("Center", new JScrollPane(this.textArea));
		c.add("South", btnPanel);

		pack();
		centerToScreen();
	}

	public void display(int row, int column) {
		Object value = this.model.getValueAt(row, column);

		this.row = row;
		this.column = column;
		setDocument();
		String s = (value == null) ? "" : value.toString();
		this.textArea.setText(s);

		this.label.setText(this.model.getColumnName(column));
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

	public void setValue() {
		String value = this.textArea.getText().trim();
		if (!(this.model instanceof ArrayPropertyTableModel))
			return;
		ArrayPropertyTableModel arrayModel = (ArrayPropertyTableModel) this.model;
		TCProperty property = null;

		Object obj = value;
		property = arrayModel.getColumn(this.column).getProperty();
		switch (property.getPropertyType()) {
		case 1:
			if ((value != null) && (value.length() > 0))
				obj = new Character(value.charAt(0));
			else
				obj = new Character('?');
			break;
		case 3:
			if ((value != null) && (value.length() > 0))
				obj = new Double(Double.parseDouble(value));
			else
				obj = new Double(0.0D);
			break;
		case 4:
			if ((value != null) && (value.length() > 0))
				obj = new Float(Float.parseFloat(value));
			else
				obj = new Float(0.0D);
			break;
		case 5:
			if ((value != null) && (value.length() > 0))
				obj = new Integer(Integer.parseInt(value));
			else
				obj = new Integer(0);
			break;
		case 12:
			obj = value;
			break;
		case 7:
			if ((value != null) && (value.length() > 0))
				obj = new Short(Short.parseShort(value));
			else
				obj = new Short((short) 0);
			break;
		case 8:
			obj = value;
		case 2:
		case 6:
		case 9:
		case 10:
		case 11:
		}
		this.model.setValueAt(obj, this.row, this.column);
	}

	public void setDocument() {
		if (!(this.model instanceof ArrayPropertyTableModel))
			return;
		ArrayPropertyTableModel arrayModel = (ArrayPropertyTableModel) this.model;
		TCProperty property = null;

		property = arrayModel.getColumn(this.column).getProperty();

		int propertyType = property.getPropertyType();
		switch (propertyType) {
		case 1:
			this.document.setAcceptedChars(null);
			this.document.setLength(1);
			return;
		case 2:
		case 3:
		case 4:
			this.document.setAcceptedChars("0123456789.eE");
			return;
		case 5:
			this.document.setAcceptedChars("9876543210");
			return;
		case 6:
		case 12:
			this.document.setAcceptedChars(null);
			this.document.setLength(property.getPropertyDescriptor()
					.getMaxStringLength());
			return;
		case 7:
			this.document.setAcceptedChars("1023456789");
			return;
		case 8:
			this.document.setAcceptedChars(null);
			this.document.setLength(property.getPropertyDescriptor()
					.getMaxStringLength());
			return;
		case 9:
		case 10:
		case 11:
		case 13:
		case 14:
		}
	}

	public void close() {
		setVisible(false);
	}
}
