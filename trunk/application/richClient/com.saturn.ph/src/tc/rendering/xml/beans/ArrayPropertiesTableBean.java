package tc.rendering.xml.beans;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableCellEditor;

import com.saturn.ph.views.table.ArrayPropertyTable;
import com.saturn.ph.views.table.ArrayPropertyTableCellEditor;
import com.saturn.ph.views.table.ArrayPropertyTableModel;
import com.saturn.ph.views.table.MultiLineTableCellRenderer;
import com.saturn.ph.views.table.ui.PopupCell;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCPreferenceService;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCPropertyDescriptor;
import com.teamcenter.rac.stylesheet.InterfacePropertyComponent;

public class ArrayPropertiesTableBean extends JPanel implements
		InterfacePropertyComponent {

	private static final long serialVersionUID = 1L;
	private String property = null;
	
	TCComponent form;

	PopupCell editor;

	private ArrayPropertyTable table;

	JButton appendButton;
	JCheckBox selectAll;

	protected JButton addButton;
	protected JButton removeButton;
	protected JButton copyButton;
	protected JButton insertButton;
	protected JButton upButton;
	protected JButton downButton;

	@Override
	public void setProperty(String property) {
		this.property = property;
	}

	@Override
	public String getProperty() {
		return this.property;
	}

	private boolean mandatory = false;

	@Override
	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}

	@Override
	public boolean isMandatory() {
		return this.mandatory;
	}

	@Override
	public Object getEditableValue() {
		// take the chance to stop editing
		table.stopEdit();
		return null;
	}

	@Override
	public void load(TCPropertyDescriptor propd) throws Exception {
	}

	@Override
	public void load(TCComponentType cmpType) throws Exception {
	}

	@Override
	public void setUIFValue(Object uifValue) {
	}

	@Override
	public void load(TCComponent cmp) throws Exception {
		if (this.property == null) {
			new Throwable("No property has been set yet!!!").printStackTrace();
			return;
		}
		TCProperty prop = cmp.getTCProperty(this.property);
		if (prop == null) {
			new Throwable("TCComponent " + cmp + " of type " + cmp.getType()
					+ " has no property named " + this.property)
					.printStackTrace();
			return;
		}
		this.load(prop);
	}

	@Override
	public boolean isPropertyModified(TCComponent cmp) throws Exception {
		if (this.property == null) {
			new Throwable("No property has been set yet!!!").printStackTrace();
			return false;
		}
		TCProperty prop = cmp.getTCProperty(this.property);
		if (prop == null) {
			new Throwable("TCComponent " + cmp + " of type " + cmp.getType()
					+ " has no property named " + this.property)
					.printStackTrace();
			return false;
		}
		return this.isPropertyModified(prop);
	}

	@Override
	public void save(TCComponent cmp) throws Exception {
		if (this.property == null) {
			new Throwable("No property has been set yet!!!").printStackTrace();
			return;
		}
		TCProperty prop = cmp.getTCProperty(this.property);
		if (prop == null) {
			new Throwable("TCComponent " + cmp + " of type " + cmp.getType()
					+ " has no property named " + this.property)
					.printStackTrace();
			return;
		}
		this.save(prop);
	}

	public ArrayPropertiesTableBean() {
		super(new BorderLayout());
		UIUtil.setNonOpaque(this);

		this.table = new ArrayPropertyTable();
		super.add(BorderLayout.CENTER, new JLabel("..."));
	}

	@Override
	public void setModifiable(boolean modifiable) {
		this.table.setTableEnabled(modifiable);
	}

	@Override
	public void load(TCProperty prop) throws Exception {
		super.removeAll();
		try {			
				form = prop.getTCComponent();
			
			selectAll = new JCheckBox("全选");
			selectAll.addItemListener(new ItemListener() {
				public void itemStateChanged(ItemEvent arg0) {
					if (selectAll.isSelected())
						selectAll();
					else
						unSelectAll();
				}
			});
			JLabel label = new JLabel("工序类型");
			// opTypeCom = new LOVUIComponent(session, "Z4_冲压工序类型");
			// opTypeCom.setEnabled(false);

			appendButton = new JButton("append");
			appendButton.setMargin(new Insets(0, 0, 0, 0));
			appendButton.setEnabled(false);
			appendButton.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent arg0) {
					appendOPPFMEA();
				}
			});
			JPanel middlePanel = new JPanel(new FlowLayout());
			middlePanel.setOpaque(false);
			middlePanel.add(label);
			// middlePanel.add(opTypeCom);
			middlePanel.add(appendButton);

			JPanel btnPanel = buildButtonPane();

			JPanel topPanel = new JPanel(new BorderLayout());
			topPanel.setOpaque(false);
			topPanel.add(BorderLayout.WEST, btnPanel);

			JPanel tablePanel = buildTable(prop);

			setLayout(new BorderLayout());
			add(BorderLayout.NORTH, topPanel);
			add(BorderLayout.CENTER, tablePanel);

			setBackground(Color.white);
		} catch (Exception e) {
			e.printStackTrace();
			super.add(BorderLayout.CENTER, new JLabel(e.toString()));
		}
	}

	@Override
	public boolean isPropertyModified(TCProperty prop) throws Exception {
		//return this.table.getModel().isModified();
		return true;
	}

	@Override
	public void save(TCProperty prop) throws Exception {
		this.table.stopEdit();
		TCProperty[] properties = table.saveTCProperties();
		form.setTCProperties(properties);
	}

	public JPanel buildButtonPane() {
		JPanel panel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		panel.setOpaque(false);

		addButton = new JButton("add");
		addButton.setMargin(new Insets(0, 0, 0, 0));
		addButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).addRow();
			}
		});

		removeButton = new JButton("remove");
		removeButton.setMargin(new Insets(0, 0, 0, 0));
		removeButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).removeSelectedRows();
			}
		});

		copyButton = new JButton("copy");
		copyButton.setMargin(new Insets(0, 0, 0, 0));
		copyButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				copyRow();
			}
		});

		insertButton = new JButton("insert");
		insertButton.setMargin(new Insets(0, 0, 0, 0));
		insertButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				insertRow();
			}
		});

		upButton = new JButton("up");
		upButton.setMargin(new Insets(0, 0, 0, 0));
		upButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).moveSelectedRowsUp();
			}
		});

		downButton = new JButton("down");
		downButton.setMargin(new Insets(0, 0, 0, 0));
		downButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).moveSelectedRowsDown();
			}
		});

		addButton.setToolTipText("新增行");
		insertButton.setToolTipText("插入行");
		copyButton.setToolTipText("复制行");
		removeButton.setToolTipText("删除行");
		upButton.setToolTipText("上移");
		downButton.setToolTipText("下移");
		panel.add(addButton);
		panel.add(insertButton);
		panel.add(copyButton);
		panel.add(removeButton);
		panel.add(upButton);

		panel.add(downButton);

		return panel;
	}

	public JPanel buildTable(TCProperty prop) throws TCException {
		TCComponent cmp = prop.getTCComponent();
		TCPreferenceService prefs = cmp.getSession().getPreferenceService();
		String prefKey = cmp.getType() + "." + prop.getPropertyName()
				+ ":columns";
		String[] colSpecs = prefs.getStringArray(
				TCPreferenceService.TC_preference_site, prefKey, null);
		if (colSpecs == null) {
			new Throwable(" ** Missing site pref: " + prefKey)
					.printStackTrace();
			return null;
		}
		int minHeight = prefs
				.getInt(TCPreferenceService.TC_preference_all,
						cmp.getType() + "." + prop.getPropertyName()
								+ ":minHeight", 250);
		int maxHeight = prefs
				.getInt(TCPreferenceService.TC_preference_all,
						cmp.getType() + "." + prop.getPropertyName()
								+ ":maxHeight", 250);
		int seqColWidth = prefs.getInt(
				TCPreferenceService.TC_preference_all, cmp.getType() + "."
						+ prop.getPropertyName() + ":seqWidth", 26);
		int minWidth = prefs.getInt(TCPreferenceService.TC_preference_all,
				cmp.getType() + "." + prop.getPropertyName() + ":minWidth",
				seqColWidth  + 10);
		int maxWidth = prefs.getInt(TCPreferenceService.TC_preference_all,
				cmp.getType() + "." + prop.getPropertyName() + ":maxWidth",
				500);

		ArrayList<TCProperty> props = new ArrayList<TCProperty>(colSpecs.length);
		ArrayList<Boolean> enables = new ArrayList<Boolean>(colSpecs.length);
		ArrayList<Integer> widthes = new ArrayList<Integer>(colSpecs.length);
		for(String colSpec : colSpecs) {
			if(colSpec == null || colSpec.length() < 1) {
				// bad config
				continue;
			}
			boolean enabled = false;
			int width = 80;
			if(colSpec.charAt(0) == '!') {
				enabled = false;
				colSpec = colSpec.substring(1);
			} else {
				enabled = true;
			}
			int pos = colSpec.indexOf('#');
			if(pos > 0) {
				width = Integer.parseInt(colSpec.substring(pos+1));
				colSpec = colSpec.substring(0, pos);
			}
			TCProperty colProp = prop.getTCComponent().getTCProperty(colSpec);
			if(colProp == null) {
				new Throwable("TCComponent " + cmp + " of type " + cmp.getType()
						+ " has no property named " + colSpec)
						.printStackTrace();
				continue;
			}
			props.add(colProp);
			enables.add(enabled);
			widthes.add(width);
		}

		TCProperty[] propArray = new TCProperty[props.size()];
		boolean[] enableArray = new boolean[enables.size()];
		int[] widthArray = new int[widthes.size()];
		for(int i=0;i<propArray.length;i++) {
			propArray[i] = props.get(i);
			enableArray[i] = enables.get(i);
			widthArray[i] = widthes.get(i);
		}
		table.buildTableModel(propArray, enableArray, widthArray);

			table.setDefaultRenderer(Object.class,
					new MultiLineTableCellRenderer());
			// {//添加部分1
			// public boolean isCellEditable(int row, int column)
			// {
			// return false;
			// }
			// };

			// CellPopupEditor editor = new CellPopupEditor("编辑PFMEA");
			table.setDefaultEditor(Object.class,
					new ArrayPropertyTableCellEditor(form.getSession(), table));
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.getTableHeader().addMouseListener(new MouseAdapter() // 表头添加事件
				{
					public void mousePressed(MouseEvent e) {
						TableCellEditor editor = table.getCellEditor();
						if (editor != null)
							editor.stopCellEditing();
					}
				});

		editor = new PopupCell(form.getSession(), "编辑PFMEA");
		editor.setTableModal(table.getModel());

		JScrollPane sp = UIUtil.setNonOpaque(new JScrollPane(this.table));
		Dimension prefSize = this.table.getPreferredSize();
		if (prefSize.height < minHeight)
			prefSize.height = minHeight;
		else if (prefSize.height > maxHeight)
			prefSize.height = maxHeight;
		if (prefSize.width <= minWidth)
			prefSize.width = minWidth;
		else if (prefSize.width + 10 > maxWidth)
			prefSize.width = maxWidth;
		else
			prefSize.width += 10;
		sp.setPreferredSize(prefSize);
		super.add(BorderLayout.CENTER, sp);

		JPanel panel = new JPanel(new BorderLayout());
		panel.setOpaque(false);
		// scrollPane.get
		panel.add(BorderLayout.CENTER, sp);
		table.setOpaque(false);
		table.getTableHeader().setBackground(Color.white);

//		panel.setPreferredSize(new Dimension(860, 500));
//		panel.setMinimumSize(new Dimension(850, 500));
//		panel.setOpaque(false);
		// panel.setBorder(new javax.swing.border.TitledBorder(new
		// javax.swing.border.EtchedBorder(),
		// registry.getString("ChangeTraceTable")));
//		return panel;
		return UIUtil.setNonOpaque(panel);
	}

	public void appendOPPFMEA() {
	}

	public void copyRow() {
		int r = table.getSelectedRow();
		if (r >= 0 && r <= table.getRowCount()) {
			if (table instanceof ArrayPropertyTable)
				((ArrayPropertyTableModel) table.getModel()).copyRow(r);
		}
	}

	public void insertRow() {
		int r = table.getSelectedRow();
		if (r >= 0 && r <= table.getRowCount()) {
			if (table instanceof ArrayPropertyTable)
				((ArrayPropertyTableModel) table.getModel()).insertRow(r);
		}
	}

	public void openEditor(int row, int column) {
		editor.display(row, column);
	}

	public void selectAll() {
	}

	public void unSelectAll() {
	}
}
