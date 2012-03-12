package com.saturn.tc.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

//import de.schlichtherle.util.zip.ZipOutputStream;

public class DownLoadAttachmentUtil {
	private static int buffer = 1024;

	/**
	 * 图片打zip包
	 * 
	 * @param pictures
	 * @return zipPath 生成的zip路径
	 * @throws Exception
	 */
	public static Boolean doZip(String zipName, String zipFolderPath, String zipPath,
			List<String> pictures){
		if(createFolder(zipFolderPath)){
			copyAttachments(pictures, zipFolderPath);
			if(dozip(zipFolderPath,zipPath)){
				return true;
			}
		}
		return false;
	}

	
	public static Boolean createFolder(String folderName) {
		File f = new File(folderName);

		if (!f.isDirectory()) {
			f.mkdirs();
			return true;
		}else{
			return false;
		}
	}
	
	public static Boolean copyAttachments(List<String> attachmentspath, String toPath) {
		if(attachmentspath != null && attachmentspath.size() > 0){
			for(String attachmentpath: attachmentspath) {
				String[] test = attachmentpath.replace(File.separator, ",").split(",");
				String attachmentName = test[test.length-1];
				copyAttachment(attachmentpath,toPath + File.separator + attachmentName);
			}
			return true;
		}
		return false;
	}

	public static Boolean copyAttachment(String file1, String file2) {
		
		if(file1 == null || file2 == null || "".equals(file1) || "".equals(file2)){
			return false;
		}
		
		java.io.File fileIn = new java.io.File(file1); // 用路径名生成源文件
		java.io.File fileOut = new java.io.File(file2); // 用路径名生成目标文件
		
		try {
			FileInputStream fin = new FileInputStream(fileIn); // 得到文件输入流
			FileOutputStream fout = new FileOutputStream(fileOut); // 得到文件输出流
			byte[] bytes = new byte[1024]; // 初始化字节数组,用于缓冲
			int c;
			while ((c = fin.read(bytes)) != -1) { // 如果文件未读完
				fout.write(bytes, 0, c); // 将读取的字节数组写入目标文件输出流中
			}
			fin.close(); // 关闭输入流
			fout.close(); // 关闭输出流
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("copy [" + fileIn.getName() + "] Failed!" );
			return false;
		}
		
	}

	public static boolean deleteFile(String delpath)
			throws FileNotFoundException, IOException {
		try {
			File file = new File(delpath);
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + File.separator + filelist[i]);
					if (!delfile.isDirectory()) {
						delfile.delete();
					} else if (delfile.isDirectory()) {
						deleteFile(delpath + File.separator + filelist[i]);
					}
				}
				file.delete();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		}
		return true;
	}

	/**
	 * @param inputFileName
	 * @param zipFileName
	 * @throws Exception
	 *//*
	public static Boolean zip(String inputFileName, String zipFileName)
			throws Exception {
		return zip(zipFileName, new File(inputFileName));
	}

	public static Boolean zip(String zipFileName, File inputFile) throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName), "GBK");
		zip(out, inputFile, "");
		out.close();
		return out.isBusy(); //标识打包是否已经完成
	}

	public static void zip(ZipOutputStream out, File f, String base)
			throws Exception {
		if (f.isDirectory()) {
			File[] fl = f.listFiles();

			de.schlichtherle.util.zip.ZipEntry entry = new de.schlichtherle.util.zip.ZipEntry(
					base + File.separator);
			out.putNextEntry(entry);
			base = base.length() == 0 ? "" : base + File.separator;
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName());
			}
		} else {

			de.schlichtherle.util.zip.ZipEntry entry = new de.schlichtherle.util.zip.ZipEntry(
					base);
			out.putNextEntry(entry);
			FileInputStream in = new FileInputStream(f);
			int b;
			
			while ((b = in.read()) != -1) {
				out.write(b);
			}
			in.close();
		}
	}*/
	
	public static Boolean dozip(String srcPath, String desPath) {
		if (srcPath.length() == 0) {
			System.out.println("请设置要压缩的文件或目录路径！");
			return false;
		}
		if (desPath.length() == 0) {
			System.out.println("请设置压缩文件保存路径！");
			return false;
		}
		try {
			System.out.println("压缩的文件或目录：" + srcPath);
			System.out.println("压缩到：" + desPath);
			FileOutputStream fos = new FileOutputStream(new File(desPath));
			org.apache.tools.zip.ZipOutputStream out = new org.apache.tools.zip.ZipOutputStream(new BufferedOutputStream(
					fos, buffer));
			//org.apache.tools.zip.ZipOutputStream out = new org.apache.tools.zip.ZipOutputStream(new FileOutputStream(desPath));
			File inputFile = new File(srcPath);
			out.setEncoding("GBK");
			dozip(out, inputFile, "");
			out.close();
			System.out.println("压缩完毕！");
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	private static void dozip(org.apache.tools.zip.ZipOutputStream out, File inputFile, String base) {
		try {
			if (inputFile.isDirectory()) {
				File[] file = inputFile.listFiles();
				out.putNextEntry(new org.apache.tools.zip.ZipEntry(base + "/"));
				System.out.println("压缩路径：" + base + "/");
				base = (base.length() == 0) ? "" : (base + "/");
				for (int i = 0; i < file.length; i++) {
					dozip(out, file[i], base + file[i].getName());
				}
			} else {
				out.putNextEntry(new org.apache.tools.zip.ZipEntry(base));
				byte[] data = new byte[buffer];
				BufferedInputStream bis = new BufferedInputStream(
						new FileInputStream(inputFile), buffer);
				System.out.println("正在压缩文件：" + base);
				int cnt;
				while ((cnt = bis.read(data, 0, buffer)) != -1) {
					out.write(data, 0, buffer);
				}
				out.flush();
				bis.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
	
	
}
