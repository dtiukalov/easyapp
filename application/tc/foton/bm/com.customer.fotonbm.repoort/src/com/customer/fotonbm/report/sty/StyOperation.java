package com.customer.fotonbm.report.sty;

import java.awt.image.BufferedImage;
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
import com.customer.fotonbm.report.utils.tc.ComponentUtils;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCSession;

public class StyOperation extends AbstractBmOperation {

	public static final String FAWBM_ITEM_STY_REVISION_MASTER = "FV9FAWBMStyRevisionMaster";

	public static final String FAWBM_ITEM_STY = "FV9FAWBMSty";
	private List<InterfaceAIFComponent> selectComponents;
	public PrintLog printlog;

	public StyOperation(TCSession session, PrintLog printlog) {
		super(session, printlog);
	}

	public StyOperation(TCSession session,
			List<InterfaceAIFComponent> components, PrintLog printlog) {
		super(session, printlog);
		this.selectComponents = components;
		this.printlog = printlog;
	}

	/*
	 * 临时路径下生成的文件名
	 */
	public String getFileName() {
		return "sty.xls";
	}

	@Override
	public void generateExcel() throws Exception {
		Map<String, Object> values = getModuleData(new Object[] { this.selectComponents });
		ExcelManager.generateExcel(values, super.getImportFileName(),
				new StyReport());
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
					Map<String, Object> formProperty = getChildComponentValue(
							compete, FAWBM_ITEM_STY_REVISION_MASTER,
							"无法找到竞品车整体风格评价表");
					
					TCComponentItem styComponent = (TCComponentItem) ComponentUtils
							.getChildComponent(compete, FAWBM_ITEM_STY, null,
									null);

					BufferedImage FV9FAWBMJpegFrontImage = ComponentUtils
							.loadComponentItemRelatedImage(
									(TCComponentItem) styComponent,
									"FV9FAWBMJpegFrontImage");
					BufferedImage FV9FAWBMJpegSideImage = ComponentUtils
							.loadComponentItemRelatedImage(
									(TCComponentItem) styComponent,
									"FV9FAWBMJpegSideImage");

					CellInfo JpegFrontImage = new CellInfo(Utils.IMAGE_FILL_FULL_TYPE, FV9FAWBMJpegFrontImage);
					CellInfo JpegSideImage = new CellInfo(Utils.IMAGE_FILL_FULL_TYPE, FV9FAWBMJpegSideImage);
					
					formProperty.put("FV9FAWBMJpegFrontImage",
							JpegFrontImage);
					formProperty.put("FV9FAWBMJpegSideImage",
							JpegSideImage);
					valueList.add(formProperty);
				}
			}
			// <property key="fv9FAWBMJpegFrontImage" type="image"/>
			// <property key="fv9FAWBMJpegSideImage" type="image"/>
			values.put("vehicles", valueList);

			int size = 3; 
			if(valueList.size() >= size){
				size = valueList.size();
			}
			values.put("logo", new CellInfo(Utils.IMAGE_FILL_FULL_TYPE,
					ImageUtil.getLogoImage(), 0, size));
			
			CellInfo mergecellinfo = new CellInfo(0, 0, 0,valueList.size());
			values.put("mergecells", mergecellinfo);

			return values;
		}

		return null;
	}
}
