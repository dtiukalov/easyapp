package com.saturn.ph.views;

import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.LocationEvent;
import org.eclipse.swt.browser.LocationListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.widgets.ToolBar;
import org.eclipse.swt.widgets.ToolItem;

import com.saturn.ph.Activator;

public class BrowserComposite extends AbstractWelcomeComposite {
	private Browser browser;
	private String HomeUrl = "http://localhost:7001/tc/webclient";

	public BrowserComposite(Composite paramComposite, String paramString) {
		if (paramString != null)
			setHomeUrl(paramString);
		initialize(paramComposite);
	}

	public void initialize(Composite paramComposite) {
		paramComposite.setLayout(new FormLayout());
		Composite localComposite = new Composite(paramComposite, 8388608);
		
		FormData localFormData = new FormData();
		localFormData.top = new FormAttachment(0, 0);
		localFormData.left = new FormAttachment(0, 0);
		localFormData.right = new FormAttachment(100, 0);
		localComposite.setLayoutData(localFormData);
		
		Label localLabel = new Label(paramComposite, 0);
		localFormData = new FormData();
		localFormData.left = new FormAttachment(0, 0);
		localFormData.right = new FormAttachment(100, 0);
		localFormData.bottom = new FormAttachment(100, 0);
		localLabel.setLayoutData(localFormData);
		
		this.browser = new Browser(paramComposite, 2048);
		localFormData = new FormData();
		localFormData.top = new FormAttachment(localComposite);
		localFormData.bottom = new FormAttachment(localLabel);
		localFormData.left = new FormAttachment(0, 0);
		localFormData.right = new FormAttachment(100, 0);
		this.browser.setLayoutData(localFormData);
		
		localComposite.setLayout(new GridLayout(7, false));
		this.browser.setUrl(this.HomeUrl);
		final Text localText = new Text(localComposite, 2048);
		localText.setLayoutData(new GridData(768));
		localText.setFocus();
		localText.setEditable(false);
		localText.addListener(14, new Listener() {
			public void handleEvent(Event paramEvent) {
				BrowserComposite.this.browser.setUrl(localText.getText());
			}
		});
		ToolBar localToolBar = new ToolBar(localComposite, 8388608);
		ToolItem localToolItem = new ToolItem(localToolBar, 0);
		ImageDescriptor localImageDescriptor = Activator
				.getImageDescriptor("/icons/home_16.png");
		Image localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Home");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				BrowserComposite.this.browser
						.setUrl(BrowserComposite.this.HomeUrl);
			}
		});
		localToolItem = new ToolItem(localToolBar, 0);
		localImageDescriptor = Activator.getImageDescriptor("/icons/back_16.png");
		localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Back to the previous page");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				BrowserComposite.this.browser.back();
			}
		});
		localToolItem = new ToolItem(localToolBar, 0);
		localImageDescriptor = Activator.getImageDescriptor("/icons/forward_16.png");
		localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Forward to the next page");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				BrowserComposite.this.browser.forward();
			}
		});
		localToolItem = new ToolItem(localToolBar, 0);
		localImageDescriptor = Activator.getImageDescriptor("/icons/reload_16.png");
		localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Refresh the current page");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				BrowserComposite.this.browser.refresh();
			}
		});
		localToolItem = new ToolItem(localToolBar, 0);
		localImageDescriptor = Activator.getImageDescriptor("/icons/aborted_16.png");
		localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Stop loading the current page");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				BrowserComposite.this.browser.stop();
			}
		});
		localToolItem = new ToolItem(localToolBar, 0);
		localImageDescriptor = Activator.getImageDescriptor("/icons/print_16.png");
		localImage = localImageDescriptor.createImage();
		localToolItem.setImage(localImage);
		localToolItem.setToolTipText("Print the current page");
		localToolItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent paramSelectionEvent) {
				String str = "javascript:print()";
				BrowserComposite.this.browser.execute(str);
			}
		});
		this.browser.addLocationListener(new LocationListener() {
			public void changing(LocationEvent paramLocationEvent) {
				localText.setText("Loading"
						+ paramLocationEvent.location
						+ "...");
			}

			public void changed(LocationEvent paramLocationEvent) {
				localText.setText(paramLocationEvent.location);
			}
		});
	}

	public void setFocus() {
		this.browser.setFocus();
	}

	public void setUrl(String paramString) {
		this.browser.setUrl(paramString);
	}

	public void setHomeUrl(String paramString) {
		this.HomeUrl = paramString;
	}

	public Browser getBrowser() {
		return this.browser;
	}
}
