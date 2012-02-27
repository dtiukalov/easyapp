package foton.picture.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import de.schlichtherle.util.zip.ZipOutputStream;
import foton.picture.vo.PictureVO;

public class DownLoadPicturesUtil {
	
	public static Boolean createFolder(String folderName) {
		File f = new File(folderName);

		if (!f.isDirectory()) {
			f.mkdirs();
			return true;
		}else{
			return false;
		}
	}
	
	public static void copyPictures(List<PictureVO> downLoadPictures, String toPath) {
		for(PictureVO picture: downLoadPictures) {
			copyPicture(picture.getJpgPath(),toPath + File.separator + picture.getJpgName());
		}
	}

	public static Boolean copyPicture(String file1, String file2) {
		try {
			java.io.File fileIn = new java.io.File(file1); // 用路径名生成源文件
			java.io.File fileOut = new java.io.File(file2); // 用路径名生成目标文件
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
	 */
	public static void zip(String inputFileName, String zipFileName)
			throws Exception {
		zip(zipFileName, new File(inputFileName));
	}

	public static void zip(String zipFileName, File inputFile) throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName), "GBK");
		zip(out, inputFile, "");
		out.close();
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
	}

}
