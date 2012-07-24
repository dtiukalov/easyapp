package com.customer.fotonbm.report.utils.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fotonbm.report.common.Report;

public class ExcelManager {

	public static void generateExcel(Map<String, Object> values,
			String generateFile, Report report) {
		FileOutputStream fileOut = null;

		try {
			fileOut = new FileOutputStream(new File(generateFile));
			InputStream inputStream = new FileInputStream(report.getTemplate());
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			report.importData(workbook, values);

			workbook.write(fileOut);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
