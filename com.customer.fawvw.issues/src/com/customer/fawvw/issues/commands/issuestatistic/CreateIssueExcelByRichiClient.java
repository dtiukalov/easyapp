package com.customer.fawvw.issues.commands.issuestatistic;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fawvw.issues.commands.common.write.AssPlacement1Write;
import com.customer.fawvw.issues.commands.common.write.AssPlacement2Write;
import com.customer.fawvw.issues.commands.common.write.DeptWrite;
import com.customer.fawvw.issues.commands.common.write.PartTypeStatusWrite;
import com.customer.fawvw.issues.commands.common.write.TimeWrite;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateIssueExcelByRichiClient {
	
	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\ProblemReport_Template.xls"; //$NON-NLS-1$ //$NON-NLS-2$
	private static final float PX_DEFAULT = 32.00f;
	private static final float PX_MODIFIED = 36.56f;
	private static final int PX_ROW = 15;

	public static Boolean createExcel(HashMap<String, Object> parameters, String file, 
			TCSession session) throws Exception  {
			
		HashMap<String, Object> values = IssueReportLoaderRichClient.load(parameters);
			
		//存在符合条件的数据
		if (values != null){ 

			FileOutputStream fileOut = null;
			//数据存在，生成报表
			fileOut = new FileOutputStream(new File(file));
		
			File excelTmp = new File(TEMPLATE_FILE_PATH);
			InputStream inputStream = new FileInputStream(excelTmp);
			System.out.println("模板位置：" + TEMPLATE_FILE_PATH);  
			
			System.out.println("获取模板成功"); 
			
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);

			System.out.println("开始写入：问题统计列表"); 
			HSSFSheet sheetPage1 = workbook.getSheetAt(0);
			IssuesReportWrite.importDataPage(workbook, sheetPage1, values, parameters);
			
			System.out.println("开始写入：按责任部门统计");			 
			HSSFSheet sheetPage2 = workbook.getSheetAt(1);
			DeptWrite.importDataPage(workbook, sheetPage2, values);
			
			System.out.println("开始写入：按问题类型统计"); 
			HSSFSheet sheetPage3 = workbook.getSheetAt(2);
			PartTypeStatusWrite.importDataPage(workbook, sheetPage3, values);
			
			
//				System.out.println("开始写入：按专业组统计");			
//				HSSFSheet sheetPage3 = workbook.getSheetAt(2);
//				MajorWrite.importDataPage(workbook, sheetPage3, values);
	
			System.out.println("开始写入：按时间统计");			
			HSSFSheet sheetPage4 = workbook.getSheetAt(3);
			TimeWrite.importDataPage(workbook, sheetPage4, values);
	
//			System.out.println("开始写入：按装车位置统计");			
//			HSSFSheet sheetPage5 = workbook.getSheetAt(4);
//			AssPlacement1Write.importDataPage(workbook, sheetPage5, values);
//	
//			System.out.println("开始写入：按新的装车位置统计");			
//			HSSFSheet sheetPage6 = workbook.getSheetAt(5);
//			AssPlacement2Write.importDataPage(workbook, sheetPage6, values);
			
			workbook.write(fileOut);
			fileOut.close();
			
			System.out.println("创建Excel成功"); 
			
			return true;
			
		} else {
			MessageBox.post("没有符合条件的数据",  
					"问题统计报表", MessageBox.INFORMATION); 
			return false;
		}
		
		
		
	}
}
