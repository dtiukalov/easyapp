<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>

<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.OutputStream"%>
<%
    String filename= request.getAttribute("servintime") + "售后前台业务分析报表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List result = (List)request.getAttribute("result");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   Region(0,   (short)   0,   0,   (short)   2));
	
    sheet.addMergedRegion(new   Region(1,   (short)   0,  4,   (short)   0));
	
    sheet.addMergedRegion(new   Region(1,   (short)   1,  2,   (short)   1));
    sheet.addMergedRegion(new   Region(3,   (short)   1,  4,   (short)   1));
	
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("");	
	cell = row.createCell(1);
	cell = row.createCell(2);
	cell = row.createCell(3);
	cell.setCellValue("总计");		 
		 
	for(int i=0; i<result.size();i++){
		SaturnData rowvel = (SaturnData)result.get(i);
		cell = row.createCell(i+4);
		cell.setCellValue(rowvel.get("value").toString());	
	}
    
	
	
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell cell1 = row1.createCell(0);
	cell1.setCellValue("招揽预约");	
	cell1 = row1.createCell(1);
	cell1.setCellValue("预约");
	cell1 = row1.createCell(2);
	cell1.setCellValue("当日");
	cell1 = row1.createCell(3); 
		
		
	int staffdaycountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowec=(SaturnData)result.get(i);
		if(rowec.get("staffdaycount")!= null && rowec.get("staffdaycount")!= "")
		{
			staffdaycountzj += Integer.parseInt(rowec.get("staffdaycount").toString());
		}
	}
	cell1.setCellValue(staffdaycountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowec=(SaturnData)result.get(i);
		cell1=row1.createCell(i+4);
		int staffdaycountid = 0;
		if(rowec.get("staffdaycount")!= null && rowec.get("staffdaycount")!= "")
		{
			staffdaycountid = Integer.parseInt(rowec.get("staffdaycount").toString());
		}
		cell1.setCellValue(staffdaycountid);
	}
	
	
	HSSFRow row2 = sheet.createRow(2);
	HSSFCell cell2 = row2.createCell(0);
	cell2.setCellValue("");	
	cell2 = row2.createCell(1);
	cell2 = row2.createCell(2);
	cell2.setCellValue("月累");
	cell2 = row2.createCell(3); 
		
		
	int staffmoncountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowew=(SaturnData)result.get(i);
		if(rowew.get("staffmoncount")!= null && rowew.get("staffmoncount")!= "")
		{
			staffmoncountzj += Integer.parseInt(rowew.get("staffmoncount").toString());
		}
	}
	cell2.setCellValue(staffmoncountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowew=(SaturnData)result.get(i);
		cell2=row2.createCell(i+4);
		int staffmoncountid = 0;
		if(rowew.get("staffmoncount")!= null && rowew.get("staffmoncount")!= "")
		{
			staffmoncountid = Integer.parseInt(rowew.get("staffmoncount").toString());
		}
		cell2.setCellValue(staffmoncountid);
	}
	
	
	HSSFRow row3 = sheet.createRow(3);
	HSSFCell cell3 = row3.createCell(0);
	cell3.setCellValue("");	
	cell3 = row3.createCell(1);
	cell3.setCellValue("成功预约");
	cell3 = row3.createCell(2);
	cell3.setCellValue("日累");
	cell3 = row3.createCell(3); 
		
		
	int staffsucdaycountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowik=(SaturnData)result.get(i);
		if(rowik.get("staffsucdaycount")!= null && rowik.get("staffsucdaycount")!= "")
		{
			staffsucdaycountzj += Integer.parseInt(rowik.get("staffsucdaycount").toString());
		}
	}
	cell3.setCellValue(staffsucdaycountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowik=(SaturnData)result.get(i);
		cell3=row3.createCell(i+4);
		int staffsucdaycountid = 0;
		if(rowik.get("staffsucdaycount")!= null && rowik.get("staffsucdaycount")!= "")
		{
			staffsucdaycountid = Integer.parseInt(rowik.get("staffsucdaycount").toString());
		}
		cell3.setCellValue(staffsucdaycountid);
	}
	
	
	HSSFRow row4 = sheet.createRow(4);
	HSSFCell cell4 = row4.createCell(0);
	cell4.setCellValue("");	
	cell4 = row4.createCell(1);
	cell4 = row4.createCell(2);
	cell4.setCellValue("月累");
	cell4 = row4.createCell(3); 
		
		
	int staffsucmoncountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowpl=(SaturnData)result.get(i);
		if(rowpl.get("staffsucmoncount")!= null && rowpl.get("staffsucmoncount")!= "")
		{
			staffsucmoncountzj += Integer.parseInt(rowpl.get("staffsucmoncount").toString());
		}
	}
	cell4.setCellValue(staffsucmoncountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowpl=(SaturnData)result.get(i);
		cell4=row4.createCell(i+4);
		int staffsucmoncountid = 0;
		if(rowpl.get("staffsucmoncount")!= null && rowpl.get("staffsucmoncount")!= "")
		{
			staffsucmoncountid = Integer.parseInt(rowpl.get("staffsucmoncount").toString());
		}
		cell4.setCellValue(staffsucmoncountid);
	}
	
	
	 try{
			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
		}catch(Exception e){
		
		}
	out.clear();
	out=pageContext.pushBody();
%>