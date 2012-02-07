package com.saturn.ph.stylesheet;

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
import java.util.Hashtable;
import java.util.Map;

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
import com.saturn.ph.views.table.SelectPropertyTableCellEditor;
import com.saturn.ph.views.table.SelectTable;
import com.saturn.ph.views.table.SelectTableCellRenderer;
import com.saturn.ph.views.table.SelectTableModel;
import com.saturn.ph.views.table.ui.CellPopupEditor;
import com.saturn.ph.views.table.ui.PopupCell;
import com.teamcenter.rac.kernel.TCClassificationService;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentItemType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.kernel.ics.ICSSearchResult;
import com.teamcenter.rac.stylesheet.AbstractRendering;

public abstract class BaseRendering extends AbstractRendering {
	TCComponentForm form;
	TCSession session;

	public static final String PREFIX = "fv9";
	public static final String CY_OP = "Z4_StampOp";
	public static final String OP_TEMPLATE_LIST = "ICM010602";

	PopupCell editor;

	JTable table;

	JButton appendButton;
	JCheckBox selectAll;

	protected JButton addButton;
	protected JButton removeButton;
	protected JButton copyButton;
	protected JButton insertButton;
	protected JButton upButton;
	protected JButton downButton;

	protected boolean isCreate = false;
	protected TCComponentItem templateItem;
	
	public abstract String[] getPropertyName();

	//protected Registry registry = Registry.getRegistry(this);

	public BaseRendering(TCComponent tccomponent, boolean isCreate,
			TCComponentItem templateItem) throws Exception {
		super(tccomponent);

		this.isCreate = isCreate;
		this.templateItem = templateItem;
		form = (TCComponentForm) tccomponent;
		session = form.getSession();

		//registry = Registry.getRegistry(this);
		try {
			loadRendering();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BaseRendering() throws Exception {
		super();
	}

	public BaseRendering(TCComponent tccomponent) throws Exception {
		super(tccomponent);
		
		form = (TCComponentForm) tccomponent;
		session = form.getSession();
		try {
			loadRendering();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public TCComponentItem findItem(String id) throws TCException {
		TCComponentItemType itemTypeComp = (TCComponentItemType) session
				.getTypeComponent("Item");
		return itemTypeComp.find(id);
	}

	public TCComponentForm getPFMEAForm(TCComponentItem item)
			throws TCException {
		TCComponentItemRevision revision = item.getLatestItemRevision();
		TCComponent[] relatedComponents = revision.getRelatedComponents();
		for (int i = 0; i < relatedComponents.length; i++) {
			if (relatedComponents[i].getType().equalsIgnoreCase(form.getType())) {
				return (TCComponentForm) relatedComponents[i];
			}
		}
		return null;
	}

	public void loadInitData() throws TCException {
		if (isCreate && templateItem != null) {
			if (templateItem.getType().equalsIgnoreCase(CY_OP)) {
				// opTypeCom.setEnabled(true);
				appendButton.setEnabled(true);
			}

			TCComponentForm templateForm = getPFMEAForm(templateItem);
			if (templateForm != null) {
				loadPFMEAValue(templateForm);
			}
		}
	}

	public void loadRendering() throws TCException {
		try {
			// TODO Auto-generated method stub
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
			if (isCreate) {
				topPanel.add(BorderLayout.WEST, selectAll);
				topPanel.add(BorderLayout.CENTER, middlePanel);
			}
			topPanel.add(BorderLayout.EAST, btnPanel);

			JPanel tablePanel = buildTable();

			setLayout(new BorderLayout());
			add(BorderLayout.NORTH, topPanel);
			add(BorderLayout.CENTER, tablePanel);

			setBackground(Color.white);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void loadPFMEAValue(TCComponentForm form) throws TCException {
		int max = 0;
		Map<String, Object[]> valueMap = new Hashtable<String, Object[]>();
		String[] propNameArray = getPropertyName();
		for (int i = 0; i < propNameArray.length; i++) {
			TCProperty property = form.getFormTCProperty(PREFIX
					+ propNameArray[i]);
			Object[] values = loadValue(property);
			if (values.length > max)
				max = values.length;
			valueMap.put(property.getPropertyName(), values);
		}
		ArrayPropertyTableModel model = (ArrayPropertyTableModel) table
				.getModel();
		model.appendData(valueMap, max);
		model.fireTableDataChanged();
	}

	private Object[] loadValue(TCProperty prop) throws TCException {
		Object[] value = null;

		switch (prop.getPropertyType()) {
		case 1:
			char ac[] = prop.getCharValueArray();
			if (ac != null && ac.length > 0) {
				value = new Object[ac.length];
				for (int i = 0; i < ac.length; i++)
					value[i] = new Character(ac[i]);
			} else {
				value = new Character[0];
			}
			break;

		case 2:
			value = prop.getDateValueArray();
			break;

		case 3:
			double ad[] = prop.getDoubleValueArray();
			if (ad != null && ad.length > 0) {
				value = new Object[ad.length];
				for (int j = 0; j < ad.length; j++)
					value[j] = new Double(ad[j]);

			} else {
				value = new Double[0];
			}
			break;

		case 4:
			float af[] = prop.getFloatValueArray();
			if (af != null && af.length > 0) {
				value = new Object[af.length];
				for (int k = 0; k < af.length; k++)
					value[k] = new Float(af[k]);

			} else {
				value = new Float[0];
			}
			break;

		case 5:
			int ai[] = prop.getIntValueArray();
			if (ai != null && ai.length > 0) {
				value = new Object[ai.length];
				for (int l = 0; l < ai.length; l++)
					value[l] = new Integer(ai[l]);

			} else {
				value = new Integer[0];
			}
			break;

		case 6:
			boolean aflag[] = prop.getLogicalValueArray();
			if (aflag != null && aflag.length > 0) {
				value = new Object[aflag.length];
				for (int i1 = 0; i1 < aflag.length; i1++)
					value[i1] = new Boolean(aflag[i1]);

			} else {
				value = new Boolean[0];
			}
			break;

		case 12:
			value = prop.getNoteValueArray();
			break;

		case 7:
			short aword0[] = prop.getShortValueArray();
			if (aword0 != null && aword0.length > 0) {
				value = new Object[aword0.length];
				for (int k1 = 0; k1 < aword0.length; k1++)
					value[k1] = new Short(aword0[k1]);

			} else {
				value = new Short[0];
			}
			break;

		case 8:
			value = prop.getStringValueArray();
			break;

		case 9:
		case 10:
		case 11:
		case 13:
		case 14:
			value = prop.getReferenceValueArray();
			break;
		}
		return value;
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
				if (table instanceof SelectTable)
					((SelectTable) table).addRow();
			}
		});

		removeButton = new JButton("remove");
		removeButton.setMargin(new Insets(0, 0, 0, 0));
		removeButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).removeSelectedRows();
				if (table instanceof SelectTable)
					((SelectTable) table).removeSelectedRows();
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
				if (table instanceof SelectTable)
					((SelectTable) table).moveSelectedRowsUp();
			}
		});

		downButton = new JButton("down");
		downButton.setMargin(new Insets(0, 0, 0, 0));
		downButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (table instanceof ArrayPropertyTable)
					((ArrayPropertyTable) table).moveSelectedRowsDown();
				if (table instanceof SelectTable)
					((SelectTable) table).moveSelectedRowsDown();
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

	public JPanel buildTable() throws TCException {
		String[] propNameArray = getPropertyName();
		TCProperty[] ps = new TCProperty[propNameArray.length];
		for (int i = 0; i < propNameArray.length; i++) {
			ps[i] = form.getFormTCProperty(PREFIX + propNameArray[i]);
		}

		if (isCreate) {
			table = new SelectTable(session, ps);
	//		CellPopupEditor editor = new CellPopupEditor("编辑PFMEA");
			table.setDefaultEditor(Object.class,
					new SelectPropertyTableCellEditor(session, table));
			table.setDefaultRenderer(Object.class,
					new SelectTableCellRenderer());
			loadInitData();
		} else {
			table = new ArrayPropertyTable(session, ps);
			table.setDefaultRenderer(Object.class,
					new MultiLineTableCellRenderer());
			// {//添加部分1
			// public boolean isCellEditable(int row, int column)
			// {
			// return false;
			// }
			// };

	//		CellPopupEditor editor = new CellPopupEditor("编辑PFMEA");
			table.setDefaultEditor(Object.class,
					new ArrayPropertyTableCellEditor(session, table));
		}
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.getTableHeader().addMouseListener(new MouseAdapter() // 表头添加事件
				{
					public void mousePressed(MouseEvent e) {
						TableCellEditor editor = table.getCellEditor();
						if (editor != null)
							editor.stopCellEditing();
					}
				});

		editor = new PopupCell(session,"编辑PFMEA");
		editor.setTableModal(table.getModel());

		table.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				if (e.getButton() == MouseEvent.BUTTON1) {
					// 单击鼠标左键
					if (e.getClickCount() == 1) {
						if (table instanceof SelectTable) {
							System.out.println("select table click");
							int column = table.getSelectedColumn();
							int row = table.getSelectedRow();
							if (column == 0) {
								Object value = table.getModel().getValueAt(row,
										column);
								String newValue = "";
								if (value == null)
									newValue = "Y";
								else {
									if (value.toString().equalsIgnoreCase("Y"))
										newValue = "N";
									else
										newValue = "Y";
								}
								table.getModel().setValueAt(newValue, row,
										column);
								((ArrayPropertyTableModel) table.getModel())
										.fireTableDataChanged();
							}
						}
					}
					// if (e.getClickCount() == 2)
					// {
					// // int colummCount = tb.getModel().getColumnCount();// 列数
					// // for (int i = 0; i < colummCount; i++)
					// int column = table.getSelectedColumn();
					// int row = table.getSelectedRow();
					//        	    		
					// if((table instanceof SelectTable) && column == 0)
					// {
					//        	
					// }
					// else
					// {
					// openEditor(row, column);
					// }
					// }
				}
			}
		});

		JScrollPane scrollPane = new JScrollPane(table);
		scrollPane.setOpaque(false);
		scrollPane.getViewport().setBackground(Color.white);
		scrollPane.setOpaque(false);

		JPanel panel = new JPanel(new BorderLayout());
		panel.setOpaque(false);
		// scrollPane.get
		panel.add(BorderLayout.CENTER, scrollPane);
		table.setOpaque(false);
		table.getTableHeader().setBackground(Color.white);

		panel.setPreferredSize(new Dimension(860, 500));
		panel.setMinimumSize(new Dimension(850, 500));
		panel.setOpaque(false);
		// panel.setBorder(new javax.swing.border.TitledBorder(new
		// javax.swing.border.EtchedBorder(),
		// registry.getString("ChangeTraceTable")));
		return panel;
	}

	public void appendOPPFMEA() {
		Object selectValue = null;// opTypeCom.getSelectedObject();
		if (selectValue != null && selectValue.toString().length() > 0) {
			System.out.println("Select: " + selectValue);
			String selectTypeName = selectValue.toString();
			try {
				TCClassificationService tccs = session
						.getClassificationService();

				ICSSearchResult[] icssResults = tccs.searchICOs(
						OP_TEMPLATE_LIST, null,
						TCClassificationService.FIND_VALUES_UNIT_SYSTEM_NONE);

				for (ICSSearchResult icssResult : icssResults) {
					TCComponent tcComponent = null;
					try {
						tcComponent = tccs.getTCComponent(icssResult
								.getWsoUid());
						String objectName = tcComponent
								.getProperty("object_name");
						if (selectTypeName.equalsIgnoreCase(objectName)) {
							TCComponentItem item = null;
							if (tcComponent instanceof TCComponentItemRevision)
								item = ((TCComponentItemRevision) tcComponent)
										.getItem();
							if (tcComponent instanceof TCComponentItem)
								item = ((TCComponentItem) tcComponent);
							;

							TCComponentForm templateForm = getPFMEAForm(item);
							if (templateForm != null) {
								loadPFMEAValue(templateForm);
							}
							break;
						}
					} catch (TCException e) {
						System.out.println("有分类对象无访问权限，跳过！");
						continue;
					}
				}

			} catch (TCException tce) {
				tce.printStackTrace();
			}
		}
	}

	public void copyRow() {
		int r = table.getSelectedRow();
		if (r >= 0 && r <= table.getRowCount()) {
			if (table instanceof ArrayPropertyTable)
				((ArrayPropertyTableModel) table.getModel()).copyRow(r);
			if (table instanceof SelectTable)
				((SelectTableModel) table.getModel()).copyRow(r);
		}
	}

	public void insertRow() {
		int r = table.getSelectedRow();
		if (r >= 0 && r <= table.getRowCount()) {
			if (table instanceof ArrayPropertyTable)
				((ArrayPropertyTableModel) table.getModel()).insertRow(r);
			if (table instanceof SelectTable)
				((SelectTableModel) table.getModel()).insertRow(r);
		}
	}

	public void openEditor(int row, int column) {
		 editor.display(row, column);
	}

	public void selectAll() {
		if (table instanceof SelectTable) {
			if (table.getCellEditor() != null)
				table.getCellEditor().stopCellEditing();
			((SelectTableModel) table.getModel()).selectAll();
		}
	}

	public void unSelectAll() {
		if (table instanceof SelectTable) {
			if (table.getCellEditor() != null)
				table.getCellEditor().stopCellEditing();
			((SelectTableModel) table.getModel()).unSelectAll();
		}
	}

	public void saveRendering() {
		// TODO Auto-generated method stub
		TCProperty[] properties = null;
		try {
			form.lock();
			if (table instanceof ArrayPropertyTable) {
				((ArrayPropertyTable) table).stopEdit();
				properties = ((ArrayPropertyTable) table).saveTCProperties();
			}
			if (table instanceof SelectTable) {
				((SelectTable) table).stopEdit();
				properties = ((SelectTable) table).saveTCProperties();
			}

			form.setTCProperties(properties);
			form.save();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				form.unlock();
			} catch (TCException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
