package com.customer.fawvw.issues.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class FileUtil {

	/*
	 * 把srcFile重命名为renameFile
	 */
	public static void renameFile(File srcFile, String renameFile) throws FileNotFoundException {

		FileOutputStream outputStream = null;
		
		try {
			File destFile = new File(renameFile);
			InputStream inputStream = new FileInputStream(srcFile);
			outputStream = new FileOutputStream(destFile);
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			
			workbook.write(outputStream);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println(" excel rename ok");
	}
	
	public static void delFile(String delFile) {
		File file = new File(delFile); 
		file.delete();
	}
	
	public static void delAllFile(String path) { 
		try { 
			Process process=Runtime.getRuntime().exec( 
					"cmd.exe /c start /b del " + path +" "+"/q"); 
			process.waitFor(); 
		} catch (IOException e) { 
		// TODO 自动生成 catch 块 
			e.printStackTrace(); 
		} catch (InterruptedException e) { 
		// TODO 自动生成 catch 块 
			e.printStackTrace(); 
		} 

	} 

}
