<%@page import="org.apache.poi.hssf.util.CellRangeAddress"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRichTextString"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFDataFormatter"%>

<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFontFormatting"%>
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
System.out.println("aaaa");
    String filename="车辆车主查询信息";
    filename = new String(filename.getBytes("gb2312"),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.setDefaultColumnWidth(10);
	sheet.setColumnWidth(4, 20*256);
	sheet.setColumnWidth(19, 20*256);
	sheet.setColumnWidth(20, 20*256);
	sheet.setColumnWidth(24, 20*256);

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
	 cell.setCellValue("建档时间");		 
	 cell = row.createCell(2);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("档案级别");		 
	 cell = row.createCell(3);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("档案分类");		 		 
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
	 cell.setCellValue("车型");		 
	 cell = row.createCell(9);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车色");	
	 cell = row.createCell(10);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("年款");		 
	 cell = row.createCell(11);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("地区");
	 cell.setCellStyle(cellStyle);
	 cell = row.createCell(12);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车辆类别");		 
	 cell = row.createCell(13);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车辆来源");		 
	 cell = row.createCell(14);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车店距离");		 
	 cell = row.createCell(15);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("用户类别");		 
	 cell = row.createCell(16);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("会员类型");		 
	 cell = row.createCell(17);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("车主");		 
	 cell = row.createCell(18);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("性别");		 
	 cell = row.createCell(19);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("电话");
	 cell = row.createCell(20);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("手机");	 
	 cell = row.createCell(21);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("联系人");	 
	 cell = row.createCell(22);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("联系人性别");		 
	 cell = row.createCell(23);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("电话");
	 cell = row.createCell(24);
	 cell.setCellStyle(cellStyle);
	 cell.setCellValue("其他联系方式");
	 
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
			 cell.setCellValue("'"+(String)data.get("carcardid"));		  

			 cell = row.createCell(1);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("carcreatetime"));		
			 
			 cell = row.createCell(2);
			 cell.setCellStyle(cellStyle);
			 String carcardlevel = (String)data.get("carcardlevel");
			 if(carcardlevel!=null&&!"".equals(carcardlevel)){
			     carcardlevel = inst.getDataDictItemInfo("crm_cardLevel",carcardlevel).getValue();
			 }
			 cell.setCellValue(carcardlevel);	
			 
			 cell = row.createCell(3);
			 cell.setCellStyle(cellStyle);
			 String carcardtype = (String)data.get("carcardtype");
			 if(carcardtype!=null&&!"".equals(carcardtype)){
				 carcardtype = inst.getDataDictItemInfo("crm_cardType",carcardtype).getValue();
			 }
			 cell.setCellValue(carcardtype);	
			 		 
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
			 String carmodel = (String)data.get("carmodel");	 
			 if(carmodel!=null&&!"".equals(carmodel)){
				 carmodel = inst.getDataDictItemInfo("crm_carModel",carmodel).getValue();
			 }
			 cell.setCellValue(carmodel);
	
			 cell = row.createCell(9);	
			 cell.setCellStyle(cellStyle);
			 String carcolor = (String)data.get("carcolor");	 
			 //if(carcolor!=null&&!"".equals(carcolor)){
				 //carcolor = inst.getDataDictItemInfo("crm_carColor",carcolor).getValue();
			 //}
			 cell.setCellValue(carcolor);
			 
			 cell = row.createCell(10);
			 cell.setCellStyle(cellStyle);
			 String caryearstyle = (String)data.get("caryearstyle");	 
			 //if(caryearstyle!=null&&!"".equals(caryearstyle)){
				 //caryearstyle = inst.getDataDictItemInfo("crm_yearStyle",caryearstyle).getValue();
			 //}
			 cell.setCellValue(caryearstyle);	 
			 
			 cell = row.createCell(11);
			 cell.setCellStyle(cellStyle);
			 String cararea = (String)data.get("cararea");	 
			 if(cararea!=null&&!"".equals(cararea)){
				 cararea = inst.getDataDictItemInfo("crm_carArea",cararea).getValue();
			 }
			 cell.setCellValue(cararea);
	
			 cell = row.createCell(12);
			 cell.setCellStyle(cellStyle);
			 String carownership = (String)data.get("carownership");	 
			 if(carownership!=null&&!"".equals(carownership)){
				 carownership = inst.getDataDictItemInfo("crm_carType",carownership).getValue();
			 }
			 cell.setCellValue(carownership);
	
			 cell = row.createCell(13);
			 cell.setCellStyle(cellStyle);
			 String carsource = (String)data.get("carsource");	 
			 if(carsource!=null&&!"".equals(carsource)){
				 carsource = inst.getDataDictItemInfo("crm_carSource",carsource).getValue();
			 }
			 cell.setCellValue(carsource);
			 
			 cell = row.createCell(14);
			 cell.setCellStyle(cellStyle);
			 String carshoprange = (String)data.get("carshoprange");	 
			 if(carshoprange!=null&&!"".equals(carshoprange)){
				 carshoprange = inst.getDataDictItemInfo("crm_shopRange",carshoprange).getValue();
			 }
			 cell.setCellValue(carshoprange);
			 
			 cell = row.createCell(15);
			 cell.setCellStyle(cellStyle);
			 String carusertype = (String)data.get("carusertype");	 
			 if(carusertype!=null&&!"".equals(carusertype)){
				 carusertype = inst.getDataDictItemInfo("crm_carUserType",carusertype).getValue();
			 }
			 cell.setCellValue(carusertype);
	
			 cell = row.createCell(16);
			 cell.setCellStyle(cellStyle);
			 String membtype = (String)data.get("membtype");
			 if(membtype!=null&&!"".equals(membtype)){
				 membtype = inst.getDataDictItemInfo("crm_membType",membtype).getValue();
			 }
			 cell.setCellValue(membtype);
			 
			 cell = row.createCell(17);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmname"));		 
			 
			 cell = row.createCell(18);
			 cell.setCellStyle(cellStyle);
			 String cstmsex = (String)data.get("cstmsex");	 
			 if(cstmsex!=null&&!"".equals(cstmsex)){
				 cstmsex = inst.getDataDictItemInfo("crm_sex",cstmsex).getValue();
			 }
			 cell.setCellValue(cstmsex);
			 
			 cell = row.createCell(19);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmtel"));
			 
			 cell = row.createCell(20);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmmobile"));	
			 
			 cell = row.createCell(21);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmcontact"));	
			 
			 cell = row.createCell(22);
			 cell.setCellStyle(cellStyle);
			 String cstmcontsex = (String)data.get("cstmcontsex");	 
			 if(cstmcontsex!=null&&!"".equals(cstmcontsex)){
				 cstmcontsex = inst.getDataDictItemInfo("crm_sex",cstmcontsex).getValue();
			 }
			 cell.setCellValue(cstmcontsex);
			 
			 cell = row.createCell(23);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmconttel"));
			 
			 cell = row.createCell(24);
			 cell.setCellStyle(cellStyle);
			 cell.setCellValue((String)data.get("cstmcontmobile"));	
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
	   CellRangeAddress range = new CellRangeAddress(footRownumber + 1, footRownumber + 1, 0, 24);   
	   sheet.addMergedRegion(range); 
	   footRowcell.setCellStyle(centerstyle);
	   footRowcell.setCellValue(new HSSFRichTextString("记录数："+result.size()));
	   for(int i=1;i<25;i++){
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