package tc.util.ui;

import java.awt.Component;
import java.awt.Container;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JViewport;

public class UIUtil {

	public static JButton createImageButton(ImageIcon icon, String tooltip,
			ActionListener listener) {
		JButton b = new JButton(icon);
		if (tooltip != null)
			b.setToolTipText(tooltip);
		b.setMargin(new java.awt.Insets(0, 0, 0, 0));
		b.setOpaque(false);
		b.setFocusable(false);
		if (listener != null)
			b.addActionListener(listener);
		return b;
	}

	public static JButton createTextButton(String text, String tooltip,
			ActionListener listener) {
		JButton b = new JButton(text);
		if (tooltip != null)
			b.setToolTipText(tooltip);
		b.setMargin(new java.awt.Insets(0, 0, 0, 0));
		b.setOpaque(false);
		b.setFocusable(false);
		if (listener != null)
			b.addActionListener(listener);
		return b;
	}

	public static <T extends Container> T setNonOpaque(final T c) {
		if (c instanceof JPanel || c instanceof JScrollPane
				|| c instanceof JViewport) {
			((JComponent) c).setOpaque(false);
		}
		for (int i = 0; i < c.getComponentCount(); i++) {
			Component cc = c.getComponent(i);
			if (cc instanceof JComponent)
				setNonOpaque((JComponent) cc);
		}
		return c;
	}

}
