package com.mycom.treeviewer.handlers;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

/**
 * TreeViewerHandler extends AbstractHandler, an IHandler base class.
 * @see org.eclipse.core.commands.IHandler
 * @see org.eclipse.core.commands.AbstractHandler
 */
public class TreeViewerHandler extends AbstractHandler {
	/**
	 * The constructor.
	 */
	public TreeViewerHandler() {
	}

	/**
	 * the command has been executed, so extract extract the needed information
	 * from the application context.
	 */
	public Object execute(ExecutionEvent event) throws ExecutionException {
		Explorer explorer = new Explorer();
	    explorer.setBlockOnOpen(true);
	    explorer.open();
		return null;
	}
}

