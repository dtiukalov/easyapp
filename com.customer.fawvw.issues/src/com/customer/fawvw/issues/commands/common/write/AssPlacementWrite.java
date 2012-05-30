package com.customer.fawvw.issues.commands.common.write;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fawvw.issues.utils.ExcelUtil;

public class AssPlacementWrite {

	public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> values) throws Exception{
		
		if (values.get("assPlacement") != null) { 
			
			Map<String, Object> assPlacement = (Map<String, Object>) values.get("assPlacement"); 
			System.out.println("按装车位置统计" 
					+ "\r\n" + "前端" + assPlacement.get("front")      //$NON-NLS-3$ 
					+ "\r\n" + "后部" + assPlacement.get("behind")  //$NON-NLS-"1$  //$NON-NLS-3$  //$NON-NLS-3$     
					+ "\r\n" + "车门" + assPlacement.get("door")     //$NON-NLS-3$ 
					+ "\r\n" + "内饰" + assPlacement.get("inner")     //$NON-NLS-3$ 
					+ "\r\n" + "底盘" + assPlacement.get("chassis")     //$NON-NLS-3$ 
					+ "\r\n" + "驱动模块" + assPlacement.get("driver")     //$NON-NLS-3$ 
					+ "\r\n" + "电器" + assPlacement.get("electronik"));     //$NON-NLS-3$ 

			
			HSSFRow red_row = sheet.getRow(25);
			ExcelUtil.writeIntValueToCell(red_row, 3, ((Map<String, Integer>) assPlacement.get("front")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 4, ((Map<String, Integer>) assPlacement.get("behind")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 5, ((Map<String, Integer>) assPlacement.get("door")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 6, ((Map<String, Integer>) assPlacement.get("inner")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 7, ((Map<String, Integer>) assPlacement.get("chassis")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 8, ((Map<String, Integer>) assPlacement.get("driver")).get("red"));
			ExcelUtil.writeIntValueToCell(red_row, 9, ((Map<String, Integer>) assPlacement.get("electronik")).get("red"));
			ExcelUtil.writeFormulaToCell(red_row, 10, "SUM(D26:J26)");
			
			HSSFRow yellow_row = sheet.getRow(26);
			ExcelUtil.writeIntValueToCell(yellow_row, 3, ((Map<String, Integer>) assPlacement.get("front")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 4, ((Map<String, Integer>) assPlacement.get("behind")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 5, ((Map<String, Integer>) assPlacement.get("door")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 6, ((Map<String, Integer>) assPlacement.get("inner")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 7, ((Map<String, Integer>) assPlacement.get("chassis")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 8, ((Map<String, Integer>) assPlacement.get("driver")).get("yellow"));
			ExcelUtil.writeIntValueToCell(yellow_row, 9, ((Map<String, Integer>) assPlacement.get("electronik")).get("yellow"));
			ExcelUtil.writeFormulaToCell(yellow_row, 10, "SUM(D27:J27)");
			
			HSSFRow green_row = sheet.getRow(27);
			ExcelUtil.writeIntValueToCell(yellow_row, 3, ((Map<String, Integer>) assPlacement.get("front")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 4, ((Map<String, Integer>) assPlacement.get("behind")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 5, ((Map<String, Integer>) assPlacement.get("door")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 6, ((Map<String, Integer>) assPlacement.get("inner")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 7, ((Map<String, Integer>) assPlacement.get("chassis")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 8, ((Map<String, Integer>) assPlacement.get("driver")).get("green"));
			ExcelUtil.writeIntValueToCell(yellow_row, 9, ((Map<String, Integer>) assPlacement.get("electronik")).get("green"));
			ExcelUtil.writeFormulaToCell(yellow_row, 10, "SUM(D28:J28)");
			
			System.out.println("写入按装车位置统计页"); 
			
		}
	}
}
