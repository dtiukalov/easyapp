package com.satrun.data.extraction.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ImageUtils {

	public static void downloadImageToLocal(String remotePath, String localPath) {
		System.out.println("remotePath = " + remotePath);
		URL url = null;
		
		try {
			url = new URL(remotePath);
						
			InputStream input = null;
			input = url.openStream();
			
			OutputStream output = null;
			
			int last = localPath.lastIndexOf("\\");
			String tempPath = localPath.substring(0, last);
			
			File file = new File(tempPath);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			output = new FileOutputStream(localPath);
			
			int bytes = 0;
			byte[] buffer = new byte[8192];
			
			while((bytes = input.read(buffer,0,8192))!=-1) {
				output.write(buffer, 0, bytes);
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return;
			
		}
	}
}
