package com.mycom.treeviewer.handlers;

import java.io.File;

import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.swt.widgets.*;
import org.eclipse.jface.window.ApplicationWindow;

public class Explorer extends ApplicationWindow {

	public Explorer() {
		super(null);

	}

	protected Control createContents(Composite parent) {

		TreeViewer tv = new TreeViewer(parent);

		tv.setContentProvider(new FileTreeExplorerContentProvider());
		tv.setLabelProvider(new FileTreeExplorerLabelProvider());
		// if for Linux/Unix platforms
		// tv.setInput(new File("/usr/"));
		tv.setInput(new File("C:\\"));
		return tv.getTree();
	}

}

