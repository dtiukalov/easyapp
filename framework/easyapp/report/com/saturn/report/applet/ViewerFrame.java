/*
 * JasperReports - Free Java Reporting Library.
 * Copyright (C) 2001 - 2009 Jaspersoft Corporation. All rights reserved.
 * http://www.jaspersoft.com
 *
 * Unless you have purchased a commercial license agreement from Jaspersoft,
 * the following license terms apply:
 *
 * This program is part of JasperReports.
 *
 * JasperReports is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * JasperReports is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with JasperReports. If not, see <http://www.gnu.org/licenses/>.
 */
package com.saturn.report.applet;

import java.applet.AppletContext;
import java.awt.BorderLayout;
import java.net.MalformedURLException;
import java.net.URL;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRHyperlink;
import net.sf.jasperreports.engine.JRPrintHyperlink;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JRHyperlinkListener;

public class ViewerFrame extends JFrame implements JRHyperlinkListener {

	private static final long serialVersionUID = -7740396099940724999L;

	private AppletContext appletContext;

	public ViewerFrame(AppletContext appletContext, JasperPrint jasperPrint)
			throws JRException {

		initComponents();

		this.appletContext = appletContext;

		JRViewerPlus viewer = new JRViewerPlus(jasperPrint);
		viewer.addHyperlinkListener(this);
		this.pnlMain.add(viewer, BorderLayout.CENTER);
	}

	/**
	 *
	 */
	public void gotoHyperlink(JRPrintHyperlink hyperlink) {
		switch (hyperlink.getHyperlinkType()) {
		case JRHyperlink.HYPERLINK_TYPE_REFERENCE: {
			try {
				this.appletContext.showDocument(
						new URL(hyperlink.getHyperlinkReference()), "_blank");
			} catch (MalformedURLException e) {
				JOptionPane.showMessageDialog(this, e.getMessage());
			}
			break;
		}
		case JRHyperlink.HYPERLINK_TYPE_LOCAL_ANCHOR:
		case JRHyperlink.HYPERLINK_TYPE_LOCAL_PAGE: {
			break;
		}
		case JRHyperlink.HYPERLINK_TYPE_REMOTE_ANCHOR:
		case JRHyperlink.HYPERLINK_TYPE_REMOTE_PAGE: {
			JOptionPane
					.showMessageDialog(this,
							"Implement your own JRHyperlinkListener to manage this type of event.");
			break;
		}
		case JRHyperlink.HYPERLINK_TYPE_NONE:
		default: {
			break;
		}
		}
	}

	private void initComponents() {// GEN-BEGIN:initComponents
		pnlMain = new javax.swing.JPanel();

		setTitle("JasperViewer");
		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
		pnlMain.setLayout(new java.awt.BorderLayout());

		getContentPane().add(pnlMain, java.awt.BorderLayout.CENTER);

		pack();
		java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit()
				.getScreenSize();
		setSize(new java.awt.Dimension(400, 300));
		setLocation((screenSize.width - 400) / 2, (screenSize.height - 300) / 2);
	}

	private javax.swing.JPanel pnlMain;
}
