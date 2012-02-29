<%@page import="org.apache.poi.hssf.usermodel.HSSFRichTextString"%>
<%@page import="org.apache.poi.hssf.util.CellRangeAddress"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
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
    String filename="存油查询信息";
    filename = new String(filename.getBytes("gb2312"),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.setDefaultColumnWidth(10);
	sheet.setColumnWidth(1, 20*256);
	sheet.setColumnWidth(6, 20*256);

    HSSFCellStyle cellStyle = wb.createCellStyle();
    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    cellStyle.setWrapText(true);
    cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
    cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    cellStyle.setBorderBottom((short)1);   
    cellStyle.setBorderTop((short)1);
    cellStyle.setBorderLeft((short)1);
    cellStyle.setBorderRight((short)1);
	
	HSSFRow row = sheet.createRow(0);
	row.setHeightInPoints(20);
	
	 HSSFCell cell = row.createCell(0);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("档案编号");	
	 
	 cell = row.createCell(1);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车架号");	
	 
	 cell = row.createCell(2);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车牌号");
	 
	 cell = row.createCell(3);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("存油时间");
	 
	 cell = row.createCell(4);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("存油编号");
	 
	 cell = row.createCell(5);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("存油种类");		
	 
	 cell = row.createCell(6);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("存油量");
	 
	 cell = row.createCell(7);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("出油时间");
	 
	 cell = row.createCell(8);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("存油接待");		 		 
	 
	SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
	if(result!=null){
		for(int i=0;i<result.size();i++){
			if(i%2==1){
				cellStyle = wb.createCellStyle();
				cellStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			    cellStyle.setWrapText(true);
			    cellStyle.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
			    cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			    cellStyle.setBorderBottom((short)1);   
			    cellStyle.setBorderTop((short)1);
			    cellStyle.setBorderLeft((short)1);
			    cellStyle.setBorderRight((short)1);
			 }else{
				cellStyle = wb.createCellStyle();
			    cellStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			    cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			    cellStyle.setWrapText(true);
			    cellStyle.setBorderBottom((short)1);   
			    cellStyle.setBorderTop((short)1);
			    cellStyle.setBorderLeft((short)1);
			    cellStyle.setBorderRight((short)1); 
			 }
			 row = sheet.createRow(i+1);
			 row.setHeightInPoints(15);
			 
			 cell = row.createCell(0);
			 cell.setCellStyle(cellStyle);
			 SaturnData data  = (SaturnData)result.get(i);
			 String carcardid = (String)data.get("carcardid");
			 if(carcardid!=null&&!"".equals(carcardid)){
				 cell.setCellValue("'"+carcardid);
			 }
			
			 cell = row.createCell(1);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("carvin"));		
			 
			 cell = row.createCell(2);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("carlicenceno"));
			 
			 cell = row.createCell(3);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("oilstoretime"));	
			 
			 cell = row.createCell(4);
			 cell.setCellStyle(cellStyle);
			 String oilnumber = (String)data.get("oilnumber");
			 if(oilnumber!=null&&!"".equals(oilnumber)){
				 cell.setCellValue("'"+oilnumber);
			 }
			 cell.setCellValue(oilnumber);
			 
			 cell = row.createCell(5);
			 cell.setCellStyle(cellStyle);
			 String oiltype = (String)data.get("oiltype");
			 if(oiltype!=null&&!"".equals(oiltype)){
				try{
					oiltype = inst.getDataDictItemInfo("crm_oilType",oiltype).getValue();
				}catch(Exception e){
					
				}
			 }
			 cell.setCellValue(oiltype);	 	
			 
			 cell = row.createCell(6);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue(String.valueOf(data.get("oilamount")));	
			 
			 cell = row.createCell(7);	
			 cell.setCellStyle(cellStyle);
			 String oilouttime = String.valueOf(data.get("oilouttime"));
			 if(oilouttime!=null&&!"".equals(oilouttime)&&!"null".equals(oilouttime)){
				 cell.setCellValue(oilouttime);	
			 }
		 
			 cell = row.createCell(8);
			 cell.setCellStyle(cellStyle);
			 String oilstaff = (String)data.get("oilstaff");
			 if(oilstaff!=null&&!"".equals(oilstaff)){
				 try{
					 oilstaff = inst.getDataDictItemInfo("crm_waiter",oilstaff).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(oilstaff);
		}
		
	   int footRownumber = sheet.getLastRowNum();     
	   HSSFRow footRow = sheet.createRow(footRownumber + 1); 
	      
	   HSSFCellStyle centerstyle = wb.createCellStyle();
	   centerstyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
	   centerstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	   centerstyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	   centerstyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	   centerstyle.setBorderBottom((short)1);   
	   centerstyle.setBorderTop((short)1);
	   centerstyle.setBorderLeft((short)1);
	   centerstyle.setBorderRight((short)1);
	   HSSFCell footRowcell = footRow.createCell(0);
	   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 8);   
	   sheet.addMergedRegion(range); 
	   footRowcell.setCellStyle(centerstyle);
	   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
	   for(int i=1;i<9;i++){
		   footRowcell = footRow.createCell(i);
		   footRowcell.setCellValue("");
		   footRowcell.setCellStyle(centerstyle);
	   }
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