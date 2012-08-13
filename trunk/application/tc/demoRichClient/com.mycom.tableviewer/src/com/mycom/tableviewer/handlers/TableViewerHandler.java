package com.mycom.tableviewer.handlers;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

/**
 * Our TableViewerHandler extends AbstractHandler
 * @see org.eclipse.core.commands.AbstractHandler
 */
public class TableViewerHandler extends AbstractHandler {
	/**
	 * The constructor.
	 */
	public TableViewerHandler() {
	}

	/**
	 * the command has been executed, so extract extract the needed information
	 * from the application context.
	 */
	public Object execute(ExecutionEvent event) throws ExecutionException {
		return new TableViewerExample();
	}
}