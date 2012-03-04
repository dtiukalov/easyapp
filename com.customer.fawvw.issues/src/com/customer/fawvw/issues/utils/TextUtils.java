package com.customer.fawvw.issues.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;

public class TextUtils {

	/**
     * 创建文本文件.
     * @throws IOException 
     * 
     */
    public static void creatTxtFile(File filename) throws IOException{
        if (!filename.exists()) {
            filename.createNewFile();
            System.err.println(filename + "已创建！");
        }
    }
    /** *//**
     * 读取文本文件.
     * 
     */
    public static String readTxtFile(File filename){
        String read;
        FileReader fileread;
        String readStr ="";

        try {
            fileread = new FileReader(filename);
            BufferedReader bufread = new BufferedReader(fileread);
            try {
                while ((read = bufread.readLine()) != null) {
                    readStr = readStr + read;
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.out.println("文件内容是:" + readStr);
        return readStr;
    }

    /** *//**
     * 写文件.
     * 
     */
    
    public static String writeTxtFile(File filename, String newStr, 
    		String oldStr) throws IOException{
        //先读取原有文件内容，然后进行写入操作
    	if (!"".equals(oldStr)) {
    		String[] arr = oldStr.split(",");
        	int n = arr.length;
        	String lastWeek = arr[n-1].substring(0, arr[n-1].length()-1).split("/")[0];
        	String newWeek = newStr.split("/")[0];
        	
        	//本周数据已存在
        	if (lastWeek.equalsIgnoreCase(newWeek)) {
        		int length = arr[n-1].length();
        		oldStr = oldStr.substring(0, oldStr.length()-length-1);
        		System.out.println("oldStr = " + oldStr);
        	}
    	}
    	
    	String filein = oldStr + newStr;
        RandomAccessFile mm = null;
        try {
            mm = new RandomAccessFile(filename, "rw");
            mm.writeBytes(filein);
        } catch (IOException e1) {
            // TODO 自动生成 catch 块
            e1.printStackTrace();
        } finally {
            if (mm != null) {
                try {
                    mm.close();
                } catch (IOException e2) {
                    // TODO 自动生成 catch 块
                    e2.printStackTrace();
                }
            }
        }
    	
        return filein;
    }


}
