package tc.wfcf;

import java.awt.Frame;
import java.util.ArrayList;
import java.util.List;

import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.workflow.commands.complete.CompleteDialog;

public class CustomCompleteDialog extends CompleteDialog {

	private static final long serialVersionUID = 1L;

	protected final List<TaskEnv> doEnvs;

	public CustomCompleteDialog(TCComponentTask[] targets) {
		super(targets);
		this.doEnvs = new ArrayList<TaskEnv>(targets.length);
		for (int i = 0; i < targets.length; i++) {
			try {
				if (!targets[i].isTypeOf("EPMDoTask"))
					continue;
			} catch (TCException e) {
				e.printStackTrace();
				continue;
			}
			doEnvs.add(new TaskEnv(targets[i], "CustomCompletion.js",
					"tc.wfcf.CustomCompletionScript"));
		}
	}

	public CustomCompleteDialog(Frame d, TCComponentTask[] targets) {
		super(d, targets);
		this.doEnvs = new ArrayList<TaskEnv>(targets.length);
		for (int i = 0; i < targets.length; i++) {
			try {
				if (!targets[i].isTypeOf("EPMDoTask"))
					continue;
			} catch (TCException e) {
				e.printStackTrace();
				continue;
			}
			doEnvs.add(new TaskEnv(targets[i], "CustomCompletion.js",
					"tc.wfcf.CustomCompletionScript"));
		}
	}

	@Override
	public void startOperation(String startMsg) {
		super.startOperation(startMsg);

		try {
			for (TaskEnv te : this.doEnvs) {
				if (!te.runHandlersBeforeCompletion(false))
					throw new RuntimeException("Java handler canceled DoTask");
			}
		} catch (RuntimeException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Java handler failed", e);
		}
	}

	@Override
	public void endOperation() {
		super.endOperation();

		if (isVisible())
			// Operation has failed
			return;

		try {
			for (TaskEnv te : this.doEnvs) {
				te.runHandlersAfterCompletion(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
