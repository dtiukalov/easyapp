package tc.wfcf.auto;

import java.io.PrintStream;

import com.teamcenter.rac.kernel.TCComponentTask;

public abstract class AutoProcessDecision {

	protected long decisionTime;

	protected long postponeDelay;

	public AutoProcessDecision(long postponeDelay) {
		decisionTime = System.currentTimeMillis();
		this.postponeDelay = postponeDelay;
	}

	public abstract boolean allowFurtherProcess();

	public abstract boolean finishProcess(TCComponentTask task, PrintStream log)
			throws Exception;

	public boolean willRetry() {
		return this.postponeDelay >= 0;
	}

	public long getRetryTime() {
		if (this.postponeDelay < 0)
			return -1L;
		return decisionTime + postponeDelay;
	}

	public boolean shouldRetryNow() {
		if (this.postponeDelay < 0)
			return false;
		return System.currentTimeMillis() >= decisionTime + postponeDelay;
	}

	public void postpone() {
		this.decisionTime = System.currentTimeMillis();
	}

	protected void postpone(long delayMillis) {
		this.decisionTime = System.currentTimeMillis();
		this.postponeDelay = delayMillis;
	}

}
