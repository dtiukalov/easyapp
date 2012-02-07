package com.saturn.ph.views.table;

import java.awt.Font;
import java.awt.FontMetrics;
import java.util.Vector;

import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.TableColumnModel;

import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;

public class SelectTable extends JTable
{
	protected TCSession session;
	/**
	 * table enabled
	 */
	protected boolean tableEnabled;
	/**
	 * table model
	 */
	protected SelectTableModel tableModel;
	
	/**
	 *  ArrayPropertyTable construct
	 * @param session	IMAN session
	 * @param properties	array-properties
	 * @param cellEditable	cellEditable
	 */
	public SelectTable(TCSession session,TCProperty[] properties) 
	{
		tableEnabled = false;
		tableModel = null;
		
		this.session = session;
		//set each column can be editable or can not be editable
		buildTableModel(properties);
		
		//this.setDefaultRenderer(Object.class, new CustTableCellRenderer());
	}

	/**
	 *  build table model and set earch column width
	 * @param properties	array-properties
	 * @param enables	column enables
	 */
	public void buildTableModel(TCProperty[] properties)
	{
		Vector columns = new Vector();
		int rowCount = 0;
		
		for(int i = 0; i < properties.length; i++)
		{
			//build column and extends column value count
			if(properties[i].getPropertyDescriptor().isArray())
			{
				ArrayPropertyTableColumn column = new ArrayPropertyTableColumn(properties[i]);
				rowCount = column.getRowCount() > rowCount ? column.getRowCount():rowCount;
				columns.addElement(column);
			}
		}
		ArrayPropertyTableColumn[] cols = new ArrayPropertyTableColumn[columns.size()];
		columns.toArray(cols);
		//build table model
		tableModel = new SelectTableModel(cols, rowCount);
		setModel(tableModel);
		
		//set column width
		Font font = getFont();
		FontMetrics fontmetrics = getFontMetrics(font);
		//get averate width of one char
		int charWidth =
			(fontmetrics.charWidth('w') + fontmetrics.charWidth('i')) / 2;
		TableColumnModel tcm = getColumnModel();
		for (int i = 0; i < tableModel.getColumnCount(); i++)
		{	
			if(i == 0)
				tcm.getColumn(i).setPreferredWidth(8 * charWidth);
			else
		         tcm.getColumn(i).setPreferredWidth(
		        		 cols[i-1].getColumnWidth() * charWidth);
		}
	}

	
	public boolean hasModified()
	{
		return tableModel.hasModified();
	}
	/**
	 *  get table model
	 * @return table model
	 */
	public ArrayPropertyTableModel getTableModel()
	{
		return tableModel;
	}
	/**
	 * return if table can be edit
	 * @return
	 */	
	public boolean isTableEnabled()
	{
		return tableEnabled;
	}
	/**
	 * save array-properties
	 * @return array-properties
	 * @throws Exception
	 */
	public TCProperty[] saveTCProperties() throws Exception
	{
		if(this.getCellEditor() != null)
			this.getCellEditor().stopCellEditing();
		
		int[] blankRows = tableModel.blankRows();
		
		System.out.println("Blank Row: " + blankRows.length);
		
		if(blankRows.length > 0)
		{
			tableModel.removeRows(blankRows);
		}
		
		tableModel.filterUnSelectRows(blankRows);
		
		return tableModel.saveValueData();
	}
	
	 public void stopEdit()
	 {
		 if(getCellEditor() != null)
		 {
			 getCellEditor().stopCellEditing();
		 }
	 }
	
//	public void saveTCProperties(Vector<TCProperty> properties) throws Exception
//	{
//		if(this.getCellEditor() != null)
//			this.getCellEditor().stopCellEditing();
//		
//		int[] blankRows = tableModel.blankRows();
//		
//		System.out.println("Blank Row: " + blankRows.length);
//		
//		if(blankRows.length > 0)
//		{
//			tableModel.removeRows(blankRows);
//		}
//		
//		tableModel.saveValueData(properties);
//	}
	/**
	 * set table enabled
	 * @param f 
	 */
	public void setTableEnabled(boolean f)
	{
		tableEnabled = f;
		repaint();
	}
	
	/**
	 * set table model
	 * @param model	new table model
	 */
	public void setTableModel(SelectTableModel model)
	{
		tableModel = model;
	}
	
	/**
	 * set values of column which name is colName
	 * @param colName	column name
	 * @param values	values
	 */
	public void setColumnValue(String colName,Object[] values)
	{
		tableModel.setColumnValue(colName, values);
	}
	
	/**
	 * get new row
	 *
	 */
	public void addRow()
	{
	    tableModel.addRows(1);
	}
	
	/**
	 * remove select rows
	 *
	 */
	public void removeSelectedRows()
	{
	    int[] rows = getSelectedRows();
	    if (rows == null || rows.length < 1)
	        return;
	    tableModel.removeRows(rows);
	}   
	
	/**
	 * move selected rows to up
	 *
	 */
	public void moveSelectedRowsUp()
	{
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
	public void moveSelectedRowsDown()
	{
	    int[] selection = getSelectedRows();
	    if (selection == null || selection.length < 1)
	       return;
	    int[] newSelection = tableModel.moveRowsDown(selection);

	    ListSelectionModel sm = getSelectionModel();
	    sm.removeSelectionInterval(0, selection[selection.length - 1]);
	    for (int i = 0; i < newSelection.length; i++)
	       sm.addSelectionInterval(newSelection[i], newSelection[i]);
	}
}
