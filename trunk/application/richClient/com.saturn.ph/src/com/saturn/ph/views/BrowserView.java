package com.saturn.ph.views;

import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.StructuredSelection;
import org.eclipse.swt.browser.CloseWindowListener;
import org.eclipse.swt.browser.WindowEvent;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.ui.ISelectionListener;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.IWorkbenchPart;
import org.eclipse.ui.part.ViewPart;

import com.saturn.ph.Activator;
import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.common.IContextInputService;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCPreferenceService;
import com.teamcenter.rac.util.OSGIUtil;
import com.teamcenter.rac.util.Utilities;

public class BrowserView extends ViewPart {
	private BrowserComposite browser;
	private String HomeUrl = "http://localhost:7001/tc/webclient";

	private ISelection selection;
	private ISelectionListener listener;
	private boolean firstTime = true;

	private class ViewSelectionListener implements ISelectionListener {

		@Override
		public void selectionChanged(IWorkbenchPart part, ISelection select) {
			selection = select;

			if (selection == null || selection.isEmpty()) {
				IContextInputService contextInputService = (IContextInputService) OSGIUtil
						.getService(Activator.getDefault(),
								IContextInputService.class);

				if (contextInputService != null) {
					selection = contextInputService.getInput();
				}
			}

			if (firstTime || part != BrowserView.this) {
				firstTime = false;

				if (selection != null) {
					changeUrl();
				}
			}
		}

	}

	public void changeUrl() {
		AIFComponentContext ctxt = null;

		try {
			ctxt = (AIFComponentContext) Utilities.getAdapter(
					((StructuredSelection) selection).getFirstElement(),
					AIFComponentContext.class, true);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			// e1.printStackTrace();
		}

		if (ctxt != null) {
			TCComponent comp = (TCComponent) ctxt.getComponent();
			if (comp != null) {
				try {
					String uid = comp.getUid();
					String name = comp.getProperty("object_name");

					String url = getUrlFromPreference(comp)
							+ uid;
					setUrl(url, "PH Preview - " + name);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public String getUrlFromPreference(TCComponent comp) {
		TCPreferenceService prefs = comp.getSession().getPreferenceService();

		return prefs.getString(TCPreferenceService.TC_preference_all,
				"FV9_PH_PREVIEW_URL",
				"http://localhost:8080/ph/app/pep/do/preview.do?uid=");
	}

	public void createPartControl(Composite paramComposite) {
		this.browser = new BrowserComposite(paramComposite, this.HomeUrl);
		this.browser.getBrowser().addCloseWindowListener(
				new CloseWindowListener() {
					public void close(WindowEvent paramWindowEvent) {
						BrowserView.this.closeView();
					}
				});

		this.listener = new ViewSelectionListener();

		super.getSite().getWorkbenchWindow().getSelectionService()
				.addSelectionListener(this.listener);
	}

	public void setFocus() {
		this.browser.setFocus();
	}

	public void setUrl(String url) {
		this.browser.setUrl(url);
	}

	public void setUrl(String url, String name) {
		setUrl(url);
		if (name != null) {
			setPartName(name);
		}
	}

	private void closeView() {
		IWorkbenchPage page = (getSite() != null) ? getSite().getPage() : null;
		if (page != null) {
			page.hideView(this);
		}
	}
}
