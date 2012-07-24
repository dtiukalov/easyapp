package com.customer.foton.picture.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		
		try {
			List<PictureItemInfo> items = PictureUploadUtil.getPictureItemInfo("C:\\导入系统");
			
			for(PictureItemInfo item: items) {
				System.out.println(item.getInfoString());
			}
			
			System.out.println(items.size());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			PictureUploadUtil.deleteFile("C:/sp/");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			ImageUtil.changeImageSize("C:/000.jpg", "C:/sp000.jpg", 140, 93);
			/*
			 * List<PictureItemInfo> list =
			 * PictureUploadUtil.getPictureItemInfo("C:\\foton造型图片批量导入");
			 * System.out.println(list.size());
			 * 
			 * for(PictureItemInfo info:list) {
			 * System.out.println(info.getJpgName());
			 * System.out.println(info.getInterOunter());
			 * System.out.println(info.getInter());
			 * System.out.println(info.getOuter());
			 *  }
			 */

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
