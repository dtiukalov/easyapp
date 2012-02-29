package com.customer.fawvw.issues.utils;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

public class NetUtil {

	public static Boolean pingIP(String ipAddress){
		
		try {
			Process process = Runtime.getRuntime().exec("ping "+ ipAddress);   
			InputStreamReader r = new InputStreamReader(process.getInputStream());   
			LineNumberReader returnData = new LineNumberReader(r);
			
			String returnMsg="";   
	        String line = "";   
	        while ((line = returnData.readLine()) != null) {   
	            System.out.println(line);   
	            returnMsg += line;   
	        }   
	           
	        if(returnMsg.indexOf("100% loss")!=-1){   
	            System.out.println("cannot contect to ip : " + ipAddress);   
	            return false;
	        }   
	        else{   
	        	System.out.println("contect to ip : " + ipAddress + " success");   
	            return true;
	        }   

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   

		
		return false;
		
	}
}
