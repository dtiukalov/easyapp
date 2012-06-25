package tc.wfcf;

import com.teamcenter.rac.kernel.TCComponentProcess;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCException;

public abstract class WFUtil {

	public static String fullName(TCComponentTask task) throws TCException {
		TCComponentTask pt = task.getParent();
		if (pt == null) {
			TCComponentProcess job = task.getProcess();
			return job.getName() + ": " + task.getName();
		}
		return fullName(pt) + "." + task.getName();
	}

	public static String universalName(TCComponentTask task) throws TCException {
		return fullName(task) + "(" + task.getUid() + ")";
	}

}
