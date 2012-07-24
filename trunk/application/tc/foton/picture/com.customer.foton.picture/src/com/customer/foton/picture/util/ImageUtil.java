package com.customer.foton.picture.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 大图转小图,支持JPEG格式
 * 
 * @author emily
 */
public class ImageUtil {

	public static final int JPG_WIDTH = 140;

	public static final int JPG_HIGHT = 93;

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

	public static byte[] getImgValue(BufferedImage bufferImg) {
		byte[] imgByte = null;

		if (bufferImg != null) {
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();

			try {
				ImageIO.write(bufferImg, "JPEG", byteArrayOut); //$NON-NLS-1$
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
			g.drawImage(bufferedImage, 0, 0, newWidth, newHight, null);

			return tag;
		}

		return bufferedImage;
	}

	public static void changeImageSize(String srcFilePath, String savePath,
			int width, int hight) throws Exception {
		
		java.io.File file = new java.io.File(srcFilePath);
		if (file.exists()
				&& (file.getName().substring(file.getName().length() - 3))
						.toLowerCase().equals("jpg")) {
			BufferedImage src = null;
			FileOutputStream newimage = null;
			try {
				src = ImageIO.read(file);
				BufferedImage tag = new BufferedImage(width, hight,
						BufferedImage.TYPE_INT_RGB);
				tag.getGraphics().drawImage(src, 0, 0, width, hight, null);
				newimage = new FileOutputStream(savePath);
				JPEGImageEncoder encoder = JPEGCodec
						.createJPEGEncoder(newimage);
				encoder.encode(tag);
			} catch (IIOException ee) {
				ee.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				newimage.close();
			}
		}
	}

}
