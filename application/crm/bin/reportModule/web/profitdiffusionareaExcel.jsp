<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="java.io.OutputStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>

<style>
.dataDiv tr td {
	vertical-align: middle;
}

.zongji {
	width: 100px;
	line-height: 18px;
	text-align: center;
}

.popname {
	width: 70px;
	line-height: 18px;
	text-align: center;
}
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
		
		//0：正常, 1:保险
		public int[][] dayNumStatic = new int[2][6]; //CIVIC, CR-V, SPIRIOR, 广本, 其他, 总计
		public float[][] dayMoneyStatic = new float[2][6]; //CIVIC, CR-V, SPIRIOR, 广本, 其他, 总计
		public int[][] monthNumStatic = new int[2][6]; //CIVIC, CR-V, SPIRIOR, 广本, 其他, 总计
		public float[][] monthMoneyStatic = new float[2][6]; //CIVIC, CR-V, SPIRIOR, 广本, 其他, 总计
		
		public FlowStatic(String type) {
			this.type = type;
		}
		
		public void add(Map vo, String currentDay) {
			String level = (String)vo.get("carCardLevel");
			String series = (String)vo.get("carSeries");
			String servOutTime = (String)vo.get("servOutTime");
			String servType = (String)vo.get("servType");
			float smoney = ((Float)vo.get("servAmountExp")).floatValue();
			
			int type = 0;//0：正常, 1:保险
			if ("112011".equals(servType)) {
				type = 1;
			}
			
			if (servOutTime.startsWith(currentDay)) {//日统计
				if (series != null && series.length() == 6) {
					int index = series.charAt(5) - '6';
					if (index >= 0 && index <= 2) {
						dayNumStatic[type][index]++;
						dayMoneyStatic[type][index] += smoney;
					} else if (index == -4) {
						dayNumStatic[type][3]++;
						dayMoneyStatic[type][3] += smoney;
					} else {
						dayNumStatic[type][4]++;
						dayMoneyStatic[type][4] += smoney;
					}
					
					//dayNumStatic[type][5]++;
					//dayMoneyStatic[type][5] += smoney;
				}
			}
			//月统计
			if (series != null && series.length() == 6) {
				int index = series.charAt(5) - '6';
				if (index >= 0 && index <= 2) {
					monthNumStatic[type][index]++;
					monthMoneyStatic[type][index] += smoney;
				} else if (index == -4) {
					monthNumStatic[type][3]++;
					monthMoneyStatic[type][3] += smoney;
				} else {
					monthNumStatic[type][4]++;
					monthMoneyStatic[type][4] += smoney;
				}
				//monthNumStatic[type][5]++;
				//monthMoneyStatic[type][5] += smoney;
			}
			
			monthNumStatic[0][5]++;
			monthMoneyStatic[0][5] += smoney;
		}
		
		public int getDaySum(int type) {
			int sum = 0;
			for (int i = 0; i < dayNumStatic.length; ++i) {
				sum += dayNumStatic[type][i];
			}
			
			return sum;
		}
		
		public int getMonthSum(int type) {
			int sum = 0;
			for (int i = 0; i < monthNumStatic.length; ++i) {
				sum += monthNumStatic[type][i];
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
			
			addCell(this.dayNumStatic[0][5], row, colNum++, cs);
			addCell(this.dayMoneyStatic[0][5], row, colNum++, cs);
			addCell(this.monthNumStatic[0][5], row, colNum++, cs);
			addCell(this.monthMoneyStatic[0][5], row, colNum++, cs);
			
			for (int i = 0; i < 2; ++i) {
				for (int j = 0; j < 5; ++j) {
					addCell(this.dayNumStatic[i][j], row, colNum++, cs);
					addCell(this.dayMoneyStatic[i][j], row, colNum++, cs);
					addCell(this.monthNumStatic[i][j], row, colNum++, cs);
					addCell(this.monthMoneyStatic[i][j], row, colNum++, cs);
				}
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
	sourceMap.put("103001", new FlowStatic("103001"));//自店
	sourceMap.put("103002", new FlowStatic("103002"));//它店
	
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
			String servOutTime = ((String)vo.get("servOutTime")).substring(0, 10);//2010-11-11
			
			if (currentVin == null || !currentVin.equals(carVin)) {
				filter.add(vo);
				currentTime = servOutTime;
				currentVin = carVin;
			} else {
				Map last = (Map)filter.get(filter.size()-1);
				if (last != null && vo != null) {
					Float smoney = (Float)last.get("servAmountExp"); 
					Float voSmoney = (Float)vo.get("servAmountExp"); 
					last.put("servAmountExp", new Float(smoney.floatValue() + voSmoney.floatValue()));
				}
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
<title>售后效益统计--地区分布</title>
<%
    String filename= request.getAttribute("statisticdate") + "售后效益统计表(地区分布)";
    filename = new String(filename.getBytes(),"iso8859-1");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);
	
	sum.setRegonAndValue(sheet, 0,   (short)   0,  3,   (short)   1, "", cs);
	
	sum.setRegonAndValue(sheet, 0,   (short)   2,  1,   (short)   5, "小计", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   6,  0,   (short)   25, "正常维修保养", cs);
	sum.setRegonAndValue(sheet, 0,   (short)   26,  0,   (short)   45, "保险车辆", cs);
	
	sum.setRegonAndValue(sheet, 1,   (short)   6,  1,   (short)   9, "CIVIC", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   10,  1,   (short)   13, "CRV", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   14,  1,   (short)   17, "SPIRIOR", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   18,  1,   (short)   21, "广本", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   22,  1,   (short)   25, "其他", cs);
	
	sum.setRegonAndValue(sheet, 1,   (short)   26,  1,   (short)   29, "CIVIC", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   30,  1,   (short)   33, "CRV", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   34,  1,   (short)   37, "SPIRIOR", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   38,  1,   (short)   41, "广本", cs);
	sum.setRegonAndValue(sheet, 1,   (short)   42,  1,   (short)   45, "其他", cs);
	
	for (int i = 0; i < 11; ++i) {
		sum.setRegonAndValue(sheet, 2,   (short)(2+i*4),  2,   (short)(3+i*4), "当日", cs);
		sum.setRegonAndValue(sheet, 2,   (short)(4+i*4),  2,   (short)(5+i*4), "当月", cs);
	}
	
	sum.setRegonAndValue(sheet, 4,   (short)   0,  16,   (short)   0, "地区分布", cs);
	
	HSSFRow row = sheet.createRow(0);
	sum.setCellValue(row,   (short)   2,  "小计", cs);
	sum.setCellValue(row,   (short)   6, "正常维修保养", cs);
	sum.setCellValue(row,   (short)   26,  "保险车辆", cs);
	
	row = sheet.createRow(1);
	sum.setCellValue(row,   (short)   6,  "CIVIC", cs);
	sum.setCellValue(row,   (short)   10,  "CRV", cs);
	sum.setCellValue(row,   (short)   14,  "SPIRIOR", cs);
	sum.setCellValue(row,   (short)   18,  "广本", cs);
	sum.setCellValue(row,   (short)   22,  "其他", cs);
	
	sum.setCellValue(row,   (short)   26,  "CIVIC", cs);
	sum.setCellValue(row,   (short)   30,  "CRV", cs);
	sum.setCellValue(row,   (short)   34,  "SPIRIOR", cs);
	sum.setCellValue(row,   (short)   38,  "广本", cs);
	sum.setCellValue(row,   (short)   42,  "其他", cs);
	
	row = sheet.createRow(2);
	for (int i = 0; i < 11; ++i) {
		sum.setCellValue(row,   (short)   (2+i*4),  "当日", cs);
		sum.setCellValue(row,   (short)   (4+i*4),  "当月", cs);
	}
	row = sheet.createRow(3);
	for (int i = 0; i < 22; ++i) {
		sum.setCellValue(row,   (short)   (2+i*2),  "台次", cs);
		sum.setCellValue(row,   (short)   (3+i*2),  "金额", cs);
	}
	
	int rowNum = 4;
	int colNum = 1;
	
	for (int i = 0; i < areaList.size(); ++i) {
		
		FlowStatic sub = (FlowStatic)areaList.get(i);
		sub.addRow(sheet, rowNum++, colNum, cs);	
	}

	row = sheet.getRow(4);
	sum.setCellValue(row,   (short)   0,  "区域分布", cs);
	
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