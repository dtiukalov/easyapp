package tc.wfcf.auto;

import java.io.PrintStream;

import com.teamcenter.rac.kernel.TCCRDecision;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCComponentSignoff;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.workflow.commands.complete.CompleteOperation;

public class DecisionApproval extends AutoProcessDecision implements
		AutoProcessor {

	@Override
	public AutoProcessDecision processTask(TCComponentTask task, PrintStream log)
			throws Exception {
		return this;
	}

	protected final String comments;
	protected final boolean allowFurtherProcess;

	public DecisionApproval(String comments, long retryDelay,
			boolean allowFurtherProcess) {
		super(retryDelay);
		this.comments = comments;
		this.allowFurtherProcess = allowFurtherProcess;
	}

	@Override
	public boolean allowFurtherProcess() {
		return this.allowFurtherProcess;
	}

	@Override
	public boolean finishProcess(TCComponentTask task, PrintStream log)
			throws Exception {
		return finishTask(task, comments);
	}

	public static boolean finishTask(TCComponentTask task, String comments)
			throws Exception {
		TCSession session = task.getSession();
		if (task.isTypeOf("EPMPerformSignoffTask")) {
			int processCount = 0;
			for (TCComponentSignoff signoff : task.getValidSignoffs()) {
				TCCRDecision decision = signoff.getDecision();
				if (decision.getIntValue() != TCCRDecision.NO_DECISION
						.getIntValue())
					// ignore signoffs already approved or rejected
					continue;
				TCComponentGroupMember gm = signoff.getGroupMember();
				if (gm == null)
					// is a resource pool, ignore
					continue;
				if (session.getUser() == gm.getUser()) {
					signoff.updateDecision(TCCRDecision.APPROVE_DECISION,
							comments, "");
					task.performAction(104 /* EPM_APPROVE_ACTION */, comments);
					processCount++;
				}
			}
			return processCount > 0;
		} else if (task.isTypeOf("EPMDoTask")) {
			CompleteOperation.triggerComplete(task, comments, null);
			return true;
		} else {
			return false;
		}
	}

}
