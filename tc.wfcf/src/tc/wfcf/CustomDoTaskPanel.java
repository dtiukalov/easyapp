package tc.wfcf;

import java.lang.reflect.Field;

import javax.swing.JPanel;
import javax.swing.JRadioButton;

import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.workflow.commands.dotask.DoTaskPanel;

public class CustomDoTaskPanel extends DoTaskPanel {

	private static final long serialVersionUID = 1L;

	protected final TaskEnv te;

	public CustomDoTaskPanel(AIFDesktop desktop, AbstractAIFDialog dialog,
			TCComponentTask task) {
		super(desktop, dialog, task);
		this.te = new TaskEnv(task, "CustomCompletion.js",
				"tc.wfcf.CustomCompletionScript");
	}

	public CustomDoTaskPanel(AIFDesktop desktop, JPanel panel,
			TCComponentTask task) {
		super(desktop, panel, task);
		this.te = new TaskEnv(task, "CustomCompletion.js",
				"tc.wfcf.CustomCompletionScript");
	}

	private transient boolean isUnableToComplete;

	@Override
	public void startOperation(String startMsg) {
		super.startOperation(startMsg);

		try {
			if (te.runHandlersBeforeCompletion(isUnableToComplete = isUnableToComplete()))
				return;
		} catch (Exception e) {
			e.printStackTrace();
		}

		throw new RuntimeException("Java handler canceled DoTask");
	}

	@Override
	public void endOperation() {
		super.endOperation();

		try {
			te.runHandlersAfterCompletion(isUnableToComplete);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected boolean isUnableToComplete() throws Exception {
		Field ucbField = DoTaskPanel.class
				.getDeclaredField("unableToCompleteRadioButton");
		ucbField.setAccessible(true);
		JRadioButton ucb = (JRadioButton) ucbField.get(this);
		return ucb.isSelected();
	}

}
