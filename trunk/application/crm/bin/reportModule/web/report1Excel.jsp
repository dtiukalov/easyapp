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
Object obj = (Object)session.getAttribute("report1");
//session.removeAttribute("report1");
if (obj != null){
	String[][] report1 = (String[][])obj;

    String filename= request.getParameter("datetime") + "售后前台业务分析报表(接车情况)";
    filename = new String(filename.getBytes(),"iso8859-1");
	//List result = (List)request.getAttribute("result");
	//List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   Region(0,   (short)   0,   0,   (short)   2));//将单元格合并
	sheet.addMergedRegion(new   Region(1,   (short)   0,  6,   (short)   0));//接车情况合并
	sheet.addMergedRegion(new   Region(1,   (short)   1,  3,   (short)   1));//当日接车
	sheet.addMergedRegion(new   Region(4,   (short)   1,  6,   (short)   1));//当月接车
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("");	
	cell = row.createCell(1);
	cell = row.createCell(2);
    
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell cell1 = row1.createCell(0);
	cell1.setCellValue("接车情况");	
	cell1 = row1.createCell(1);
	cell1.setCellValue("当日接车");
	cell1 = row1.createCell(2);
	cell1.setCellValue("台次");

	HSSFRow row2 = sheet.createRow(2);
	HSSFCell cel2 = row2.createCell(0);
	cel2.setCellValue("");	
	cel2 = row2.createCell(1);	
	cel2 = row2.createCell(2);
	cel2.setCellValue("金额");	
	
	HSSFRow row3 = sheet.createRow(3);
	HSSFCell cel3 = row3.createCell(0); 
	cel3.setCellValue("");
	cel3 = row3.createCell(1); 
	cel3 = row3.createCell(2); 
	cel3.setCellValue("未录");
	
	HSSFRow row4 = sheet.createRow(4);
	HSSFCell cell4 = row4.createCell(0); 
	cell4 = row4.createCell(1); 
	cell4.setCellValue("当月接车");
	cell4 = row4.createCell(2); 
	cell4.setCellValue("台次");
	
	HSSFRow row5 = sheet.createRow(5);
	HSSFCell cell5 = row5.createCell(0);
	cell5.setCellValue("");
	cell5 = row5.createCell(1); 
	cell5 = row5.createCell(2); 
	cell5.setCellValue("金额");
	
	HSSFRow row6 = sheet.createRow(6);
	HSSFCell cel6 = row6.createCell(0); 
	cel6.setCellValue("");
	cel6 = row6.createCell(1); 
	cel6 = row6.createCell(2); 
	cel6.setCellValue("未录");
	
	HSSFRow[] rowz = {row,row1,row2,row3,row4,row5,row6};
	
	for(int i=1;i<report1.length;i++){ 
		HSSFRow t_row = rowz[i-1]; 
        String[] dq = report1[i]; //当前行
        for(int j=0;j<dq.length;j++){
        	HSSFCell t_cell = t_row.createCell(j+3);
        	if(i==1){
        		try {
        			t_cell.setCellValue(dq[j]);
        		} catch (Exception e) {
        			t_cell.setCellValue("");
        		}
        	}else if(i==3||i==6){
        		double valuez = Double.parseDouble(dq[j]);
        		try {
        			t_cell.setCellValue(valuez);
        		} catch (Exception e) {
        			t_cell.setCellValue(0.00d);
        		}
        	}else{
        		int valuez = Integer.parseInt(dq[j]);
        		try {
        			t_cell.setCellValue(valuez);
        		} catch (Exception e) {
        			t_cell.setCellValue(0);
        		}
        	}
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
}
%>