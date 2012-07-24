package com.customer.foton.picture.util;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.DateFormat;
import java.util.Date;

public class LogUtil {
		
	public static final String enter = "\r\n";
	
	public static final String loggerPath = "c:/fotonPicture.log";
	public static final String loggerErrorPath = "c:/fotonGetPictureError.log";
   
    /** *//**
     * 创建文本文件.
     * @throws IOException 
     * 
     */
    public static File creatTxtFile(String path) throws IOException{      
    	File file = new File(path);
    	if(file.exists()){
    		file.delete();
    	}
    	file = new File(path);
    	return file;
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
            osw = new OutputStreamWriter(fos, "UTF-8");   
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
 
    public static String initLogHead() {
    	
    	return DateFormat.getDateInstance().format(new Date()) +  " LOGGER:  " + enter ;
	
	}
    
    public static void main(String[] args) {
    	try {
			//LogUtil.creatTxtFile("c:/log.log");
			LogUtil.writeTxtFile(LogUtil.creatTxtFile("c:/log.log"),"abcggg");
			System.out.println("ok");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

} 

