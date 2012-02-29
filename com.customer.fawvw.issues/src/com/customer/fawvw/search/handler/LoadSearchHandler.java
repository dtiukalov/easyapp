package com.customer.fawvw.search.handler;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.handlers.HandlerUtil;

import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.aif.navigationpane.IApplicationTaskPaneSection;
import com.teamcenter.rac.aifrcp.AIFUtility;
import com.teamcenter.rac.common.taskpane.QuerySectionComponent;
import com.teamcenter.rac.explorer.common.TCComponentSearch;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentQuery;
import com.teamcenter.rac.kernel.TCComponentQueryType;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Registry;

/**
 * Our sample handler extends AbstractHandler, an IHandler base class.
 * 
 * @see org.eclipse.core.commands.IHandler
 * @see org.eclipse.core.commands.AbstractHandler
 */
public class LoadSearchHandler extends AbstractHandler {
	/**
	 * The constructor.
	 */

	//private static Logger logger = Logger.getLogger("MySaveDataSearchHandler");
	TCSession m_session = (TCSession) AIFUtility.getCurrentApplication()
			.getSession();

	public LoadSearchHandler() {
	}

	/**
	 * the command has been executed, so extract extract the needed information
	 * from the application context.
	 */
	public Object execute(ExecutionEvent event) throws ExecutionException {
		IWorkbenchWindow window = HandlerUtil
				.getActiveWorkbenchWindowChecked(event);
//		MessageDialog.openInformation(window.getShell(), "Exitcommand Plug-in",
//				"Hello, emily world!!!!!!!!!!!!!");
		InterfaceAIFComponent selectComp = AIFUtility.getCurrentApplication()
				.getTargetComponent();

		//System.out.println(selectComp.getObjectString());
//		System.out.println(selectComp.getType());
		if (selectComp instanceof TCComponent) {
			String type = selectComp.getType();
//			MessageDialog.openInformation(window.getShell(), "Plug-in",
//			type);
			if (type.equals("SavedSearch")) { //$NON-NLS-1$
				TCComponent tcComp = (TCComponent)selectComp;
				final TCComponentSearch search = new TCComponentSearch(tcComp);
				loadSearch(search);
//				MessageDialog.openInformation(window.getShell(), "Plug-in",
//				"111111111111111111111111111111111111");
			}
		}

		return null;

	}

	private void loadSearch(final TCComponentSearch newSearch) {

		final String populateSavedSearchMessage = Registry.getRegistry(
				"com.teamcenter.rac.common.taskpane.dialogs.dialogs") //$NON-NLS-1$
				.getString("getDescriptionSavedSearches.MESSAGE"); //$NON-NLS-1$

		Job job = new Job("Getting searches") { //$NON-NLS-1$
			@Override
			protected IStatus run(IProgressMonitor monitor) {

				monitor.beginTask(populateSavedSearchMessage, -1); // Indeterminate
				try {
					newSearch.populateSavedSearchDetails();
					final String[] names = newSearch.getCriteriaNames();
					final String[] values = newSearch.getCriteriaValues();
					final boolean multilevel = newSearch.isMultiLevelResults();
					final String searchName = newSearch.getSearchName();
					// find the query component by searching the query name
					// newSearch.getMySavedSearch().getSession();
					TCComponentQueryType queryType = (TCComponentQueryType) m_session
							.getTypeComponent("ImanQuery"); //$NON-NLS-1$
					final TCComponent query = queryType.find(newSearch
							.getQueryName());

					if (query != null && query instanceof TCComponentQuery) {
						Display.getDefault().asyncExec(new Runnable() {
							public void run() {
								IApplicationTaskPaneSection taskPane = null;
								QuerySectionComponent qc = (QuerySectionComponent) QuerySectionComponent
										.createQuerySectionComponent(query,
												taskPane, searchName, names,
												values);

								qc.setMultiLevelSearch(multilevel);

								((TCComponentQuery) query).setData(qc);
								qc.open();

							}
						});
					}
				} catch (Exception e) {
				//	logger.error("Problem while loading a selected query", e); //$NON-NLS-1$
					MessageBox.post(AIFUtility.getActiveDesktop(), e);
				}
				monitor.done();
				return Status.OK_STATUS;
			}
		};
		job.schedule(); // required to queue the job

	}
}