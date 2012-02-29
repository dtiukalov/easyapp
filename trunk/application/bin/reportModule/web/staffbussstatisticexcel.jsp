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
    String filename= request.getAttribute("statisticdate") + "售后前台业务分析报表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List result = (List)request.getAttribute("result");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	sheet.addMergedRegion(new   Region(0,   (short)   4,   0,   (short)   6));//将单元格合并
	sheet.addMergedRegion(new   Region(0,   (short)   7,   0,   (short)   8));//组别合并单元格
	sheet.addMergedRegion(new   Region(0,   (short)   9,   0,   (short)   10));
	sheet.addMergedRegion(new   Region(0,   (short)   11,   0,   (short)   12));
	
	sheet.addMergedRegion(new   Region(2,   (short)   0,  7,   (short)   0));//接车情况合并
	sheet.addMergedRegion(new   Region(2,   (short)   1,  4,   (short)   1));//当日接车
	sheet.addMergedRegion(new   Region(5,   (short)   1,  7,   (short)   1));//当月接车
	
	sheet.addMergedRegion(new   Region(8,   (short)   0,  11,   (short)   0));//招揽预约
	sheet.addMergedRegion(new   Region(8,   (short)   1,  9,   (short)   1));//当日
	sheet.addMergedRegion(new   Region(10,   (short)   1,  11,   (short)   1));//当月
	
	sheet.addMergedRegion(new   Region(12,   (short)   0,  13,   (short)   0));//节余
	sheet.addMergedRegion(new   Region(14,   (short)   0,  15,   (short)   1));//投保台次
	sheet.addMergedRegion(new   Region(16,   (short)   0,  17,   (short)   1));//精品金额
	sheet.addMergedRegion(new   Region(18,   (short)   0,  19,   (short)   1));//护养品金额
	sheet.addMergedRegion(new   Region(20,   (short)   0,  21,   (short)   1));//索赔台次
	sheet.addMergedRegion(new   Region(22,   (short)   0,  23,   (short)   1));//顾客投诉
	 cell.setCellValue("");		 
	 cell = row.createCell(1);
	 cell.setCellValue("");		 
	 cell = row.createCell(2);
	 cell.setCellValue("");		 
	 cell = row.createCell(3);
	 cell.setCellValue("");		 		 
	 cell = row.createCell(4);
	 cell.setCellValue("第一组");		 
	 cell = row.createCell(5);
	 cell.setCellValue("");	 
	 cell = row.createCell(6);
	 cell.setCellValue("");	 
	 cell = row.createCell(7);
	 cell.setCellValue("第二组");		 
	 cell = row.createCell(8);
	 cell.setCellValue("");		 
	 cell = row.createCell(9);
	 cell.setCellValue("第三组");		 
	 cell = row.createCell(10);
	 cell.setCellValue("");		 
	 cell = row.createCell(11);
	 cell.setCellValue("第四组");		 
	 cell = row.createCell(12);
	 cell.setCellValue("");		 
	 cell = row.createCell(13);
	 cell.setCellValue("第五组");		
	 
 	 HSSFRow row1 = sheet.createRow(1);
	 HSSFCell cell1 = row1.createCell(0);
	 cell1.setCellValue("");		 
	 cell1 = row1.createCell(1);
	 cell1.setCellValue("");		 
	 cell1 = row1.createCell(2);
	 cell1.setCellValue("");		 
	 cell1 = row1.createCell(3);
	 cell1.setCellValue("总计");		 		 
	 cell1 = row1.createCell(4);
	 cell1.setCellValue("张策");		 
	 cell1 = row1.createCell(5);
	 cell1.setCellValue("赵晓亮");	 
	 cell1 = row1.createCell(6);
	 cell1.setCellValue("郑秋月");	 
	 cell1 = row1.createCell(7);
	 cell1.setCellValue("梁天依");		 
	 cell1 = row1.createCell(8);
	 cell1.setCellValue("郑爽");		 
	 cell1 = row1.createCell(9);
	 cell1.setCellValue("张景辉");		 
	 cell1 = row1.createCell(10);
	 cell1.setCellValue("邓然");		 
	 cell1 = row1.createCell(11);
	 cell1.setCellValue("王晶晶");		 
	 cell1 = row1.createCell(12);
	 cell1.setCellValue("战洪新");		 
	 cell1 = row1.createCell(13);
	 cell1.setCellValue("王中恺");	

	 HSSFRow row2 = sheet.createRow(2);
	 HSSFCell cell2 = row2.createCell(0);
	 cell2.setCellValue("接车情况");		 
	 cell2 = row2.createCell(1);
	 cell2.setCellValue("当日接车");		 
	 cell2 = row2.createCell(2);
	 cell2.setCellValue("台次");		 
	 cell2 = row2.createCell(3);
	 	List list = (List)request.getAttribute("result");
			int j0 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j0 += Integer.parseInt(rowfri.get("carcount").toString());
		    }
	 cell2.setCellValue(j0);
	    for(int i=0;i<list.size();i++){
	    	cell2 = row2.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	int j= Integer.parseInt(rownum.get("carcount").toString());
	    	cell2.setCellValue(j);
	    }
	 
	 HSSFRow row3 = sheet.createRow(3);
	 HSSFCell cell3 = row3.createCell(0);
				
	 cell3.setCellValue("");		 
	 cell3 = row3.createCell(1);
	 cell3.setCellValue("");		 
	 cell3 = row3.createCell(2);
	 cell3.setCellValue("金额");		 
	 cell3 = row3.createCell(3);
	 float j1 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j1 += Float.parseFloat(rownum.get("carmoney").toString());
	    }
	 cell3.setCellValue(j1);
	    for(int i=0;i<list.size();i++){
	    	cell3 = row3.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("carmoney").toString());
	    	cell3.setCellValue(j);
	    }	
	 
 	 HSSFRow row4 = sheet.createRow(4);
	 HSSFCell cell4 = row4.createCell(0);
	 cell4.setCellValue("");		 
	 cell4 = row4.createCell(1);
	 cell4.setCellValue("");		 
	 cell4 = row4.createCell(2);
	 cell4.setCellValue("未录");		 
	 cell4 = row4.createCell(3);
		int j2 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j2 += Integer.parseInt(rowfri.get("norecordcarcount").toString());
		    }
	 cell4.setCellValue(j2);
	 for(int i=0;i<list.size();i++){
	 	cell4 = row4.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("norecordcarcount").toString());
	 	cell4.setCellValue(j);
	 }
	 HSSFRow row5 = sheet.createRow(5);
	 HSSFCell cell5 = row5.createCell(0);
	 cell5.setCellValue("");		 
	 cell5 = row5.createCell(1);
	 cell5.setCellValue("当月累计");		 
	 cell5 = row5.createCell(2);
	 cell5.setCellValue("台次");		 
	 cell5 = row5.createCell(3);
			int j5 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j5 += Integer.parseInt(rowfri.get("mcarcount").toString());
		    }
	 cell5.setCellValue(j5);
	    for(int i=0;i<list.size();i++){
	    	cell5 = row5.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	int j= Integer.parseInt(rownum.get("mcarcount").toString());
	    	cell5.setCellValue(j);
	    }
	 
	 HSSFRow row6 = sheet.createRow(6);
	 HSSFCell cell6 = row6.createCell(0);
				
	 cell6.setCellValue("");		 
	 cell6 = row6.createCell(1);
	 cell6.setCellValue("");		 
	 cell6 = row6.createCell(2);
	 cell6.setCellValue("金额");		 
	 cell6 = row6.createCell(3);
	 float j6 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j6 += Float.parseFloat(rownum.get("mcarmoney").toString());
	    }
	 cell6.setCellValue(j6);
	    for(int i=0;i<list.size();i++){
	    	cell6 = row6.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("mcarmoney").toString());
	    	cell6.setCellValue(j);
	    }	
	 
 	 HSSFRow row7 = sheet.createRow(7);
	 HSSFCell cell7 = row7.createCell(0);
	 cell7.setCellValue("");		 
	 cell7 = row7.createCell(1);
	 cell7.setCellValue("");		 
	 cell7 = row7.createCell(2);
	 cell7.setCellValue("未录");		 
	 cell7 = row7.createCell(3);
		int j7 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j7 += Integer.parseInt(rowfri.get("mnorecordcarcount").toString());
		    }
	 cell7.setCellValue(j7);
	 for(int i=0;i<list.size();i++){
	 	cell7 = row7.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("mnorecordcarcount").toString());
	 	cell7.setCellValue(j);
	 }
	 
	 //招揽预约
	 HSSFRow row8 = sheet.createRow(8);
	 HSSFCell cell8 = row8.createCell(0);
	 cell8.setCellValue("招揽预约");		 
	 cell8 = row8.createCell(1);
	 cell8.setCellValue("预约");		 
	 cell8 = row8.createCell(2);
	 cell8.setCellValue("当日");		 
	 cell8 = row8.createCell(3);
		int j8 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j8 += Integer.parseInt(rowfri.get("reservecount").toString());
		    }
	 cell8.setCellValue(j8);
	 for(int i=0;i<list.size();i++){
	 	cell8 = row8.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("reservecount").toString());
	 	cell8.setCellValue(j);
	 }
	 HSSFRow row9 = sheet.createRow(9);
	 HSSFCell cell9 = row9.createCell(0);
	 cell9.setCellValue("");		 
	 cell9 = row9.createCell(1);
	 cell9.setCellValue("");		 
	 cell9 = row9.createCell(2);
	 cell9.setCellValue("月累");		 
	 cell9 = row9.createCell(3);
		int j9 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j9 += Integer.parseInt(rowfri.get("mreservecount").toString());
		    }
	 cell9.setCellValue(j9);
	 for(int i=0;i<list.size();i++){
	 	cell9 = row9.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("mreservecount").toString());
	 	cell9.setCellValue(j);
	 }
	 HSSFRow row10 = sheet.createRow(10);
	 HSSFCell cell10 = row10.createCell(0);
	 cell10.setCellValue("");		 
	 cell10 = row10.createCell(1);
	 cell10.setCellValue("成功预约");		 
	 cell10 = row10.createCell(2);
	 cell10.setCellValue("当日");		 
	 cell10 = row10.createCell(3);
		int j10 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j10 += Integer.parseInt(rowfri.get("reservesuccesscount").toString());
		    }
	 cell10.setCellValue(j10);
	 for(int i=0;i<list.size();i++){
	 	cell10 = row10.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("reservesuccesscount").toString());
	 	cell10.setCellValue(j);
	 }
	 HSSFRow row11 = sheet.createRow(11);
	 HSSFCell cell11 = row11.createCell(0);
	 cell11.setCellValue("");		 
	 cell11 = row11.createCell(1);
	 cell11.setCellValue("");		 
	 cell11 = row11.createCell(2);
	 cell11.setCellValue("月累");		 
	 cell11 = row11.createCell(3);
		int j11 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j11 += Integer.parseInt(rowfri.get("mreservesuccesscount").toString());
		    }
	 cell11.setCellValue(j11);
	 for(int i=0;i<list.size();i++){
	 	cell11 = row11.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("mreservesuccesscount").toString());
	 	cell11.setCellValue(j);
	 }
	 
	 
	 //节余机油
	 
	 HSSFRow row12 = sheet.createRow(12);
	 HSSFCell cell12 = row12.createCell(0);
	 cell12.setCellValue("节余机油");		 
	 cell12 = row12.createCell(1);
	 cell12.setCellValue("现存");		 
	 cell12 = row12.createCell(2);
	 cell12.setCellValue("当日");		 
	 cell12 = row12.createCell(3);
		int j12 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j12 += Integer.parseInt(rowfri.get("oilcount").toString());
		    }
	 cell12.setCellValue(j12);
	 for(int i=0;i<list.size();i++){
	 	cell12 = row12.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("oilcount").toString());
	 	cell12.setCellValue(j);
	 }
	 HSSFRow row13 = sheet.createRow(13);
	 HSSFCell cell13 = row13.createCell(0);
	 cell13.setCellValue("");		 
	 cell13 = row13.createCell(1);
	 int alloil = (Integer)request.getAttribute("count");
	 cell13.setCellValue(alloil);		 
	 cell13 = row13.createCell(2);
	 cell13.setCellValue("月累");		 
	 cell13 = row13.createCell(3);
		int j13 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j13 += Integer.parseInt(rowfri.get("moilcount").toString());
		    }
	 cell13.setCellValue(j13);
	 for(int i=0;i<list.size();i++){
	 	cell13 = row13.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("moilcount").toString());
	 	cell13.setCellValue(j);
	 }
	//投保台次
	 HSSFRow row14 = sheet.createRow(14);
	 HSSFCell cell14 = row14.createCell(0);
	 cell14.setCellValue("投保台次");		 
	 cell14 = row14.createCell(1);
	 cell14.setCellValue("");		 
	 cell14 = row14.createCell(2);
	 cell14.setCellValue("当日");		 
	 cell14 = row14.createCell(3);
		int j14 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j14 += Integer.parseInt(rowfri.get("insurancecount").toString());
		    }
	 cell14.setCellValue(j14);
	 for(int i=0;i<list.size();i++){
	 	cell14 = row14.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("insurancecount").toString());
	 	cell14.setCellValue(j);
	 }
	 HSSFRow row15 = sheet.createRow(15);
	 HSSFCell cell15 = row15.createCell(0);
	 cell15.setCellValue("");		 
	 cell15 = row15.createCell(1);
	 cell15.setCellValue("");		 
	 cell15 = row15.createCell(2);
	 cell15.setCellValue("月累");		 
	 cell15 = row15.createCell(3);
		int j15 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j15 += Integer.parseInt(rowfri.get("minsurancecount").toString());
		    }
	 cell15.setCellValue(j15);
	 for(int i=0;i<list.size();i++){
	 	cell15 = row15.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("minsurancecount").toString());
	 	cell15.setCellValue(j);
	 }
	//精品金额
	 HSSFRow row16 = sheet.createRow(16);
	 HSSFCell cell16 = row16.createCell(0);
				
	 cell16.setCellValue("精品金额");		 
	 cell16 = row16.createCell(1);
	 cell16.setCellValue("");		 
	 cell16 = row16.createCell(2);
	 cell16.setCellValue("当日");		 
	 cell16 = row16.createCell(3);
	 float j16 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j16 += Float.parseFloat(rownum.get("partsmoney").toString());
	    }
	 cell16.setCellValue(j16);
	    for(int i=0;i<list.size();i++){
	    	cell16 = row16.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("partsmoney").toString());
	    	cell16.setCellValue(j);
	    }	
     HSSFRow row17 = sheet.createRow(17);
	 HSSFCell cell17 = row17.createCell(0);
				
	 cell17.setCellValue("");		 
	 cell17 = row17.createCell(1);
	 cell17.setCellValue("");		 
	 cell17 = row17.createCell(2);
	 cell17.setCellValue("月累");		 
	 cell17 = row17.createCell(3);
	 float j17 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j17 += Float.parseFloat(rownum.get("mpartsmoney").toString());
	    }
	 cell17.setCellValue(j17);
	    for(int i=0;i<list.size();i++){
	    	cell17 = row17.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("mpartsmoney").toString());
	    	cell17.setCellValue(j);
	    }	
	 //护养品金额
	 HSSFRow row18 = sheet.createRow(18);
	 HSSFCell cell18 = row18.createCell(0);
	 cell18.setCellValue("护养品金额");		 
	 cell18 = row18.createCell(1);
	 cell18.setCellValue("");		 
	 cell18 = row18.createCell(2);
	 cell18.setCellValue("当日");		 
	 cell18 = row18.createCell(3);
	 float j18 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j18 += Float.parseFloat(rownum.get("caremoney").toString());
	    }
	 cell18.setCellValue(j18);
	    for(int i=0;i<list.size();i++){
	    	cell18 = row18.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("caremoney").toString());
	    	cell18.setCellValue(j);
	    }
	 HSSFRow row19 = sheet.createRow(19);
	 HSSFCell cell19 = row19.createCell(0);
	 cell19.setCellValue("");		 
	 cell19 = row19.createCell(1);
	 cell19.setCellValue("");		 
	 cell19 = row19.createCell(2);
	 cell19.setCellValue("月累");		 
	 cell19 = row19.createCell(3);
	 float j19 = 0;
	    for(int i=0;i<list.size();i++){
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	j19 += Float.parseFloat(rownum.get("mcaremoney").toString());
	    }
	 cell19.setCellValue(j19);
	    for(int i=0;i<list.size();i++){
	    	cell19 = row19.createCell(i+4);
	    	SaturnData rownum = (SaturnData)list.get(i);
	    	float j = Float.parseFloat(rownum.get("mcaremoney").toString());
	    	cell19.setCellValue(j);
	    }
	//索赔台次
	HSSFRow row20 = sheet.createRow(20);
	 HSSFCell cell20 = row20.createCell(0);
	 cell20.setCellValue("索赔台次");		 
	 cell20 = row20.createCell(1);
	 cell20.setCellValue("");		 
	 cell20 = row20.createCell(2);
	 cell20.setCellValue("当日");		 
	 cell20 = row20.createCell(3);
		int j20 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j20 += Integer.parseInt(rowfri.get("factoryrepaircount").toString());
		    }
	 cell20.setCellValue(j20);
	 for(int i=0;i<list.size();i++){
	 	cell20 = row20.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("factoryrepaircount").toString());
	 	cell20.setCellValue(j);
	 }
	 HSSFRow row21 = sheet.createRow(21);
	 HSSFCell cell21 = row21.createCell(0);
	 cell21.setCellValue("");		 
	 cell21 = row21.createCell(1);
	 cell21.setCellValue("");		 
	 cell21 = row21.createCell(2);
	 cell21.setCellValue("月累");		 
	 cell21 = row21.createCell(3);
		int j21 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j21 += Integer.parseInt(rowfri.get("mfactoryrepaircount").toString());
		    }
	 cell21.setCellValue(j21);
	 for(int i=0;i<list.size();i++){
	 	cell21 = row21.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("mfactoryrepaircount").toString());
	 	cell21.setCellValue(j);
	 }
	//顾客投诉和解决
	HSSFRow row22 = sheet.createRow(22);
	 HSSFCell cell22 = row22.createCell(0);
	 cell22.setCellValue("顾客投诉");		 
	 cell22 = row22.createCell(1);
	 cell22.setCellValue("");		 
	 cell22 = row22.createCell(2);
	 cell22.setCellValue("当日");		 
	 cell22 = row22.createCell(3);
		int j22 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j22 += Integer.parseInt(rowfri.get("complaintsolve").toString());
		    }
	 cell22.setCellValue(j22);
	 for(int i=0;i<list.size();i++){
	 	cell22 = row22.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("complaintsolve").toString());
	 	cell22.setCellValue(j);
	 }
	 HSSFRow row23 = sheet.createRow(23);
	 HSSFCell cell23 = row23.createCell(0);
	 cell23.setCellValue("");		 
	 cell23 = row23.createCell(1);
	 cell23.setCellValue("");		 
	 cell23 = row23.createCell(2);
	 cell23.setCellValue("月累");		 
	 cell23 = row23.createCell(3);
		int j23 = 0;
		    for(int i=0;i<list.size();i++){
		    	SaturnData rowfri = (SaturnData)list.get(i);
		    	j23 += Integer.parseInt(rowfri.get("mcomplaintsolve").toString());
		    }
	 cell23.setCellValue(j23);
	 for(int i=0;i<list.size();i++){
	 	cell23 = row23.createCell(i+4);
	 	SaturnData rownum = (SaturnData)list.get(i);
	 	int j= Integer.parseInt(rownum.get("mcomplaintsolve").toString());
	 	cell23.setCellValue(j);
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