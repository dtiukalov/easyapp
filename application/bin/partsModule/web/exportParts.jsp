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
	String filename="精品查询信息";
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
	row.setHeightInPoints(25);

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
	cell.setCellValue("车型");	
	
	cell = row.createCell(6);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("地区");
	
	cell = row.createCell(7);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("精品接待");
	
	cell = row.createCell(8);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("精品名称");	
	
	cell = row.createCell(9);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("精品消费");	
	
	cell = row.createCell(10);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("工作人员");
	
	cell = row.createCell(11);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("精品进场时间");	
	
	cell = row.createCell(12);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("精品出场时间");	
	
	cell = row.createCell(13);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("车主");
	
	cell = row.createCell(14);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("性别");
	
	cell = row.createCell(15);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("电话");
	
	cell = row.createCell(16);
	cell.setCellStyle(cellStyle);
	cell.setCellValue("手机");
	
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
			 cell.setCellValue((String)data.get("carlicenceno"));
			 
			 cell = row.createCell(3);
			 cell.setCellStyle(cellStyle);
			 String carbrand = (String)data.get("carbrand");
			 if(carbrand!=null&&!"".equals(carbrand)){
				 try{
				 	carbrand = inst.getDataDictItemInfo("crm_carModel",carbrand).getValue();
				 }catch(Exception e){}
			 }
			 cell.setCellValue(carbrand);
			 
			 cell = row.createCell(4);
			 cell.setCellStyle(cellStyle);
			 String carseries = (String)data.get("carseries");
			 if(carseries!=null&&!"".equals(carseries)){
				 try{
				 	carseries = inst.getDataDictItemInfo("crm_carModel",carseries).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(carseries);
			 
			 cell = row.createCell(5);
			 cell.setCellStyle(cellStyle);
			 String carModel = (String)data.get("carModel");
			 if(carModel!=null&&!"".equals(carModel)){
				 try{
				 	carModel = inst.getDataDictItemInfo("crm_carModel",carModel).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(carModel);
			 
			 cell = row.createCell(6);
			 cell.setCellStyle(cellStyle);
			 String cararea = (String)data.get("cararea");
			 if(cararea!=null&&!"".equals(cararea)){
				 try{
					 cararea = inst.getDataDictItemInfo("crm_carArea",cararea).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(cararea);
			 
			 cell = row.createCell(7);
			 cell.setCellStyle(cellStyle);
			 String partsstaff = (String)data.get("partsstaff");
			 if(partsstaff!=null&&!"".equals(partsstaff)){
				 try{
				 	partsstaff = inst.getDataDictItemInfo("crm_waiter",partsstaff).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(partsstaff);
			 
			 cell = row.createCell(8);
			 cell.setCellStyle(cellStyle);
			 String partsname = (String)data.get("partsname");	 
			 cell.setCellValue(partsname);	
			 
			 cell = row.createCell(9);
			 cell.setCellStyle(cellStyle);
			 String partsexpense = String.valueOf(data.get("partsexpense"));
			 if("".equals(partsexpense)||partsexpense==null||"null".equals(partsexpense)){
				 partsexpense="0.0";
			 }
			 cell.setCellValue(Double.parseDouble(partsexpense));
			 
			 cell = row.createCell(10);
			 cell.setCellStyle(cellStyle);
			 String partsworker = (String)data.get("partsworker");
			 if(partsworker!=null&&!"".equals(partsworker)){
				 try{
					 partsworker = inst.getDataDictItemInfo("crm_worker",partsworker).getValue();
					}catch(Exception e){}
			 } 
			 cell.setCellValue(partsworker);
			 
			 cell = row.createCell(11);
			 cell.setCellStyle(cellStyle);
			 String partsintime = (String)data.get("partsintime");	 
			 cell.setCellValue(partsintime);
			 
			 cell = row.createCell(12);
			 cell.setCellStyle(cellStyle);
			 String partsouttime = (String)data.get("partsouttime");	 
			 cell.setCellValue(partsouttime);
			 
			 cell = row.createCell(13);
			 cell.setCellStyle(cellStyle);
			 String cstmname = (String)data.get("cstmname");	 
			 cell.setCellValue(cstmname);
			 
			 cell = row.createCell(14);
			 cell.setCellStyle(cellStyle);
			 String cstmsex = (String)data.get("cstmsex");
			 if(cstmsex!=null&&!"".equals(cstmsex)){
				 try{
					 cstmsex = inst.getDataDictItemInfo("crm_sex",cstmsex).getValue();
				 }catch(Exception e){}
			 } 
			 cell.setCellValue(cstmsex);
			 
			 cell = row.createCell(15);
			 cell.setCellStyle(cellStyle);
			 String cstmtel = (String)data.get("cstmtel");	 
			 cell.setCellValue(cstmtel);
			 
			 cell = row.createCell(16);
			 cell.setCellStyle(cellStyle);
			 String cstmmobile = (String)data.get("cstmmobile");	 
			 cell.setCellValue(cstmmobile);
			 
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
		   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 16);   
		   sheet.addMergedRegion(range); 
		   footRowcell.setCellStyle(centerstyle);
		   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
		   for(int i=1;i<17;i++){
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
