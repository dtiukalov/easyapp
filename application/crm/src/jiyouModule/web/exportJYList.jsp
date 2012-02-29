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
    String filename="机油查询信息";
    filename = new String(filename.getBytes("gb2312"),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.setDefaultColumnWidth(10);
	sheet.setColumnWidth(0, 20*256);
	sheet.setColumnWidth(2, 20*256);
	sheet.setColumnWidth(5, 20*256);

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
	cell.setCellValue("档案号");	
	cell = row.createCell(1);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("车架号");		 
	cell = row.createCell(2);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("工单号");		 
	cell = row.createCell(3);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("机油类型");		 
	cell = row.createCell(4);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("大桶数量");		 		 
	cell = row.createCell(5);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("小桶数量");	
	cell = row.createCell(6);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("销售时间");	
	cell = row.createCell(7);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("服务顾问");	 		 		 
	 
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
				 cell.setCellValue("'"+carcardid);	
			 }
			
			 cell = row.createCell(1);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("carvin"));		 
			
			 cell = row.createCell(2);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("servorderid"));		
			 
			 cell = row.createCell(3);
			 cell.setCellStyle(cellStyle);
			 String jytype = (String)data.get("jytype");
			 if(jytype!=null&&!"".equals(jytype)){
				 jytype = inst.getDataDictItemInfo("crm_jyType",jytype).getValue();
			 }
			 cell.setCellValue(jytype);	 	
			 
			 cell = row.createCell(4);
			 cell.setCellStyle(cellStyle);
			 String jybignum = String.valueOf(data.get("jybignum"));
			 if(jybignum!=null&&!"".equals(jybignum)&&!"null".equals(jybignum)){
				 cell.setCellValue(jybignum);	
			 }
			 
			 cell = row.createCell(5);
			 cell.setCellStyle(cellStyle);
			 String jysmallnum = String.valueOf(data.get("jysmallnum"));
			 if(jysmallnum!=null&&!"".equals(jysmallnum)&&!"null".equals(jysmallnum)){
				 cell.setCellValue(jysmallnum);	
			 }
		 
			 cell = row.createCell(6);
			 cell.setCellStyle(cellStyle);
			 String jyselltime = String.valueOf(data.get("jyselltime"));
			 if(jyselltime!=null&&!"".equals(jyselltime)&&!"null".equals(jyselltime)){
				 cell.setCellValue(jyselltime);	
			 }
			
			 cell = row.createCell(7);
			 cell.setCellStyle(cellStyle);
			 String jystaff = (String)data.get("jystaff");
			 if(jystaff!=null&&!"".equals(jystaff)){
				 jystaff = inst.getDataDictItemInfo("crm_waiter",jystaff).getValue();
			 } 
			 cell.setCellValue(jystaff);
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
	   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 7);   
	   sheet.addMergedRegion(range); 
	   footRowcell.setCellStyle(centerstyle);
	   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
	   for(int i=1;i<8;i++){
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