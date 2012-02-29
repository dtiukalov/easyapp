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
List<SaturnData> dictlist = (List<SaturnData>)request.getAttribute("dictlist");
List carecode = new ArrayList();
List carename = new ArrayList();
if(dictlist!=null){
	for(SaturnData sd : dictlist){
		carecode.add(sd.get("code"));
		carename.add(sd.get("value"));
	}
}  

//车型
List brandser = new ArrayList();
	brandser.add("105007");
	brandser.add("105006");
	brandser.add("105008");
	brandser.add("1");	

    String filename= request.getAttribute("statisticdate") + "售后车辆当日流量(养护品)";
    filename = new String(filename.getBytes(),"iso8859-1");
    List resultcareday = new ArrayList();
	resultcareday = (List)request.getAttribute("resultcareday");
	List resultcaremon=(List)request.getAttribute("resultcaremon");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	sheet.addMergedRegion(new   Region(0,   (short)  0,   0,   (short)  5));
	sheet.addMergedRegion(new   Region(0,   (short)  6,   0,   (short)  11));
	
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("当日养护品统计(桶数)");	
	cell = row.createCell(6);	 
	cell.setCellValue("当月养护品统计(桶数)");	
	
	
	
	HSSFRow row1 = sheet.createRow(1);
	HSSFCell cell1 = row1.createCell(0);
	cell1.setCellValue("种类");	
	cell1 = row1.createCell(1);	 
	cell1.setCellValue("总计");
	cell1 = row1.createCell(2);	 
	cell1.setCellValue("CRV");
	cell1 = row1.createCell(3);	 
	cell1.setCellValue("CIVIC");
	cell1 = row1.createCell(4);	 
	cell1.setCellValue("SPIRIOR");
	cell1 = row1.createCell(5);	 
	cell1.setCellValue("其他");
	cell1 = row1.createCell(6);	 
	cell1.setCellValue("种类");
	cell1 = row1.createCell(7);	 
	cell1.setCellValue("总计");
	cell1 = row1.createCell(8);	 
	cell1.setCellValue("CRV");
	cell1 = row1.createCell(9);	 
	cell1.setCellValue("CIVIC");
	cell1 = row1.createCell(10);	 
	cell1.setCellValue("SPIRIOR");
	cell1 = row1.createCell(11);	 
	cell1.setCellValue("其他");
	
	

	int i=0;
	for(;i<carename.size();i++)
	{   
		String care = carecode.get(i).toString();
		String car_n = carename.get(i).toString();
		HSSFRow rownum = sheet.createRow(2+i);
		
		HSSFCell cellnum = rownum.createCell(0);
		cellnum.setCellValue(car_n);
		//天总计
		cellnum=rownum.createCell(1);
		int alljis=0;
		for(int k=0;k<resultcareday.size();k++ ){
			SaturnData rowg = (SaturnData)resultcareday.get(k);
			
				if(care.equals(rowg.get("careitemvame"))){
					alljis += Integer.parseInt(rowg.get("carecount").toString());
				}
			
		}
		cellnum.setCellValue(alljis);
		
		
		
		//以天进行车型显示
		for(int j=0;j<brandser.size();j++){
			cellnum=rownum.createCell(j+2);
			int carecount= 0;
			String brand=(String)brandser.get(j);
			
			for(int k=0; k<resultcareday.size();k++){
				SaturnData rown = (SaturnData)resultcareday.get(k);
				if(care.equals(rown.get("careitemvame"))){
					if(brand.equals(rown.get("carseries"))){
						carecount = rown.get("carecount")!=null&&!"".equals(rown.get("carecount").toString().trim())?Integer.parseInt(rown.get("carecount").toString().trim()):0;
						
					}
				}
				
			}
			cellnum.setCellValue(carecount);
		}
		
		
		
		cellnum = rownum.createCell(6);	 
		cellnum.setCellValue(car_n);
		
		//月总计
		cellnum=rownum.createCell(7);
		int ck=0;
		for(int g=0;g<resultcaremon.size();g++ ){
			SaturnData rowgs = (SaturnData)resultcaremon.get(g);
			
				if(care.equals(rowgs.get("careitemvame"))){
					ck += Integer.parseInt(rowgs.get("carecount").toString());
				}
			
		}
		cellnum.setCellValue(ck);
		
		//以月进行车型显示
		for(int t=0;t<brandser.size();t++)
		{
			cellnum=rownum.createCell(t+8);
			int mexcount=0;
			String brands=(String)brandser.get(t);
			for(int y=0; y<resultcaremon.size();y++){
				SaturnData rowns = (SaturnData)resultcaremon.get(y);
				if(care.equals(rowns.get("careitemvame"))){
					if(brands.equals(rowns.get("carseries"))){
						mexcount = rowns.get("carecount")!=null&&!"".equals(rowns.get("carecount").toString().trim())?Integer.parseInt(rowns.get("carecount").toString().trim()):0;
						
					}
				}
				
			}
			cellnum.setCellValue(mexcount);
		}
		
		
		
		
	}
	HSSFRow rowrt= sheet.createRow(2+i);
	HSSFCell cellrt = rowrt.createCell(0);
	cellrt.setCellValue("总计");	
	cellrt = rowrt.createCell(1);
	int counts=0;
	for(int w=0;w<resultcareday.size();w++)
	{
		SaturnData rowrts=(SaturnData)resultcareday.get(w);
		counts +=Integer.parseInt(rowrts.get("carecount").toString());	
	}
	cellrt.setCellValue(counts);
	
	for(int j=0;j<brandser.size();j++){
		cellrt=rowrt.createCell(j+2);
		int carecount= 0;
		String brand=(String)brandser.get(j);
	
		for(int k=0; k<resultcareday.size();k++){
			SaturnData rown = (SaturnData)resultcareday.get(k);
				if(brand.equals(rown.get("carseries"))){
					carecount += Integer.parseInt(rown.get("carecount").toString());
			}
		}
		cellrt.setCellValue(carecount);
	}
	
	
	

	HSSFCell cellrtd = rowrt.createCell(6);
	cellrtd.setCellValue("总计");
	cellrtd = rowrt.createCell(7);
	int countsd=0;
	for(int h=0;h<resultcaremon.size();h++)
	{
		SaturnData rowrtsg=(SaturnData)resultcaremon.get(h);
		countsd +=Integer.parseInt(rowrtsg.get("carecount").toString());	
	}
	cellrtd.setCellValue(countsd);
	for(int j=0;j<brandser.size();j++){
		cellrtd=rowrt.createCell(j+8);
		int carecount= 0;
		String brand=(String)brandser.get(j);
	
		for(int k=0; k<resultcaremon.size();k++){
			SaturnData rowrtsg = (SaturnData)resultcaremon.get(k);
				if(brand.equals(rowrtsg.get("carseries"))){
					carecount += Integer.parseInt(rowrtsg.get("carecount").toString());
			}
		}
		cellrtd.setCellValue(carecount);
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