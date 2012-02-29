<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
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
    String filename= request.getAttribute("servintime") + "售后日报表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List result = (List)request.getAttribute("result");
	SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
	cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
	cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
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
	
	//保险样式
	HSSFCellStyle csIns =wb.createCellStyle();
	csIns.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	csIns.setBorderTop(HSSFCellStyle.BORDER_THIN);
	csIns.setBorderRight(HSSFCellStyle.BORDER_THIN);
	csIns.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	csIns.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	csIns.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	csIns.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
	csIns.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	csIns.setWrapText(true);

	//进项资金样式
	HSSFCellStyle csMoney =wb.createCellStyle();
	csMoney.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	csMoney.setBorderTop(HSSFCellStyle.BORDER_THIN);
	csMoney.setBorderRight(HSSFCellStyle.BORDER_THIN);
	csMoney.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	csMoney.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	csMoney.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	csMoney.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
	csMoney.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	csMoney.setWrapText(true);
	
	HSSFRow row = sheet.createRow(0);
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("序号");
	
	cell.setCellStyle(csH);
	cell = row.createCell(1);
	cell.setCellValue("来厂日期");
	cell.setCellStyle(csH);
	cell = row.createCell(2);
	cell.setCellValue("档案号");
	cell.setCellStyle(csH);
	cell = row.createCell(3);
	cell.setCellValue("车牌号");
	cell.setCellStyle(csH);
	cell = row.createCell(4);
	cell.setCellValue("车型");
	cell.setCellStyle(csH);
	cell = row.createCell(5);
	cell.setCellValue("用户类别");
	cell.setCellStyle(csH);
	cell = row.createCell(6);
	cell.setCellValue("来厂时间");
	cell.setCellStyle(csH);
	cell = row.createCell(7);
	cell.setCellValue("修理单号");
	cell.setCellStyle(csH);
	cell = row.createCell(8);
	cell.setCellValue("交车时间");
	cell.setCellStyle(csH);
	cell = row.createCell(9);
	cell.setCellValue("维修类型");
	cell.setCellStyle(csH);
	cell = row.createCell(10);
	cell.setCellValue("分布区域");
	cell.setCellStyle(csH);
	cell = row.createCell(11);
	cell.setCellValue("用户级别");
	cell.setCellStyle(csH);
	cell = row.createCell(12);
	cell.setCellValue("接待人员");
	cell.setCellStyle(csH);
	cell = row.createCell(13);
	cell.setCellValue("维修人员");
	cell.setCellStyle(csH);
	cell = row.createCell(14);
	cell.setCellValue("零部件费");
	cell.setCellStyle(csH);
	cell = row.createCell(15);
	cell.setCellValue("零部件会员折扣");
	cell.setCellStyle(csH);
	cell = row.createCell(16);
	cell.setCellValue("零部件折扣");
	cell.setCellStyle(csH);
	cell = row.createCell(17);
	cell.setCellValue("工时费");
	cell.setCellStyle(csH);
	cell = row.createCell(18);
	cell.setCellValue("工时会员折扣");
	cell.setCellStyle(csH);
	cell = row.createCell(19);
	cell.setCellValue("工时会员免费");
	cell.setCellStyle(csH);
	cell = row.createCell(20);
	cell.setCellValue("工时折扣");
	cell.setCellStyle(csH);
	cell = row.createCell(21);
	cell.setCellValue("代金券");
	cell.setCellStyle(csH);
	cell = row.createCell(22);
	cell.setCellValue("保险零件");
	cell.setCellStyle(csH);
	cell = row.createCell(23);
	cell.setCellValue("保险零件折扣");
	cell.setCellStyle(csH);
	cell = row.createCell(24);
	cell.setCellValue("保险工时");
	cell.setCellStyle(csH);
	//cell = row.createCell(25);
	//cell.setCellValue("保险零件会员折扣");
	//cell.setCellStyle(csH);
	cell = row.createCell(25);
	cell.setCellValue("保险工时折扣");
	cell.setCellStyle(csH);
	//cell = row.createCell(27);
	//cell.setCellValue("保险工时会员折扣");
	//cell.setCellStyle(csH);
	cell = row.createCell(26);
	cell.setCellValue("维修费用合计");
	cell.setCellStyle(csH);
	cell = row.createCell(27);
	cell.setCellValue("备注");
	cell.setCellStyle(csH);
	
	LinkedList clearResult = new LinkedList();
	if (result!=null&&!result.isEmpty()) {
		SaturnData data = (SaturnData)result.get(0);
		Map dataMap = new HashMap(data);
		
		if ("112003".equals(data.get("servtype")+"")) {
			dataMap.put("in_servpartsexp", data.get("servpartsexp"));
			dataMap.put("in_servhoursexp", data.get("servhoursexp"));
			dataMap.put("in_servpartsreb", data.get("servpartsreb"));
			dataMap.put("in_servhoursreb", data.get("servhoursreb"));
			dataMap.put("in_servHoursMembReb", data.get("servHoursMembReb"));
			dataMap.put("in_servPartsMembReb", data.get("servPartsMembReb"));
			dataMap.put("servpartsexp", "0");
			dataMap.put("servhoursexp", "0");
			dataMap.put("servpartsreb", "0");
			dataMap.put("servhoursreb", "0");
			dataMap.put("servHoursMembReb", "0");
			dataMap.put("servPartsMembReb", "0");
		} else {
			//else为jyb加的
			dataMap.put("in_servpartsexp", "0");
			dataMap.put("in_servhoursexp", "0");
			dataMap.put("in_servpartsreb", "0");
			dataMap.put("in_servhoursreb", "0");
			dataMap.put("in_servHoursMembReb", "0");
			dataMap.put("in_servPartsMembReb", "0");
		}
		clearResult.add(dataMap);
		
	}
	for (int i = 1; i < result.size(); ++i) {
		SaturnData data = (SaturnData)result.get(i);
		Map dataMap = new HashMap(data);
		String servOrderId = dataMap.get("servorderid") + "";
		
		if ("112003".equals(dataMap.get("servtype")+"")) {
			String[] keys = {
					"servpartsexp",	
					"servhoursexp",
					"servHoursMembReb",
					"servpartsreb",
					"servhoursreb",
					"servPartsMembReb"
			};
			
			for (int j = 0; j < keys.length; ++j) {
				try {
					double value = Double.parseDouble(dataMap.get(keys[j]) + "");
					dataMap.put("in_" + keys[j], value+"");
				} catch (Exception e) {
				}
				
				dataMap.put(keys[j], "0");
			}
		} else {
			//else为jyb加的
			dataMap.put("in_servpartsexp", "0");
			dataMap.put("in_servhoursexp", "0");
			dataMap.put("in_servpartsreb", "0");
			dataMap.put("in_servhoursreb", "0");
			dataMap.put("in_servHoursMembReb", "0");
			dataMap.put("in_servPartsMembReb", "0");
		}
		
		Map lastData = (Map)clearResult.getLast();
		String lastServOrderId = lastData.get("servorderid") + "";
		if (servOrderId.equals(lastServOrderId)) {
			//String[] keys = {
			//		"servhoursexp", "servhoursreb", "servHoursMembReb", "servpartsexp", "servpartsreb", "servPartsMembReb", "servinsureexp", "servticketexp"
			//};
			//keys jyb 修改过
			String[] keys = {
					"servhoursexp", "servhoursreb", "servHoursMembReb", "servpartsexp", "servpartsreb", "servPartsMembReb", "servinsureexp", "servticketexp"
					, "in_servpartsexp", "in_servhoursexp", "in_servpartsreb", "in_servhoursreb", "in_servHoursMembReb", "in_servPartsMembReb"
			};
			
			for (int j = 0; j < keys.length; ++j) {
				try {
					double value = Double.parseDouble(dataMap.get(keys[j]) + "");
					double lastValue = Double.parseDouble(lastData.get(keys[j]) + "");
					dataMap.put(keys[j], lastValue + value + "");
				} catch (Exception e) {
				}
			}
			
			clearResult.remove(lastData);
		} 
		
		dataMap.put("saturnData", data);
		clearResult.add(dataMap);
	}
	
	int j=0;
	float sumz=0;
	double servpartsexpSum = 0;//14
	double servpartsmembrebSum = 0;//15
	double servpartsrebSum = 0;//15;
	double servhoursexpSum = 0;//17;
	double servhoursmembrebSum = 0;//19;
	double servhoursrebSum = 0;//18;
	double servticketexpSum = 0;//21;
	
	double in_servinsureexpSum = 0;//22;
	double in_servhoursexp = 0;//23;
	double in_servpartsreb = 0;//24;
	double in_servpartsmembrebSum = 0;//25;
	double in_servhoursreb = 0;//26;
	double in_servhoursmembrebSum = 0;//27;
	
	//1;
	for(int i=1; i<= clearResult.size();i++){
		HSSFRow rowi = sheet.createRow(i);
		HSSFCell cellj = rowi.createCell(0);
		Map numcell = (Map)clearResult.get(i-1);
		
		//String serviceid = numcell.get("serviceid").toString();
		//if(serviceid!= null && serviceid!= "")
		//{
			cellj.setCellValue(i);
		//}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(1);
		if(numcell.get("servintime")!= null && numcell.get("servintime")!= "")
		{
			cellj.setCellValue(numcell.get("servintime").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(2);
		if(numcell.get("carcardid")!= null && numcell.get("carcardid")!= "")
		{
			cellj.setCellValue(numcell.get("carcardid").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(3);
		if(numcell.get("carlicenceno")!= null && numcell.get("carlicenceno")!= "")
		{
			cellj.setCellValue(numcell.get("carlicenceno").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(4);
		if(numcell.get("carvin")!= null && numcell.get("carvin")!= "")
		{
			cellj.setCellValue(numcell.get("carvin").toString());
		}
		cellj.setCellStyle(cs);
		
		//carusertype
		cellj = rowi.createCell(5);
		if(numcell.get("servusertype")!= null && numcell.get("servusertype")!= "")
		{
			try{
				String carusertype = inst.getDataDictItemInfo("crm_carUserType",numcell.get("servusertype")+"").getValue();
				cellj.setCellValue(carusertype);
			}catch(Exception e){
				String carusertype = numcell.get("servusertype")!=null?numcell.get("servusertype")+"":"";
				cellj.setCellValue(carusertype);
			}
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(6);
		if(numcell.get("servintime1")!= null && numcell.get("servintime1")!= "")
		{
			cellj.setCellValue(numcell.get("servintime1").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(7);
		if(numcell.get("servorderid")!= null && numcell.get("servorderid")!= "")
		{
			cellj.setCellValue(numcell.get("servorderid").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(8);
		if(numcell.get("servouttime")!= null && numcell.get("servouttime")!= "")
		{
			cellj.setCellValue(numcell.get("servouttime").toString());
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(9);//维修类型
		String servtype_temp="";
		//System.out.println("alltype:" + numcell.get("alltype"));
		if(numcell.get("alltype")!= null && numcell.get("alltype")!= "")
		{
			servtype_temp=numcell.get("alltype")+"";
			
			String servtype = inst.getDataDictItemInfo("crm_serviceType",servtype_temp)!=null?
					inst.getDataDictItemInfo("crm_serviceType",servtype_temp).getValue():numcell.get("alltype")+"";
					
		//	System.out.println("##"+servtype_temp+",RRR" + servtype);
			cellj.setCellValue(servtype);
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(10);
		if(numcell.get("cararea")!= null && numcell.get("cararea")!= "")
		{
			try{
				String cararea = inst.getDataDictItemInfo("crm_carArea",numcell.get("cararea")+"").getValue();
				cellj.setCellValue(cararea);
			}catch(Exception e){
				String cararea = numcell.get("cararea")!=null?numcell.get("cararea")+"":"";
				cellj.setCellValue(cararea);
			}
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(11);
		if(numcell.get("carcardlevel")!= null && numcell.get("carcardlevel")!= "")
		{
			try{
				String carcardlevel = inst.getDataDictItemInfo("crm_cardLevel",numcell.get("carcardlevel")+"").getValue();
				cellj.setCellValue(carcardlevel);
			}catch(Exception e){
				String carcardlevel = numcell.get("cararea")!=null?numcell.get("carcardlevel")+"":"";
				cellj.setCellValue(carcardlevel);
			}
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(12);
		if(numcell.get("servstaff")!= null && numcell.get("servstaff")!= "")
		{
			try{
				String servstaff = inst.getDataDictItemInfo("crm_waiter",numcell.get("servstaff")+"").getValue();
				cellj.setCellValue(servstaff);
			}catch(Exception e){
				String servstaff = numcell.get("servstaff")!=null?numcell.get("servstaff")+"":"";
				cellj.setCellValue(servstaff);
			}
		}
		cellj.setCellStyle(cs);
		
		cellj = rowi.createCell(13);
		Object servmetalworker = numcell.get("servmetalworker");//板筋
		Object servpaintworker = numcell.get("servpaintworker");//喷漆
		Object servelecworker = numcell.get("servelecworker");//机电
		
		StringBuffer worker = new StringBuffer();
		if(servmetalworker != null && servmetalworker!= "") {
			try{
				worker.append("钣金:" + inst.getDataDictItemInfo("crm_worker",servmetalworker.toString()).getValue() + ";");
			}catch(Exception e){
				worker.append("钣金:" + servmetalworker.toString() + ";");
			}
		}
		if(servpaintworker != null && servpaintworker!= "") {
			try{
				worker.append("喷漆:" + inst.getDataDictItemInfo("crm_worker",servpaintworker.toString()).getValue() + ";");
			}catch(Exception e){
				worker.append("喷漆:" + servpaintworker.toString() + ";");
			}
		}
		if(servelecworker != null && servelecworker!= "") {
			try{
				worker.append("机电:" + inst.getDataDictItemInfo("crm_worker",servelecworker.toString()).getValue() + ";");
			}catch(Exception e){
				worker.append("机电:" + servelecworker.toString() + ";");
			}
		}
		cellj.setCellValue(worker.toString());
		cellj.setCellStyle(cs);
			
//保险相关
		//保险零件费
		cellj = rowi.createCell(22);
		cellj.setCellValue(0);
		if(numcell.get("in_servpartsexp")!= null && numcell.get("in_servpartsexp")!= "")
		{
			//cellj.setCellValue(numcell.get("servpartsexp").toString());
			try {
				double servpartsexp = Double.parseDouble(numcell.get("in_servpartsexp").toString());
				in_servinsureexpSum += servpartsexp;
				cellj.setCellValue(servpartsexp);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csMoney);
		//保险工时费
		cellj = rowi.createCell(24);
		cellj.setCellValue(0);
		if(numcell.get("in_servhoursexp")!= null && numcell.get("in_servhoursexp")!= "")
		{
		//	cellj.setCellValue(numcell.get("servhoursexp").toString());
			double servhoursexp = Double.parseDouble(numcell.get("in_servhoursexp").toString());
			try {
				cellj.setCellValue(servhoursexp);
				in_servhoursexp += servhoursexp;
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csMoney);
		//保险零折扣件费
		cellj = rowi.createCell(23);
		cellj.setCellValue(0);
		if(numcell.get("in_servpartsreb")!= null && numcell.get("in_servpartsreb")!= "")
		{
			//cellj.setCellValue(numcell.get("servpartsreb").toString());
			double servpartsreb = Double.parseDouble(numcell.get("in_servpartsreb").toString());
			try {
				cellj.setCellValue(servpartsreb);
				in_servpartsreb += servpartsreb;
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		
		cellj.setCellStyle(csIns);
		//cellj = rowi.createCell(25);
		//cellj.setCellValue(0);
		//if(numcell.get("in_servPartsMembReb")!= null && numcell.get("in_servPartsMembReb")!= "")
		//{
			//--cellj.setCellValue(numcell.get("servpartsmembreb").toString());
		//	try {
		//		double servpartsmembreb = Double.parseDouble(numcell.get("in_servPartsMembReb").toString());
		//		in_servpartsmembrebSum += servpartsmembreb;
		//		cellj.setCellValue(servpartsmembreb);
		//	} catch (Exception e) {
		//		cellj.setCellValue(0.0d);
		//	}
		//}
		//cellj.setCellStyle(csIns);
			
		//保险工时扣件费
		cellj = rowi.createCell(25);
		cellj.setCellValue(0);
		if(numcell.get("in_servhoursreb")!= null && numcell.get("in_servhoursreb")!= "")
		{
			//cellj.setCellValue(numcell.get("servhoursreb").toString());
			double servhoursreb = Double.parseDouble(numcell.get("in_servhoursreb").toString());
			try {
				cellj.setCellValue(servhoursreb);
				in_servhoursreb += servhoursreb;
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csIns);
		
		//cellj = rowi.createCell(27);
		//cellj.setCellValue(0);
		//if(numcell.get("in_servHoursMembReb")!= null && numcell.get("in_servHoursMembReb")!= "")
		//{
		//---	cellj.setCellValue(numcell.get("servhoursmembreb").toString());
		//	try {	
		//		double servhoursmembreb = Double.parseDouble(numcell.get("in_servHoursMembReb").toString());
		//		in_servhoursmembrebSum += servhoursmembreb;
		//		cellj.setCellValue(servhoursmembreb);
		//	} catch (Exception e) {
		//		cellj.setCellValue(0.0d);
		//	}
		//}
		//cellj.setCellStyle(csIns);
//保险相关结束
	//	}else{
			//零件费
		cellj = rowi.createCell(14);
		cellj.setCellValue(0);
		if(numcell.get("servpartsexp")!= null && numcell.get("servpartsexp")!= "")
		{
			//cellj.setCellValue(numcell.get("servpartsexp").toString());
			try {
				double servpartsexp = Double.parseDouble(numcell.get("servpartsexp").toString());
				servpartsexpSum += servpartsexp;
			
				cellj.setCellValue(servpartsexp);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csMoney);
		//零件会员折扣
		cellj = rowi.createCell(15);
		cellj.setCellValue(0);
		if(numcell.get("servPartsMembReb")!= null && numcell.get("servPartsMembReb")!= "")
		{
			//cellj.setCellValue(numcell.get("servpartsmembreb").toString());
			try {
				double servpartsmembreb = Double.parseDouble(numcell.get("servPartsMembReb").toString());
				servpartsmembrebSum += servpartsmembreb;
				cellj.setCellValue(servpartsmembreb);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csIns);
		//零件折扣
		cellj = rowi.createCell(16);
		cellj.setCellValue(0);
		if(numcell.get("servpartsreb")!= null && numcell.get("servpartsreb")!= "")
		{
		//	cellj.setCellValue(numcell.get("servpartsreb").toString());
			try {	
				double servpartsreb = Double.parseDouble(numcell.get("servpartsreb").toString());
				servpartsrebSum += servpartsreb;
				cellj.setCellValue(servpartsreb);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csIns);
		//工时费
		cellj = rowi.createCell(17);
		cellj.setCellValue(0);
		if(numcell.get("servhoursexp")!= null && numcell.get("servhoursexp")!= "")
		{
			//cellj.setCellValue(numcell.get("servhoursexp").toString());
			try {	
				double servhoursexp = Double.parseDouble(numcell.get("servhoursexp").toString());
				servhoursexpSum += servhoursexp;
				cellj.setCellValue(servhoursexp);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csMoney);
		//工时会员折扣
		cellj = rowi.createCell(18);
		cellj.setCellValue(0);
		if(numcell.get("servHoursMembReb")!= null && numcell.get("servHoursMembReb")!= "")
		{
		//	cellj.setCellValue(numcell.get("servhoursmembreb").toString());
			try {	
				double servhoursmembreb = Double.parseDouble(numcell.get("servHoursMembReb").toString());
				servhoursmembrebSum += servhoursmembreb;
				cellj.setCellValue(servhoursmembreb);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csIns);
		
		cellj = rowi.createCell(19);
			cellj.setCellValue(" ");
			cellj.setCellStyle(cs);
		//工时折扣
		cellj = rowi.createCell(20);
		cellj.setCellValue(0);
		if(numcell.get("servhoursreb")!= null && numcell.get("servhoursreb")!= "")
		{
			//cellj.setCellValue(numcell.get("servhoursreb").toString());
			try {	
				double servhoursreb = Double.parseDouble(numcell.get("servhoursreb").toString());
				servhoursrebSum += servhoursreb;
				cellj.setCellValue(servhoursreb);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(csIns);
		cellj = rowi.createCell(21);
		cellj.setCellValue(0);
		if(numcell.get("servticketexp")!= null && numcell.get("servticketexp")!= "")
		{
		//	cellj.setCellValue(numcell.get("servticketexp").toString());
			try {
				double servticketexp = Double.parseDouble(numcell.get("servticketexp").toString());
				servticketexpSum += servticketexp;
				cellj.setCellValue(servticketexp);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(cs);
		
		//}
		
		
		
		
		cellj = rowi.createCell(26);//总计
		if(numcell.get("servamountexp")!= null && numcell.get("servamountexp")!= "")
		{
		//	cellj.setCellValue(numcell.get("servamountexp").toString());
			double servamountexp = Double.parseDouble(numcell.get("servamountexp").toString());
			try {
				cellj.setCellValue(servamountexp);
			} catch (Exception e) {
				cellj.setCellValue(0.0d);
			}
		}
		cellj.setCellStyle(cs);
		//备注
		cellj = rowi.createCell(27);
		if(numcell.get("servnotes")!= null && numcell.get("servnotes")!= "")
		{
			cellj.setCellValue(numcell.get("servnotes").toString());
		}else{
			cellj.setCellValue(" ");
		}
		cellj.setCellStyle(cs);
		j=i+1;
		try{
			sumz=sumz+Float.parseFloat(numcell.get("servamountexp").toString());
		}catch(Exception e){
			
		}
		
	}
	HSSFRow rowi = sheet.createRow(j);
	
	HSSFCell cellj = rowi.createCell(0);
	cellj.setCellValue("总计");
	cellj.setCellStyle(csH);
	
	cellj = rowi.createCell(1);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);
	
	cellj = rowi.createCell(2);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(3);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(4);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(5);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(6);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(7);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(8);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(9);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(10);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(11);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(12);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(13);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(14);
	cellj.setCellValue(servpartsexpSum);
	cellj.setCellStyle(csMoney);

	cellj = rowi.createCell(15);
	cellj.setCellValue(servpartsmembrebSum);
	cellj.setCellStyle(csIns);

	cellj = rowi.createCell(16);
	cellj.setCellValue(servpartsrebSum);
	cellj.setCellStyle(csIns);

	cellj = rowi.createCell(17);
	cellj.setCellValue(servhoursexpSum);
	cellj.setCellStyle(csMoney);

	cellj = rowi.createCell(18);
	cellj.setCellValue(servhoursmembrebSum);
	cellj.setCellStyle(csIns);

	cellj = rowi.createCell(19);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);

	cellj = rowi.createCell(20);
	cellj.setCellValue(servhoursrebSum);
	cellj.setCellStyle(csIns);

	cellj = rowi.createCell(21);
	cellj.setCellValue(servticketexpSum);
	cellj.setCellStyle(csH);
	
	cellj = rowi.createCell(22);
	cellj.setCellValue(in_servinsureexpSum);
	cellj.setCellStyle(csMoney);

	cellj = rowi.createCell(24);
	cellj.setCellValue(in_servhoursexp);
	cellj.setCellStyle(csMoney);
	
	cellj = rowi.createCell(23);
	cellj.setCellValue(in_servpartsreb);
	cellj.setCellStyle(csIns);
	

	//cellj = rowi.createCell(25);
	//cellj.setCellValue(in_servpartsmembrebSum);
	//cellj.setCellStyle(csIns);
	
	cellj = rowi.createCell(25);
	cellj.setCellValue(in_servhoursreb);
	cellj.setCellStyle(csIns);
	
	//cellj = rowi.createCell(27);
	//cellj.setCellValue(in_servhoursmembrebSum);
	//cellj.setCellStyle(csIns);
	
	cellj = rowi.createCell(26);
	cellj.setCellValue(sumz);
	cellj.setCellStyle(csH);
	
	cellj = rowi.createCell(27);
	cellj.setCellValue(" ");
	cellj.setCellStyle(csH);
	
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