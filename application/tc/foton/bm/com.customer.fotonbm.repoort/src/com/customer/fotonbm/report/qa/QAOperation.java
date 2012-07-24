package com.customer.fotonbm.report.qa;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.customer.fotonbm.report.common.AbstractBmOperation;
import com.customer.fotonbm.report.utils.ImageUtil;
import com.customer.fotonbm.report.utils.PrintLog;
import com.customer.fotonbm.report.utils.Utils;
import com.customer.fotonbm.report.utils.excel.CellInfo;
import com.customer.fotonbm.report.utils.excel.ExcelManager;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCSession;

public class QAOperation extends AbstractBmOperation{
	
	public static final String BM_FORM_QA_REVISION_MASTER = "FV9FAWBMQARevisionMaster";
	
	private List<InterfaceAIFComponent> selectComponents;
	
	public QAOperation(TCSession session, PrintLog printlog) {
		super(session, printlog);
	}
	
	public QAOperation(TCSession session, List<InterfaceAIFComponent> components, PrintLog printlog) {
		super(session, printlog);
		this.selectComponents = components;
	}
	/*
	 * 临时路径下生成的文件名
	 */
	public String getFileName() {
		return "QA.xls";
	}

	@Override
	public void generateExcel() throws Exception {
		Map<String, Object> values = getModuleData(
				new Object[] {this.selectComponents});
		ExcelManager.generateExcel(values, super.getImportFileName(), new QAReport());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getModuleData(Object[] args) throws Exception {
		if (args != null && args.length == 1) {
			List<InterfaceAIFComponent> competes = (List<InterfaceAIFComponent>) args[0];

			Map<String, Object> values = new HashMap<String, Object>();
			List<Map<String, Object>> valueList = new ArrayList<Map<String, Object>>();

			if (competes != null) {
				for (InterfaceAIFComponent compete : competes) {
					valueList.add(getChildComponentValue(compete, BM_FORM_QA_REVISION_MASTER,
							"无法找到竞品车整车质量评价表"));
				}
			}
 
			values.put("vehicles", valueList); 
			int size = 4; 
			if(valueList.size() >= 4){
				size = valueList.size();
			}
			values.put("logo", new CellInfo(Utils.IMAGE_FILL_FULL_TYPE,ImageUtil.getLogoImage(),0,size)); 
			
			CellInfo mergecellinfo = new CellInfo(0,0,0,valueList.size());
			values.put("mergecells", mergecellinfo);

			return values;
		}

		return null;
	}
}
