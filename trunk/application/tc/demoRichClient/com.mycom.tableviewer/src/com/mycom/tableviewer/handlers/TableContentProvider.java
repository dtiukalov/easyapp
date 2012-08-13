package com.mycom.tableviewer.handlers;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.Viewer;

public class TableContentProvider implements IStructuredContentProvider {
	public Object[] getElements(Object parent) {
		List results = new ArrayList();
		if (parent instanceof ArrayList) {
			results = (ArrayList) parent;
		}
		return results.toArray();
	}

	public void dispose() {
	}

	public void inputChanged(Viewer viewer, Object oldInput, Object newInput) {
	}

}