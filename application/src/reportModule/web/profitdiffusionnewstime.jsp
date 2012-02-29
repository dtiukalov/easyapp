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
    
	List result_time = (List)request.getAttribute("result");//时间分布
	List result_pro=(List)request.getAttribute("resultmonth");//地区分布
	
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   Region(0,   (short)   0,   0,   (short)   1));
	sheet.addMergedRegion(new   Region(1,   (short)   0,  12,   (short)   0));
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("");	
	cell = row.createCell(1);
	cell = row.createCell(2);
	cell.setCellValue("小计");
	cell = row.createCell(3);
	cell.setCellValue("CRV");
	cell = row.createCell(4);
	cell.setCellValue("CTVIC");
	cell = row.createCell(5);
	cell.setCellValue("SPIRIOR");
	cell = row.createCell(6);
	cell.setCellValue("其他");
	cell = row.createCell(7);
	cell.setCellValue("地区分布（累计）");
	
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell celll = row1.createCell(0);
	celll.setCellValue("时间分布");	
	
	
	
	
	
	
	
	
	
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