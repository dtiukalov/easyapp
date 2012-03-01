package com.customer.fawvw.issues.commands.issuesingle;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.eclipse.swt.graphics.Path;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateIssueSingleExcel {

	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueSingleReport_Template.xls"; //$NON-NLS-1$ //$NON-NLS-2$

	public static final String LOGO_FILE_PATH = "/xls/logo.JPG"; //$NON-NLS-1$

	private static final float PX_DEFAULT = 32.00f;
	
	private static final float PX_MODIFIED = 36.56f;

	private static final int PX_ROW = 15;

	public static void createExcel(InterfaceAIFComponent targetcompontent, 
			String file, TCSession session)	throws Exception{
		
		System.out.println("模板所在位置：" + TEMPLATE_FILE_PATH);  //$NON-NLS-1$
		
		FileOutputStream fileOut = null;

		try {
			fileOut = new FileOutputStream(new File(file));
			
			//模板不在工程中，取绝对路径
			File excelTmp = new File(TEMPLATE_FILE_PATH);
			InputStream inputStream = new FileInputStream(excelTmp);
			
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			HSSFSheet sheet = workbook.getSheetAt(0);
			HSSFPatriarch patri = sheet.createDrawingPatriarch();
			
			System.out.println("获取模板成功"); //$NON-NLS-1$
			
			importData(workbook, sheet, patri, targetcompontent, session);
			
			workbook.write(fileOut);
			
			System.out.println("创建报表成功"); //$NON-NLS-1$
			
		} catch (FileNotFoundException e) {
			
			System.out.println("Excel模板不存在"); //$NON-NLS-1$
			e.printStackTrace();
			throw new FawvmLoaderException("Excel模板不存在"); //$NON-NLS-1$
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new FawvmLoaderException(e.getMessage());
			
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获得数据写Excel
	 * @throws Exception 
	 * 
	 * 
	 */
		@SuppressWarnings("deprecation")
		public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
				HSSFPatriarch patri, InterfaceAIFComponent targetcompontent,
				TCSession session) throws Exception {
			
			try {
				System.out.println("开始获取数据"); //$NON-NLS-1$
				Map<String, Object> values = ReportIssueSingleLoader.load(targetcompontent, session);
				System.out.println("获取数据结束"); //$NON-NLS-1$
				
				System.out.println("开始写入报表"); //$NON-NLS-1$
				
				//默认样式：文字：左右居左，上下居中，自动换行
				HSSFCellStyle cellStyle = wb.createCellStyle();   
				cellStyle.setWrapText(true);   
				cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
				cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
				
				//文字：左右居左，上下居上，自动换行
				HSSFCellStyle cellTopStyle = wb.createCellStyle();
				cellTopStyle.setWrapText(true);
				cellTopStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
				cellTopStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);

				//文字：左右居中，上下居中，自动换行
				HSSFCellStyle cellCenterStyle = wb.createCellStyle();
				cellCenterStyle.setWrapText(true);
				cellCenterStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				cellCenterStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
				
				HSSFCellStyle borderCellStyle = wb.createCellStyle();
				borderCellStyle.setBorderBottom((short)1);
				borderCellStyle.setBorderLeft((short)1);
				borderCellStyle.setBorderRight((short)1);
				borderCellStyle.setBorderTop((short)1);
				
				HSSFRow row0 = sheet.getRow(0);
				HSSFRow row1 = sheet.getRow(1);
				HSSFRow row4 = sheet.getRow(4);
				HSSFRow row9 = sheet.getRow(9);
				HSSFRow row10 = sheet.getRow(10);
				HSSFRow row14 = sheet.getRow(14);
				HSSFRow row16 = sheet.getRow(16);
				HSSFRow row19 = sheet.getRow(19);
				HSSFRow row22 = sheet.getRow(22);
				HSSFRow row24 = sheet.getRow(24);
				HSSFRow row28 = sheet.getRow(28);
				HSSFRow row29 = sheet.getRow(29);
				HSSFRow row34 = sheet.getRow(34);
				HSSFRow row35 = sheet.getRow(35);
				HSSFRow row36 = sheet.getRow(36);
				HSSFRow row37 = sheet.getRow(37);
				HSSFRow row39 = sheet.getRow(39);
				
				//Bauteil
				HSSFCell bauteilCell = row0.getCell(4);
				if (bauteilCell == null) {
					bauteilCell = row0.createCell(4);
				}
				bauteilCell.setCellValue((String)values.get("fv9PartNumber")); //$NON-NLS-1$
//				bauteilCell.setCellStyle(cellStyle);
				
				//Lifeerant
				HSSFCell lifeerantCell = row0.getCell(55);
				if (lifeerantCell == null) {
					lifeerantCell = row0.createCell(0);
				}
				lifeerantCell.setCellValue((String)values.get("fv9SupplierID")); //$NON-NLS-1$
//				lifeerantCell.setCellStyle(cellStyle);
				
				//Zustaendig
				HSSFCell zustaendigCell = row1.getCell(5);
				if (zustaendigCell == null) {
					zustaendigCell = row1.createCell(5);
				}
				zustaendigCell.setCellValue((String)values.get("fv9PartName")); //$NON-NLS-1$
//				zustaendigCell.setCellStyle(cellStyle);
				
				//供应商名称
				HSSFCell supplyCell = row1.getCell(49);
				if (supplyCell == null) {
					supplyCell = row1.createCell(49);
				}
				supplyCell.setCellValue((String)values.get("fv9SupplierName")); //$NON-NLS-1$
//				supplyCell.setCellStyle(cellCenterStyle);
				
				//问题描述
				HSSFCell descCell = row4.getCell(0);
				if (descCell == null) {
					descCell = row4.createCell(0);
				}
				descCell.setCellValue((String)values.get("fv9IssueDesc")); //$NON-NLS-1$
//				descCell.setCellStyle(cellTopStyle);
				
				//问题描述图片	
				if (((HashMap)values.get("problemImage")).containsKey("FV9DescPhoto")) { //$NON-NLS-1$ //$NON-NLS-2$
					HSSFClientAnchor anchor = new HSSFClientAnchor();
					Map<String, Object> problemImage = (Map<String, Object>)values.get("problemImage"); //$NON-NLS-1$
					BufferedImage imageBuffer = (BufferedImage)problemImage.get("FV9DescPhoto"); //$NON-NLS-1$
					byte[] imageValue = ImageUtil.getImgValue((BufferedImage)(problemImage.get("FV9DescPhoto"))); //$NON-NLS-1$
	
					HSSFPicture picture = patri.createPicture(anchor, wb.addPicture(
							imageValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
					ImageCellInfo problemCellnfo = new ImageCellInfo(15, 0, 33, 18);	
					ImageUtil.GenerateImage(wb, sheet, patri, problemCellnfo, imageBuffer);
					System.out.println("写入问题描述图片"); //$NON-NLS-1$
				} 
				
				//临时措施
				HSSFCell tempSolCell1 = row4.getCell(19);
				if (tempSolCell1 == null) {
					tempSolCell1 = row4.createCell(19);
				}
				tempSolCell1.setCellValue((String)values.get("fv9IssueTempSolution")); //$NON-NLS-1$
				
				//临时措施完成期限
				HSSFCell tempSolTerminCell1 = row4.getCell(53);
				if (tempSolTerminCell1 == null) {
					tempSolTerminCell1 = row4.createCell(53);
				}
				if (!"".equals((String)values.get("fv9TempSolutionDL"))) { //$NON-NLS-1$ //$NON-NLS-2$
					tempSolTerminCell1.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9TempSolutionDL")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9TempSolutionDL")).substring(0, 4)); //$NON-NLS-1$
				} else {
					tempSolTerminCell1.setCellValue(""); //$NON-NLS-1$
				}
				
				//措施1
				HSSFCell solCell1 = row9.getCell(19);
				if (solCell1 == null) {
					solCell1 = row9.createCell(19);
				}
				solCell1.setCellValue((String)values.get("fv9Solution1")); //$NON-NLS-1$
				
				//措施1解决期限
				HSSFCell solTerminCell1 = row9.getCell(53);
				if (solTerminCell1 == null) {
					solTerminCell1 = row9.createCell(53);
				}
				if (!"".equals((String)values.get("fv9SlDLDate1"))) { //$NON-NLS-1$ //$NON-NLS-2$
					solTerminCell1.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9SlDLDate1")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9SlDLDate1")).substring(0, 4)); //$NON-NLS-1$
				} else {
					solTerminCell1.setCellValue(""); //$NON-NLS-1$
				}
				
				
				//措施2
				HSSFCell solCell2 = row14.getCell(19);
				if (solCell2 == null) {
					solCell2 = row14.createCell(19);
				}
				solCell2.setCellValue((String)values.get("fv9Solution2")); //$NON-NLS-1$
				
				//措施2解决期限
				HSSFCell solTerminCell2 = row14.getCell(53);
				if (solTerminCell2 == null) {
					solTerminCell2 = row14.createCell(53);
				}
				if (!"".equals((String)values.get("fv9SlDLDate2"))) { //$NON-NLS-1$ //$NON-NLS-2$
					solTerminCell2.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9SlDLDate2")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9SlDLDate2")).substring(0, 4)); //$NON-NLS-1$
				} else {
					solTerminCell2.setCellValue(""); //$NON-NLS-1$
				}
				
				//措施3
				HSSFCell solCell3 = row19.getCell(19);
				if (solCell3 == null) {
					solCell3 = row19.createCell(19);
				}
				solCell3.setCellValue((String)values.get("fv9Solution3")); //$NON-NLS-1$
//				solCell3.setCellStyle(cellTopStyle);
				
				//措施3解决期限
				HSSFCell solTerminCell3 = row19.getCell(53);
				if (solTerminCell3 == null) {
					solTerminCell3 = row19.createCell(53);
				}
				if (!"".equals((String)values.get("fv9SlDLDate3"))) { //$NON-NLS-1$ //$NON-NLS-2$
					solTerminCell3.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9SlDLDate3")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9SlDLDate3")).substring(0, 4)); //$NON-NLS-1$
				} else {
					solTerminCell3.setCellValue(""); //$NON-NLS-1$
				}
//				solTerminCell3.setCellStyle(cellTopStyle);
				
				//措施4
				HSSFCell solCell4 = row24.getCell(19);
				if (solCell4 == null) {
					solCell4 = row24.createCell(19);
				}
				solCell4.setCellValue((String)values.get("fv9Solution4")); //$NON-NLS-1$
//				solCell4.setCellStyle(cellTopStyle);
				
				//措施4解决期限
				HSSFCell solTerminCell4 = row24.getCell(53);
				if (solTerminCell4 == null) {
					solTerminCell4 = row24.createCell(53);
				}
				if (!"".equals((String)values.get("fv9SlDLDate4"))) { //$NON-NLS-1$ //$NON-NLS-2$
					solTerminCell4.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9SlDLDate4")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9SlDLDate4")).substring(0, 4)); //$NON-NLS-1$
				} else {
					solTerminCell4.setCellValue(""); //$NON-NLS-1$
				}
//				solTerminCell4.setCellStyle(cellTopStyle);
				
				//措施5
				HSSFCell solCell5 = row29.getCell(19);
				if (solCell5 == null) {
					solCell5 = row29.createCell(19);
				}
				solCell5.setCellValue((String)values.get("fv9Solution5")); //$NON-NLS-1$
//				solCell5.setCellStyle(cellTopStyle);
				
				//措施5解决期限
				HSSFCell solTerminCell5 = row29.getCell(53);
				if (solTerminCell5 == null) {
					solTerminCell5 = row29.createCell(53);
				}
				if (!"".equals((String)values.get("fv9SlDLDate5"))) { //$NON-NLS-1$ //$NON-NLS-2$
					solTerminCell5.setCellValue(DateUtil.getWeekOfYear((String)values.get("fv9SlDLDate5")) + "/" +  //$NON-NLS-1$ //$NON-NLS-2$
							((String)values.get("fv9SlDLDate5")).substring(0, 4)); //$NON-NLS-1$
				} else {
					solTerminCell5.setCellValue(""); //$NON-NLS-1$
				}
//				solTerminCell5.setCellStyle(cellTopStyle);
				
				//ASW
				ImageCellInfo ASW = new ImageCellInfo(35, 3, 35, 3);
				ImageUtil.GenerateImage(wb, sheet, patri, ASW, ImageUtil.getASW());
				System.out.println("写入图片：ASW.jpg"); //$NON-NLS-1$
				
				//WZG-Erst
				ImageCellInfo WZGErst = new ImageCellInfo(35, 6, 35, 6);
				ImageUtil.GenerateImage(wb, sheet, patri, WZGErst, ImageUtil.getWZGErst());
				System.out.println("写入图片：WZGErst.jpg"); //$NON-NLS-1$
				
				//WZG-Verl
				ImageCellInfo WZGVerl = new ImageCellInfo(35, 9, 35, 9);
				ImageUtil.GenerateImage(wb, sheet, patri, WZGVerl, ImageUtil.getWZGVerl());
				System.out.println("写入图片：WZG-Verl.jpg"); //$NON-NLS-1$
				
				//SWZ-Teile
				ImageCellInfo SWZTeile = new ImageCellInfo(35, 12, 35, 12);
				ImageUtil.GenerateImage(wb, sheet, patri, SWZTeile, ImageUtil.getSWZTeile());
				System.out.println("写入图片：SWZ-Teile.jpg"); //$NON-NLS-1$
				
				//EMTAnl
				ImageCellInfo EMTAnl = new ImageCellInfo(35, 15, 35, 15);
				ImageUtil.GenerateImage(wb, sheet, patri, EMTAnl, ImageUtil.getEMTAnl());
				System.out.println("写入图片：EMTAnl.jpg"); //$NON-NLS-1$
				
				//Note3
				ImageCellInfo Note3 = new ImageCellInfo(35, 18, 35, 18);
				ImageUtil.GenerateImage(wb, sheet, patri, Note3, ImageUtil.getNote3());
				System.out.println("写入图片：Note3.jpg"); //$NON-NLS-1$
				
				//BMG
				ImageCellInfo BMG = new ImageCellInfo(35, 21, 35, 21);
				ImageUtil.GenerateImage(wb, sheet, patri, BMG, ImageUtil.getBMG());
				System.out.println("写入图片：BMG.jpg"); //$NON-NLS-1$
				
				//Note1
				ImageCellInfo Note1 = new ImageCellInfo(35, 24, 35, 24);
				ImageUtil.GenerateImage(wb, sheet, patri, Note1, ImageUtil.getNote1());
				System.out.println("写入图片：Note1.jpg"); //$NON-NLS-1$
				
				//获取各个里程碑的时间点
				Date VFF = (Date)values.get("PH_VFF"); 
				Date PVS = (Date)values.get("PH_PVS"); 
				Date OS = (Date)values.get("PH_0S"); 
				Date SOP = (Date)values.get("PH_SOP"); 
				Date TBT_VFF = (Date)values.get("TBT_VFF"); 
				Date TBT_PVS = (Date)values.get("TBT_PVS"); 
				Date TBT_0S = (Date)values.get("TBT_0S"); 
				
				HashMap<String, Object> result = null;
				//各个时间点都有值才显示底部的图形，否则不显示
				if (VFF != null && PVS != null && OS != null && SOP != null && 
						TBT_VFF != null && TBT_PVS != null && TBT_0S != null) {
					
					//计算各个时间点所在的年、周
					//如果日期在53周，则将其年-1
					int year_tbtvff = DateUtil.getYearByDate(TBT_VFF);
					int kw_tbtvff = DateUtil.getWeekOfYear2(TBT_VFF);
					if (kw_tbtvff == 53) {
						year_tbtvff -= 1;
					}
					
					int year_tbtpvs = DateUtil.getYearByDate(TBT_PVS);
					int kw_tbtpvs = DateUtil.getWeekOfYear2(TBT_PVS);
					if (kw_tbtpvs == 53) {
						year_tbtpvs -= 1;
					}
					
					int year_tbt0s = DateUtil.getYearByDate(TBT_0S);
					int kw_tbt0s = DateUtil.getWeekOfYear2(TBT_0S);
					if (kw_tbt0s == 53) {
						year_tbt0s -= 1;
					}
					
					int year_vff = DateUtil.getYearByDate(VFF);
					int kw_vff = DateUtil.getWeekOfYear2(VFF);
					if (kw_vff == 53) {
						year_vff -= 1;
					}
					
					int year_pvs = DateUtil.getYearByDate(PVS);
					int kw_pvs = DateUtil.getWeekOfYear2(PVS);
					if (kw_pvs == 53) {
						year_pvs -= 1;
					}
					
					int year_0s = DateUtil.getYearByDate(OS);
					int kw_0s = DateUtil.getWeekOfYear2(OS);
					if (kw_0s == 53) {
						year_0s -= 1;
					}
					
					int year_sop = DateUtil.getYearByDate(SOP); 
					int kw_sop = DateUtil.getWeekOfYear2(SOP);
					if (kw_sop == 53) {
						year_sop -= 1;
					}
					
					//根据SOP日期和其所在年，生成74周的数组
					result = getKWArray(SOP, year_sop);
					int[] kws = (int[])result.get("kwnos"); 
					
					//J行合并单元格
					int begin = 1;
					if (Integer.parseInt(result.get("cols_before2") + "") > 0) {  //$NON-NLS-2$
						sheet.addMergedRegion(new Region(34, (short)begin, 34, (short)(begin+Integer.parseInt(result.get("cols_before2") + "")-1)));   //$NON-NLS-2$
						HSSFCell before2Cell = row34.getCell(begin);
						if (before2Cell == null) {
							before2Cell = row34.createCell(begin);
						}
						before2Cell.setCellValue(result.get("year_before2") + "");  //$NON-NLS-2$
						begin += Integer.parseInt(result.get("cols_before2") + "");  //$NON-NLS-2$
					}
					if (Integer.parseInt(result.get("cols_before1") + "") > 0) {  //$NON-NLS-2$
						sheet.addMergedRegion(new Region(34, (short)begin, 34, (short)(begin+Integer.parseInt(result.get("cols_before1") + "")-1)));   //$NON-NLS-2$
						
						HSSFCell before1Cell = row34.getCell(begin);
						if (before1Cell == null) {
							before1Cell = row34.createCell(begin);
						}
						before1Cell.setCellValue(result.get("year_before1") + "");  //$NON-NLS-2$
						begin += Integer.parseInt(result.get("cols_before1") + "");  //$NON-NLS-2$
					}
					if (Integer.parseInt(result.get("cols_current") + "") > 0) {  //$NON-NLS-2$
						sheet.addMergedRegion(new Region(34, (short)begin, 34, (short)(begin+Integer.parseInt(result.get("cols_current") + "")-1)));   //$NON-NLS-2$
						
						HSSFCell currentCell = row34.getCell(begin);
						if (currentCell == null) {
							currentCell = row34.createCell(begin);
						}
						currentCell.setCellValue(result.get("year_current") + "");  //$NON-NLS-2$
						begin += Integer.parseInt(result.get("cols_current") + "");  //$NON-NLS-2$
					}
					if (Integer.parseInt(result.get("cols_after") + "") > 0) {  //$NON-NLS-2$
						sheet.addMergedRegion(new Region(34, (short)begin, 34, (short)(begin+Integer.parseInt(result.get("cols_after") + "")-1)));   //$NON-NLS-2$
						
						HSSFCell afterCell = row34.getCell(begin);
						if (afterCell == null) {
							afterCell = row34.createCell(begin);
						}
						afterCell.setCellValue(result.get("year_after") + "");  //$NON-NLS-2$
						begin += Integer.parseInt(result.get("cols_current") + "");  //$NON-NLS-2$
					}
					
					//计算Soll中TBT和各个里程碑的时间所在单元格
					/*
					 * 基本思路为：
					 * 计算74周的第一周的周一的日期，
					 * 再计算各个时间点所在周的周一的日期
					 * 计算各个里程碑与第一周之间相差多少周
					 * */
					//首先计算周数组中的第一周的周一的日期
					int firstKW = kws[0];
					int firstYear = 0; //周数组中的第一年
					if (Integer.parseInt(result.get("cols_after") + "") > 0) {  //$NON-NLS-2$
						firstYear = (Integer)result.get("year_after"); 
					}
					if (Integer.parseInt(result.get("cols_current") + "") > 0) {  //$NON-NLS-2$
						firstYear = (Integer)result.get("year_current"); 
					}
					if (Integer.parseInt(result.get("cols_before1") + "") > 0) {  //$NON-NLS-2$
						firstYear = (Integer)result.get("year_before1"); 
					}
					if (Integer.parseInt(result.get("cols_before2") + "") > 0) {  //$NON-NLS-2$
						firstYear = (Integer)result.get("year_before2"); 
					}
					Date firstDate = DateUtil.getFirstDayOfWeek(firstYear, firstKW); //第一周的周一日期
					
					//计算各个时间点所在周的周一的日期
					Date mon_tbtvff = DateUtil.getFirstDayOfWeek(TBT_VFF); //TBTVFF所在周的周一日期
					Date mon_tbtpvs = DateUtil.getFirstDayOfWeek(TBT_PVS);//TBTPVS所在周的周一日期
					Date mon_tbt0s = DateUtil.getFirstDayOfWeek(TBT_0S);//TBT0S所在周的周一日期
					Date mon_vff = DateUtil.getFirstDayOfWeek(VFF);
					Date mon_pvs = DateUtil.getFirstDayOfWeek(PVS);
					Date mon_0s = DateUtil.getFirstDayOfWeek(OS);
					Date mon_sop = DateUtil.getFirstDayOfWeek(SOP);
					
					//计算各个时间点与第一周相差的周数
					int vff = DateUtil.dateDiff(firstDate, mon_vff)/7;
					int pvs = DateUtil.dateDiff(firstDate, mon_pvs)/7;
					int os = DateUtil.dateDiff(firstDate, mon_0s)/7;
					int sop = DateUtil.dateDiff(firstDate, mon_sop)/7;
					int tbt_vff = DateUtil.dateDiff(firstDate, mon_tbtvff)/7;
					int tbt_pvs = DateUtil.dateDiff(firstDate, mon_tbtpvs)/7;
					int tbt_0s = DateUtil.dateDiff(firstDate, mon_tbt0s)/7;
					int tbt_sop = os + 8; //系统中没有SOP的TBT时间，默认为0S开始后10周
					
					//循环写入74周
					for (int i = 0; i < kws.length; i++) {
						HSSFCell kwCell = row39.getCell(i+1);
						System.out.println("i = " + i);
						if (kwCell == null) {
							kwCell = row39.createCell(i+1);
						}
						if (i == tbt_vff) {
							ImageCellInfo vffCell = new ImageCellInfo(37, i+1, 37, i+1);
							ImageUtil.GenerateImage(wb, sheet, patri, vffCell, ImageUtil.getTBTVFF());
							System.out.println("写入图片：TBT-VFF.jpg"); 
						}
						if (i == vff) {
							ImageCellInfo vffCell = new ImageCellInfo(36, i, 36, i+4);
							ImageUtil.GenerateImage(wb, sheet, patri, vffCell, ImageUtil.getVFF());
							System.out.println("写入图片：VFF.jpg"); 
						}
						if (i == tbt_pvs) {
							ImageCellInfo pvsCell = new ImageCellInfo(37, i+1, 37, i+1);
							ImageUtil.GenerateImage(wb, sheet, patri, pvsCell, ImageUtil.getTBTPVS());
							System.out.println("写入图片：TBT-PVS.jpg"); 
						}
						if (i == pvs) {
							ImageCellInfo vffCell = new ImageCellInfo(36, i, 36, i+8);
							ImageUtil.GenerateImage(wb, sheet, patri, vffCell, ImageUtil.getPVS());
							System.out.println("写入图片：PVS.jpg"); 
						}
						if (i == tbt_0s) {
							ImageCellInfo osCell = new ImageCellInfo(37, i+1, 37, i+1);
							ImageUtil.GenerateImage(wb, sheet, patri, osCell, ImageUtil.getTBT0S());
							System.out.println("写入图片：TBT-0S.jpg"); 
						}
						if (i == os) {
							ImageCellInfo vffCell = new ImageCellInfo(36, i, 36, os+6);
							ImageUtil.GenerateImage(wb, sheet, patri, vffCell, ImageUtil.get0S());
							System.out.println("写入图片：0S.jpg"); 
						}
						if (i == tbt_sop) {
							ImageCellInfo sopCell = new ImageCellInfo(37, i+1, 37, i+1);
							ImageUtil.GenerateImage(wb, sheet, patri, sopCell, ImageUtil.getTBTSOP());
							System.out.println("写入图片：TBT-SOP.jpg"); 
						}
						if (i == sop) {
							ImageCellInfo vffCell = new ImageCellInfo(36, i, 36, sop+10);
							ImageUtil.GenerateImage(wb, sheet, patri, vffCell, ImageUtil.getSOP());
							System.out.println("写入图片：SOP.jpg"); 
						}
						//写入TBT三个字母
						if ((i==tbt_vff+1) || (i==tbt_pvs+1) || (i==tbt_0s+1) || (i==tbt_sop+1)) {
							HSSFCell vffCell = row37.getCell(i+1);
							if (vffCell == null) {
								vffCell = row37.createCell(i+1);
							}
							vffCell.setCellValue("T");
						}
						if ((i==tbt_vff+2) || (i==tbt_pvs+2) || (i==tbt_0s+2) || (i==tbt_sop+2)) {
							HSSFCell vffCell = row37.getCell(i+1);
							if (vffCell == null) {
								vffCell = row37.createCell(i+1);
							}
							vffCell.setCellValue("B");
						}
						if ((i==tbt_vff+3) || (i==tbt_pvs+3) || (i==tbt_0s+3) || (i==tbt_sop+3)) {
							HSSFCell vffCell = row37.getCell(i+1);
							if (vffCell == null) {
								vffCell = row37.createCell(i+1);
							}
							vffCell.setCellValue("T");
						}
						kwCell.setCellValue(kws[i] + ""); 
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new FawvmLoaderException(e.getMessage());
			}		


		}

		/*
		 * 根据SOP时间计算时间轴
		 * 时间轴——共74周，以SOP后的12周为截止周
		 */
		public static HashMap getKWArray(Date SOP, int year_sop) {
			int[] kwnos = new int[74];//时间轴数组
			
			int sop_days = DateUtil.getMaxWeekNumOfYear(year_sop); //sop所在年的总周数
			int sop_before1 = year_sop - 1; //SOP前一年
			int sop_before1_days = DateUtil.getMaxWeekNumOfYear(sop_before1); //sop前一年的总周数
			int sop_before2 = year_sop - 2; //SOP前两年
			int sop_before2_days = DateUtil.getMaxWeekNumOfYear(sop_before2); //sop前两年的总周数

			int cols_current = 0; //sop所在年的周数
			int cols_after = 0; //sop之后年的周数
			int cols_before1 = 0;// sop前一年的周数
			int cols_before2 = 0; //sop前两年的周数
			
			int year_before1 = 0, year_before2 = 0, year_current = 0, year_after = 0;
			
			int kw_sop = DateUtil.getWeekOfYear2(SOP); 
			System.out.println("SOP所在周数 : " + kw_sop); 
			System.out.println("SOP所在年的总周数： " + sop_days); 
			
			//SOP当前年
			int[] current = new int[kw_sop];
			for (int i=1; i<kw_sop+1; i++) {
				current[i-1] = i;
			}
			System.out.println("sop current length = " + current.length); 
			System.out.println("sop current = " + Arrays.toString(current)); 
			cols_current += kw_sop;
			year_current = year_sop;
			
			//sop之后的12周
			int[] aftersop = new int[12];
			if ((sop_days - kw_sop) > 12) {
				//sop之后的12周没有跨年
				for (int i = 0; i < 12; i++) {
					aftersop[i] = kw_sop+1;
					kw_sop++;
				}
				cols_current += 12;
			} else {
				//sop之后的12周跨年
				int sep = sop_days - kw_sop; //当前年SOP后有多少周
				for (int i=0; i<sep; i++) {
					aftersop[i] = kw_sop + 1;
					kw_sop++;
				}
				cols_current += sep;
				
				//跨年之后的周数
				int last = 12 - sep;
				int begin = 1;
				for (int i=sep; i<12; i++) {
					aftersop[i] = begin;
					begin++;
				}
				cols_after += last;
				year_after = year_sop + 1;
			}
			System.out.println("aftersop length = " + aftersop.length); 
			System.out.println("aftersop = " + Arrays.toString(aftersop)); 
			
			//sop前一年
			int before = 74 - current.length - aftersop.length;
			int[] beforesop = new int[before];
			if (before > sop_before1_days) {
				//剩余周数大于一整年
				cols_before1 = sop_before1_days;
				year_before1 = sop_before1;
				int before1 = before - sop_before1_days;
				for (int k = 0; k < sop_before1_days; k++) {
					beforesop[before1+k] = k+1;
				}
				
				cols_before2 += before1;
				year_before2 = sop_before2;
				for (int m = 0; m < before1; m++) {
					beforesop[m] = sop_before2_days - before1 + m + 1;
				}
				
			} else {
				for (int i = 0; i < before; i++) {
					beforesop[i] = sop_before1_days-before+i+1;
				}
				cols_before1 = before;
				year_before1 = sop_before1;
			}
			System.out.println("beforesop length = " + beforesop.length); 
			System.out.println("beforesop = " + Arrays.toString(beforesop)); 
			
			System.arraycopy(beforesop, 0, kwnos, 0, beforesop.length);
			System.arraycopy(current, 0, kwnos, beforesop.length, current.length);
			System.arraycopy(aftersop, 0, kwnos, beforesop.length + current.length, aftersop.length);
			
			System.out.println(Arrays.toString(kwnos));
			
			HashMap map = new HashMap<String, Object>();
			map.put("kwnos", kwnos); 
			map.put("cols_before1", cols_before1); 
			map.put("cols_before2", cols_before2); 
			map.put("cols_current", cols_current); 
			map.put("cols_after", cols_after); 
			
			map.put("year_before2", year_before2); 
			map.put("year_before1", year_before1); 
			map.put("year_current", year_current); 
			map.put("year_after", year_after); 
			
			return map;
		}
}
