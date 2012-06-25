package tc.wfcf;

import com.teamcenter.rac.kernel.TCCRDecision;
import com.teamcenter.rac.kernel.TCComponentTask;

public interface JavaHandler {

	boolean handleDecision(TCComponentTask task, TCCRDecision decision)
			throws Exception;

	boolean handleCompletion(TCComponentTask task, boolean unableToComplete)
			throws Exception;

	Object getMessage();

}
