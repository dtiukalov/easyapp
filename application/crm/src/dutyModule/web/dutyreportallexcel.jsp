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
    String filename= "售后总值综合报表";
    filename = new String(filename.getBytes(),"iso8859-1");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   0,   0));//台数
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   1,   1));//车牌
	sheet.addMergedRegion(new   CellRangeAddress(0,   0,   2,   6));//车型
	
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   7,   7));//进厂时间
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   8,   8));//预交车时间
	sheet.addMergedRegion(new   CellRangeAddress(0,   0,   9,   10));//分类
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   11,   11));//内容
	
	sheet.addMergedRegion(new   CellRangeAddress(0,   0,   12,   16));//当日进程
	sheet.addMergedRegion(new   CellRangeAddress(0,   0,   17,   22));//停留工位
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   23,   23));//说明
	sheet.addMergedRegion(new   CellRangeAddress(0,   1,   24,   24));//接待
	
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
	cell.setCellValue("台数");
	cell.setCellStyle(csH);
	
	cell = row.createCell(1);
	cell.setCellValue("车牌 VIN");
	cell.setCellStyle(csH);
	
	cell = row.createCell(2);
	cell.setCellValue("车型");
	cell.setCellStyle(csH);
	
	cell = row.createCell(3);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(4);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(5);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(6);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(7);
	cell.setCellValue("进厂时间");
	cell.setCellStyle(csH);
	
	cell = row.createCell(8);
	cell.setCellValue("预交车时间");
	cell.setCellStyle(csH);
	
	cell = row.createCell(9);
	cell.setCellValue("车辆分类");
	cell.setCellStyle(csH);
	
	cell = row.createCell(10);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(11);
	cell.setCellValue("大概维修内容");
	cell.setCellStyle(csH);
	
	cell = row.createCell(12);
	cell.setCellValue("当日进程");
	cell.setCellStyle(csH);
	
	cell = row.createCell(13);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(14);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(15);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(16);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(17);
	cell.setCellValue("当日停留工位");
	cell.setCellStyle(csH);
	
	cell = row.createCell(18);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(19);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(20);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(21);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(22);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row.createCell(23);
	cell.setCellValue("待料说明、处理情况");
	cell.setCellStyle(csH);
	
	cell = row.createCell(24);
	cell.setCellValue("接待");
	cell.setCellStyle(csH);
	
	HSSFRow row1 = sheet.createRow(1);
	
	cell = row1.createCell(0);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(1);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(2);
	cell.setCellValue("CR-V");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(3);
	cell.setCellValue("CIVIC");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(4);
	cell.setCellValue("SPR");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(5);
	cell.setCellValue("广本");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(6);
	cell.setCellValue("其他");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(7);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(8);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(9);
	cell.setCellValue("售后部");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(10);
	cell.setCellValue("市场部");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(11);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(12);
	cell.setCellValue("定损");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(13);
	cell.setCellValue("待料");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(14);
	cell.setCellValue("作业");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(15);
	cell.setCellValue("等交车");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(0);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(15);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(16);
	cell.setCellValue("其他");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(17);
	cell.setCellValue("机电");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(18);
	cell.setCellValue("钣金");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(19);
	cell.setCellValue("喷漆");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(20);
	cell.setCellValue("完检");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(21);
	cell.setCellValue("交车");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(22);
	cell.setCellValue("其他");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(23);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	cell = row1.createCell(24);
	cell.setCellValue("");
	cell.setCellStyle(csH);
	
	List<Map<String, Object>> allresult = (List)request.getAttribute("allresult");
int stanum=1;
int tip=2;
	if (allresult != null){
		if (!allresult.isEmpty()) {
			int i = 0;
			for (; i < allresult.size(); ++i) {
				SaturnData data = (SaturnData)allresult.get(i);
				String cp=data.get("carlicenseno")!=null?data.get("carlicenseno")+"":data.get("carvin")!=null?"VIN:"+data.get("carvin").toString().substring(data.get("carvin").toString().length()-4):"";
				String cx1="";
				String cx2="";
				String cx3="";
				String cx4="";
				String cx5="";
				if("105007".equals(data.get("dutycarmodel"))){
					cx1="√";
				}else if("105006".equals(data.get("dutycarmodel"))){
					cx2="√";
				}else if("105008".equals(data.get("dutycarmodel"))){
					cx3="√";
				}else if("105002".equals(data.get("dutycarmodel"))||"105003".equals(data.get("dutycarmodel"))||"105004".equals(data.get("dutycarmodel"))||"105005".equals(data.get("dutycarmodel"))){
					cx4="√";
				}else{
					cx5="√";
				}
				String intime=data.get("dutyintime")!=null?data.get("dutyintime")+"":"";
				String prtime=data.get("dutypredelivtime")!=null?data.get("dutypredelivtime")+"":"";
				String type1="";
				String type2="";
				if("售后".equals(data.get("dutytype"))){
					type1="√";
				}else if("市场".equals(data.get("dutytype"))){
					type2="√";
				}
				String wk=data.get("dutywkcontent")!=null?data.get("dutywkcontent")+"":"";
				String st=data.get("dutystaff_dict")!=null?data.get("dutystaff_dict")+"":"";
				
				HSSFRow rowi = sheet.createRow(tip++);
				
				cell = rowi.createCell(0);
				cell.setCellValue((stanum++)+"");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(1);
				cell.setCellValue(cp);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(2);
				cell.setCellValue(cx1);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(3);
				cell.setCellValue(cx2);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(4);
				cell.setCellValue(cx3);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(5);
				cell.setCellValue(cx4);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(6);
				cell.setCellValue(cx5);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(7);
				cell.setCellValue(intime);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(8);
				cell.setCellValue(prtime);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(9);
				cell.setCellValue(type1);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(10);
				cell.setCellValue(type2);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(11);
				cell.setCellValue(wk);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(12);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(13);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(14);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(15);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(16);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(17);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(18);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(19);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(20);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(21);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(22);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(23);
				cell.setCellValue("");
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(24);
				cell.setCellValue(st);
				cell.setCellStyle(cs);
				
			}
			
			sheet.addMergedRegion(new   CellRangeAddress(tip,   tip,   0,   24));//接待
			HSSFRow rowi = sheet.createRow(tip++);
			cell = rowi.createCell(0);
			cell.setCellValue("共有"+i+"台车");
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