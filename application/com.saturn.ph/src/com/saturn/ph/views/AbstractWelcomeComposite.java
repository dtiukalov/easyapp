package com.saturn.ph.views;

import org.eclipse.swt.widgets.Display;

public abstract class AbstractWelcomeComposite {
	private Display display;

	protected Display getDisplay() {
		return this.display;
	}

	protected void setDisplay(Display paramDisplay) {
		this.display = paramDisplay;
	}

	public abstract void setFocus();
}
