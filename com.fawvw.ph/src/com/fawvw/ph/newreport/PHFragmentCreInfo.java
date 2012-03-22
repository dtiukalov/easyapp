package com.fawvw.ph.newreport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fawvw.ph.policy.PHFragmentPolicy;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;

public class PHFragmentCreInfo {

	public final PHReportCreInfo report;

	public final PHFragmentPolicy policy;

	public final TCComponent srcCmp;

	public final List<TCComponentGroupMember> owners;

	public PHFragmentCreInfo(PHReportCreInfo report, PHFragmentPolicy policy,
			Map<String, Map<String, TCComponentItemRevision>> msm,
			List<TCComponentGroupMember> tms) throws Exception {
		this.report = report;
		this.policy = policy;

		System.err.println(" *** Finding " + policy + " ...");
		TCComponent sc = null;
		Map<String, TCComponentItemRevision> sameMS = msm.get(report.fv9MLName);
		if (sameMS != null) {
			System.err.println("  ** Searching same milestone "
					+ report.fv9MLName + " ...");
			int typeIdx = 0;
			while (typeIdx < policy.config.types2CopyInSameMS.size()
					&& report.fv9PHType.equals(policy.config.types2CopyInSameMS
							.get(typeIdx)))
				typeIdx++;
			search_sc: for (typeIdx++; typeIdx < policy.config.types2CopyInSameMS
					.size(); typeIdx++) {
				String tryType = policy.config.types2CopyInSameMS.get(typeIdx);
				TCComponentItemRevision tryRpt = sameMS.get(tryType);
				if (tryRpt == null) {
					System.err.println("   * No rpt of PH type " + tryType);
					continue;
				}
				System.err.println("   * Searching rpt of PH type " + tryType
						+ " : " + tryRpt);
				for (TCComponent c : tryRpt
						.getRelatedComponents(policy.relation)) {
					if (policy.isValidSrc(c)) {
						sc = c;
						break search_sc;
					}
				}
			}
			if (sc == null)
				System.err.println("  ** Not found in same milestone "
						+ report.fv9MLName);
			else
				System.err.println("  ** Found in same milestone "
						+ report.fv9MLName + " : " + sc);
		}
		if (sc == null) {
			int idxMS;
			for (idxMS = policy.config.milestones.size() - 1; idxMS >= 0; idxMS--) {
				if (report.fv9MLName
						.equals(policy.config.milestones.get(idxMS))) {
					break;
				}
			}
			search_sc: for (idxMS--; idxMS >= 0; idxMS--) {
				String tryMS = policy.config.milestones.get(idxMS);
				Map<String, TCComponentItemRevision> prevMS = msm.get(tryMS);
				if (prevMS == null) {
					System.err.println("  ** Not rpt in milestone " + tryMS);
					continue;
				}
				System.err
						.println("  ** Searching milestone " + tryMS + " ...");
				for (String tryType : policy.config.types2CopyInPrevMS) {
					TCComponentItemRevision tryRpt = prevMS.get(tryType);
					if (tryRpt == null) {
						System.err.println("   * No rpt of PH type " + tryType);
						continue;
					}
					System.err.println("   * Searching rpt of PH type "
							+ tryType + " : " + tryRpt);
					for (TCComponent c : tryRpt
							.getRelatedComponents(policy.relation)) {
						if (policy.isValidSrc(c)) {
							sc = c;
							break search_sc;
						}
					}
				}
			}
		}
		if (sc == null) {
			System.err.println("  ** Searching root template...");
			for (TCComponent c : policy.config.rootTemplate
					.getRelatedComponents(policy.relation)) {
				if (policy.isValidSrc(c)) {
					sc = c;
					break;
				}
			}
		}
		this.srcCmp = sc;
		if (sc == null) {
			new TCException(" *** Not found even in root template: " + policy)
					.printStackTrace();
		} else {
			System.err.println(" *** Found " + policy + " << " + sc);
		}

		this.owners = new ArrayList<TCComponentGroupMember>(tms.size());
		for (TCComponentGroupMember tm : tms) {
			if (policy.isTeamMemberQualify(tm)) {
				owners.add(tm);
			}
		}
	}

	protected TCComponentGroupMember selectedOwner = null;

	public TCComponentGroupMember getSelectedOwner() {
		if (selectedOwner != null)
			return selectedOwner;
		if (owners.size() == 1)
			return owners.get(0);
		return null;
	}

	public void setSelectedOwner(TCComponentGroupMember selectedOwner) {
		this.selectedOwner = selectedOwner;
	}

	public boolean isReady() {
		if (srcCmp == null) {
			return false;
		}
		boolean released = false;
		try {
			released = null != srcCmp.getDateProperty("date_released");
		} catch (TCException e) {
			e.printStackTrace();
		}
		if (!released)
			return false;
		return selectedOwner != null || owners.size() == 1;
	}

	private TCComponent newCmp = null;

	public TCComponent doCopy() throws TCException {
		if (newCmp != null) {
			throw new IllegalStateException("已经复制了: " + policy);
		}

		if (srcCmp == null)
			return null;
		if (srcCmp instanceof TCComponentForm) {
			newCmp = ((TCComponentForm) srcCmp).saveAs(srcCmp
					.getProperty("object_name"));
		} else if (srcCmp instanceof TCComponentDataset) {
			newCmp = ((TCComponentDataset) srcCmp).saveAs(srcCmp
					.getProperty("object_name"));
		}

		if (newCmp == null)
			return null;

		TCProperty[] props = newCmp.getTCProperties(new String[] {
				"fv9PreRelesed", "fv9PlatformType" });
		props[0].setStringValueData("");
		props[1].setStringValueData(report.fv9PlatformType);
		newCmp.setTCProperties(props);

		return newCmp;
	}

	public void doAssignNewOwner() throws TCException {
		if (newCmp == null)
			return;
		TCComponentGroupMember newOwner = getSelectedOwner();
		if (newOwner == null)
			return;
		newCmp.changeOwner(newOwner.getUser(), newOwner.getGroup());
	}

}
