package com.fawvw.ph.newreport;

import java.awt.Color;
import java.awt.Component;
import java.util.List;

import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.SwingUtilities;
import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

import com.fawvw.ph.policy.PHFragmentPolicy;
import com.teamcenter.rac.common.TCTypeRenderer;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCException;

public class FragsTableModel extends AbstractTableModel {

	private static final long serialVersionUID = 1L;

	protected final List<PHFragmentCreInfo> frags;

	public FragsTableModel(List<PHFragmentCreInfo> fragments) {
		this.frags = fragments;
	}

	@Override
	public int getRowCount() {
		return frags.size();
	}

	@Override
	public Object getValueAt(int row, int col) {
		if (row >= frags.size())
			return null;
		PHFragmentCreInfo frag = frags.get(row);
		PHFragmentPolicy policy = frag.policy;
		switch (col) {
		case 0:
			return policy.section;
		case 1:
			return policy.relation;
		case 2:
		case 3:
			return frag;
		}
		return "";
	}

	@Override
	public boolean isCellEditable(int row, int col) {
		if (col != 3)
			return false;
		PHFragmentCreInfo frag = frags.get(row);
		return frag.owners.size() > 1;
	}

	@Override
	public void setValueAt(Object v, int row, int col) {
		if (col != 3)
			return;
		TCComponentGroupMember gm = v instanceof TCComponentGroupMember ? (TCComponentGroupMember) v
				: null;
		PHFragmentCreInfo frag = frags.get(row);
		frag.setSelectedOwner(gm);
	}

	@Override
	public int getColumnCount() {
		return 4;
	}

	@Override
	public String getColumnName(int col) {
		switch (col) {
		case 0:
			return "序号";
		case 1:
			return "关系";
		case 2:
			return "对象";
		case 3:
			return "转移所有权给";
		}
		return "";
	}

	@Override
	public void addTableModelListener(TableModelListener l) {
		super.addTableModelListener(l);
		if (!(l instanceof JTable))
			return;
		final JTable t = (JTable) l;
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				TableColumnModel cm = t.getColumnModel();
				if (cm.getColumnCount() < 4) {
					SwingUtilities.invokeLater(this);
					return;
				}
				t.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
				cm.getColumn(0).setPreferredWidth(45);
				cm.getColumn(1).setPreferredWidth(90);
				cm.getColumn(2).setPreferredWidth(260);
				cm.getColumn(3).setPreferredWidth(190);
				cm.getColumn(2).setCellRenderer(new SrcCmpRenderer());
				cm.getColumn(3).setCellRenderer(new OwnerRenderer());
				cm.getColumn(3).setCellEditor(new NewOwnerChooser());
			}
		});
	}

	protected class SrcCmpRenderer extends JLabel implements TableCellRenderer {
		private static final long serialVersionUID = 1L;

		private Color defaultForeground;
		private Color defaultBackground;

		public SrcCmpRenderer() {
			defaultForeground = getForeground();
			defaultBackground = getBackground();
			setOpaque(true);
		}

		@Override
		public Component getTableCellRendererComponent(JTable table,
				Object value, boolean selected, boolean focus, int row, int col) {
			PHFragmentCreInfo frag = (PHFragmentCreInfo) value;
			if (frag.srcCmp != null) {
				setText(frag.srcCmp.toDisplayString());
				setIcon(TCTypeRenderer.getIconForComponent(frag.srcCmp, false));
				boolean released = false;
				try {
					released = null != frag.srcCmp
							.getDateProperty("date_released");
				} catch (TCException e) {
					e.printStackTrace();
				}
				if (released) {
					setForeground(selected ? table.getSelectionForeground()
							: defaultForeground);
					setBackground(selected ? table.getSelectionBackground()
							: defaultBackground);
				} else {
					setForeground(Color.BLACK);
					setBackground(Color.YELLOW);
				}
			} else {
				PHFragmentPolicy policy = frag.policy;
				String name = policy.objName;
				if (name == null)
					name = "";
				String type = policy.objType;
				if (type == null)
					type = "";
				setText(name + "(" + type + ")");
				setIcon(TCTypeRenderer.defaultIcon);
				setForeground(Color.DARK_GRAY);
				setBackground(Color.RED);
			}
			return this;
		}
	}

	protected class OwnerRenderer extends JLabel implements TableCellRenderer {
		private static final long serialVersionUID = 1L;

		private Color defaultForeground;
		private Color defaultBackground;

		public OwnerRenderer() {
			defaultForeground = getForeground();
			defaultBackground = getBackground();
			setOpaque(true);
			setIcon(TCTypeRenderer.getTypeIcon("GroupMember", "User"));
		}

		@Override
		public Component getTableCellRendererComponent(JTable table,
				Object value, boolean selected, boolean focus, int row, int col) {
			PHFragmentCreInfo frag = (PHFragmentCreInfo) value;
			TCComponentGroupMember gm = frag.getSelectedOwner();
			if (gm == null) {
				if (frag.owners.isEmpty()) {
					setText("???");
					setForeground(Color.DARK_GRAY);
					setBackground(Color.RED);
				} else {
					setText("???");
					setForeground(Color.BLACK);
					setBackground(Color.YELLOW);
				}
			} else {
				setText(gm.toDisplayString());
				setForeground(selected ? table.getSelectionForeground()
						: defaultForeground);
				setBackground(selected ? table.getSelectionBackground()
						: defaultBackground);
			}
			return this;
		}
	}

	protected class NewOwnerChooser extends DefaultCellEditor {
		private static final long serialVersionUID = 1L;

		public NewOwnerChooser() {
			super(new JComboBox());
		}

		@Override
		public Component getTableCellEditorComponent(JTable table,
				Object value, boolean isSelected, int row, int column) {
			PHFragmentCreInfo frag = (PHFragmentCreInfo) value;
			frag.report.config.loadGroupMember(
					(JComboBox) super.editorComponent, frag.policy.group,
					frag.policy.role, frag.getSelectedOwner());
			return super.getTableCellEditorComponent(table, value, isSelected,
					row, column);
		}
	}

}
