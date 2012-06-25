package tc.wfcf;

import javax.swing.SwingUtilities;

import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.kernel.TCCRDecision;
import com.teamcenter.rac.kernel.TCComponentSignoff;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.workflow.commands.newperformsignoff.DecisionDialog;

public class CustomDecisionDialog extends DecisionDialog {

	private static final long serialVersionUID = 1L;

	public TCComponentTask getTask() {
		return super.psTask;
	}

	protected final TaskEnv te;

	public CustomDecisionDialog(AIFDesktop desktop, TCComponentTask task,
			TCComponentSignoff signoff) {
		super(desktop, task, signoff);

		this.te = new TaskEnv(task, "CustomDecision.js",
				"tc.wfcf.CustomDecisionScript");
	}

	// TODO this is not compliant to Tc logic yet
	public boolean isFinishing() throws TCException {
		TCCRDecision myDecision = getDecision();
		for (TCComponentSignoff otherSO : psTask.getUserSignoffs()) {
			if (otherSO.equals(super.signoffObj)) // ignore my signoff
				continue;
			if (myDecision.getIntValue() != otherSO.getDecision().getIntValue())
				// have at least one different decision by others,
				// this task is not going to finish
				return false;
		}
		return true;
	}

	private boolean isFinishing = false;

	protected class CommitOp extends AbstractAIFOperation {
		public void executeOperation() throws Exception {
			try {
				if (isFinishing = isFinishing()) {
					if (!te.runHandlersBeforeDecision(getDecision())) {
						okB.setEnabled(true);
						return;
					}
				}
				SwingUtilities.invokeLater(new Runnable() {
					public void run() {
						CustomDecisionDialog.super.commitDecision();
					}
				});
			} catch (Exception e) {
				e.printStackTrace();
				MessageBox.post(e);
				okB.setEnabled(true);
			}
		}
	}

	@Override
	public void commitDecision() {
		super.okB.setEnabled(false);
		super.psTask.getSession().queueOperationLater(new CommitOp());
	}

	@Override
	public void endOperation() {
		super.endOperation();

		if (super.isDisplayable())
			// commit not successful, or the dialog should have been disposed
			return;

		try {
			if (isFinishing) {
				te.runHandlersAfterDecision(getDecision());
			}
		} catch (Exception e) {
			e.printStackTrace();
			MessageBox.post(e);
		}
	}

}
