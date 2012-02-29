<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.io.PrintWriter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<style>
.dataDiv tr td{vertical-align: middle;}
.zongji{width:100px; line-height: 18px; text-align: center;}
.popname{width:70px; line-height: 18px; text-align: center;}
</style>
<script type="text/javascript">
function doSelect(){
	var value = document.getElementById("statisticdate").value;
	//var value = $('#statisticdate :input').val();
	if(value==''||value ==null){
		$('#sub').attr("disabled","disabled");
	}else{
		$('#sub').removeAttr("disabled");
	}
}

function findExcel(){
			$('#crmform')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/HondaFlowstatisticExcel.action";
			$('#crmform')[0].submit();
		}	
</script>
<%
	class FlowStatic {
		public String type;
		public int[] dayLevelStatic = new int[6]; //优，良，中，差，新，死档
		public int[] daySeriesStatic = new int[3]; //CIVIC, CR-V, SPIRIOR
		public int[] monthLevelStatic = new int[6]; //优，良，中，差，新，死档
		public int[] monthSeriesStatic = new int[3]; //CIVIC, CR-V, SPIRIOR
		
		public FlowStatic(String type) {
			this.type = type;
		}
		
		public void add(Map vo, String currentDay) {
			String level = (String)vo.get("carCardLevel");
			String series = (String)vo.get("carSeries");
			String servInTime = (String)vo.get("servInTime");
			
			if (servInTime.startsWith(currentDay)) {//日统计
				if (level != null && level.length() == 6) {
					int index = level.charAt(5) - '1';
					dayLevelStatic[index]++;
				}
				
				if (series != null && series.length() == 6) {
					int index = series.charAt(5) - '6';
					if (index >= 0 && index <= 2) {
						daySeriesStatic[index]++;
					}
				}
			}
			//月统计
			if (level != null && level.length() == 6) {
				int index = level.charAt(5) - '1';
				monthLevelStatic[index]++;
			}
			
			if (series != null && series.length() == 6) {
				int index = series.charAt(5) - '6';
				if (index >= 0 && index <= 2) {
					monthSeriesStatic[index]++;
				}
			}
		}
		
		public int getDaySum() {
			int sum = 0;
			for (int i = 0; i < dayLevelStatic.length; ++i) {
				sum += dayLevelStatic[i];
			}
			
			return sum;
		}
		
		public int getMonthSum() {
			int sum = 0;
			for (int i = 0; i < monthLevelStatic.length; ++i) {
				sum += monthLevelStatic[i];
			}
			
			return sum;
		}
		
		public void addCell(int value, HSSFRow row, int colNum, HSSFCellStyle cs) {
			HSSFCell cell = row.createCell(colNum);
			cell.setCellValue(value);	
			cell.setCellStyle(cs);
		}
		
		public void addCellStr(String value, HSSFRow row, int colNum, HSSFCellStyle cs) {
			HSSFCell cell = row.createCell(colNum);
			cell.setCellValue(value);	
			cell.setCellStyle(cs);
		}
		
		public void addRow(HSSFSheet sheet, int rowNum, int colNum, HSSFCellStyle cs) {
			HSSFRow row = sheet.createRow(rowNum);
				
			addCellStr(this.type, row, colNum++, cs);
			
			for (int i = 0; i < this.dayLevelStatic.length; ++i) {
				addCell(this.dayLevelStatic[i], row, colNum++, cs);
			}
			
			addCell(this.getDaySum(), row, colNum++, cs);
			
			for (int i = 0; i < this.daySeriesStatic.length; ++i) {
				addCell(this.daySeriesStatic[i], row, colNum++, cs);
			}
			
			for (int i = 0; i < this.monthLevelStatic.length; ++i) {
				addCell(this.monthLevelStatic[i], row, colNum++, cs);
			}
			
			addCell(this.getMonthSum(), row, colNum++, cs);
			
			for (int i = 0; i < this.monthSeriesStatic.length; ++i) {
				addCell(this.monthSeriesStatic[i], row, colNum++, cs);
			}
		}
		
		public void setCellValue(HSSFSheet sheet, int rowNum, int colNum, String value, HSSFCellStyle cs) {
			HSSFRow row = sheet.createRow(rowNum);
			HSSFCell cell = row.createCell(colNum);

			cell.setCellValue(value);
			cell.setCellStyle(cs);
		}
		
		public void setCellValue(HSSFRow row, int colNum, String value, HSSFCellStyle cs) {
			HSSFCell cell = row.createCell(colNum);

			cell.setCellValue(value);
			cell.setCellStyle(cs);
		}
		
		public void setRegonAndValue(HSSFSheet sheet, int row1, short col1, int row2, short col2, String value, HSSFCellStyle cs) {
			sheet.addMergedRegion(new Region(row1, col1,  row2, col2));
		}
 	}
	
	FlowStatic sum = new FlowStatic("总计");

	Map sourceMap = new HashMap();
	sourceMap.put("103001", new FlowStatic("自店"));//自店
	sourceMap.put("103002", new FlowStatic("它店"));//它店
	
	Map areaMap = new HashMap();
	areaMap.put("111001", new FlowStatic( "长春"));
	areaMap.put("111013", new FlowStatic( "松原"));
	areaMap.put("111009", new FlowStatic( "通化"));
	areaMap.put("111007", new FlowStatic( "四平"));
	areaMap.put("111011", new FlowStatic( "白城"));
	areaMap.put("111008", new FlowStatic( "辽源"));
	areaMap.put("111006", new FlowStatic( "吉林"));
	areaMap.put("111010", new FlowStatic( "白山"));
	areaMap.put("111012", new FlowStatic( "延吉"));
	areaMap.put("111014", new FlowStatic( "内蒙"));
	areaMap.put("111015", new FlowStatic( "辽宁"));
	areaMap.put("111016", new FlowStatic( "黑龙江"));
	areaMap.put("其他", new FlowStatic("其他"));
	
	List result = (List)request.getAttribute("result");
	List filter = new ArrayList();
	String statisticdate = (String)request.getAttribute("statisticdate");
	
	if (result != null) {
		String currentVin = null;
		String currentTime = null;
		for (int i = 0; i < result.size(); ++i) {
			Map vo = (Map) result.get(i);
			String carVin = (String)vo.get("carVin");
			String servInTime = ((String)vo.get("servInTime")).substring(0, 10);//2010-11-11
			
			if (currentVin == null || !currentVin.equals(carVin)) {
				filter.add(vo);
				currentTime = servInTime;
				currentVin = carVin;
			}
		}
		
		for (int i = 0; i < filter.size(); ++i) {
			Map vo = (Map) filter.get(i);
			
			sum.add(vo, statisticdate);
			
			String source = (String)vo.get("carSource");
			String area = (String)vo.get("carArea");
			
			FlowStatic sourceStatic = (FlowStatic)sourceMap.get(source);
			if (sourceStatic != null) {
				sourceStatic.add(vo, statisticdate);
			}
			
			FlowStatic areaStatic = (FlowStatic)areaMap.get(area);
			if (areaStatic != null) {
				areaStatic.add(vo, statisticdate);
			} else {
				((FlowStatic)areaMap.get("其他")).add(vo, statisticdate);
			}
		}
	}
	
	List areaList = new ArrayList();
	areaList.add(areaMap.get("111001"));
	areaList.add(areaMap.get("111013"));
	areaList.add(areaMap.get("111009"));
	areaList.add(areaMap.get("111007"));
	areaList.add(areaMap.get("111011"));
	areaList.add(areaMap.get("111008"));
	areaList.add(areaMap.get("111006"));
	areaList.add(areaMap.get("111010"));
	areaList.add(areaMap.get("111012"));
	areaList.add(areaMap.get("111014"));
	areaList.add(areaMap.get("111015"));
	areaList.add(areaMap.get("111016"));
	areaList.add(areaMap.get("其他"));
%>
<%
    String filename= request.getAttribute("statisticdate") + "售后车辆当日流量表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	sum.setRegonAndValue(sheet, 0,   (short)   1,  2,   (short)   2, "东本", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   3,  2,   (short)   3, "优", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   4,  2,   (short)   4, "良", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   5,  2,   (short)   5, "中", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   6,  2,   (short)   6, "差", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   7,  2,   (short)   7, "新", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   8,  2,   (short)   8, "死档", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   9,  1,   (short)   12, "小计", cs);
	
	sum.setRegonAndValue(sheet, 1,   (short)   13,  2,   (short)   13, "优", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   14,  2,   (short)   14, "良", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   15,  2,   (short)   15, "中", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   16,  2,   (short)   16, "差", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   17,  2,   (short)   17, "新", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   18,  2,   (short)   18, "死档", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   19,  1,   (short)   22, "小计", cs);
	
	sum.setRegonAndValue(sheet, 0,   (short)   3,  0,   (short)   12, "当日流量", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   13,  0,   (short)   22, "当月流量", cs);
	
	sum.setRegonAndValue(sheet, 3,   (short)   1,  3,   (short)   2, "东本", cs);
	sum.setRegonAndValue(sheet, 4,   (short)   1,  5,   (short)   1, "东本", cs);
	sum.setRegonAndValue(sheet, 6,   (short)   1,  18,   (short)   1, "东本", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   0,  18,   (short)   0, "东本", cs);
	

	HSSFRow row = sheet.createRow(0);
	sum.setCellValue(row,   (short)   3,  "当日流量", cs);
	sum.setCellValue(row,   (short)   13, "当月流量", cs);
	sum.setCellValue(row,   (short)   0,  "东本", cs);
	
	row = sheet.createRow(1);
	sum.setCellValue(row,   (short)   3,  "优", cs);
	sum.setCellValue(row,   (short)   4,  "良", cs);
	sum.setCellValue(row,   (short)   5,  "中", cs);
	sum.setCellValue(row,   (short)   6,  "差", cs);
	sum.setCellValue(row,   (short)   7,  "新", cs);
	sum.setCellValue(row,   (short)   8,  "死档", cs);
	sum.setCellValue(row,   (short)   9,  "小计", cs);
	
	sum.setCellValue(row,   (short)   13,  "优", cs);
	sum.setCellValue(row,   (short)   14,  "良", cs);
	sum.setCellValue(row,   (short)   15,  "中", cs);
	sum.setCellValue(row,   (short)   16,  "差", cs);
	sum.setCellValue(row,   (short)   17,  "新", cs);
	sum.setCellValue(row,   (short)   18,  "死档", cs);
	sum.setCellValue(row,   (short)   19,  "小计", cs);
	
	row = sheet.createRow(2);
	sum.setCellValue(row,   (short)   9,  "总台次", cs);
	sum.setCellValue(row,   (short)   10, "CIVIC", cs);
	sum.setCellValue(row,   (short)   11,  "CRV", cs);
	sum.setCellValue(row,   (short)   12,  "SPIRIOR", cs);
	
	sum.setCellValue(row,   (short)   19,  "总台次", cs);
	sum.setCellValue(row,   (short)   20, "CIVIC", cs);
	sum.setCellValue(row,   (short)   21,  "CRV", cs);
	sum.setCellValue(row,   (short)   22,  "SPIRIOR", cs);
	
	int rowNum = 3;
	int colNum = 2;
	sum.addRow(sheet, rowNum++, colNum, cs);		
		
	FlowStatic self = (FlowStatic)sourceMap.get("103001");
	self.addRow(sheet, rowNum++, colNum, cs);	
	
	FlowStatic other = (FlowStatic)sourceMap.get("103002");
	other.addRow(sheet, rowNum++, colNum, cs);	
	
	for (int i = 0; i < areaList.size(); ++i) {
		FlowStatic sub = (FlowStatic)areaList.get(i);
		sub.addRow(sheet, rowNum++, colNum, cs);	
	}

	sum.setCellValue(sheet.getRow(3),   (short)   1,  "当日/当月总计", cs);
	sum.setCellValue(sheet.getRow(4),   (short)   1,  "东本", cs);
	sum.setCellValue(sheet.getRow(6),   (short)   1,  "地区分布", cs);
	sum.setCellValue(sheet.getRow(4),   (short)   2,  "自店", cs);
	sum.setCellValue(sheet.getRow(5),   (short)   2,  "它店", cs);
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
