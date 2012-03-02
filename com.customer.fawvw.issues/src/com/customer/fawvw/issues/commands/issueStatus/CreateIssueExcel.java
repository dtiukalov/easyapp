package com.customer.fawvw.issues.commands.issueStatus;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Random;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.FileUtil;
import com.customer.fawvw.issues.utils.NetUtil;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateIssueExcel {

	
	public static final String TEMPLATE_FILE_PATH1 = System.getenv("TPR") + "\\plugins\\Template\\IssueStatusReport_Template1.xls"; //$NON-NLS-1$ //$NON-NLS-2$
	public static final String TEMPLATE_FILE_PATH2 = System.getenv("TPR") + "\\plugins\\Template\\IssueStatusReport_Template2.xls"; //$NON-NLS-1$ //$NON-NLS-2$
	
	public static Boolean createExcel(HashMap<String, Object> parameters, 
			String path1, String path2, String project_id) throws Exception  {
		
		HashMap<String, Object> values = IssueStatusReportLoader.load(parameters);
		
		String server_ip = ComponentUtils.getPreferenceByName(
				(TCSession)parameters.get("session"), "server_ip"); //$NON-NLS-1$ //$NON-NLS-2$
		System.out.println("server_ip = " + server_ip);		 //$NON-NLS-1$

		//检查网络
		if (NetUtil.pingIP(server_ip)) {
			//网络连接成功
			System.out.println("path = " + path1); //$NON-NLS-1$
			System.out.println("parameters = " + parameters); //$NON-NLS-1$
			String user_id = ((TCSession)parameters.get("session")).getUser().getUserId(); //$NON-NLS-1$
			String remote_template = "\\\\" + server_ip + "\\TCData\\IssueTemplate\\" + user_id + "_IssueStatusReport_" + project_id + ".xls"; //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$
			String remote_temp = "\\\\" + server_ip + "\\TCData\\IssueTemplate\\" + user_id + "_IssueStatusReport_" + project_id + Math.abs(new Random().nextInt()) + ".xls";  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$
	System.out.println("remote_template = " + remote_template); //$NON-NLS-1$
	System.out.println("remote_temp = " + remote_temp); //$NON-NLS-1$
			//新建一个临时excel
			FileOutputStream remoteFileOut = null;
			FileOutputStream localFileOut = null;
			FileOutputStream localFileOut2 = null;
			
			try {
				
//				获取服务器上的模板
				File remoteExcelTmp = new File(remote_template);//存储文件
				File remoteExcelTemp = new File(remote_temp);//临时文件
				InputStream inputStream = new FileInputStream(remoteExcelTmp);
				remoteFileOut = new FileOutputStream(remoteExcelTemp);
				localFileOut = new FileOutputStream(new File(path1));
				
				writeExcel1(parameters, inputStream, remoteFileOut, localFileOut, values);
				FileUtil.delFile(remote_template);
				FileUtil.renameFile(remoteExcelTemp, remote_template);
				
				//写入第二个excel
				File file2 = new File(path2);
				File excelTmp2 = new File(TEMPLATE_FILE_PATH2);
				InputStream inputStream2 = new FileInputStream(excelTmp2);
				localFileOut2 = new FileOutputStream(file2);
				writeExcel2(parameters, inputStream2, localFileOut2, values);
				
				return true;

			} catch (FileNotFoundException e) {
				
				e.printStackTrace();
				//服务器中无此模板，在本地获取模板
				try {
					
					File localExcelTmp = new File(TEMPLATE_FILE_PATH1);
					InputStream inputStream = new FileInputStream(localExcelTmp);
					remoteFileOut = new FileOutputStream(new File(remote_template));
					localFileOut = new FileOutputStream(new File(path1));
					writeExcel1(parameters, inputStream, remoteFileOut, localFileOut, values);
					
					//写入第二个excel
					File file2 = new File(path2);
					File excelTmp2 = new File(TEMPLATE_FILE_PATH2);
					InputStream inputStream2 = new FileInputStream(excelTmp2);
					localFileOut2 = new FileOutputStream(file2);
					writeExcel2(parameters, inputStream2, localFileOut2, values);
					
					return true;
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					MessageBox.post("Excel模板不存在", 
							"问题汇报报表", 
							MessageBox.ERROR);
					
					return false;
				}
				
			} catch (Exception e) {

				e.printStackTrace();
				
				return false;
				
			} finally {
				try {
					remoteFileOut.close();
					localFileOut.close();
					localFileOut2.close();
					//删除临时文件
					FileUtil.delFile(remote_temp);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		} else {
			//网络连接有误
			MessageBox.post("无法访问，请检查网络", 
					"问题汇报报表", 
					MessageBox.ERROR);
			return false;
		}
		
		
	}
	
	public static void writeExcel1(HashMap<String, Object> parameters, InputStream inputStream,
			FileOutputStream remoteFileOut, FileOutputStream localFileOut,
			HashMap<String, Object> values) throws Exception{
		
		try {
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			
			HSSFSheet sheetPage1 = workbook.getSheetAt(0);
//			HSSFSheet sheetPage2 = workbook.getSheetAt(1);
			
			StatusWrite.importDataPage(workbook, sheetPage1, values, Integer.parseInt((String)parameters.get("forecast"))); //$NON-NLS-1$
//			AssPlacementWrite.importDataPage2(workbook, sheetPage2, values);
			
			workbook.write(remoteFileOut);
			workbook.write(localFileOut);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void writeExcel2(HashMap<String, Object> parameters, InputStream inputStream,
			FileOutputStream localFileOut, HashMap<String, Object> values) throws Exception{
		
		try {
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			
			HSSFSheet sheetPage1 = workbook.getSheetAt(0);
//			HSSFSheet sheetPage2 = workbook.getSheetAt(1);
			
//			StatusWrite.importDataPage(workbook, sheetPage1, values, Integer.parseInt((String)parameters.get("forecast"))); //$NON-NLS-1$
			AssPlacementWrite.importDataPage2(workbook, sheetPage1, values);
			
			workbook.write(localFileOut);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
