package com.saturn.ph.views.table;

import java.awt.Color;
import java.awt.Component;
import java.awt.Graphics;

import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class SelectTableCellRenderer extends MultiLineTableCellRenderer 
{
	public Component getTableCellRendererComponent(JTable table,
            Object value,
            boolean isSelected,
            boolean hasFocus,
            int row,
            int column)
	{
		int factcol = table.convertColumnIndexToModel(column);
		if(factcol == 0)
		{
			JCheckBox checkBox = new JCheckBox();
			checkBox.setOpaque(false);
			if(value != null && value.toString().trim().equalsIgnoreCase("Y"))
			{
				checkBox.setSelected(true);
			}					
			else
			{
				checkBox.setSelected(false);
			}
			return checkBox;
		}
		Component component = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);

		/*
		if(table instanceof ECRChangeTable)
		{
			ArrayPropertyTableColumn col = ((ECRChangeTable)table).getTableModel().getColumn(column);
			if(col.getColumnName().equals("ActionType11"))
			{
				component = new JLabel("")
				{
					public void paint(Graphics g)
				    {
						super.paint(g);
					    Painter.paintIsRequired(this, g);
				    }
		        };
		       ((JLabel)component).setOpaque(false);
			}
		}
		*/
//		if(!table.isCellEditable(row, column))
//		{
//			if(isSelected)
//			{
//				setBackground(table.getSelectionBackground());
//				setForeground(Color.white);
//			}
//			else
//			{
////				setBackground(new Color(245,230,230));
//				setBackground(table.getBackground());
//				setForeground(table.getForeground());
//			}
//			//setBackground(table.getSelectionBackground());
//		}
//		else
//		{
//			if(isSelected)
//			{
//				setBackground(table.getSelectionBackground());
//				setForeground(Color.white);
//			}
//			else
//			{
//				setBackground(table.getBackground());
//				setForeground(table.getForeground());
//			}
//		}
		
		return component;
	}
}
