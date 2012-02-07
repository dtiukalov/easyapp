package com.saturn.ph.views.table;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;
import java.util.Vector;

import com.teamcenter.rac.kernel.TCProperty;

public class SelectTableModel extends ArrayPropertyTableModel 
{
	public Map<String,String> selectedInx;
	public SelectTableModel(ArrayPropertyTableColumn[] columnData,
			int maxRowCount) {
		super(columnData, maxRowCount);
		// TODO Auto-generated constructor stub
		selectedInx = new Hashtable<String,String>();
	}

	public int getColumnCount()
	{
		return column.length + 1;
	}
	/**
	 * return column name
	 * @param col	column index
	 * @return	column display name
	 */
	public String getColumnName(int col)
	{
		if(col == 0)
			return " ";
		else
			return column[col-1].getColumnName();
	}
	
	public ArrayPropertyTableColumn getColumn(int col)
	{
		return column[col-1];
	}
	/**
	 * return if table cell can be edit 
	 * @param	row table row index
	 * @param	col table column index
	 * @return	true or false
	 */
	public boolean isCellEditable(int row, int col)
	{		
		if(col == 0)
			return false;
		else
			return column[col-1].isEditable();
//		return false;
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
		if(col == 0)
		{
			if(selectedInx.containsKey(row + ""))
			{
				String value = selectedInx.get(row + "");
				if(value.equalsIgnoreCase("Y"))
					return "Y";
				else
					return "N";
			}
			else
			{
				return "N";
			}
		}
		else
		{
			return column[col-1].getEditValue()[row];
		}
	}
	
    public int[] blankRows()
    {
    	Vector rowIdx = new Vector();
    	for(int i = 0 ;i < getRowCount(); i++)
    	{
    		boolean flag = false;
    		for(int j = 1 ; j < this.getColumnCount(); j++)
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
	
	public void selectAll()
	{
		int rowCount = getRowCount();
		for(int i = 0 ; i < rowCount; i++)
		{
			selectedInx.put("" + i, "Y");
		}
		fireTableDataChanged();
	}
	
	public void unSelectAll()
	{
		int rowCount = getRowCount();
		for(int i = 0 ; i < rowCount; i++)
		{
			selectedInx.put("" + i, "N");
		}
		fireTableDataChanged();
	}
	
	public void setValueAt(Object value, int row, int col)
	{
		if(col == 0)
		{
			if(value != null && value.toString().trim().equalsIgnoreCase("Y"))
			{
				selectedInx.put(row + "", "Y");
			}
			else
			{
				selectedInx.put(row + "", "N");
			}
		}
		else
		{
			column[col - 1].getEditValue()[row] = value;
		}
	}
	
	public void filterUnSelectRows(int[] idx)
	{
		for(int i = 0 ; i < column.length; i++)
		{
			Object[] values = column[i].getEditValue();
			Vector<Object> vec = new Vector<Object>();
			for(int j = 0; j < values.length; j++)
			{				
				if(isInIdx(idx, j))
					continue;
				
				boolean isSelected = false;
				
				if(selectedInx.containsKey(j + ""))
				{
					String s = selectedInx.get(j + "");
					if(s.equalsIgnoreCase("Y"))
						isSelected = true;
				}
				if(isSelected)
				{
					vec.add(values[j]);
				}
			}
			Object[] values1 = new Object[vec.size()];
			vec.toArray(values1);
			column[i].setEditValue(values1);
		}
	}
	
	public boolean isInIdx(int[] idx, int d)
	{
		for(int i = 0 ; i < idx.length; i++)
		{
			if(idx[i] == d)
				return true;
		}
		return false;
	}
	
	
//    public void copyRow(int row)
//    {
//    	for(int i = 0 ; i < getColumnCount(); i++)
//    	{
//    		Object value = getValueAt(row, i);
//    		copyMap.put(getColumnName(i), value);
//    	}
//    }
    
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
		
		Map<String, String> temp = new Hashtable<String,String>();
		for(int i = 0 ; i < getRowCount(); i++)
		{
			if(selectedInx.containsKey("" + i))
			{
				if(selectedInx.get("" + i).equalsIgnoreCase("Y"))
				{
					if(i >= row)
						temp.put("" + (i + 1), "" + (i + 1));
					else
						temp.put("" + i, "" + i);
				}
			}
		}
		selectedInx.clear();
		for(int i = 0 ; i < getRowCount(); i++)
		{
			if(temp.containsKey("" + i))
			{
				selectedInx.put("" + i, "Y");
			}
			else
			{
				selectedInx.put("" + i, "N");
			}
		}
		
		this.fireTableDataChanged();
    }
    
    public void copyRow(int row)
    {
    	for(int i = 0 ; i < getColumnCount(); i++)
    	{
    		Object value = getValueAt(row, i);
    		copyMap.put(getColumnName(i), value);
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
    		
    		Map<String, String> temp = new Hashtable<String,String>();
    		for(int i = 0 ; i < getRowCount(); i++)
    		{
    			if(selectedInx.containsKey("" + i))
    			{
    				if(selectedInx.get("" + i).equalsIgnoreCase("Y"))
    				{
    					if(i >= row)
    						temp.put("" + (i + 1), "" + (i + 1));
    					else
    						temp.put("" + i, "" + i);
    				}
    			}
    		}
    		selectedInx.clear();
    		for(int i = 0 ; i < getRowCount(); i++)
    		{
    			if(temp.containsKey("" + i))
    			{
    				selectedInx.put("" + i, "Y");
    			}
    			else
    			{
    				selectedInx.put("" + i, "N");
    			}
    		}
    		
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
    
    /*
    public void inesrtRow(int row)
    {
    	if(!copyMap.isEmpty())
    	{
    		for(int i = 0 ; i < column.length; i++)
        	{
    			Object[] values = column[i].getEditValue();
    			Object[] values1 = new Object[values.length + 1];
    			
    			System.arraycopy(values, 0, values1, 0, row + 1);
    			System.arraycopy(values, row + 1, values1, row + 2, values.length - row - 1);
    			column[i].setEditValue(values1);
        	}
    		fireTableRowsInserted(row + 1, row + 1);
    		
    		Map<String, String> temp = new Hashtable<String,String>();
    		for(int i = 0 ; i < getRowCount(); i++)
    		{
    			if(selectedInx.containsKey("" + i))
    			{
    				if(selectedInx.get("" + i).equalsIgnoreCase("Y"))
    				{
    					if(i > row)
    						temp.put("" + (i + 1), "" + (i + 1));
    					else
    						temp.put("" + i, "" + i);
    				}
    			}
    		}
    		selectedInx.clear();
    		for(int i = 0 ; i < getRowCount(); i++)
    		{
    			if(temp.containsKey("" + i))
    			{
    				selectedInx.put("" + i, "Y");
    			}
    			else
    			{
    				selectedInx.put("" + i, "N");
    			}
    		}
    		
    		for(int i = 0 ; i < getColumnCount(); i++)
    		{
    			String colName = getColumnName(i);
    			if(copyMap.containsKey(colName))
    			{
    				setValueAt(copyMap.get(colName), row + 1, i);
    			}
    		}
    		
    		this.fireTableDataChanged();
    	}
    	copyMap.clear();
    }
	*/
	
    
//    public void saveValueData(Vector<TCProperty> properties) throws Exception
//    {
//    	for(int i = 0; i < column.length; i++)
//    	{
//    		boolean flag  = column[i].saveValueData();
//    		{
//    			System.out.println("Save property[" + column[i].getProperty().getPropertyName() + "] " + flag);
//    		}
//    		if(flag)
//    			properties.add(column[i].getProperty());
//    	}
//    }
    
}
