package gctc.common;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.IWorkbench;
import org.eclipse.ui.PlatformUI;

import com.teamcenter.rac.util.ButtonLayout;
import com.teamcenter.rac.util.Registry;

public class RestartReminder extends JFrame implements TcRollbackHandler {

	private static final long serialVersionUID = 1L;

	public RestartReminder(String msg) {
		super("Rich Client needs to restart");

		Registry reg = Registry.getRegistry(this);

		JPanel msgp = new JPanel(new BorderLayout());
		msgp.add(BorderLayout.CENTER, new JLabel(msg));
		msgp.setBorder(new EmptyBorder(20, 50, 30, 20));
		getContentPane().add(BorderLayout.CENTER, msgp);
		JPanel btnp = new JPanel(new ButtonLayout());
		JButton okb = new JButton(reg.getString("RESTART_NOW", "Restart Now"));
		okb.setToolTipText(reg.getString("RESTART_TIP",
				"Click to restart Rich Client"));
		okb.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Display.getDefault().asyncExec(new Runnable() {
					public void run() {
						IWorkbench wb = PlatformUI.getWorkbench();
						wb.restart();
					}
				});
				setVisible(false);
			}
		});
		btnp.add(okb);
		getContentPane().add(BorderLayout.SOUTH, btnp);
		setMinimumSize(new Dimension(300, 120));
		pack();
		setLocationRelativeTo(null);
		setVisible(true);
	}

	public void popup() {
		if (!isVisible())
			return;
		setState(Frame.NORMAL);
		toFront();
		requestFocus();
	}

	private transient Thread th;

	public void startReminding() {
		this.setVisible(true);
		this.popup();
		if (th == null || th.isAlive()) {
			th = new Thread("Restart Reminder") {
				public void run() {
					while (RestartReminder.this.isVisible()) {
						// popup every 10 seconds
						RestartReminder.this.popup();
						try {
							Thread.sleep(10 * 1000L);
						} catch (InterruptedException e) {
							break;
						}
					}
				}
			};
			th.start();
		}
	}

	@Override
	public void handleRollback() {
		startReminding();
	}

}
