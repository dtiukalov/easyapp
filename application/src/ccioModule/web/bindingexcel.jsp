<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@page import="org.apache.poi.hssf.util.CellRangeAddress"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="java.io.OutputStream"%>
<%
    String filename= "绑定列表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	
	//头样式
	HSSFCellStyle csH =wb.createCellStyle();
	csH.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	csH.setBorderTop(HSSFCellStyle.BORDER_THIN);
	csH.setBorderRight(HSSFCellStyle.BORDER_THIN);
	csH.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	csH.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	csH.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	csH.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	csH.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	csH.setWrapText(true);
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
	cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
	cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);

	HSSFRow row = sheet.createRow(0);
	
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("卡号");
	cell.setCellStyle(csH);
	
	cell = row.createCell(1);
	cell.setCellValue("VIN");
	cell.setCellStyle(csH);
	
	cell = row.createCell(2);
	cell.setCellValue("时间");
	cell.setCellStyle(csH);
	
	List<Map<String, Object>> result = (List)request.getAttribute("result");
	if (result != null){
		if (!result.isEmpty()) {
			int i = 0;
			for (; i < result.size(); ++i) {
				SaturnData data = (SaturnData)result.get(i);
				String card=data.get("b_card").toString();
				String vin=data.get("b_vin").toString();
				String date=data.get("b_date").toString();
				
				HSSFRow rowi = sheet.createRow(i+1);
				
				cell = rowi.createCell(0);
				cell.setCellValue(card);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(1);
				cell.setCellValue(vin);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(2);
				cell.setCellValue(date);
				cell.setCellStyle(cs);
			}
			
			HSSFRow rowi = sheet.createRow(i+1);
			cell = rowi.createCell(0);
			cell.setCellValue("共有"+i+"条绑定");
			cell.setCellStyle(cs);
		}
	}

	try {
		OutputStream os = response.getOutputStream();
		wb.write(os);
		os.flush();
		os.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	out.clear();
	out=pageContext.pushBody();
%>