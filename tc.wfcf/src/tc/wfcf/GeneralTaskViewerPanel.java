package tc.wfcf;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.workflow.commands.complete.CompleteOperation;
import com.teamcenter.rac.workflow.commands.formtask.FormTaskPanel;

/**
 * 
 * Example viewer panel for custom task types
 * 
 */
public class GeneralTaskViewerPanel extends JPanel {

	private static final long serialVersionUID = 1L;

	private final TCComponentTask task;

	public GeneralTaskViewerPanel(AIFDesktop desktop, JPanel parent,
			TCComponentTask task) throws Exception {
		this(desktop, (AbstractAIFDialog) null, task);
	}

	public GeneralTaskViewerPanel(AIFDesktop desktop, AbstractAIFDialog parent,
			TCComponentTask task) throws Exception {
		super(new BorderLayout());

		this.task = task;

		// be compatible with EPM-display-form
		if (task.getTaskForm() != null) {
			FormTaskPanel formPanel = new FormTaskPanel(task);
			this.add(BorderLayout.CENTER, formPanel);
			return;
		}

		// initialize customized viewer component
		this.add(BorderLayout.CENTER, new JLabel("Click complete to finish"));
		JButton b = new JButton("Complete");
		b.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent evt) {
				try {
					completeTask();
				} catch (Exception e) {
					e.printStackTrace();
					MessageBox.post(e);
				}
			}
		});
		this.add(BorderLayout.SOUTH, b);
	}

	protected void completeTask() throws Exception {
		CompleteOperation.triggerComplete(task, "comments", "password");
		super.setVisible(false);
	}

}
