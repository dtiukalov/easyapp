package com.fawvw.handlers;

import javax.swing.SwingUtilities;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;

import com.fawvw.ph.newreport.NewPHReportDialog;
import com.fawvw.ph.policy.PHReportConfig;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.ui.common.RACUIUtil;

public class NewPHReportHandler extends AbstractHandler {

	@Override
	public Object execute(ExecutionEvent ee) throws ExecutionException {
		final TCSession session = RACUIUtil.getTCSession();
		session.queueOperation(new AbstractAIFOperation() {
			@Override
			public void executeOperation() throws Exception {
				PHReportConfig config = PHReportConfig.getConfig(session);
				SwingUtilities.invokeLater(new NewPHReportDialog(config));
			}
		});
		return null;
	}

}
