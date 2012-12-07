package com.fawvw.ph.policy;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JComboBox;
import javax.swing.SwingUtilities;

import org.apache.axis.utils.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.util.StringUtil;

import tc.util.excel.WorkbookPOI;

import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentAuditReport;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentFolder;
import com.teamcenter.rac.kernel.TCComponentGroup;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCComponentGroupMemberType;
import com.teamcenter.rac.kernel.TCComponentGroupType;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentRole;
import com.teamcenter.rac.kernel.TCComponentRoleType;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCComponentUserType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCPreferenceService;
import com.teamcenter.rac.kernel.TCSession;

public class PHReportConfig {

	private static PHReportConfig curCache = null;

	private static TCSession curSession = null;
	private static String curDs = null;
	private static Date curDate = null;

	public static PHReportConfig getConfig(TCSession session) throws Exception {
		if (curSession != session) {
			curDate = null;
			curSession = session;
		}
		AIFComponentContext dsCtx = findConfigDataset(curSession);
		if (dsCtx == null) {
			throw new TCException("找不到PH汇报配置数据集!");
		}
		String dsUid = ((TCComponent) dsCtx.getComponent()).getUid();
		Date lmd = ((TCComponent) dsCtx.getComponent())
				.getDateProperty("last_mod_date");
		if (curCache == null || curDs == null || !curDs.equals(dsUid)
				|| curDate == null || !curDate.equals(lmd)) {
			curCache = new PHReportConfig(dsCtx);
			curDs = dsUid;
			curDate = lmd;
		}
		return curCache;
	}

	public static AIFComponentContext findConfigDataset(TCSession session)
			throws TCException {
//		获取用户信息
		TCComponentGroup group = session.getCurrentGroup();
		String current_group = group.getFullName();
		
		String templateName = "PHReportConf";
//		根据平台获取模板
		if (current_group != null && !"".equals(current_group)) {
			
			if (current_group.startsWith("AudiPlat"))
				templateName += "_Audi";
			
			if (current_group.startsWith("PQ32_34Plat"))
				templateName += "_PQ32_34";
			
			if (current_group.startsWith("PQ35Plat"))
				templateName += "_PQ35";
			
			if (current_group.startsWith("PQ46Plat"))
				templateName += "_PQ46";

		}

		
//		获取模板
		TCPreferenceService prefs = session.getPreferenceService();
		String adminUserID = prefs.getString(
				TCPreferenceService.TC_preference_site, "WSTemplateOwner",
				"infodba");
		TCComponentUser adminUser = ((TCComponentUserType) session
				.getTypeComponent("User")).find(adminUserID);
		TCComponentFolder home = adminUser.getHomeFolder();
		TCComponentFolder templateArea = null;
		for (TCComponent c : home.getRelatedComponents("contents")) {
			if (!(c instanceof TCComponentFolder))
				continue;
			if ("PH汇报材料模板区".equals(c.getProperty("object_name"))) {
				templateArea = (TCComponentFolder) c;
				break;
			}
		}
		if (templateArea == null)
			return null;
		for (TCComponent c : templateArea.getRelatedComponents("contents")) {
			if (!c.isTypeOf("MSExcel"))
				continue;
			String dsName = c.getProperty("object_name");
			if (templateName.equals(dsName) || templateName.equals(dsName)) {
System.out.println("模板匹配成功：templateName = " + templateName + " dsName = " + dsName);
				return new AIFComponentContext(templateArea, c, null);
			}
		}
		return null;
	}

	public final TCComponentItemRevision rootTemplate;

	public final List<String> milestones = new ArrayList<String>(10);
	public final List<PHFragmentPolicy> fragments = new ArrayList<PHFragmentPolicy>(
			100);

	public final List<String> allTypes = new ArrayList<String>(10);
	public final List<String> types2CopyInSameMS = new ArrayList<String>(10);
	public final List<String> types2CopyInPrevMS = new ArrayList<String>(10);

	public PHReportConfig(AIFComponentContext dsCtx) throws Exception {
		final String header1 = "序号\t表单类型\t数据名称\t关系\t所属组\t所属用户角色";
		final int nHeader1Cols = 6;
		final String header2 = "会议类型\t同里程碑另存会议类型\t跨里程碑另存会议类型";
		final int nHeader2Cols = 3;

		// find report root
		TCComponentItemRevision rootTemplate = null;
		TCComponentFolder templateArea = (TCComponentFolder) dsCtx
				.getParentComponent();
		for (TCComponent c : templateArea.getRelatedComponents("contents")) {
			if (c.isTypeOf("FV9PHReport")) {
				rootTemplate = ((TCComponentItem) c).getLatestItemRevision();
				break;
			} else if (c.isTypeOf("FV9PHReportRevision")) {
				rootTemplate = (TCComponentItemRevision) c;
				break;
			}
		}
		if (rootTemplate == null) {
			throw new TCException("未配置PH汇报根模板!");
		}
		this.rootTemplate = rootTemplate;

		// loading workbook
		TCComponentDataset ds = (TCComponentDataset) dsCtx.getComponent();
		File[] files = ds.getFiles("excel");
		if (files == null || files.length < 1) {
			throw new TCException("PH汇报配置数据集命名的引用丢失!");
		}
		WorkbookPOI wb = new WorkbookPOI(files[0]);
		Sheet sht = wb.wb.getSheetAt(0);

		// parsing/validating header
		Row header = sht.getRow(1);
		StringBuilder hl = new StringBuilder(500);
		for (int c = 0; c < nHeader1Cols; c++) {
			hl.append('\t').append(wb.getCellValue(header.getCell(c)));
		}
		if (hl.length() < 1 || !hl.substring(1).equals(header1)) {
			throw new TCException("PH汇报配置数据集格式错误,里程碑前各列应为: " + header1);
		}
		for (int nMilestones = 0;; nMilestones++) {
			String ms = wb.getCellString(header.getCell(nHeader1Cols
					+ nMilestones));
			if (ms == null || ms.length() < 1)
				break;
			milestones.add(ms.intern());
		}
		hl.setLength(0);
		for (int i = 1; i <= nHeader2Cols; i++) {
			hl.append('\t').append(
					wb.getCellValue(header.getCell(nHeader1Cols
							+ milestones.size() + i)));
		}
		if (hl.length() < 1 || !hl.substring(1).equals(header2)) {
			throw new TCException("PH汇报配置数据集格式错误,里程碑后各列应为: " + header2);
		}

		// loading fragment policy rows
		for (int row = 2; row < sht.getLastRowNum(); row++) {
			Row r = sht.getRow(row);
			PHFragmentPolicy fp = new PHFragmentPolicy(this, wb.getCellString(r
					.getCell(0)), wb.getCellString(r.getCell(1)),
					wb.getCellString(r.getCell(2)), wb.getCellString(r
							.getCell(3)), wb.getCellString(r.getCell(4)),
					wb.getCellString(r.getCell(5)));
			for (int i = 0; i < milestones.size(); i++) {
				String msi = wb.getCellString(r.getCell(nHeader1Cols + i));
				if (msi != null && msi.length() > 0 && msi.charAt(0) == 'Y') {
					fp.milestones.add(milestones.get(i));
				}
			}
			fragments.add(fp);
		}

		// loading types & copy policy rows
		for (int row = 2; row < sht.getLastRowNum(); row++) {
			Row r = sht.getRow(row);
			String t = wb.getCellString(r.getCell(nHeader1Cols
					+ milestones.size() + 1));
			if (t != null && t.length() > 0)
				allTypes.add(t.intern());
			t = wb.getCellString(r.getCell(nHeader1Cols + milestones.size() + 2));
			if (t != null && t.length() > 0)
				types2CopyInSameMS.add(t.intern());
			t = wb.getCellString(r.getCell(nHeader1Cols + milestones.size() + 3));
			if (t != null && t.length() > 0)
				types2CopyInPrevMS.add(t.intern());
		}
	}

	protected Map<String, TCComponent[]> gmCache = new HashMap<String, TCComponent[]>();

	public void loadGroupMember(final JComboBox cb, final String group,
			final String role, final TCComponentGroupMember selection) {
		cb.removeAllItems();
		final String key = role + "@" + group;
		TCComponent[] gms = gmCache.get(key);
		if (gms != null) {
			cb.addItem("  ");
			for (int i = 0; i < gms.length; i++)
				cb.addItem(gms[i]);
			if (selection != null)
				cb.setSelectedItem(selection);
			return;
		}
		cb.addItem("...");
		rootTemplate.getSession().queueOperation(new AbstractAIFOperation() {
			@Override
			public void executeOperation() throws Exception {
				TCComponentGroupType gt = (TCComponentGroupType) rootTemplate
						.getSession().getTypeComponent("Group");
				TCComponentRoleType rt = (TCComponentRoleType) rootTemplate
						.getSession().getTypeComponent("Role");
				TCComponentGroupMemberType gmt = (TCComponentGroupMemberType) rootTemplate
						.getSession().getTypeComponent("GroupMember");
				TCComponentGroup g = gt.find(group);
				TCComponentRole r = rt.find(role);
				final TCComponent[] gms;
				if (r == null && g == null) {
					gms = gmt.extent();
				} else if (r == null) {
					gms = gmt.findByGroup(g);
				} else {
					gms = gmt.findByRole(r, g);
				}
				gmCache.put(key, gms);
				SwingUtilities.invokeLater(new Runnable() {
					public void run() {
						cb.removeAllItems();
						cb.addItem("  ");
						for (int i = 0; i < gms.length; i++)
							cb.addItem(gms[i]);
						if (selection != null)
							cb.setSelectedItem(selection);
					}
				});
			}
		});
	}

}
