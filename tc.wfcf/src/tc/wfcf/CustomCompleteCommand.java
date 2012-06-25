package tc.wfcf;

import java.awt.Frame;

import com.teamcenter.rac.kernel.TCComponentTask;

public class CustomCompleteCommand extends
		com.teamcenter.rac.workflow.commands.complete.CompleteCommand {

	public CustomCompleteCommand(Frame d, TCComponentTask[] targets) {
		super(d, null);
		setRunnable(new CustomCompleteDialog(d, targets));
	}

	public CustomCompleteCommand(TCComponentTask[] targets) {
		super(null);
		setRunnable(new CustomCompleteDialog(targets));
	}

}
