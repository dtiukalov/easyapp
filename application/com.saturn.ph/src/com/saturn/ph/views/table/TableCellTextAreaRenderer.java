package com.saturn.ph.views.table;

import java.awt.Color;
import java.awt.Component;

import javax.swing.BorderFactory;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.table.TableCellRenderer;

public class TableCellTextAreaRenderer extends JTextArea implements TableCellRenderer
{
    public TableCellTextAreaRenderer() {
        setLineWrap(true);
        setWrapStyleWord(true);
        
        this.setBorder(BorderFactory.createEmptyBorder(1, 1, 0, 0)); 

    }

    public Component getTableCellRendererComponent(JTable table, Object value,
            boolean isSelected, boolean hasFocus, int row, int column) {
        // ���㵱���е���Ѹ߶�
//        int maxPreferredHeight = 0;
//        for (int i = 0; i < table.getColumnCount(); i++) {
//            setText("" + table.getValueAt(row, i));
//            
//            if(column == 1 && row == 1)
//            {
//            	System.out.println("Weight: " + table.getColumnModel().getColumn(column).getWidth());
//            }
//            
//            setSize(table.getColumnModel().getColumn(i).getWidth(), 0);
//            maxPreferredHeight = Math.max(maxPreferredHeight, getPreferredSize().height);
//            if(row == 1)
//            	System.out.println("Compare : " +  i + "|" + getPreferredSize().height);
//        }

//        if (table.getRowHeight(row) != maxPreferredHeight)  // ��������������Ϲæ
//            table.setRowHeight(row, maxPreferredHeight);
        
//        if(row == 1)
//        	System.out.println("Height: " +  column + "|" + maxPreferredHeight);

        setText(value == null ? "" : value.toString());
        
        
	    if(isSelected)
	    {
	    	//setBackground(table.getSelectionBackground());
	    	setBackground(new Color(189,215,255));
	    	setForeground(Color.black);

	    }
	    else
	    {
	    	setBackground(table.getBackground());
	    	setForeground(Color.black);
	    }
        
        return this;
    }
}
