package com.customer.fawvw.issues.utils;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

public class LogUtil {
	
	public static BufferedReader bufread;
	    //指定文件路径和名称
    private static String readStr =""; //$NON-NLS-1$
   
    public static String generateLogName(String reportName) {
    	String savePath = System.getenv("TEMP"); //$NON-NLS-1$
//    	int n = fms_home.indexOf("fcc");
//    	String savePath = (String)fms_home.subSequence(0, n) + "portal\\temp\\";
//    	System.out.println("savePath = " + savePath);
    	
		String sysDate = DateFormat.getDateInstance().format(new Date());
		
		String logName = reportName + "-" + sysDate + ".log"; //$NON-NLS-1$ //$NON-NLS-2$
		
		savePath += "\\" + logName; //$NON-NLS-1$
		
		return savePath;
    	
	}
    /** *//**
     * 创建文本文件.
     * @throws IOException 
     * 
     */
    public static File creatTxtFile(String path) throws IOException{
        
    	File filename = new File(path);
    	if (!filename.exists()) {
            filename.createNewFile();
            System.err.println(filename + "已创建！"); //$NON-NLS-1$
            
            
        } else {
        	System.err.println(filename + "已存在！"); //$NON-NLS-1$
        }
    	return filename;
    }
    
    /** *//**
     * 读取文本文件.
     * 
     */
    public static String readTxtFile(File filename){
        String read;
        FileReader fileread;
        try {
            fileread = new FileReader(filename);
            bufread = new BufferedReader(fileread);
            try {
                while ((read = bufread.readLine()) != null) {
                    readStr = readStr + read+ "\r\n"; //$NON-NLS-1$
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return readStr;
    }


    
    /** *//**
     * 写文件.
     * 
     */
    public static void writeTxtFile(File filename, String newStr) throws IOException{
    	
        FileOutputStream fos = null;   
        OutputStreamWriter osw = null;   
        try {   
            fos = new FileOutputStream(filename);   
            osw = new OutputStreamWriter(fos, "UTF-8");    //$NON-NLS-1$
            osw.write(newStr);   
        } catch (Exception e) {   
            e.printStackTrace();   
        }finally{   
            if(osw!=null){   
                try {   
                    osw.close();   
                } catch (IOException e1) {   
                    e1.printStackTrace();   
                }   
            }   
            if(fos!=null){   
                try {   
                    fos.close();   
                } catch (IOException e1) {   
                    e1.printStackTrace();   
                }   
            }   
        }


    }

    
    public static String initContent() {
    	
		String initContent = "  生成报表日志文件  " + "\r\n" + " 程序开始时间：" +  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
			DateFormat.getDateInstance().format(new Date()) + "\r\n" +  //$NON-NLS-1$
			" ---------开始----------\r\n"; //$NON-NLS-1$
		
		return initContent;
		
	}
    
    public static void main(String[] args) {

	}

} 

