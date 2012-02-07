/*=============================================================================*
 *         Copyright(c) 2009-2010, Siemens PLM Software Inc.
 *                          ALL RIGHTS RESERVED

 *  FILENAME : 	ArrayPropertyTableModel.java
 *  PURPOSE  : 	data model of ArrayPropertyTable, implements some method to let
 *  			table useful
 *  
 *  HISTORY  :
 *    DATE            VERSION        AUTHOR            NOTE
 *    2009-02-09      V1.0           Tim              Created.    
 *   
 *============================================================================*/

package com.saturn.ph.views.table;

import java.util.Hashtable;
import java.util.Map;
import java.util.Vector;

import javax.swing.table.AbstractTableModel;

import com.teamcenter.rac.kernel.TCProperty;

/**
 * array-property table model
 * @author Tim
 *
 */
public class ArrayPropertyTableModel extends AbstractTableModel
{
	/**
	 * all column
	 */
	protected ArrayPropertyTableColumn[] column;
	
	protected Map<String, Object> copyMap;
	/**
	 * ArrayPropertyTableModel construct
	 * @param columnData	table column datas
	 * @param maxRowCount	row count
	 */
	public ArrayPropertyTableModel(ArrayPropertyTableColumn[] columnData, int maxRowCount)
	{
		super();
		
		column = new ArrayPropertyTableColumn[columnData.length];
		
		copyMap = new Hashtable<String, Object>();
		
		for(int i = 0 ; i < columnData.length; i++)
		{
			if(columnData[i].getRowCount() < maxRowCount)
			{
				//extends  each column values
				columnData[i].extend(maxRowCount);
			}
			column[i] = columnData[i];
		}
	}
	
	/**
	 *  get table column
	 * @param col	column index
	 * @return
	 */
	public ArrayPropertyTableColumn getColumn(int col)
	{
		return column[col];
	}
	/**
	 * return column count
	 * @return column count
	 */
	public int getColumnCount()
	{
		return column.length;
	}
	/**
	 * return column name
	 * @param col	column index
	 * @return	column display name
	 */
	public String getColumnName(int col)
	{
		return column[col].getColumnName();
	}
	/**
	 * return if table cell can be edit 
	 * @param	row table row index
	 * @param	col table column index
	 * @return	true or false
	 */
	public boolean isCellEditable(int row, int col)
	{		
		return column[col].isEditable();
		//return false;
	}

	/**
	 * return row count
	 * @return row count
	 */
	public int getRowCount() 
	{
		return column[0].getRowCount();
	}
	/**
	 * get table cell value
	 * @param row	table row index
	 * @param col	table column index
	 * @return cell value
	 */
	public Object getValueAt(int row, int col) 
	{	
		return column[col].getEditValue()[row];
	}

	/**
	 * set cell value
	 * @param value	cell value
	 * @param row	table row index
	 * @param col	table column index
	 */
	public void setValueAt(Object value, int row, int col)
	{
		column[col].getEditValue()[row] = value;
		
	
	}		
	/**
	 * add new rows into the table
	 * @param count new row count
	 */
    public void addRows(int count)
    {
       Object[] value = column[0].getEditValue();
       int pos = value == null ? 0 : value.length;
       for (int i = 0; i < column.length; i++)
       {
          Object[] oldValue = column[i].getEditValue();
          Object[] newValue;
          if (oldValue == null)
          {
             newValue = new Object[count];
          }
          else
          {
             newValue = new Object[oldValue.length + count];
          }
          //copy and set new values
          if (oldValue != null)
             System.arraycopy(oldValue, 0, newValue, 0, oldValue.length);
          column[i].setEditValue(newValue);
       }
       fireTableRowsInserted(pos > 0 ? pos - 1 : pos, pos + count);
    }
    
    /**
     *  add rows has initial value
     * @param s1	column[0] has value s1
     * @param s2	column[1] has value s2
     * @param s3	column[2] has value s3
     */
    public void addRow(String s1, String s2, String s3)
    {
       Object[] value = column[0].getEditValue();
       int pos = value == null ? 0 : value.length;
       for (int i = 0; i < column.length; i++)
       {
          Object[] oldValue = column[i].getEditValue();
          Object[] newValue;
          if (oldValue == null)
          {
             newValue = new Object[1];
             if(i == 0)
            	 newValue[0] = s1;
             else if(i == 1)
            	 newValue[0] = s2;
             else if(i == 2)
            	 newValue[0] = s3;
          }
          else
          {
             newValue = new Object[oldValue.length + 1];
             if(i == 0)
            	 newValue[oldValue.length] = s1;
             else if(i == 1)
            	 newValue[oldValue.length] = s2;
             else if(i == 2)
            	 newValue[oldValue.length] = s3;
          }
          //copy and set new values
          if (oldValue != null)
             System.arraycopy(oldValue, 0, newValue, 0, oldValue.length);
          column[i].setEditValue(newValue);
       }
       fireTableRowsInserted(pos > 0 ? pos - 1 : pos, pos + 1);
    }
    
//    public void copyRow(int row)
//    {
//    	for(int i = 0 ; i < getColumnCount(); i++)
//    	{
//    		Object value = getValueAt(row, i);
//    		copyMap.put(getColumnName(i), value);
//    	}
//    }
    
    public void copyRow(int row)
    {
    	for(int i = 0 ; i < getColumnCount(); i++)
    	{
    		Object value = getValueAt(row, i);
    		if (value != null)
    		{
    			copyMap.put(getColumnName(i), value);
    		}
    		
    	}
    	if(!copyMap.isEmpty())
    	{
    		for(int i = 0 ; i < column.length; i++)
        	{
    			Object[] values = column[i].getEditValue();
    			Object[] values1 = new Object[values.length + 1];
    			
    			System.arraycopy(values, 0, values1, 0, row);
    			System.arraycopy(values, row, values1, row + 1, values.length - row);
    			column[i].setEditValue(values1);
        	}
    		fireTableRowsInserted(row, row);
    		for(int i = 0 ; i < getColumnCount(); i++)
    		{
    			String colName = getColumnName(i);
    			if(copyMap.containsKey(colName))
    			{
    				setValueAt(copyMap.get(colName), row, i);
    			}
    		}
    		this.fireTableDataChanged();
    	}
    	copyMap.clear();
    }
    
    public void insertRow(int row)
    {
		for(int i = 0 ; i < column.length; i++)
    	{
			Object[] values = column[i].getEditValue();
			Object[] values1 = new Object[values.length + 1];
			
			System.arraycopy(values, 0, values1, 0, row);
			System.arraycopy(values, row, values1, row + 1, values.length - row);
			column[i].setEditValue(values1);
    	}
		fireTableRowsInserted(row, row);
    }

    public boolean hasModified()
    {
    	for(int i = 0 ; i < this.getColumnCount(); i++)
    	{
    		boolean flag = this.getColumn(i).isModified();
    		if(flag)
    			return true;
    	}
    	return false;
    }
    /**
     * remove assigned rows
     * @param rows	remove rows
     */
    public void removeRows(int[] rows)
    {
       for (int i = 0; i < column.length; i++)
       {
          Object[] oldValue = column[i].getEditValue();
          Object[] newValue;
          newValue = new Object[oldValue.length - rows.length];
          int idx = 0, k = 0;
          for (int j = 0; j < oldValue.length; j++)
          {
             if (k < rows.length && j == rows[k])
                k++;
             else
                newValue[idx++] = oldValue[j];
          }
          column[i].setEditValue(newValue);
       }
       fireTableRowsDeleted(rows[0], rows[rows.length - 1]);
    }
    
    /**
     * move rows to up
     * @param rows must be ascend sorted indices 
     */
    public int[] moveRowsUp(int[] rows)
    {
       int[] newRows = new int[rows.length];
       for (int i = 0; i < rows.length; i++)
       {
          newRows[i] = rows[i] - 1;
          if (newRows[i] >= 0)
          {
             for (int j = 0; j < column.length; j++)
             {
                Object[] value = column[j].getEditValue();
                swap(value, rows[i], newRows[i]);
             }
          }
          else
          {
             do
             {
                newRows[i] = rows[i];
                i++;
             }
             while (i < rows.length && rows[i] == rows[i - 1] + 1);
             i--;
          }
       }
       fireTableRowsUpdated(newRows[0], rows[rows.length - 1]);
       return newRows;
    }

    /**
     * move rows to down
     * @param rows must be ascend sorted indices 
     */
    public int[] moveRowsDown(int[] rows)
    {
       int len = column[0].getEditValue().length;
       int[] newRows = new int[rows.length];
       for (int i = rows.length - 1; i >= 0; i--)
       {
          newRows[i] = rows[i] + 1;
          if (newRows[i] < len)
          {
             for (int j = 0; j < column.length; j++)
             {
                Object[] value = column[j].getEditValue();
                swap(value, rows[i], newRows[i]);
             }
          }
          else
          {
             do
             {
                newRows[i] = rows[i];
                i--;
             }
             while (i >= 0 && rows[i] == rows[i + 1] - 1);
             i++;
          }
       }
       fireTableRowsUpdated(rows[0], newRows[newRows.length - 1]);
       return newRows;
    }
    /**
     * change elements position in the array 
     * @param array	array
     * @param i	first element index
     * @param j	second element index
     */
    private void swap(Object[] array, int i, int j)
    {
       Object obj = array[i];
       array[i] = array[j];
       array[j] = obj;
    }
    
    /**
     * save all table values 
     * @return	all properties
     * @throws Exception
     */
    public TCProperty[] saveValueData() throws Exception
    {
    	TCProperty[] ps;
    	
    	ps = new TCProperty[column.length];
    	
    	for(int i = 0; i < column.length; i++)
    	{
    		column[i].saveValueData();
    		ps[i] = column[i].getProperty();
    	}
    	
    	return ps;
    }
    /**
     * set column values
     * @param colName	column name
     * @param values	values
     */
    public void setColumnValue(String colName,Object[] values)
    {
    	for(int i = 0; i < column.length; i++)
    	{
    		String propertyName = column[i].getProperty().getPropertyName();
    		if(propertyName.equals(colName))
    		{
    			column[i].setEditValue(values);
    		}
    	}
    }
    
    public int[] blankRows()
    {
    	Vector rowIdx = new Vector();
    	for(int i = 0 ;i < getRowCount(); i++)
    	{
    		boolean flag = false;
    		for(int j = 0 ; j < this.getColumnCount(); j++)
    		{
    			String strValue = "";
    			Object value = this.getValueAt(i, j);
    			if(value != null)
    				strValue = value.toString();
    			
    			if(strValue.trim().length() > 0)
    			{
    				flag = true;
    			}
    		}
    		
    		if(!flag)
    		{
    			rowIdx.add(new Integer(i));
    		}
    	}
    	
    	int[] idx = new int[rowIdx.size()];
    	for(int i = 0 ; i < idx.length; i++)
    		idx[i] = ((Integer)rowIdx.get(i)).intValue();
    	
    	return idx;
    }
    
    public void appendData(Map<String, Object[]> data, int max)
    {
    	int maxRow = getRowCount() + max;
    	for(int i = 0 ; i < column.length; i++)
    	{
    		String propName = column[i].getProperty().getPropertyName();
    		if(data.containsKey(propName))
    		{
    			Object[] v1 = column[i].getEditValue();
    			Object[] v2 = data.get(propName);
    			Object[] v = new Object[v1.length + v2.length];
    			System.arraycopy(v1, 0, v, 0, v1.length);
    			System.arraycopy(v2, 0, v, v1.length, v2.length);
    			column[i].setEditValue(v);
    		}
    		column[i].extend(maxRow);
    	}
    }
}