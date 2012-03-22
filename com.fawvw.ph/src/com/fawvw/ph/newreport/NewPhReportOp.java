package com.fawvw.ph.newreport;

import javax.swing.SwingUtilities;

import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;

import com.fawvw.ph.policy.PHReportConfig;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentFolder;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.services.ISelectionMediatorService;
import com.teamcenter.rac.util.MessageBox;

public class NewPhReportOp extends AbstractAIFOperation {

	public final PHReportConfig config;

	/**
	 * 里程碑
	 */
	public final String fv9MLName;

	/**
	 * 会议类型
	 */
	public final String fv9PHType;

	/**
	 * 汇报周数
	 */
	public final String fv9ReportKW;

	/**
	 * 汇报轮次
	 */
	public final String fv9ReportRound;

	/**
	 * 品牌
	 */
	public final String fv9PlatformType;

	public NewPhReportOp(PHReportConfig config, String fv9MLName,
			String fv9PHType, String fv9ReportKW, String fv9ReportRound,
			String fv9PlatformType) {
		this.config = config;
		this.fv9MLName = fv9MLName;
		this.fv9PHType = fv9PHType;
		this.fv9ReportKW = fv9ReportKW;
		this.fv9ReportRound = fv9ReportRound;
		this.fv9PlatformType = fv9PlatformType;
	}

	protected PHReportCreInfo reportCI = null;

	@Override
	public void executeOperation() throws Exception {
		try {
			if (reportCI == null) {
				reportCI = new PHReportCreInfo(config, fv9MLName, fv9PHType,
						fv9ReportKW, fv9ReportRound, fv9PlatformType);
			}
			if (!reportCI.isReady()) {
				SwingUtilities.invokeLater(new FragmentsPromptDialog(this));
				return;
			}
			TCComponentItemRevision newRev = reportCI.doCreate();
			if (newRev == null)
				return;
			TCComponentFolder paste2Folder = null;
			BundleContext bundleCtx = FrameworkUtil.getBundle(this.getClass())
					.getBundleContext();
			ServiceReference sr = bundleCtx
					.getServiceReference(ISelectionMediatorService.class
							.getName());
			ISelectionMediatorService selectionSvc = (ISelectionMediatorService) bundleCtx
					.getService(sr);
			InterfaceAIFComponent[] pasteTargets = selectionSvc
					.getTargetComponents();
			if (pasteTargets != null) {
				for (InterfaceAIFComponent t : pasteTargets) {
					if (t instanceof TCComponentFolder) {
						paste2Folder = (TCComponentFolder) t;
					}
				}
			}
			if (paste2Folder == null) {
				paste2Folder = newRev.getSession().getUser()
						.getNewStuffFolder();
			}
			paste2Folder.add("contents", newRev.getItem());
		} catch (Exception e) {
			e.printStackTrace();
			MessageBox.post(e);
			throw e;
		}
	}

}
