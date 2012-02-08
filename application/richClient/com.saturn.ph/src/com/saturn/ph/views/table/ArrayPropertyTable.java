/*=============================================================================*
 *         Copyright(c) 2009-2010, Siemens PLM Software Inc.
 *                          ALL RIGHTS RESERVED

 *  FILENAME : 	ArrayPropertyTable.java
 *  PURPOSE  : 	this table base on any arrray properties, each property respresent
 *  			one column in the table,
 *  
 *  HISTORY  :
 *    DATE            VERSION        AUTHOR            NOTE
 *    2009-02-09      V1.0           Tim              Created.    
 *   
 *============================================================================*/

package com.saturn.ph.views.table;

import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.event.MouseEvent;
import java.util.EventObject;
import java.util.Vector;

import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.TableColumnModel;

import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;

/**
 * This class use to show array-properties, each column is mapping to an
 * array-property
 * 
 * @author Tim
 * 
 */
public class ArrayPropertyTable extends JTable {

	/**
	 * table enabled
	 */
	protected boolean tableEnabled;
	
	/**
	 * table model
	 */
	protected ArrayPropertyTableModel tableModel;

	public ArrayPropertyTable () {
		tableEnabled = false;
	}

	@Deprecated
	public ArrayPropertyTable (TCSession session, TCProperty[] ps) {
		new Throwable("Deprecated").printStackTrace();
	}

	/**
	 * build table model and set earch column width
	 * 
	 * @param properties
	 *            array-properties
	 * @param enables
	 *            column enables
	 */
	public void buildTableModel(TCProperty[] properties, boolean[] enables, int[] widthes) {
		Vector columns = new Vector();
		int rowCount = 0;

		for (int i = 0; i < properties.length; i++) {
			// build column and extends column value count
			if (properties[i].getPropertyDescriptor().isArray()) {
				ArrayPropertyTableColumn column = new ArrayPropertyTableColumn(
						properties[i], enables[i], widthes[i]);
				rowCount = column.getRowCount() > rowCount ? column
						.getRowCount() : rowCount;
				columns.addElement(column);
			}
		}
		ArrayPropertyTableColumn[] cols = new ArrayPropertyTableColumn[columns
				.size()];
		columns.toArray(cols);
		// build table model
		tableModel = new ArrayPropertyTableModel(cols, rowCount);
		setModel(tableModel);

		// set column width
		Font font = getFont();
		FontMetrics fontmetrics = getFontMetrics(font);
		// get averate width of one char
		int charWidth = (fontmetrics.charWidth('w') + fontmetrics
				.charWidth('i')) / 2;
		TableColumnModel tcm = getColumnModel();
		for (int i = 0; i < cols.length; i++) {
			tcm.getColumn(i).setPreferredWidth(
					cols[i].getColumnWidth() * charWidth);
		}
	}

	public boolean hasModified() {
		return tableModel.hasModified();
	}

	/**
	 * get table model
	 * 
	 * @return table model
	 */
	public ArrayPropertyTableModel getTableModel() {
		return tableModel;
	}

	/**
	 * return if table can be edit
	 * 
	 * @return
	 */
	public boolean isTableEnabled() {
		return tableEnabled;
	}

	/**
	 * save array-properties
	 * 
	 * @return array-properties
	 * @throws Exception
	 */
	public TCProperty[] saveTCProperties() throws Exception {
		if (this.getCellEditor() != null)
			this.getCellEditor().stopCellEditing();

		int[] blankRows = tableModel.blankRows();
		if (blankRows.length > 0) {
			tableModel.removeRows(blankRows);
		}

		return tableModel.saveValueData();
	}

	/**
	 * set table enabled
	 * 
	 * @param f
	 */
	public void setTableEnabled(boolean f) {
		tableEnabled = f;
		repaint();
	}

	/**
	 * set table model
	 * 
	 * @param model
	 *            new table model
	 */
	public void setTableModel(ArrayPropertyTableModel model) {
		tableModel = model;
	}

	/**
	 * set values of column which name is colName
	 * 
	 * @param colName
	 *            column name
	 * @param values
	 *            values
	 */
	public void setColumnValue(String colName, Object[] values) {
		tableModel.setColumnValue(colName, values);
	}

	/**
	 * get new row
	 * 
	 */
	public void addRow() {
		tableModel.addRows(1);
	}

	public void copyRow() {
		int row = getSelectedRow();
		tableModel.copyRow(row);
	}

	/**
	 * remove select rows
	 * 
	 */
	public void removeSelectedRows() {
		int[] rows = getSelectedRows();
		if (rows == null || rows.length < 1)
			return;
		tableModel.removeRows(rows);
	}

	/**
	 * move selected rows to up
	 * 
	 */
	public void moveSelectedRowsUp() {
		stopEdit();
		int[] selection = getSelectedRows();
		if (selection == null || selection.length < 1)
			return;
		int[] newSelection = tableModel.moveRowsUp(selection);
		ListSelectionModel sm = getSelectionModel();
		sm.removeSelectionInterval(0, selection[selection.length - 1]);
		for (int i = 0; i < newSelection.length; i++)
			sm.addSelectionInterval(newSelection[i], newSelection[i]);
	}

	/**
	 * move selected rows down
	 * 
	 */
	public void moveSelectedRowsDown() {
		stopEdit();
		int[] selection = getSelectedRows();
		if (selection == null || selection.length < 1)
			return;
		int[] newSelection = tableModel.moveRowsDown(selection);

		ListSelectionModel sm = getSelectionModel();
		sm.removeSelectionInterval(0, selection[selection.length - 1]);
		for (int i = 0; i < newSelection.length; i++)
			sm.addSelectionInterval(newSelection[i], newSelection[i]);
	}

	public void stopEdit() {
		if (getCellEditor() != null) {
			getCellEditor().stopCellEditing();
		}
	}

}
