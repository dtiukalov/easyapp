package com.customer.fawvw.issues.commands.common.write;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fawvw.issues.utils.ExcelUtil;

public class DeptWrite {

	/**
	 *写入“按责任部门统计”页
	 */

	public static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		
		if (values.get("department") != null) { 

			Map<String, Object> departments = (Map<String, Object>) values.get("department"); 
	
			HSSFRow row21 = sheetPage.getRow(21);
			ExcelUtil.writeIntValueToCell(row21, 2, ((Map<String, Integer>) departments.get("TE")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 3, ((Map<String, Integer>) departments.get("QAPP")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 4, ((Map<String, Integer>) departments.get("SU")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 5, ((Map<String, Integer>) departments.get("PL")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 6, ((Map<String, Integer>) departments.get("VSC")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 7, ((Map<String, Integer>) departments.get("LO")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 8, ((Map<String, Integer>) departments.get("ME1")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 9, ((Map<String, Integer>) departments.get("ME2")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 10, ((Map<String, Integer>) departments.get("BS1")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 11, ((Map<String, Integer>) departments.get("PA1")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 12, ((Map<String, Integer>) departments.get("CA1")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 13, ((Map<String, Integer>) departments.get("BS2")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 14, ((Map<String, Integer>) departments.get("PA2")).get("red"));
			ExcelUtil.writeIntValueToCell(row21, 15, ((Map<String, Integer>) departments.get("CA2")).get("red"));
			ExcelUtil.writeFormulaToCell(row21, 16, "SUM(C22:P22)");
			
			HSSFRow row22 = sheetPage.getRow(22);
			ExcelUtil.writeIntValueToCell(row22, 2, ((Map<String, Integer>) departments.get("TE")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 3, ((Map<String, Integer>) departments.get("QAPP")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 4, ((Map<String, Integer>) departments.get("SU")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 5, ((Map<String, Integer>) departments.get("PL")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 6, ((Map<String, Integer>) departments.get("VSC")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 7, ((Map<String, Integer>) departments.get("LO")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 8, ((Map<String, Integer>) departments.get("ME1")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 9, ((Map<String, Integer>) departments.get("ME2")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 10, ((Map<String, Integer>) departments.get("BS1")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 11, ((Map<String, Integer>) departments.get("PA1")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 12, ((Map<String, Integer>) departments.get("CA1")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 13, ((Map<String, Integer>) departments.get("BS2")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 14, ((Map<String, Integer>) departments.get("PA2")).get("yellow"));
			ExcelUtil.writeIntValueToCell(row22, 15, ((Map<String, Integer>) departments.get("CA2")).get("yellow"));
			ExcelUtil.writeFormulaToCell(row22, 16, "SUM(C23:P23)");
			
			HSSFRow row23 = sheetPage.getRow(23);
			ExcelUtil.writeIntValueToCell(row23, 2, ((Map<String, Integer>) departments.get("TE")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 3, ((Map<String, Integer>) departments.get("QAPP")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 4, ((Map<String, Integer>) departments.get("SU")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 5, ((Map<String, Integer>) departments.get("PL")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 6, ((Map<String, Integer>) departments.get("VSC")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 7, ((Map<String, Integer>) departments.get("LO")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 8, ((Map<String, Integer>) departments.get("ME1")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 9, ((Map<String, Integer>) departments.get("ME2")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 10, ((Map<String, Integer>) departments.get("BS1")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 11, ((Map<String, Integer>) departments.get("PA1")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 12, ((Map<String, Integer>) departments.get("CA1")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 13, ((Map<String, Integer>) departments.get("BS2")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 14, ((Map<String, Integer>) departments.get("PA2")).get("green"));
			ExcelUtil.writeIntValueToCell(row23, 15, ((Map<String, Integer>) departments.get("CA2")).get("green"));
			ExcelUtil.writeFormulaToCell(row23, 16, "SUM(C24:P24)");
		}
	}
}
