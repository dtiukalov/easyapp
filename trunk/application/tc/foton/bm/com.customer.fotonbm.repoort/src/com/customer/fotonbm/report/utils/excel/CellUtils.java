package com.customer.fotonbm.report.utils.excel;

import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fotonbm.report.utils.ImageUtil;
import com.customer.fotonbm.report.utils.Utils;

public class CellUtils {
	/*
	 * 在给定文档的第n个sheet页中10*10个cell内搜索templatelogo的位置 作为循环起始点，返回空则没有找到这个值或者模板有问题
	 */
	public static LocationInfo getLocation(String template, int sheetpage,String templatelogo){
		try {
			InputStream inputStream = new FileInputStream(template);
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			HSSFSheet sheet = workbook.getSheetAt(sheetpage);
			for(int row=0; row<10 ; row++){
				for(int colume = 0; colume<10; colume++){
					HSSFRow r =  sheet.getRow(row);
					if(r != null){
						HSSFCell cell = r.getCell(colume);
						if(cell != null){
							HSSFRichTextString value = cell.getRichStringCellValue();
							
							if(value != null && templatelogo.equalsIgnoreCase(value.getString())){
								LocationInfo info = new LocationInfo();
								info.setRow(row);
								info.setColume(colume);
								return info;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		return null;
	}
	
	// 确保表格样式覆盖（后一列与前一列样式一致）    单元格内数据设置成内数据自动换行
	public static HSSFCell getCell(int rowPos, int columnPos, HSSFSheet sheet){
		
		HSSFRow row = sheet.getRow(rowPos);
		if (row == null) {
			row = sheet.createRow(rowPos);
		}

		HSSFCell cell = row.getCell(columnPos);
		if (cell == null) {
			if (columnPos > 0) {
				HSSFCell frontColumnCell = row.getCell(columnPos - 1);

				cell = row.createCell(columnPos);
				cell.getCellStyle().setWrapText(true); // cell内数据自动换行
				if (frontColumnCell != null) {
					// emily 确保表格样式覆盖
					cell.setCellStyle(frontColumnCell.getCellStyle());
					sheet.setColumnWidth(columnPos, sheet
							.getColumnWidth(columnPos - 1));
					frontColumnCell.setCellStyle(row.getCell(
							columnPos - 2).getCellStyle());
					// emily
				}
			}
		}
		return cell;
	}
	/*
	 * 此方法向excel单元格中插入值。区分 String类型和 图片类型 jpg（图片包括全填充、右半填充、区域填充3种方式）
	 * 当插入图片在固定位置 或者特殊情况，即不在循环之内 ，调用此方法时 可将cell值设置为null,图片信息在object对象中录入
	 */
	public static void setCellValue(HSSFWorkbook workbook,  HSSFSheet sheet, HSSFCell cell,  HSSFPatriarch patri, Object object){
		if(object instanceof String){
			cell.setCellValue(new HSSFRichTextString(object
					.toString().trim()));
			cell.getCellStyle().setWrapText(true); // cell内数据自动换行
		} else if (object instanceof CellInfo){
			CellInfo value = (CellInfo) object;
			String type = value.getType();
			
			if(cell == null){//特殊位置的图片 cell的传入值才会是空
				cell = getCell(value.getRow(), value.getColumn(),sheet);
			} else {
				value.setRow(cell.getRowIndex());
				value.setColumn(cell.getColumnIndex());
			}
			
			if(type.equalsIgnoreCase(Utils.TYPE_IMAGE)){
				BufferedImage bufferedImage = (BufferedImage) value.getImage();

				byte[] imageValue = ImageUtil
						.getImgValue(bufferedImage);

				HSSFClientAnchor anchor = new HSSFClientAnchor();

				HSSFPicture picture = patri.createPicture(anchor,
						workbook.addPicture(imageValue,
								HSSFWorkbook.PICTURE_TYPE_JPEG));
				
				if (Utils.IMAGE_FILL_FULL_TYPE
						.equals(value.getImageFillType())) {
					ImageUtil.setImageCoordinateFull(sheet, anchor,
							picture, value.getColumn(), value.getRow());
				}

				if (Utils.IMAGE_FILL_HALF_TYPE
						.equals(value.getImageFillType())) {
					String cellValue = cell.getRichStringCellValue().getString();
					if (cellValue == null
							|| cellValue.trim().equals("")) {
						ImageUtil.setImageCoordinateFull(sheet, anchor,
								picture, value.getColumn(), value.getRow());
					} else {
						ImageUtil.setImageCoordinateHalf(sheet, anchor,
								picture, value.getColumn(), value.getRow());
					}
				}

				if (Utils.IMAGE_FILL_REGION_TYPE
						.equals(value.getImageFillType())) {
					ImageUtil.setImageCoordinateRegion(sheet, anchor,
							picture, value.getColumn(), value.getToColumn(), value.getRow(), value.getToRow());
				}
			}
		}
	}
	
	// 单元格合并	
	public static int setMergedRegion(HSSFSheet sheet, int row, int toRow, int col, int toCol){
		CellRangeAddress region = new CellRangeAddress(row, toRow, col,
				toCol);
		return sheet.addMergedRegion(region);
	}

}
