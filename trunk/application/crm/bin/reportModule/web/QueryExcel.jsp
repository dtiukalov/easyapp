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
	cell = row.createCell(3);
	cell.setCellValue("总计");		 
		 
	for(int i=0; i<result.size();i++){
		SaturnData rowvel = (SaturnData)result.get(i);
		cell = row.createCell(i+4);
		cell.setCellValue(rowvel.get("value").toString());	
	}
    
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell cell1 = row1.createCell(0);
	cell1.setCellValue("接车情况");	
	cell1 = row1.createCell(1);
	cell1.setCellValue("当日接车");
	cell1 = row1.createCell(2);
	cell1.setCellValue("台次");
	cell1 = row1.createCell(3); 
		
		
	int countidzj = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowec=(SaturnData)result.get(i);
		if(rowec.get("countid")!= null && rowec.get("countid")!= "")
		{
			countidzj += Integer.parseInt(rowec.get("countid").toString());
		}
	}
	cell1.setCellValue(countidzj);		 

	
	for(int i=0;i<result.size();i++)
	{
		
		SaturnData rowec=(SaturnData)result.get(i);
		cell1=row1.createCell(i+4);
		int countid = 0;
		if(rowec.get("countid")!= null && rowec.get("countid")!= "")
		{
			countid = Integer.parseInt(rowec.get("countid").toString());
		}
		cell1.setCellValue(countid);
	}

	HSSFRow row2 = sheet.createRow(2);
	HSSFCell cel2 = row2.createCell(0);
	cel2.setCellValue("");	
	cel2 = row2.createCell(1);	
	cel2 = row2.createCell(2);
	cel2.setCellValue("金额");	
	cel2 = row2.createCell(3); 
	
	float counttwo = 0,countthree=0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowst=(SaturnData)result.get(i);
		if(rowst.get("sumexp")!= null && rowst.get("sumexp")!= "")
		{
			counttwo += Float.parseFloat(rowst.get("sumexp").toString());
		}
		if(rowst.get("partsExpense")!=null && rowst.get("partsExpense")!=null)
		{
			countthree+=Float.parseFloat(rowst.get("partsExpense").toString());
		}
	}
	cel2.setCellValue(counttwo+countthree);	
	
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowst = (SaturnData)result.get(i);
		cel2 = row2.createCell(i+4);
		float j=0,j2=0;
		
		if(rowst.get("sumexp")!=null && rowst.get("sumexp")!=null)
		{
			j=Float.parseFloat(rowst.get("sumexp").toString());
		}
		if(rowst.get("partsExpense")!=null && rowst.get("partsExpense")!=null)
		{
			j2=Float.parseFloat(rowst.get("partsExpense").toString());
		}
		cel2.setCellValue(j+j2);
		
	}
	
	
	
	
	
	
	HSSFRow row3 = sheet.createRow(3);
	HSSFCell cel3 = row3.createCell(0); 
	cel3.setCellValue("");
	cel3 = row3.createCell(1); 
	cel3 = row3.createCell(2); 
	cel3.setCellValue("未录");
	cel3 = row3.createCell(3); 
	int countfour = 0;
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowrt=(SaturnData)result.get(i);
		if(rowrt.get("countnoid")!= null && rowrt.get("countnoid")!= "")
		{
			countfour += Integer.parseInt(rowrt.get("countnoid").toString());
		}
	}
	cel3.setCellValue(countfour);	
	
	for(int i=0;i<result.size();i++)
	{
		SaturnData rowrt = (SaturnData)result.get(i);
		cel3 = row3.createCell(i+4);
		int j1=0;
		if(rowrt.get("countnoid")!=null && rowrt.get("countnoid")!=null)
		{
			j1=Integer.parseInt(rowrt.get("countnoid").toString());
		}
		cel3.setCellValue(j1);
	}
	
	HSSFRow row4 = sheet.createRow(4);
	HSSFCell cell4 = row4.createCell(0); 
	cell4 = row4.createCell(1); 
	cell4.setCellValue("当月接车");
	cell4 = row4.createCell(2); 
	cell4.setCellValue("台次");
	cell4 = row4.createCell(3); 
	
	int countfive = 0;
	for(int i=0;i<resultmonth.size();i++)
	{
		SaturnData rowui=(SaturnData)resultmonth.get(i);
		if(rowui.get("countid")!= null && rowui.get("countid")!= "")
		{
			countfive += Integer.parseInt(rowui.get("countid").toString());
		}
	}
	cell4.setCellValue(countfive);	
	
	
	
	
	for(int i=0;i<resultmonth.size();i++)
	{
		
		SaturnData rowui=(SaturnData)resultmonth.get(i);
		cell4=row4.createCell(i+4);
		int countid = 0;
		if(rowui.get("countid")!= null && rowui.get("countid")!= "")
		{
			countid = Integer.parseInt(rowui.get("countid").toString());
		}
		cell4.setCellValue(countid);
	}
	
	HSSFRow row5 = sheet.createRow(5);
	HSSFCell cell5 = row5.createCell(0);
	cell5.setCellValue("");
	cell5 = row5.createCell(1); 
	cell5 = row5.createCell(2); 
	cell5.setCellValue("金额");
	cell5 = row5.createCell(3); 
	
	float countsix = 0,countseven=0;
	for(int i=0;i<resultmonth.size();i++)
	{
		SaturnData rowhj=(SaturnData)resultmonth.get(i);
		if(rowhj.get("sumexp")!= null && rowhj.get("sumexp")!= "")
		{
			countsix += Float.parseFloat(rowhj.get("sumexp").toString());
		}
		if(rowhj.get("partsExpense")!=null && rowhj.get("partsExpense")!=null)
		{
			countseven+=Float.parseFloat(rowhj.get("partsExpense").toString());
		}
	}
	cell5.setCellValue(countsix+countseven);	
	
	
	for(int i=0;i<resultmonth.size();i++)
	{
		SaturnData rowhj = (SaturnData)resultmonth.get(i);
		cell5 = row5.createCell(i+4);
		float j=0,j2=0;
		
		if(rowhj.get("sumexp")!=null && rowhj.get("sumexp")!=null)
		{
			j=Float.parseFloat(rowhj.get("sumexp").toString());
		}
		if(rowhj.get("partsExpense")!=null && rowhj.get("partsExpense")!=null)
		{
			j2=Float.parseFloat(rowhj.get("partsExpense").toString());
		}
		cell5.setCellValue(j+j2);
		
	}
	
	
	HSSFRow row6 = sheet.createRow(6);
	HSSFCell cel6 = row6.createCell(0); 
	cel6.setCellValue("");
	cel6 = row6.createCell(1); 
	cel6 = row6.createCell(2); 
	cel6.setCellValue("未录");
	cel6 = row6.createCell(3); 
	
	
	int counteitity = 0;
	for(int i=0;i<resultmonth.size();i++)
	{
		SaturnData rowqe=(SaturnData)resultmonth.get(i);
		if(rowqe.get("countnoid")!= null && rowqe.get("countnoid")!= "")
		{
			counteitity += Integer.parseInt(rowqe.get("countnoid").toString());
		}
	}
	cel6.setCellValue(counteitity);	
	
	
	for(int i=0;i<resultmonth.size();i++)
	{
		SaturnData rowqe = (SaturnData)resultmonth.get(i);
		cel6 = row6.createCell(i+4);
		int j1=0;
		if(rowqe.get("countnoid")!=null && rowqe.get("countnoid")!=null)
		{
			j1=Integer.parseInt(rowqe.get("countnoid").toString());
		}
		cel6.setCellValue(j1);
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