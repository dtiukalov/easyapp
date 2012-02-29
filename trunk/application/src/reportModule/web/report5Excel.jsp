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
Object obj = (Object)session.getAttribute("report5");
//session.removeAttribute("report5");
if (obj != null){
	String[][] report1 = (String[][])obj;

    String filename= request.getParameter("datetime") + "售后前台业务分析报表(精品金额)";
    filename = new String(filename.getBytes(),"iso8859-1");
	List result = (List)request.getAttribute("result");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   Region(0,   (short)   1,   0,   (short)  1));
	sheet.addMergedRegion(new   Region(1,   (short)   0,  2,   (short)   0));
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("");	
	cell = row.createCell(1);
	
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell cell1 = row1.createCell(0);
	cell1.setCellValue("精品金额");
	cell1 = row1.createCell(1);
	cell1.setCellValue("当日");
	
	HSSFRow row2 = sheet.createRow(2);
	HSSFCell cell2 = row2.createCell(0);
	cell2.setCellValue("");	
	cell2 = row2.createCell(1);
	cell2.setCellValue("月累");	
	
	HSSFRow[] rowz = {row,row1,row2};
	
	for(int i=1;i<report1.length;i++){ 
		HSSFRow t_row = rowz[i-1]; 
        String[] dq = report1[i]; //当前行
        for(int j=0;j<dq.length;j++){
        	HSSFCell t_cell = t_row.createCell(j+2);
        	if(i==1){
        		try {
        			t_cell.setCellValue(dq[j]);
        		} catch (Exception e) {
        			t_cell.setCellValue("");
        		}
        	}else{
        		double valuez = Double.parseDouble(dq[j]);
        		try {
        			t_cell.setCellValue(valuez);
        		} catch (Exception e) {
        			t_cell.setCellValue(0.00d);
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