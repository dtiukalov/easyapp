package com.customer.fotonbm.report.utils;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

/**
 * 根据文件路径读取图片数据,只支持JPEG格式
 * 
 * @author LeslieGu
 */
public class ImageUtil {
	/**
	 * width of 1px in columns with default width in units of 1/256 of a
	 * character width
	 */
	private static final float PX_DEFAULT = 32.00f;

	/**
	 * width of 1px in columns with overridden width in units of 1/256 of a
	 * character width
	 */
	private static final float PX_MODIFIED = 36.56f;

	/**
	 * Height of 1px of a row
	 */
	private static final int PX_ROW = 15;


	public static byte[] readImg(File imageFile) {
		try {
			return readImg(new FileInputStream(imageFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static BufferedImage readBufferedImg(File imageFile) {
		try {
			return readBufferedImg(new FileInputStream(imageFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static byte[] readImg(InputStream in) {
		return getImgValue(readBufferedImg(in));
	}

	public static BufferedImage readBufferedImg(InputStream in) {
		if (in != null) {
			try {
				return ImageIO.read(in);
			} catch (Exception e1) {
				e1.printStackTrace();
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return null;
	}
	
	public static BufferedImage getLogoImage(){
		try {
			return ImageUtil.readBufferedImg(new FileInputStream(new File(Utils.LOGO_FILE_PATH)));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static byte[] getImgValue(BufferedImage bufferImg) {
		byte[] imgByte = null;

		if (bufferImg != null) {
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();

			try {
				ImageIO.write(bufferImg, "JPEG", byteArrayOut);
				imgByte = byteArrayOut.toByteArray();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally {
				if (byteArrayOut != null) {
					try {
						byteArrayOut.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return imgByte;
	}

	public static BufferedImage BufferedImageResizeByWitdh(
			BufferedImage bufferedImage, int newWidth) {
		int width = bufferedImage.getWidth();
		int hight = bufferedImage.getHeight();

		if (width > newWidth) {
			int newHight = (int) (((hight * 1.0) / width) * newWidth);

			BufferedImage tag = new BufferedImage(newWidth, newHight,
					BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.createGraphics();   
			  
            g.setColor(Color.white);   
            g.fillRect(0, 0, newWidth, newHight);   
			g.drawImage(bufferedImage, 0, 0, newWidth,
					newHight, null);

			return tag;
		}

		return bufferedImage;
	}
	
	// TODO：关于图片处理的方案，重复性较大，可以重构下(LeslieGu)
	// 将图片填充在单元格中
	public static void setImageCoordinateFull(HSSFSheet sheet,
			HSSFClientAnchor anchor, HSSFPicture picture, int columnPos,
			int rowPos) {

		picture.resize();

		anchor.setCol1((short) columnPos);
		anchor.setCol2((short) columnPos);
		anchor.setRow1(rowPos);
		anchor.setRow2(rowPos);
		anchor.setDx1(20);
		anchor.setDy1(20);

		double imageWidth = picture.getImageDimension().getWidth();
		double imageHeight = picture.getImageDimension().getHeight();

		float columnWidthHalfInPixels = getColumnWidthInPixels(sheet,
				(short) columnPos);
		float rowHeightInPixels = getRowHeightInPixels(sheet, rowPos);
		HSSFRow row = sheet.getRow(rowPos);
		setPictureSize(imageWidth, imageHeight, columnWidthHalfInPixels,
				rowHeightInPixels, anchor, picture, row);
	}

	// 将图片显示在单元格的一半中
	public static void setImageCoordinateHalf(HSSFSheet sheet,
			HSSFClientAnchor anchor, HSSFPicture picture, int columnPos,
			int rowPos) {

		picture.resize();

		anchor.setCol1((short) columnPos);
		anchor.setCol2((short) columnPos);
		anchor.setRow1(rowPos);
		anchor.setRow2(rowPos);
		anchor.setDx1(20);
		anchor.setDy1(20);

		HSSFRow row = sheet.getRow(rowPos);

		double imageWidth = picture.getImageDimension().getWidth();
		double imageHeight = picture.getImageDimension().getHeight();

		float columnWidthInPixels = getColumnWidthInPixels(sheet,
				(short) columnPos);
		float rowHeightInPixels = getRowHeightInPixels(sheet, rowPos);

		double imgWidthWantPixels = columnWidthInPixels / 2;
		double scale = imgWidthWantPixels / imageWidth;
		double imgheightWantPixels = imageHeight * scale;

		int dx2 = (int) (imgWidthWantPixels / columnWidthInPixels * 1024);
		int dy2 = (int) (imgheightWantPixels / rowHeightInPixels * 256);

		if (imgheightWantPixels > rowHeightInPixels) {
			row.setHeight((short) (imgheightWantPixels * PX_ROW));
		}
		// 设制图片靠右
		anchor.setDx1(dx2);
		anchor.setDy1(20);
		anchor.setDx2(1024);
		anchor.setDy2(dy2);
	}

	// 将图片显示在区域中
	public static void setImageCoordinateRegion(HSSFSheet sheet,
			HSSFClientAnchor anchor, HSSFPicture picture, int columnPos, int toColumn,
			int rowPos, int toRow ) {

		picture.resize();

		anchor.setCol1((short) columnPos);
		anchor.setCol2((short) toColumn);
		anchor.setRow1(rowPos);
		anchor.setRow2(toRow);
		anchor.setDx1(20);
		anchor.setDy1(20);

		double imageWidth = picture.getImageDimension().getWidth();
		double imageHeight = picture.getImageDimension().getHeight();

		float columnWidthInPixels = 0;

		for (int i = 0; i <= toColumn - columnPos; i++) {
			columnWidthInPixels += getColumnWidthInPixels(sheet,
					(short) (columnPos + i));
		}

		float rowHeightInPixels = 0;

		for (int j = 0; j <= columnPos - rowPos; j++) {
			rowHeightInPixels += getRowHeightInPixels(sheet, rowPos
					+ j);
		}
		HSSFRow row = sheet.getRow(toRow);

		if (imageWidth > columnWidthInPixels) {

			double imgWidthWantPixels = columnWidthInPixels;
			double scale = imgWidthWantPixels / imageWidth;
			double imgheightWantPixels = imageHeight * scale;

			int dx2 = (int) (imgWidthWantPixels / columnWidthInPixels * 1024);
			int dy2 = (int) (imgheightWantPixels / rowHeightInPixels * 256);

			if (imgheightWantPixels > rowHeightInPixels) {
				row.setHeight((short) (imgheightWantPixels * PX_ROW));
			}

			anchor.setDx2(dx2);
			anchor.setDy2(dy2);
		}

		if (imageWidth < columnWidthInPixels) {
			picture.resize();
			anchor.setDx1(20);
			anchor.setDy1(20);
		}

	}

	// 设置图片的显示大小，如果图片比指定宽的大，则按比例缩小；如果图片比指定宽度小，则显示图片的原始大小
	public static void setPictureSize(double imageWidth, double imageHeight,
			float columnWidthInPixels, float rowHeightInPixels,
			HSSFClientAnchor anchor, HSSFPicture picture, HSSFRow row) {

		if (imageWidth > columnWidthInPixels) {
			double imgWidthWantPixels = columnWidthInPixels;
			double scale = imgWidthWantPixels / imageWidth;
			double imgheightWantPixels = imageHeight * scale;

			int dx2 = (int) (imgWidthWantPixels / columnWidthInPixels * 1024);
			int dy2 = (int) (imgheightWantPixels / rowHeightInPixels * 256);

			if (imgheightWantPixels > rowHeightInPixels) {
				row.setHeight((short) (imgheightWantPixels * PX_ROW));
			}

			anchor.setDx2(dx2);
			anchor.setDy2(dy2);
		}

		if (imageWidth < columnWidthInPixels) {

			// emily：当图片高度大于单元格高度时，设置单元格高度为图片高度
			if (imageHeight > rowHeightInPixels) {
				row.setHeight((short) (imageHeight * PX_ROW));
				picture.resize();
			} else {
				picture.resize();
			}

			anchor.setDx1(20);
			anchor.setDy1(20);
		}
	}

	// 获取列宽的像素值
	@SuppressWarnings("deprecation")
	public static float getColumnWidthInPixels(HSSFSheet sheet, short column) {

		short cw = sheet.getColumnWidth(column);
		float px = getPixelWidth(sheet, column);

		return cw / px;
	}

	// 获取像素与宽度的比例
	@SuppressWarnings("deprecation")
	public static float getPixelWidth(HSSFSheet sheet, short column) {

		int def = sheet.getDefaultColumnWidth() * 256;
		short cw = sheet.getColumnWidth(column);

		return cw == def ? PX_DEFAULT : PX_MODIFIED;
	}

	// 获取行高的像素值
	public static float getRowHeightInPixels(HSSFSheet sheet, int i) {

		HSSFRow row = sheet.getRow(i);
		float height;
		if (row != null)
			height = row.getHeight();
		else
			height = sheet.getDefaultRowHeight();

		return height / PX_ROW;
	}
}

