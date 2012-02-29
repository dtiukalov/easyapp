<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="java.io.OutputStream"%>
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
			$('#crmform')[0].action = "${pageContext.request.contextPath}/crm::/reportModule/action/ProfitdiffusionAreaExcel.action";
			$('#crmform')[0].submit();
		}	
</script>
<%
	class FlowStatic {
		public String type;

		public int[] dayNumStatic = new int[5]; //CIVIC, CR-V, SPIRIOR, 其他, 总计
		public int[] monthNumStatic = new int[5]; //CIVIC, CR-V, SPIRIOR, 其他, 总计
		public int[] monthAreaStatic = new int[14]; //长春、松原、通化、四平、白城、辽源、吉林、白山、延吉、内蒙、辽宁、黑龙江、其他,非长春总计
		
		public FlowStatic(String type) {
			this.type = type;
		}
		
		public void add(Map vo, String currentDay) {
			String level = (String)vo.get("carCardLevel");
			String series = (String)vo.get("carSeries");
			String servInTime = (String)vo.get("servInTime");
			String servType = (String)vo.get("servType");
			String carArea = (String)vo.get("carArea");
			
			if (servInTime.startsWith(currentDay)) {//日统计
				if (series != null && series.length() == 6) {
					int index = series.charAt(5) - '6';
					if (index >= 0 && index <= 2) {
						dayNumStatic[index]++;
					} else {
						dayNumStatic[3]++;
					}
					
					dayNumStatic[4]++;
				}
			}
			//月统计
			if (series != null && series.length() == 6) {
				int index = series.charAt(5) - '6';
				if (index >= 0 && index <= 2) {
					monthNumStatic[index]++;
				} else {
					monthNumStatic[3]++;
				}
				
				monthNumStatic[4]++;
			}
			
			if (carArea != null) {
				if("111001".equals(carArea)) { monthAreaStatic[0]++;} else
				if("111013".equals(carArea)) { monthAreaStatic[1]++;} else
				if("111009".equals(carArea)) { monthAreaStatic[2]++;} else
				if("111007".equals(carArea)) { monthAreaStatic[3]++;} else
				if("111011".equals(carArea)) { monthAreaStatic[4]++;} else
				if("111008".equals(carArea)) { monthAreaStatic[5]++;} else
				if("111006".equals(carArea)) { monthAreaStatic[6]++;} else
				if("111010".equals(carArea)) { monthAreaStatic[7]++;} else
				if("111012".equals(carArea)) { monthAreaStatic[8]++;} else
				if("111014".equals(carArea)) { monthAreaStatic[9]++;} else
				if("111015".equals(carArea)) { monthAreaStatic[10]++;} else
				if("111016".equals(carArea)) { monthAreaStatic[11]++;} else {
					monthAreaStatic[12]++;
				}
				
				if (!"111001".equals(carArea)) {
					monthAreaStatic[13]++;
				}
			}
		}
		
		public int getDaySum(int type) {
			int sum = 0;
			for (int i = 0; i < dayNumStatic.length; ++i) {
				sum += dayNumStatic[i];
			}
			
			return sum;
		}
		
		public int getMonthSum(int type) {
			int sum = 0;
			for (int i = 0; i < monthNumStatic.length; ++i) {
				sum += monthNumStatic[i];
			}
			
			return sum;
		}
		
		public void addCell(int value, HSSFRow row, int colNum, HSSFCellStyle cs) {
			HSSFCell cell = row.createCell(colNum);
			cell.setCellValue(value);	
			cell.setCellStyle(cs);
		}
		
		public void addCell(float value, HSSFRow row, int colNum, HSSFCellStyle cs) {
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
			
			addCell(this.dayNumStatic[4], row, colNum++, cs);
			addCell(this.monthNumStatic[4], row, colNum++, cs);
			
			for (int j = 0; j < 4; ++j) {
				addCell(this.dayNumStatic[j], row, colNum++, cs);
				addCell(this.monthNumStatic[j], row, colNum++, cs);
			}
			
			for (int j = 0; j < 13; ++j) {
				addCell(this.monthAreaStatic[j], row, colNum++, cs);
			}
			
			addCell(this.monthAreaStatic[0], row, colNum++, cs);
			addCell(this.monthAreaStatic[13], row, colNum++, cs);
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
	sourceMap.put("103001", new FlowStatic("103001"));//自店
	sourceMap.put("103002", new FlowStatic("103002"));//它店
	
	Map areaMap = new HashMap();
	areaMap.put("<8", new FlowStatic( "8点之前"));
	areaMap.put("08", new FlowStatic( "8-9点"));
	areaMap.put("09", new FlowStatic( "9-10点"));
	areaMap.put("10", new FlowStatic( "10-11点"));
	areaMap.put("11", new FlowStatic( "11-12点"));
	areaMap.put("12", new FlowStatic( "12-13点"));
	areaMap.put("13", new FlowStatic( "13-14点"));
	areaMap.put("14", new FlowStatic( "14-15点"));
	areaMap.put("15", new FlowStatic( "15-16点"));
	areaMap.put("16", new FlowStatic( "16-17点"));
	areaMap.put(">17", new FlowStatic( "17点之后"));
	
	List result = (List)request.getAttribute("result_time");
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
			
			String servInTime = ((String)vo.get("servInTime")).substring(11, 13);
			sum.add(vo, statisticdate);
			
			FlowStatic areaStatic = (FlowStatic)areaMap.get(servInTime);
			if (areaStatic != null) {
				areaStatic.add(vo, statisticdate);
			} else {
				if (servInTime.compareTo("08") <= 0) {
					((FlowStatic)areaMap.get("<8")).add(vo, statisticdate);
				} else if (servInTime.compareTo("17") >= 0) {
					((FlowStatic)areaMap.get(">17")).add(vo, statisticdate);
				}
			}
		}
	}
	
	List areaList = new ArrayList();
	areaList.add(areaMap.get("<8"));
	areaList.add(areaMap.get("08"));
	areaList.add(areaMap.get("09"));
	areaList.add(areaMap.get("10"));
	areaList.add(areaMap.get("11"));
	areaList.add(areaMap.get("12"));
	areaList.add(areaMap.get("13"));
	areaList.add(areaMap.get("14"));
	areaList.add(areaMap.get("15"));
	areaList.add(areaMap.get("16"));
	areaList.add(areaMap.get(">17"));
%>
<title>售后效益统计--时间分布</title>
<%
    String filename= request.getAttribute("statisticdate") + "售后效益统计表(时间分布)";
    filename = new String(filename.getBytes(),"iso8859-1");
	List resultmonth=(List)request.getAttribute("result_time");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	sum.setRegonAndValue(sheet, 0,   (short)   0,  12,   (short)   0, "时间分布", cs);
	
	sum.setRegonAndValue(sheet, 0,   (short)   1,  1,   (short)   1, "", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   2,  0,   (short)   3, "小计", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   4,  0,   (short)   5, "CIVIC", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   6,  0,   (short)   7, "CRV", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   8,  0,   (short)   9, "SPIRIOR", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   10,  0,   (short)   11, "其他", cs);
	
	sum.setRegonAndValue(sheet, 0,   (short)   12,  0,   (short)   24, "地区分布（累计）", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   25,  0,   (short)   26, "总计", cs);
	
	
	HSSFRow row = sheet.createRow(0);
	sum.setCellValue(row,   (short)   0,  "时间分布", cs);
	sum.setCellValue(row,   (short)   2,  "小计", cs);
	sum.setCellValue(row,   (short)   4,  "CIVIC", cs);
	sum.setCellValue(row,   (short)   6,  "CRV", cs);
	sum.setCellValue(row,   (short)   8,  "SPIRIOR", cs);
	sum.setCellValue(row,   (short)   10,  "其他", cs);
	
	sum.setCellValue(row,   (short)   12, "地区分布（累计）", cs);
	sum.setCellValue(row,   (short)   25,  "总计", cs);
	
	row = sheet.createRow(1);
	for (int i = 0; i < 5; ++i) {
		sum.setCellValue(row,   (short)   (2+i*2),  "当日", cs);
		sum.setCellValue(row,   (short)   (3+i*2),  "累计", cs);
	}
	
	sum.setCellValue(row,   (short)   12,  "长春", cs);
	sum.setCellValue(row,   (short)   13,  "松原", cs);
	sum.setCellValue(row,   (short)   14,  "通化", cs);
	sum.setCellValue(row,   (short)   15,  "四平", cs);
	sum.setCellValue(row,   (short)   16,  "白城", cs);
	sum.setCellValue(row,   (short)   17,  "辽源", cs);
	sum.setCellValue(row,   (short)   18,  "吉林", cs);
	sum.setCellValue(row,   (short)   19,  "白山", cs);
	sum.setCellValue(row,   (short)   20,  "延吉", cs);
	sum.setCellValue(row,   (short)   21,  "内蒙", cs);
	sum.setCellValue(row,   (short)   22,  "辽宁", cs);
	sum.setCellValue(row,   (short)   23,  "黑龙江", cs);
	sum.setCellValue(row,   (short)   24,  "其他", cs);
	
	sum.setCellValue(row,   (short)   25,  "长春", cs);
	sum.setCellValue(row,   (short)   26,  "其他", cs);
	
	
	int rowNum = 2;
	int colNum = 1;
	
	for (int i = 0; i < areaList.size(); ++i) {
		
		FlowStatic sub = (FlowStatic)areaList.get(i);
		sub.addRow(sheet, rowNum++, colNum, cs);	
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