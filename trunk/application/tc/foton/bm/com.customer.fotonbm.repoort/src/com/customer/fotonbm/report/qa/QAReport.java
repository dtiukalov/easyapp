package com.customer.fotonbm.report.qa;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fotonbm.report.common.Report;
import com.customer.fotonbm.report.exception.BmModelException;
import com.customer.fotonbm.report.utils.Utils;
import com.customer.fotonbm.report.utils.excel.CellInfo;
import com.customer.fotonbm.report.utils.excel.CellUtils;
import com.customer.fotonbm.report.utils.excel.LocationInfo;

public class QAReport extends Report {

	public List<String> keylist = new ArrayList<String>();
	//该 list用来确定一条记录的顺序
	public QAReport() {
		keylist.add("object_name");
		keylist.add("fv9BMAuditScore");
		keylist.add("fv9BMAuditLevel");
		keylist.add("fv9BMFunctionDefect");
		keylist.add("fv9BMSurfaceQuality");
		keylist.add("fv9BMAuiditPartMatch");
		keylist.add("fv9BMAuditBType");
		keylist.add("fv9BMAuditCType");
		keylist.add("fv9BMAuditOdor");
		keylist.add("fv9BMAuditchromatism");
	}
	//导入数据方法  参数是 workbook和 values  
	@SuppressWarnings("unchecked")
	public void importData(HSSFWorkbook workbook, Map<String, Object> values) throws BmModelException{
		HSSFSheet sheet = workbook.getSheetAt(0);
		HSSFPatriarch patri = sheet.createDrawingPatriarch();
		LocationInfo info = getLocation();
		if (info != null) {
			// 获取竞品车List
			List<Map<String, Object>> vehicles = (List<Map<String, Object>>) values
					.get("vehicles");// 获取竞品车List

			if (vehicles != null && vehicles.size() > 0) {
				int size = vehicles.size();
				// 循环列 一个竞品车是一列
				for (int c = 0; c < size; c++) {
					Map<String, Object> vehicle = vehicles.get(c);
					int vehicleAttributesSize = vehicle.keySet().size();

					for (int i = 0; i < vehicleAttributesSize; i++) {
						HSSFCell attrcell = CellUtils.getCell(
								info.getRow() + i, info.getColume() + c, sheet);
						Object object = null;
						if(this.keylist!= null && this.keylist.size() > 0){
							object = vehicle.get(this.keylist.get(i));
						} 
						CellUtils.setCellValue(workbook, sheet, attrcell,
								patri, object);
					}
				}
			}
			// 合并单元格
			CellInfo mergecells_object = (CellInfo) values.get("mergecells");
			if (mergecells_object != null) {
				CellUtils.setMergedRegion(sheet, mergecells_object.getRow(),
						mergecells_object.getToRow(), mergecells_object
								.getColumn(), mergecells_object.getToColumn());
			}

			// 表头导入logo图片
			Object logo_object = values.get("logo");
			if (logo_object != null) {
				CellUtils.setCellValue(workbook, sheet, null, patri,
						logo_object);
			}
		} else {
			throw new BmModelException("xls Template error!");
		}
	}

	private LocationInfo getLocation() {
		//获取模板中的标识 START_LOGO的位置  第一个参数是xls模板  第二个参数是xls中的第几个sheet页 第三个参数是标识字符串，默认是 START_LOGO	
		return CellUtils.getLocation(getTemplate(), 0, getlocationStr());
	}
	//模板位置：System.getenv("TPR") + "\\fawvw\\"; 
	public String getTemplate() {
		return Utils.XLS_PATH + "xls\\qa.xls";
	}
	//模板中的标识 START_LOGO
	public String getlocationStr() {
		return Utils.LOCATION;
	};

}
