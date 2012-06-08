package com.customer.fawvw.issues.commands.issueStatus;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Text;

import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;

public class AssPlacementWrite {

	/**
	 * excel模板中存放图片，只输入具体数值
	 */
	static void importDataPage1(HSSFWorkbook workbook,
			HSSFSheet sheetPage, HashMap<String, Object> values) {
		
		if (values.get("assPlacement") != null) { 
			HashMap<String, Object> AssIssues = (HashMap<String, Object>)values.get("assPlacement"); 
			
			HSSFRow row5 = sheetPage.getRow(5);
			HSSFRow row7 = sheetPage.getRow(7);
			HSSFRow row8 = sheetPage.getRow(8);
			HSSFRow row9 = sheetPage.getRow(9);
			HSSFRow row12 = sheetPage.getRow(12);
			HSSFRow row13 = sheetPage.getRow(13);
			HSSFRow row14 = sheetPage.getRow(14);
			HSSFRow row27 = sheetPage.getRow(27);
			HSSFRow row28 = sheetPage.getRow(28);
			HSSFRow row29 = sheetPage.getRow(29);
			
			int sum = ((Map<String, Integer>) AssIssues.get("front")).get("red") +   
						((Map<String, Integer>) AssIssues.get("front")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("front")).get("green") +   
						((Map<String, Integer>) AssIssues.get("chassis")).get("red") +   
						((Map<String, Integer>) AssIssues.get("chassis")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("chassis")).get("green") +   
						((Map<String, Integer>) AssIssues.get("electronik")).get("red") +   
						((Map<String, Integer>) AssIssues.get("electronik")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("electronik")).get("green") +   
						((Map<String, Integer>) AssIssues.get("driver")).get("red") +   
						((Map<String, Integer>) AssIssues.get("driver")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("driver")).get("green") +   
						((Map<String, Integer>) AssIssues.get("door")).get("red") +   
						((Map<String, Integer>) AssIssues.get("door")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("door")).get("green") +   
						((Map<String, Integer>) AssIssues.get("inner")).get("red") +   
						((Map<String, Integer>) AssIssues.get("inner")).get("yellow") +   
						((Map<String, Integer>) AssIssues.get("inner")).get("green") +   
						((Map<String, Integer>) AssIssues.get("behind")).get("red") +   
						((Map<String, Integer>) AssIssues.get("behind")).get("yellow") +  
						((Map<String, Integer>) AssIssues.get("behind")).get("green");  
			
	
			//写入问题总数Gesamt
			HSSFCell cell_5_2 = row5.getCell(2);
			if (cell_5_2 == null) {
				cell_5_2 = row5.createCell(2);
			}
			cell_5_2.setCellValue(sum);
			
			//前端
			HSSFCell cell_27_3 = row27.getCell(3);
			cell_27_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("red"));  
			
			HSSFCell cell_28_3 = row28.getCell(3);
			cell_28_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("yellow"));  
			
			HSSFCell cell_29_3 = row29.getCell(3);
			cell_29_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("green"));  
			
			//底盘
			HSSFCell cell_27_6 = row27.getCell(6);
			cell_27_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("red"));  
			
			HSSFCell cell_28_6 = row28.getCell(6);
			cell_28_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("yellow"));  
			
			HSSFCell cell_29_6 = row29.getCell(6);
			cell_29_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("green"));  
			
			//电器
			HSSFCell cell_27_9 = row27.getCell(9);
			cell_27_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("red"));  
			
			HSSFCell cell_28_9 = row28.getCell(9);
			cell_28_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("yellow"));  
			
			HSSFCell cell_29_9 = row29.getCell(9);
			cell_29_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("green"));  
			
			//驾驶模块
			HSSFCell cell_12_2 = row12.getCell(2);
			cell_12_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("red"));  
			
			HSSFCell cell_13_2 = row13.getCell(2);
			cell_13_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("yellow"));  

			HSSFCell cell_14_2 = row14.getCell(2);
			cell_14_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("green"));  
			
			//车门
			HSSFCell row_7_4 = row7.getCell(4);
			row_7_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("red"));  
			
			HSSFCell cell_8_4 = row8.getCell(4);
			cell_8_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("yellow"));  
			
			HSSFCell row_9_4 = row9.getCell(4);
			row_9_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("green"));  
			
			//内饰
			HSSFCell cell_7_7 = row7.getCell(7);
			cell_7_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("red"));  
			
			HSSFCell cell_8_7 = row8.getCell(7);
			cell_8_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("yellow"));  
			
			HSSFCell cell_9_7 = row9.getCell(7);
			cell_9_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("green"));  
			
			//后部
			HSSFCell cell_7_10 = row7.getCell(10);
			cell_7_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("red"));  
			
			HSSFCell cell_8_10 = row8.getCell(10);
			cell_8_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("yellow"));  
			
			HSSFCell cell_9_10 = row9.getCell(10);
			cell_9_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("green"));  
			
		
		}
	}
	
	/**
	 * excel模板中不存在图片，所有图片均由程序写入
	 */
	static void importDataPage2(HSSFWorkbook workbook,
			HSSFSheet sheetPage, HashMap<String, Object> values) {
		
		if (values.get("assPlacement") != null) { 
			HSSFPatriarch patri = sheetPage.createDrawingPatriarch();
			
			HashMap<String, Object> AssIssues = (HashMap<String, Object>)values.get("assPlacement"); 
			
			Map<String, Integer> front = (Map<String, Integer>) AssIssues.get("front");
			Map<String, Integer> chassis = (Map<String, Integer>) AssIssues.get("chassis");
			Map<String, Integer> electronik = (Map<String, Integer>) AssIssues.get("electronik");
			Map<String, Integer> driver = (Map<String, Integer>) AssIssues.get("driver");
			Map<String, Integer> door = (Map<String, Integer>) AssIssues.get("door");
			Map<String, Integer> inner = (Map<String, Integer>) AssIssues.get("inner");
			Map<String, Integer> behind = (Map<String, Integer>) AssIssues.get("behind");
			
			int sum = front.get("red") + front.get("yellow") + front.get("green") +   
				chassis.get("red") + chassis.get("yellow") + chassis.get("green") +   
				electronik.get("red") + electronik.get("yellow") + electronik.get("green") +   
				driver.get("red") + driver.get("yellow") + driver.get("green") +   
				door.get("red") + door.get("yellow") + door.get("green") +   
				inner.get("red") + inner.get("yellow") + inner.get("green") +   
				behind.get("red") + behind.get("yellow") + behind.get("green");  
			
			int sum_yellow = front.get("yellow") + chassis.get("yellow") +   
						electronik.get("yellow") + driver.get("yellow") +   
						door.get("yellow") + inner.get("yellow") +   
						behind.get("yellow");
			
			int sum_red = front.get("red") + chassis.get("red") +   
						electronik.get("red") + driver.get("red") +   
						door.get("red") + inner.get("red") +   
						behind.get("red");
	
//			HSSFCellStyle textStyle = workbook.createCellStyle();   
//			textStyle.setWrapText(true);   
//			textStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
//			textStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);

			HSSFRow row0 = sheetPage.getRow(0);
//			Gesamt —— 总数
			HSSFCell gesamtCell = row0.createCell(5);
			gesamtCell.setCellValue(sum);
			
//			Rotpunkte —— 红灯
			HSSFCell yellowCell = row0.createCell(10);
			yellowCell.setCellValue(sum_red);
			
//			Gelbpunkte —— 黄灯
			HSSFCell redCell = row0.createCell(15);
			redCell.setCellValue(sum_yellow);
			
			try {
//				ImageCellInfo carTopCell = new ImageCellInfo(10, 9, 13, 29);
//				ImageUtil.GenerateImage(workbook, sheetPage, patri, carTopCell, ImageUtil.getCarTop());
//				System.out.println("写入图片：top.jpg"); 
//				
//				ImageCellInfo carBottomCell = new ImageCellInfo(14, 4, 22, 29);
//				ImageUtil.GenerateImage(workbook, sheetPage, patri, carBottomCell, ImageUtil.getCarBottom());
//				System.out.println("写入图片：bottom.jpg"); 
				
				ImageCellInfo carCell = new ImageCellInfo(10, 4, 28, 30);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, carCell, ImageUtil.getCarImage());
				System.out.println("写入图片：car.jpg"); 
				
				HSSFRow row3 = sheetPage.getRow(3);
				HSSFRow row5 = sheetPage.getRow(5);
				HSSFRow row6 = sheetPage.getRow(6);
				HSSFRow row7 = sheetPage.getRow(7);
				HSSFRow row8 = sheetPage.getRow(8);
				HSSFRow row9 = sheetPage.getRow(9);
				HSSFRow row10 = sheetPage.getRow(10);
				HSSFRow row11 = sheetPage.getRow(11);
				HSSFRow row12 = sheetPage.getRow(12);
				HSSFRow row26 = sheetPage.getRow(26);
				HSSFRow row27 = sheetPage.getRow(27);
				HSSFRow row28 = sheetPage.getRow(28);
				HSSFRow row30 = sheetPage.getRow(30);
				HSSFRow row31 = sheetPage.getRow(31);
				HSSFRow row32 = sheetPage.getRow(32);
				HSSFRow row33 = sheetPage.getRow(33);
				HSSFRow row34 = sheetPage.getRow(34);
				
				//驾驶模块
				ImageCellInfo driverCell = new ImageCellInfo(6, 7, 8, 7);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, driverCell, getRYGImage(driver));
				
				if (driver.get("red") > 0) {
					HSSFCell cell_6_8 = row6.createCell(8);
					cell_6_8.setCellValue(driver.get("red"));
//					cell_6_8.setCellStyle(textStyle);
				} 
				
				if (driver.get("yellow") > 0) {
					HSSFCell cell_7_8 = row7.createCell(8);
					cell_7_8.setCellValue(driver.get("yellow"));
//					cell_7_8.setCellStyle(textStyle);
				} 
				
				if (driver.get("green") > 0) {
					HSSFCell cell_8_8 = row8.createCell(8);
					cell_8_8.setCellValue(driver.get("green"));
//					cell_8_8.setCellStyle(textStyle);
				} 
				
				//车门
				ImageCellInfo doorCell = new ImageCellInfo(6, 15, 8, 15);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, doorCell, getRYGImage(door));
				
				if (door.get("red") > 0) {
					HSSFCell cell_6_16 = row6.createCell(16);
					cell_6_16.setCellValue(door.get("red"));
//					cell_6_16.setCellStyle(textStyle);
				} 
				
				if (door.get("yellow") > 0) {
					HSSFCell cell_7_16 = row7.createCell(16);
					cell_7_16.setCellValue(door.get("yellow"));
//					cell_7_16.setCellStyle(textStyle);
				} 
				
				if (door.get("green") > 0) {
					HSSFCell cell_8_16 = row8.createCell(16);
					cell_8_16.setCellValue(door.get("green"));
//					cell_8_16.setCellStyle(textStyle);
				}
				
				//内饰
				ImageCellInfo innerCell = new ImageCellInfo(6, 21, 8, 21);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, innerCell, getRYGImage(inner));
				
				if (inner.get("red") > 0) {
					HSSFCell cell_6_22 = row6.createCell(22);
					cell_6_22.setCellValue(inner.get("red"));
//					cell_6_22.setCellStyle(textStyle);
				} 
				
				if (inner.get("yellow") > 0) {
					HSSFCell cell_7_22 = row7.createCell(22);
					cell_7_22.setCellValue(inner.get("yellow"));
//					cell_7_22.setCellStyle(textStyle);
				} 
				
				if (inner.get("green") > 0) {
					HSSFCell cell_8_22 = row8.createCell(22);
					cell_8_22.setCellValue(inner.get("green"));
//					cell_8_22.setCellStyle(textStyle);
				} 
				
				//后端
				ImageCellInfo heckRedCell = new ImageCellInfo(6, 28, 8, 28);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, heckRedCell, getRYGImage(behind));
				
				if (behind.get("red") > 0) {
					HSSFCell cell_6_29 = row6.createCell(29);
					cell_6_29.setCellValue(behind.get("red"));
//					cell_6_29.setCellStyle(textStyle);
				} 
				
				if (behind.get("yellow") > 0) {
					HSSFCell cell_7_29 = row7.createCell(29);
					cell_7_29.setCellValue(behind.get("yellow"));
//					cell_7_29.setCellStyle(textStyle);
				} 
				
				if (behind.get("green") > 0) {
					HSSFCell cell_8_29 = row8.createCell(29);
					cell_8_29.setCellValue(behind.get("green"));
//					cell_8_29.setCellStyle(textStyle);
				}
				
				//前端
				ImageCellInfo vordRedCell = new ImageCellInfo(32, 6, 34, 6);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, vordRedCell, getRYGImage(front));
				
				if (front.get("red") > 0) {
					HSSFCell cell_32_7 = row32.createCell(7);
					cell_32_7.setCellValue(front.get("red"));
//					cell_32_7.setCellStyle(textStyle);
				} 
				
				if (front.get("yellow") > 0) {
					HSSFCell cell_33_7 = row33.createCell(7);
					cell_33_7.setCellValue(front.get("yellow"));
//					cell_33_7.setCellStyle(textStyle);
				}
				
				if (front.get("green") > 0) {
					HSSFCell cell_34_7 = row34.createCell(7);
					cell_34_7.setCellValue(front.get("green"));
//					cell_34_7.setCellStyle(textStyle);
				} 
				
				//底盘
				ImageCellInfo chassicRedCell = new ImageCellInfo(32, 17, 34, 17);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicRedCell, getRYGImage(chassis));
				
				if (chassis.get("red") > 0) {
					HSSFCell cell_32_18 = row32.createCell(18);
					cell_32_18.setCellValue(chassis.get("red"));
//					cell_32_18.setCellStyle(textStyle);
				}
				
				if (chassis.get("yellow") > 0) {
					HSSFCell cell_33_18 = row33.createCell(18);
					cell_33_18.setCellValue(chassis.get("yellow"));
//					cell_33_18.setCellStyle(textStyle);
				}
				
				if (chassis.get("green") > 0) {
					HSSFCell cell_34_18 = row34.createCell(18);
					cell_34_18.setCellValue(chassis.get("green"));
//					cell_34_18.setCellStyle(textStyle);
				} 
				
				//电器
				ImageCellInfo eleckRedCell = new ImageCellInfo(32, 26, 34, 26);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckRedCell, getRYGImage(electronik));
				
				if (electronik.get("red") > 0) {
					HSSFCell cell_32_27 = row32.createCell(27);
					cell_32_27.setCellValue(electronik.get("red"));
//					cell_32_27.setCellStyle(textStyle);
				} 
				
				if (electronik.get("yellow") > 0) {
					HSSFCell cell_33_27 = row33.createCell(27);
					cell_33_27.setCellValue(electronik.get("yellow"));
//					cell_33_27.setCellStyle(textStyle);
				}
				
				if (electronik.get("green") > 0) {
					HSSFCell cell_34_27 = row34.createCell(27);
					cell_34_27.setCellValue(electronik.get("green"));
//					cell_34_27.setCellStyle(textStyle);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	/**
	 * 通过装车位置的红黄绿灯的个数判断写入哪张图片
	 */
	public static BufferedImage getRYGImage(Map<String, Integer> assplace) {
		try {
			if (assplace.get("red") > 0) {
				if (assplace.get("yellow") > 0) {
					if (assplace.get("green") > 0) {
						return ImageUtil.getRYG(); //红黄绿
					} else {
						return ImageUtil.getRYW(); //红黄
					}
				} else {
					if (assplace.get("green") > 0) {
						return ImageUtil.getRWG(); //红 绿
					} else {
						return ImageUtil.getRWW(); //红
					}
				}
			} else if (assplace.get("yellow") > 0) {
				if (assplace.get("green") > 0) {
					return ImageUtil.getWYG(); //黄 绿
				} else {
					return ImageUtil.getWYW(); //黄 
				}
			} else if (assplace.get("green") > 0) {
				return ImageUtil.getWWG(); //绿
			} else {
				return ImageUtil.getWWW();//都是白灯
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}

