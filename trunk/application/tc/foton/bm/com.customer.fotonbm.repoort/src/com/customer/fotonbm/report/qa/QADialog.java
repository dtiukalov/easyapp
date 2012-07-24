package com.customer.fotonbm.report.qa;

import java.awt.Frame;
import java.util.List;

import com.customer.fotonbm.report.common.AbstractBMDialog;
import com.customer.fotonbm.report.common.AbstractBmOperation;
import com.customer.fotonbm.report.utils.PrintLog;
import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.commands.newdataset.NewDatasetOperation;
import com.teamcenter.rac.kernel.TCSession;

@SuppressWarnings("serial")
public class QADialog extends AbstractBMDialog implements
		InterfaceAIFOperationListener {
	

	public QADialog(QACommand command, Frame frame, AbstractAIFApplication app,
			InterfaceAIFComponent pasteTargets[], PrintLog p) {
		super(command,frame, app,pasteTargets,p);
	}
	
	public String getTitle() {
		return "竞品车质量评价表";
	}

	@Override
	public void doInitUI() {

	}

	@Override
	public void doOperation() {
		List<InterfaceAIFComponent> components = getSelectedCompeteComponents();
		// 执行operation
		QAOperation operation = new QAOperation(session, components, printlog);
		operation.addOperationListener(QADialog.this);
		session.queueOperation(operation);
		
		newDatasetOp = new NewDatasetOperation(session,
				(AIFDesktop) frame, nameText.getText(), descText
						.getText(), null, null, "MSExcel", "MSExcel",
				openOnCreateCheckBox.isSelected(), operation
						.getImportFileName(), "Binary", "excel", false,
				pasteTargets);
		newDatasetOp
		.addOperationListener(QADialog.this);
		session.queueOperation(newDatasetOp);
	}

	@Override
	public AbstractBmOperation createBmOpration(TCSession session) {
		return new QAOperation(session,printlog);
	}
	
	

}
