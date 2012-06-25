package tc.wfcf.auto;

import java.io.PrintStream;

import com.teamcenter.rac.kernel.TCComponentTask;

public class DecisionIgnore extends AutoProcessDecision implements
		AutoProcessor {

	@Override
	public AutoProcessDecision processTask(TCComponentTask task, PrintStream log)
			throws Exception {
		return this;
	}

	public static final DecisionIgnore instance = new DecisionIgnore();

	private DecisionIgnore() {
		super(-1L);
	}

	@Override
	public boolean allowFurtherProcess() {
		// allow more processors to process on it
		return true;
	}

	@Override
	public boolean shouldRetryNow() {
		// never retry
		return false;
	}

	@Override
	public boolean finishProcess(TCComponentTask task, PrintStream log)
			throws Exception {
		// never finish
		return false;
	}

}
