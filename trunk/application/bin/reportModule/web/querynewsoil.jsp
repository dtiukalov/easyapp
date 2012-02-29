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
	sheet.addMergedRegion(new   Region(1,   (short)   0,  2,   (short)   0));

	
	
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
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
	cell1.setCellValue("节余机油");
	cell1 = row1.createCell(1);
	cell1.setCellValue("现存");
	cell1 = row1.createCell(2);
	cell1.setCellValue("当日");
	cell1 = row1.createCell(3); 
		
		
	int oildaycountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowec=(SaturnData)result.get(i);
		if(rowec.get("oildaycount")!= null && rowec.get("oildaycount")!= "")
		{
			oildaycountzj += Integer.parseInt(rowec.get("oildaycount").toString());
		}
	}
	cell1.setCellValue(oildaycountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowec=(SaturnData)result.get(i);
		cell1=row1.createCell(i+4);
		int oildaycountid = 0;
		if(rowec.get("oildaycount")!= null && rowec.get("oildaycount")!= "")
		{
			oildaycountid = Integer.parseInt(rowec.get("oildaycount").toString());
		}
		cell1.setCellValue(oildaycountid);
	}
	
	HSSFRow row2 = sheet.createRow(2);
	HSSFCell cell2 = row2.createCell(0);
	cell2.setCellValue("");	
	cell2 = row2.createCell(1);
	cell2.setCellValue("2469");	
	cell2 = row2.createCell(2);
	cell2.setCellValue("月累");
	cell2 = row2.createCell(3); 
		
		
	int oilmoncountzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowom=(SaturnData)result.get(i);
		if(rowom.get("oilmoncount")!= null && rowom.get("oilmoncount")!= "")
		{
			oilmoncountzj += Integer.parseInt(rowom.get("oilmoncount").toString());
		}
	}
	cell2.setCellValue(oilmoncountzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowom=(SaturnData)result.get(i);
		cell2=row2.createCell(i+4);
		int oilmoncountid = 0;
		if(rowom.get("oilmoncount")!= null && rowom.get("oilmoncount")!= "")
		{
			oilmoncountid = Integer.parseInt(rowom.get("oilmoncount").toString());
		}
		cell2.setCellValue(oilmoncountid);
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