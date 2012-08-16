package com.fawvw.ph.newreport;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fawvw.ph.policy.PHFragmentPolicy;
import com.fawvw.ph.policy.PHReportConfig;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentItemType;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;

public class PHReportCreInfo {

//	既有已发布报告又有未发布报告时，优先选用已发布报告；
//	都是已发布报告时，优先选用发布时间晚的报告。
	public static boolean isReportMorePreferable(TCComponentItemRevision rpt,
			TCComponentItemRevision thanRpt) throws TCException {
		if (thanRpt == null)
			return true;
		Date thanRelDate = thanRpt.getDateProperty("date_released");
		System.out.println("thanRelDate date_released = " + thanRelDate);
		Date relDate = rpt.getDateProperty("date_released");
		System.out.println("relDate date_released = " + relDate);
		
        if (relDate != null) {                                                
        	if(thanRelDate == null)                                                                
        		return true;                                                
        	return relDate.getTime() > thanRelDate.getTime();                                
        }                                
        Date creDate = rpt.getDateProperty("creation_date");                                
        Date thanCreDate = thanRpt.getDateProperty("creation_date");                                
        return creDate.getTime() > thanCreDate.getTime();

	}

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

	public final TCComponentItemRevision lastRpt;

	public final List<PHFragmentCreInfo> fragments;

	public PHReportCreInfo(PHReportConfig config, String fv9mlName,
			String fv9phType, String fv9ReportKW, String fv9ReportRound,
			String fv9PlatformType) throws Exception {
		this.config = config;
		this.fv9MLName = fv9mlName;
		this.fv9PHType = fv9phType;
		this.fv9ReportKW = fv9ReportKW;
		this.fv9ReportRound = fv9ReportRound;
		this.fv9PlatformType = fv9PlatformType;

		this.fragments = new ArrayList<PHFragmentCreInfo>(
				config.fragments.size());

		TCSession session = config.rootTemplate.getSession();
		TCComponentProject prj = session.getCurrentProject();
		if (prj == null) {
			throw new TCException("未设置当前项目!");
		}
		prj.clearCache();
		prj.refresh();
		Map<String, Map<String, TCComponentItemRevision>> msm = new HashMap<String, Map<String, TCComponentItemRevision>>();
		int count = 0;
//		查找当前项目的数据
		for (TCComponent c : prj.getRelatedComponents("project_data")) {
//			如果不是PH汇报，继续查找
			if (!c.isTypeOf("FV9PHReportRevision"))
				continue;
			TCComponentItemRevision rpt = (TCComponentItemRevision) c;
			int active_seq = rpt.getIntProperty("active_seq");
			if (active_seq != 1)
				continue;
			if(null == rpt.getDateProperty("date_released"))
				continue;
			String ms = rpt.getStringProperty("fv9MLName");
			String t = rpt.getStringProperty("fv9PHType");
			Map<String, TCComponentItemRevision> tm = msm.get(ms);
			if (tm == null) {
				tm = new HashMap<String, TCComponentItemRevision>();
				msm.put(ms, tm);
			}
			
			if (isReportMorePreferable(rpt, tm.get(t))) {
				tm.put(t, rpt);
			}
		}
		List<TCComponentGroupMember> gms = new ArrayList<TCComponentGroupMember>();
		TCComponent[] teamMembers = (TCComponent[]) prj.getTeam().get(0);
		for (TCComponent teamMember : teamMembers) {
			if (teamMember instanceof TCComponentGroupMember) {
				gms.add((TCComponentGroupMember) teamMember);
			}
		}

		lastRpt = findLastReport(msm);

		for (PHFragmentPolicy fp : config.fragments) {
			if (fp.shouldPresentForMilestone(fv9mlName)) {
				PHFragmentCreInfo fci = new PHFragmentCreInfo(this, fp, msm,
						gms);
				this.fragments.add(fci);
			}
		}
	}

	protected TCComponentItemRevision findLastReport(
			Map<String, Map<String, TCComponentItemRevision>> msm) {
		Map<String, TCComponentItemRevision> sameMS = msm.get(fv9MLName);
		
		if (sameMS != null) {
			System.err.println("  ** Searching last rpt in same milestone "
					+ fv9MLName + " ...");
//			int typeIdx = 0;
//			while (typeIdx < config.types2CopyInSameMS.size()
//					&& fv9PHType.equals(config.types2CopyInSameMS.get(typeIdx)))
//				typeIdx++;
//			for (typeIdx++; typeIdx < config.types2CopyInSameMS.size(); typeIdx++) {
			for (int typeIdx=0; typeIdx < config.types2CopyInSameMS.size(); typeIdx++) {
				String tryType = config.types2CopyInSameMS.get(typeIdx);
				TCComponentItemRevision lastRpt = sameMS.get(tryType);
				if (lastRpt == null) {
					System.err
							.println("   * No last rpt in same milestone of PH type "
									+ tryType);
					continue;
				}
				System.err
						.println("   * Found last rpt in same milestone of PH type "
								+ tryType + " : " + lastRpt);
				return lastRpt;
			}
			System.err.println("  ** No last rpt found in same milestone "
					+ fv9MLName);
		}
		int idxMS;
		for (idxMS = config.milestones.size() - 1; idxMS >= 0; idxMS--) {
			if (fv9MLName.equals(config.milestones.get(idxMS))) {
				break;
			}
		}
		for (idxMS--; idxMS >= 0; idxMS--) {
			String tryMS = config.milestones.get(idxMS);
			Map<String, TCComponentItemRevision> prevMS = msm.get(tryMS);
			if (prevMS == null) {
				System.err
						.println("  ** No rpt in previous milestone " + tryMS);
				continue;
			}
			System.err.println("  ** Searching last rpt in milestone " + tryMS
					+ " ...");
			for (String tryType : config.types2CopyInPrevMS) {
				TCComponentItemRevision lastRpt = prevMS.get(tryType);
				if (lastRpt == null) {
					System.err.println("   * No last rpt of PH type " + tryType
							+ " in milestone " + tryMS);
					continue;
				}
				System.err.println("   * Found last rpt in milestone " + tryMS
						+ " of PH type " + tryType + " : " + lastRpt);
				return lastRpt;
			}
		}
		System.err.println("  ** No last rpt found.");
		return null;
	}

	public boolean isReady() {
		for (PHFragmentCreInfo f : fragments) {
			if (!f.isReady())
				return false;
		}
		return true;
	}

	public TCComponentItemRevision doCreate() throws TCException {
		TCSession session = config.rootTemplate.getSession();
		TCComponentProject prj = session.getCurrentProject();
		if (prj == null) {
			throw new TCException("未设置当前项目!");
		}

		ArrayList<TCComponent> objs2prj = new ArrayList<TCComponent>(
				config.fragments.size() + 2);

		// 新建的Item名称为：项目ID-里程碑-周数
		String newName = prj.getProperty("project_id") + "-" + fv9MLName + "-"
				+ fv9ReportKW;
		String newDesc = newName + "-" + fv9PHType;
		TCComponentItemType rptType = (TCComponentItemType) session
				.getTypeComponent("FV9PHReport");
		TCComponentItem newItem = rptType.create("", "", "FV9PHReport",
				newName, newDesc, null);
		TCComponentItemRevision newRev = newItem.getLatestItemRevision();
		objs2prj.add(newItem);
		objs2prj.add(newRev);
		TCProperty[] props = newRev.getTCProperties(new String[] { "fv9MLName",
				"fv9PHType", "fv9ReportKW", "fv9PlatformType" });
		props[0].setStringValueData(fv9MLName);
		props[1].setStringValueData(fv9PHType);
		props[2].setStringValueData(fv9ReportKW);
		props[3].setStringValueData(fv9PlatformType);
		newRev.setTCProperties(props);
		String[] otherUids = new String[2];
		for (PHFragmentCreInfo f : fragments) {
			TCComponent newFrag = f.doCopy();
			if (newFrag == null) {
				// copy failed
				continue;
			}
			if (newFrag.isTypeOf("FV9_11ProjectTermin")) {
				otherUids[0] = newFrag.getUid();
			} else if (newFrag.isTypeOf("FV9_11VorserienTer")) {
				otherUids[1] = newFrag.getUid();
			}
			newRev.add(f.policy.relation, newFrag);
			objs2prj.add(newFrag);
		}

		if (lastRpt != null) {
			// TODO copy backup fragments from lastRpt

		}

		for (TCComponent cmp : objs2prj) {
			TCProperty p = cmp.getTCProperty("fv9otherUid");
			if (p != null) {
				p.setStringValueArray(otherUids);
			}
		}

		for (PHFragmentCreInfo f : fragments) {
			f.doAssignNewOwner();
		}

		prj.assignToProject(objs2prj.toArray(new TCComponent[objs2prj.size()]));
		return newRev;
	}

}
