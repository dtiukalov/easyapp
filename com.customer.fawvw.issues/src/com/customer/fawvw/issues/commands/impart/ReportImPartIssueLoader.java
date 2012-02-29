package com.customer.fawvw.issues.commands.impart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class ReportImPartIssueLoader {

	public static final String Property_FV9ISTRACKED = "Yes"; //$NON-NLS-1$

	private ReportImPartIssueLoader() {
	}

	public static Map<String, Object> load(TCSession session,
			HashMap<String, Object> parameters) throws Exception {

		Map<String, Object> values = new HashMap<String, Object>();

		try {
			System.out.println("开始获取数据"); //$NON-NLS-1$

			//查询FV9Component类型的零组件
			TCComponent[] tcCompontents = ComponentUtils
					.findTCComponentItemByType(session, "FV9Component"); //$NON-NLS-1$
			
			List<ImPartVO> imparts = new LinkedList<ImPartVO>();
			
			//筛选符合条件的零件
			if (tcCompontents.length > 0) {
				//获取重点件
				imparts = getReportvalues(tcCompontents, session, parameters);
			}
			
			values.put("imparts", imparts);  //$NON-NLS-1$
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}

		return values;
	}

	/*
	 * 根据条件筛选零件：零件属于选中项目且是重点件
	 * @param tcCompontents
	 *            零件数组
	 * @param parameters
	 *            筛选条件           
	 */
	public static List<ImPartVO> getReportvalues(TCComponent[] tcCompontents,
			TCSession session, HashMap<String, Object> parameters) throws Exception {
		//定义重点件
		List<ImPartVO> imParts = new ArrayList<ImPartVO>();
		String currentProjectID = (String)parameters.get("project_id");//选中项目ID //$NON-NLS-1$
		try {
			String log = "重点件有：\r\n"; //$NON-NLS-1$
			for (int i = 0; i < tcCompontents.length; i++) {
	
				try {
	
					TCComponent tcComponent = tcCompontents[i];
					TCComponentItemRevision itemRevision = ((TCComponentItem) tcCompontents[i])
							.getLatestItemRevision();
					
					//选中项目不为空
					//零件的所属项目不能为空
					//零件所属项目包含选中的项目
					//零件的“是否跟踪”属性为yes
					if (!"".equals(currentProjectID) && //$NON-NLS-1$
							!" ".equals(itemRevision.getProperty("project_ids")) &&  //$NON-NLS-1$ //$NON-NLS-1$
							!"".equals(itemRevision.getProperty("project_ids"))	&& //$NON-NLS-1$ //$NON-NLS-1$
							StringUtil.containsNo(itemRevision.getProperty("project_ids"), currentProjectID) && //$NON-NLS-1$
							Property_FV9ISTRACKED.equals(itemRevision.getProperty("fv9IsTracked"))){ //$NON-NLS-1$
							
						log += itemRevision + "\r\n"; //$NON-NLS-1$
						//查找重点件的问题
						imParts.add(ImPartVO.loadImPart(itemRevision, session, parameters));
							
					}
						
				} catch (TCException e) {
					// TODO Auto-generated catch block
					throw new FawvmLoaderException("程序执行失败，请参考日志"); //$NON-NLS-1$
					
				}
			}
			System.out.println(log);
		} catch (TCException e1) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException("程序执行失败，请参考日志"); //$NON-NLS-1$
		}

		return imParts;
	}
}

