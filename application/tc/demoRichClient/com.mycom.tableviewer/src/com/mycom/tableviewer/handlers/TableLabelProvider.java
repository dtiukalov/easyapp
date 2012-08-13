package com.mycom.tableviewer.handlers;

import org.eclipse.jface.viewers.ITableLabelProvider;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.swt.graphics.Image;

public class TableLabelProvider extends LabelProvider implements
		ITableLabelProvider {
	public Image getColumnImage(Object element, int columnIndex) {
		return null;
	}

	public String getColumnText(Object element, int columnIndex) {
		Row row = (Row) element;

		switch (columnIndex) {
		case 0:
			return row.getKey();
		case 1:
			return row.getValue();
		}

		return null;
	}

}