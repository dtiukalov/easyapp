package com.saturn.report.applet;

import javax.swing.JButton;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JRViewer;

public class JRViewerPlus extends JRViewer {

	private static final long serialVersionUID = -448272415243312932L;
	
	protected JButton btnPlus = new javax.swing.JButton();

	public JRViewerPlus(JasperPrint jrPrint) throws JRException {
		super(jrPrint);

		tlbToolBar.remove(btnSave);
		tlbToolBar.remove(btnReload);

		btnPlus = new javax.swing.JButton();
		btnPlus.setToolTipText("...");
		btnPlus.setText("...");
		btnPlus.setPreferredSize(new java.awt.Dimension(80, 23));
		btnPlus.setMaximumSize(new java.awt.Dimension(80, 23));
		btnPlus.setMinimumSize(new java.awt.Dimension(80, 23));
		tlbToolBar.add(btnPlus, 0);
	}

	protected void setZooms() {
		this.zooms = new int[] { 33, 66, 100, 133, 166, 200, 233 };
		this.defaultZoomIndex = 2;
	}

}
