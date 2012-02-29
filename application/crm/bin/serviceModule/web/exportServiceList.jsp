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
    String filename="维修查询信息";
    filename = new String(filename.getBytes("gb2312"),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.setDefaultColumnWidth(10);
	sheet.setColumnWidth(1,20*256);
	sheet.setColumnWidth(2,20*256);
	sheet.setColumnWidth(4,20*256);
	sheet.setColumnWidth(20,20*256);

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
	 cell.setCellValue("进厂日期");		 
	 cell = row.createCell(2);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("工单号");		 
	 cell = row.createCell(3);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("维修类型");		 		 
	 cell = row.createCell(4);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车架号");		 
	 cell = row.createCell(5);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车牌号");	 
	 cell = row.createCell(6);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("品牌");	 
	 cell = row.createCell(7);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车系");		 
	 cell = row.createCell(8);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("是否返修");		 
	 cell = row.createCell(9);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("进厂行驶里程");		 
	 cell = row.createCell(10);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("维修项目");		 
	 cell = row.createCell(11);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("优惠劵消费");		 
	 cell = row.createCell(12);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("转账消费");		 
	 cell = row.createCell(13);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("现金消费");		 
	 cell = row.createCell(14);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("消费总额");		 
	 cell = row.createCell(15);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("钣金主修");		 
	 cell = row.createCell(16);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("喷漆主修");		 
	 cell = row.createCell(17);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("机电主修");		 
	 cell = row.createCell(18);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("交车日期");		 
	 cell = row.createCell(19);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("是否回访");
	 cell = row.createCell(20);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("预约单号");	 
	 cell = row.createCell(21);
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
		 SaturnData data = (SaturnData)result.get(i);
		 String carcardid = (String)data.get("carcardid");
		 if(carcardid!=null&&!"".equals(carcardid)){
			 cell.setCellValue("'"+(String)data.get("carcardid"));		 
		 }
		 
		 cell = row.createCell(1);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("servintime"));		
		 
		 cell = row.createCell(2);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("servorderid"));	
		 
		 cell = row.createCell(3);
		 cell.setCellStyle(cellStyle);
		 String servtype = (String)data.get("servtype");
		 if(servtype!=null&&!"".equals(servtype)){
			 servtype = inst.getDataDictItemInfo("crm_serviceType",servtype).getValue();
		 }
		 cell.setCellValue(servtype);	 	
		 		 
		 cell = row.createCell(4);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("carvin"));	 
		 
		 cell = row.createCell(5);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("carlicenceno"));	
		 
		 cell = row.createCell(6);
		 cell.setCellStyle(cellStyle);
		 String carbrand = (String)data.get("carbrand");
		 if(carbrand!=null&&!"".equals(carbrand)){
			 carbrand = inst.getDataDictItemInfo("crm_carModel",carbrand).getValue();
		 }
		 cell.setCellValue(carbrand);	
		
		 cell = row.createCell(7);
		 cell.setCellStyle(cellStyle);
		 String carseries = (String)data.get("carseries");
		 if(carseries!=null&&!"".equals(carseries)){
			 carseries = inst.getDataDictItemInfo("crm_carModel",carseries).getValue();
		 } 
		 cell.setCellValue(carseries);

		 cell = row.createCell(8);	
		 cell.setCellStyle(cellStyle);
		 String isrework = String.valueOf(data.get("isrework"));	 
		 if("1".equals(isrework)){
			 isrework = "是";
		 }else if("0".equals(isrework)){
			 isrework = "否";
		 }else{
			 isrework="";
		 }
		 cell.setCellValue(isrework);
		 
		 cell = row.createCell(9);
		 cell.setCellStyle(cellStyle);
		 String servkilometer = String.valueOf(data.get("servkilometer"));
		 long lc=0;
		 try{
			 lc=Long.parseLong(servkilometer);
			 cell.setCellValue(lc);	
		 }catch(Exception e){
			 cell.setCellValue(servkilometer);	
		 }
		  
		 
		 cell = row.createCell(10);
		 cell.setCellStyle(cellStyle);
		 String servitems = (String)data.get("servitems");	 
		 cell.setCellValue(servitems);

		 cell = row.createCell(11);
		 cell.setCellStyle(cellStyle);
		 String servticketexp = String.valueOf(data.get("servticketexp"));	
		 if("".equals(servticketexp)||servticketexp==null||"null".equals(servticketexp)){
			 servticketexp="0.0";
		 }
		 //cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
		 cell.setCellValue(Double.parseDouble(servticketexp));

		 cell = row.createCell(12);
		 cell.setCellStyle(cellStyle);
		 String servtransfer = String.valueOf(data.get("servtransfer"));
		 if("".equals(servtransfer)||servtransfer==null||"null".equals(servtransfer)){
			 servtransfer="0.0";
		 }
		 cell.setCellValue(Double.parseDouble(servtransfer));
		 
		 cell = row.createCell(13);
		 cell.setCellStyle(cellStyle);
		 String servcashexp = String.valueOf(data.get("servcashexp"));
		 if("".equals(servcashexp)||servcashexp==null||"null".equals(servcashexp)){
			 servcashexp="0.0";
		 }
		 cell.setCellValue(Double.parseDouble(servcashexp));
		 
		 cell = row.createCell(14);
		 cell.setCellStyle(cellStyle);
		 String servamountexp = String.valueOf(data.get("servamountexp"));
		 if("".equals(servamountexp)||servamountexp==null||"null".equals(servamountexp)){
			 servamountexp="0.0";
		 }
		 cell.setCellValue(Double.parseDouble(servamountexp));

		 cell = row.createCell(15);
		 cell.setCellStyle(cellStyle);
		 String servmetalworker = (String)data.get("servmetalworker");
		 if(servmetalworker!=null&&!"".equals(servmetalworker)){
			 try{
				 servmetalworker = inst.getDataDictItemInfo("crm_worker",servmetalworker).getValue();
				}catch(Exception e){}
		 } 
		 cell.setCellValue(servmetalworker);
		 
		 cell = row.createCell(16);
		 cell.setCellStyle(cellStyle);
		 String servpaintworker = (String)data.get("servpaintworker");	 
		 if(servpaintworker!=null&&!"".equals(servpaintworker)){
			 try{
			 servpaintworker = inst.getDataDictItemInfo("crm_worker",servpaintworker).getValue();
			 }catch(Exception e){}
		 }
		 cell.setCellValue(servpaintworker);	
		 cell = row.createCell(17);
		 cell.setCellStyle(cellStyle);
		 String servelecworker = (String)data.get("servelecworker");	 
		 if(servelecworker!=null&&!"".equals(servelecworker)){
			 try{
			 servelecworker = inst.getDataDictItemInfo("crm_worker",servelecworker).getValue();
		 	}catch(Exception e){}
		 }
		 cell.setCellValue(servelecworker);
		 cell = row.createCell(18);
		 cell.setCellStyle(cellStyle);
		 cell.setCellValue((String)data.get("servouttime"));
		 
		 cell = row.createCell(19);
		 cell.setCellStyle(cellStyle);
		 String visitid = (String)data.get("visitid");	 
		 if("".equals(visitid)||visitid==null){
			 visitid = "否";
		 }else if(!"".equals(visitid)){
			 visitid = "是";
		 }else{
			 visitid="";
		 }
		 cell.setCellValue(visitid);	
		 
		 cell = row.createCell(20);
		 cell.setCellStyle(cellStyle);
		 String resveorederid = (String)data.get("resveorederid");	 
		 cell.setCellValue(resveorederid);
		 
		 cell = row.createCell(21);
		 cell.setCellStyle(cellStyle);
		 String servstaff = (String)data.get("servstaff");	 
		 if(servstaff!=null&&!"".equals(servstaff)){
			 servstaff = inst.getDataDictItemInfo("crm_waiter",servstaff).getValue();
		 } 
		 cell.setCellValue(servstaff);
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
	   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 21);   
	   sheet.addMergedRegion(range); 
	   footRowcell.setCellStyle(centerstyle);
	   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
	   for(int i=1;i<22;i++){
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