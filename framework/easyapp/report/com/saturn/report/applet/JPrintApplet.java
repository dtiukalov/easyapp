package com.saturn.report.applet;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;

import javax.swing.JApplet;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.util.JRLoader;

public class JPrintApplet extends JApplet {

	private static final long serialVersionUID = 7442434824506739403L;
	
	private URL url;
	private JasperPrint jasperPrint;

	public JPrintApplet() {
		initComponents();
	}

	public void init() {
		String strUrl = this.getParameter("url");
		
		if (strUrl != null) {
			try {
				url = new URL(getCodeBase(), strUrl);//?
			} catch (Exception e) {
				StringWriter swriter = new StringWriter();
				PrintWriter pwriter = new PrintWriter(swriter);
				e.printStackTrace(pwriter);
				JOptionPane.showMessageDialog(this, swriter.toString());
			}
		} else {
			JOptionPane.showMessageDialog(this, "Source URL not specified");
		}
	}

	private void initComponents() {// GEN-BEGIN:initComponents
		pnlMain = new JPanel();
		btnPrint = new JButton();
		btnView = new JButton();

		btnPrint.setText("打印");
//		btnPrint.addActionListener(new java.awt.event.ActionListener() {
//			public void actionPerformed(java.awt.event.ActionEvent evt) {
//				btnPrint();
//			}
//		});

		pnlMain.add(btnPrint);

		btnView.setText("预览");
//		btnView.addActionListener(new java.awt.event.ActionListener() {
//			public void actionPerformed(java.awt.event.ActionEvent evt) {
//				btnReview();
//			}
//		});

		pnlMain.add(btnView);

		getContentPane().add(pnlMain, java.awt.BorderLayout.WEST);

	}

	@SuppressWarnings("deprecation")
	public void btnReview() {// GEN-FIRST:event_btnViewActionPerformed
		if (url != null) {
			try {
				if (jasperPrint == null) {
					jasperPrint = (JasperPrint) JRLoader.loadObject(url);
				}
				
				if (jasperPrint != null) {
					ViewerFrame viewerFrame = new ViewerFrame(this.getAppletContext(), jasperPrint);
					viewerFrame.show();
				} else {
					JOptionPane.showMessageDialog(this, "Empty report.");
				}
			} catch (Exception e) {
				StringWriter swriter = new StringWriter();
				PrintWriter pwriter = new PrintWriter(swriter);
				e.printStackTrace(pwriter);
				JOptionPane.showMessageDialog(this, swriter.toString());
			}
		} else {
			JOptionPane.showMessageDialog(this, "Source URL not specified");
		}
	}

	public void btnPrint() {
		if (url != null) {
			if (jasperPrint == null) {
				try {
					jasperPrint = (JasperPrint) JRLoader.loadObject(url);
				} catch (JRException e) {
					e.printStackTrace();
				}
			}
			
			if (jasperPrint != null) {
				final JasperPrint print = jasperPrint;

				new Thread(new Runnable() {
					public void run() {
						try {
							JasperPrintManager.printReport(print, true);
						} catch (Exception e) {
							StringWriter swriter = new StringWriter();
							PrintWriter pwriter = new PrintWriter(swriter);
							e.printStackTrace(pwriter);
							JOptionPane.showMessageDialog(null, swriter.toString());
						}
					}
				}).start();
			} else {
				JOptionPane.showMessageDialog(this, "Empty report.");
			}
			
		} else {
			JOptionPane.showMessageDialog(this, "Source URL not specified");
		}
	}
	
	private JPanel pnlMain;
	private JButton btnView;
	private JButton btnPrint;
}
