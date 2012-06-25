package tc.wfcf.auto;

import java.io.PrintStream;

import com.teamcenter.rac.kernel.TCComponentTask;

public interface AutoProcessor {

	AutoProcessDecision processTask(TCComponentTask task, PrintStream log)
			throws Exception;

}
