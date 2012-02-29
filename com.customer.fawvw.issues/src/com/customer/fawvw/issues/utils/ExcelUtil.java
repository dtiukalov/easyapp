package com.customer.fawvw.issues.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class ExcelUtil {

	public static void fillTheCellColor(HSSFWorkbook wb, HSSFCell cell, String color, String borderFlag){
		short c = -1;
		
		if ("∫Ï".equals(color)){ //$NON-NLS-1$
			c = HSSFColor.RED.index;
		}
		if ("ª∆".equals(color)){ //$NON-NLS-1$
			c = HSSFColor.YELLOW.index;
		}
		if ("¬Ã".equals(color)){ //$NON-NLS-1$
			c = HSSFColor.GREEN.index;
		}
		if (c > 0) {
			HSSFCellStyle style = wb.createCellStyle();
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			if ("yes".equals(borderFlag)) { //$NON-NLS-1$
				style.setBorderBottom((short)1);
				style.setBorderLeft((short)1);
				style.setBorderRight((short)1);
				style.setBorderTop((short)1);
			}
			style.setFillForegroundColor(c);
			cell.setCellStyle(style);  //cell  « HSSFCell ∂‘œÛ
		}
	}
}
