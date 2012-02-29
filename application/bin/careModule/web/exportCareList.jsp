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
    String filename="养护查询信息";
    filename = new String(filename.getBytes("gb2312"),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.setDefaultColumnWidth(10);
	sheet.setColumnWidth(1, 20*256);
	sheet.setColumnWidth(5, 20*256);
	sheet.setColumnWidth(6, 20*256);
	sheet.setColumnWidth(7, 80*256);
	sheet.setColumnWidth(11, 20*256);

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
	 cell.setCellValue("品牌");		 		 
	 cell = row.createCell(4);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车系");		 
	 cell = row.createCell(5);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("进厂时间");	 
	 cell = row.createCell(6);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("工单号");	 
	 cell = row.createCell(7);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("养护接待");		 
	 cell = row.createCell(8);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("养护消费");		 
	 cell = row.createCell(9);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("养护桶数");		 
	 cell = row.createCell(10);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("出厂时间");		 		 
	 
	SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
	if(result!=null){
		for(int i=0;i<result.size();i++){
		 row = sheet.createRow(i+1);
		 row.setHeightInPoints(15);
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
		 
		 cell = row.createCell(0);
		 cell.setCellStyle(cellStyle);
		 SaturnData data  = (SaturnData)result.get(i);
		 String carcardid = (String)data.get("carcardid");
		 if(carcardid!=null&&!"".equals(carcardid)){
			 try{
				 cell.setCellValue("'"+(String)data.get("carcardid"));	
			 }catch(Exception e){}
		 }
			 
		 cell = row.createCell(1);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("carvin"));		
		 
		 cell = row.createCell(2);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("carlicenceno"));	
		 
		 cell = row.createCell(3);
		 cell.setCellStyle(cellStyle);
		 String carseries = (String)data.get("carseries");
		 if(carseries!=null&&!"".equals(carseries)){
			try{
				carseries = inst.getDataDictItemInfo("crm_carModel",carseries).getValue();
			}catch(Exception e){}
		 }
		 cell.setCellValue(carseries);
		 
		 cell = row.createCell(4);
		 cell.setCellStyle(cellStyle);
		 String carbrand = (String)data.get("carbrand");
		 if(carbrand!=null&&!"".equals(carbrand)){
			 carbrand = inst.getDataDictItemInfo("crm_carModel",carbrand).getValue();
		 }
		 cell.setCellValue(carbrand);	
		 
		 cell = row.createCell(5);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("careintime"));	
		 
		 cell = row.createCell(6);
		 cell.setCellStyle(cellStyle);
		 String careorderid = (String)data.get("careorderid");
		 cell.setCellValue(careorderid);
		 
		 cell = row.createCell(7);
		 cell.setCellStyle(cellStyle);
		 String carestaff = (String)data.get("carestaff");
		 if(carestaff!=null&&!"".equals(carestaff)){
			 try{
				 carestaff = inst.getDataDictItemInfo("crm_waiter",carestaff).getValue();
			 }catch(Exception e){}
		 } 
		 cell.setCellValue(carestaff);
		 
		 cell = row.createCell(8);	
		 cell.setCellStyle(cellStyle);
		 String careexpense = String.valueOf(data.get("careexpense"));	 
		 if("".equals(careexpense)||careexpense==null||"null".equals(careexpense)){
			 careexpense="0";
		 }
		 cell.setCellValue(Double.parseDouble(careexpense));
		 
		 cell = row.createCell(9);
		 cell.setCellStyle(cellStyle);
		 String carebucketnum = String.valueOf(data.get("carebucketnum"));	 
		 cell.setCellValue(carebucketnum);
		 
		 cell = row.createCell(10);
		 cell.setCellStyle(cellStyle);
		 String careouttime = (String)data.get("careouttime");	 
		 cell.setCellValue(careouttime);
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
	   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 10);   
	   sheet.addMergedRegion(range); 
	   footRowcell.setCellStyle(centerstyle);
	   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
	   for(int i=1;i<11;i++){
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