package gctc.common;

import com.teamcenter.rac.kernel.Markpoint;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.Registry;

public class TcTX {

	public static volatile TcRollbackHandler rollbackHandler;

	protected final Markpoint mp;

	public TcTX(TCSession session) throws TCException {
		this.mp = new Markpoint(session);
	}

	public void commit() throws TCException {
		mp.forget();
	}

	public boolean rollback() throws TCException {
		boolean serverRolledBack = mp.rollBack();
		// if (serverRolledBack)
		{
			if (rollbackHandler == null) {
				Registry reg = Registry.getRegistry(this);
				rollbackHandler = new RestartReminder(
						reg.getString(
								"RESTART_REMINDER_MSG",
								"Teamcenter has recovered from data failure, to prevent data corruption, Rich Client has to restart ASAP, your work will be resumed after restart."));
			}
			rollbackHandler.handleRollback();
		}
		return serverRolledBack;
	}

}
