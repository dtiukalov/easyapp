<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
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
</script>
<%
	List carar = new ArrayList();
	carar.add("111001");
	carar.add("111013");
	carar.add("111009");
	carar.add("111007");
	carar.add("111011");
	carar.add("111008");
	carar.add("111006");
	carar.add("111010");
	carar.add("111012");
	carar.add("111014");
	carar.add("111015");
	carar.add("111016");
	List cararname = new ArrayList();
	cararname.add("长春");
	cararname.add("松原");
	cararname.add("通化");
	cararname.add("四平");
	cararname.add("白城");
	cararname.add("辽源");
	cararname.add("吉林");
	cararname.add("白山");
	cararname.add("延吉");
	cararname.add("内蒙");
	cararname.add("辽宁");
	cararname.add("黑龙江");
	
	List brandser = new ArrayList();
	brandser.add("105007");
	brandser.add("105006");
	brandser.add("105008");
	brandser.add("104002");
	brandser.add("1");
	
	List servicety = new ArrayList();
	servicety.add("112005");
	servicety.add("112003");
	
	List timemates =new ArrayList();
	timemates.add("8点之前");
	timemates.add("8-9点");
	timemates.add("9-10点");
	timemates.add("10-11点");
	timemates.add("11-12点");
	timemates.add("12-13点");
	timemates.add("13-14点");
	timemates.add("14-15点");
	timemates.add("15-16点");
	timemates.add("16-17点");
	timemates.add("17点之后");
	
	List brandfortime =new ArrayList();
	brandfortime.add("2");
	brandfortime.add("105007");
	brandfortime.add("105006");
	brandfortime.add("105008");
	brandfortime.add("1");
%>
<title>售后效益统计</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/BeneFitestimates.action">
		<fieldset>
		  <legend>售后效益统计</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">统计日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${statisticdate}" name="statisticdate" id="statisticdate" onchange="javascript:doSelect(this);" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   </tr>
                   <tr>
                      <td colspan="8" style="text-align:center;">
						<input id="sub" type="submit" value="查询"  disabled="disabled"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>${statisticdate}售后台前业务分析</label></td>
			<td><div id="paginate"><a href="javascript:$('#exportForm').submit();">导出</a></div></td>
		</tr>
	</table>

    <div class="tbDiv">
      <%
			List<Map<String, Object>> result = (List)request.getAttribute("result");
			if (result != null){
		  %>
		<table style='width:1500px;' cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
				<td rowspan="4" colspan='2' style="width: 80px;"></td>
				<td rowspan='2' colspan='4' style="width: 160px;">小计</td>
				<td colspan='20' style="line-height:18px; text-align: center;width: 800px;" >正常维修保养</td>
				<td colspan='20' style="line-height:18px; text-align: center; width: 800px;">保险车辆</td>
				<td colspan='4' style="line-height:18px; text-align: center; width: 160px;">其他</td>		
			</tr>
			<tr>
				<td colspan='4' class="">CRV</td>
				<td colspan='4' class="">CIVIC</td>
				<td colspan='4' class="">SPIRIOR</td>
				<td colspan='4' class="">广本</td>
				<td colspan='4' class="">其他</td>
				<td colspan='4' class="">CRV</td>
				<td colspan='4' class="">CIVIC</td>
				<td colspan='4' class="">SPIRIOR</td>
				<td colspan='4' class="">广本</td>
				<td colspan='4' class="">其他</td>
				<td colspan='4' class="">其他</td>
			</tr>
			<tr>
				<%
					for(int i=0;i<12;i++){
				%>
				<td colspan='2' class="" >当日</td>
				<td colspan='2' class="" >月累计</td>
				<%
					}
				%>
			</tr>
			<tr>
				<%
					for(int i = 0; i < 24; i++){						
				%>
					<td style="width: 30px;height: 18px;">台次</td>
					<td style="width: 50px;height: 18px;">金额</td>
				<%
					}
				%>
			</tr>
			<%
				for(int i=0; i<carar.size(); i++){
					out.print("<tr>");
					String cara = (String)carar.get(i);
					if("111001".equals(cara)){
						out.print("<td rowspan='12'>地区分布</td>");
					}
					out.print("<td>"+cararname.get(i)+"</td>");
					String a ="";
					float b =0;
					String c ="";
					float d =0;
					for(int j=0; j<result.size();j++){
						SaturnData row = (SaturnData)result.get(j);
						if(cara.equals(row.get("cararea"))){
							if("2".equals(row.get("servicetype"))){
								if("1".equals(row.get("statisticgrade"))){
									a = (String)row.get("scount");
									b = Float.parseFloat(row.get("smoney").toString());
								}
							}
							if("2".equals(row.get("servicetype"))){
								if("2".equals(row.get("statisticgrade"))){
									c = (String)row.get("scount");
									d = Float.parseFloat(row.get("smoney").toString());
								}
							}
						}
					}
					if(a != ""){
						out.print("<td>"+a+"</td>");
						out.print("<td>"+b+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
						out.print("<td>&nbsp;</td>");
					};
					if(c != ""){
						out.print("<td>"+c+"</td>");
						out.print("<td>"+d+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
						out.print("<td>&nbsp;</td>");
					}
					for(int k=0; k<servicety.size();k++){
						String servic = (String)servicety.get(k);
						for(int s=0; s<brandser.size();s++){
							String brand = (String)brandser.get(s);
							String a1 ="";
							float b1 =0;
							String c1 ="";
							float d1 =0;
							for(int j=0; j<result.size();j++){
							SaturnData row = (SaturnData)result.get(j);	
								if(cara.equals(row.get("cararea"))){
									if(servic.equals(row.get("servicetype"))){
										if(brand.equals(row.get("brandseries"))){
											if("1".equals(row.get("statisticgrade"))){
												a1 = (String)row.get("scount");
												b1 = Float.parseFloat(row.get("smoney").toString());
											}
											if("2".equals(row.get("statisticgrade"))){
												c1 = (String)row.get("scount");
												d1 = Float.parseFloat(row.get("smoney").toString());
											}
										}
									}
								}
							}
							if(a1 != ""){
								out.print("<td>"+a1+"</td>");
								out.print("<td>"+b1+"</td>");
							}else{
								out.print("<td>&nbsp;</td>");
								out.print("<td>&nbsp;</td>");
							};
							if(c1 != ""){
								out.print("<td>"+c1+"</td>");
								out.print("<td>"+d1+"</td>");
							}else{
								out.print("<td>&nbsp;</td>");
								out.print("<td>&nbsp;</td>");
							}
						}
					}
					
					String a2 ="";
					float b2 =0;
					String c2 ="";
					float d2 =0;
					for(int j=0; j<result.size();j++){
					SaturnData row = (SaturnData)result.get(j);		
						if(cara.equals(row.get("cararea"))){
							if("1".equals(row.get("servicetype"))){
								if("1".equals(row.get("statisticgrade"))){
									a2 = (String)row.get("scount");
									b2 = Float.parseFloat(row.get("smoney").toString());
								}
							}
							if("1".equals(row.get("servicetype"))){
								if("2".equals(row.get("statisticgrade"))){
									c2 = (String)row.get("scount");
									d2 = Float.parseFloat(row.get("smoney").toString());
								}
							}
						}
					}
					if(a2 != ""){
						out.print("<td>"+a2+"</td>");
						out.print("<td>"+b2+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
						out.print("<td>&nbsp;</td>");
					}
					if(c2 != ""){
						out.print("<td>"+c2+"</td>");
						out.print("<td>"+d2+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
						out.print("<td>&nbsp;</td>");
					}
					out.print("</tr>");
				}
			%>
		</tbody>
		</table>
		<div style="width: 1500px; border: none;">
			<div style="float: left;">
			<table style="width: 1000px;">
				<tr>
					<td rowspan="14" colspan="1"  style="width: 40px">时间分布</td>
					<td rowspan="2" style="width: 80px"></td>
					<td rowspan="1" colspan="2" style="width: 80px">小计</td>
					<td rowspan="1" colspan="2" style="width: 80px">CRV</td>
					<td rowspan="1" colspan="2" style="width: 80px">CTVIC</td>
					<td rowspan="1" colspan="2" style="width: 80px">SPIRIOR</td>
					<td rowspan="1" colspan="2" style="width: 80px">其他</td>
					<td rowspan="1" colspan="12" style="width: 480px;background-color:#e3f2fb;">地区分布（累计）</td>
				</tr>
				<tr>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					
					
					<td style="background-color:#e3f2fb;">长春</td>
					<td style="background-color:#e3f2fb;">松原</td>
					<td style="background-color:#e3f2fb;">通化</td>
					<td style="background-color:#e3f2fb;">四平</td>
					<td style="background-color:#e3f2fb;">白城</td>
					<td style="background-color:#e3f2fb;">辽源</td>
					<td style="background-color:#e3f2fb;">吉林</td>
					<td style="background-color:#e3f2fb;">白山</td>
					<td style="background-color:#e3f2fb;">延吉</td>
					<td style="background-color:#e3f2fb;">内蒙</td>
					<td style="background-color:#e3f2fb;">辽宁</td>
					<td style="background-color:#e3f2fb;">黑龙江</td>
				</tr>
				<%
				List<Map<String, Object>> result_time = (List)request.getAttribute("result_time");
				List<Map<String, Object>> result_pro = (List)request.getAttribute("result_pro");
				if(result_pro == null){
					result_pro = new ArrayList();
				}
				if(result_time != null){
					for(int i=0; i<timemates.size();i++){
					out.print("<tr>");
						String timem =(String)timemates.get(i);
						String timesect = String.valueOf(i+1);
						out.print("<td>"+timem+"</td>");
						//小计
						for(int k=0; k<brandfortime.size();k++){
							String vark = (String)brandfortime.get(k); 
							String a ="";
							String b ="";
							for(int j=0; j<result_time.size();j++){
								SaturnData row = (SaturnData)result_time.get(j);
								if(timesect.equals(row.get("timesect"))){
									if(vark.equals(row.get("brandseries"))){
										if("1".equals(row.get("flag_day"))){
											a = (String)row.get("daycount");
										}
										if("2".equals(row.get("flag_day"))){
											b = (String)row.get("daycount");
										}
									}
								}
							}
							if(a != ""){
								out.print("<td>"+a+"</td>");
							}else{
								out.print("<td>&nbsp;</td>");
							}
							if(b != ""){
								out.print("<td>"+b+"</td>");
							}else{
								out.print("<td>&nbsp;</td>");
							}
						}
						
						//out.print("<td>"+timem+"</td>");
						for(int k=0; k<carar.size();k++){
							String vark = (String)carar.get(k); 
							out.print("<td style='background-color:#e3f2fb;'>");
							for(int j=0; j<result_pro.size();j++){
								SaturnData row = (SaturnData)result_pro.get(j);
								if(timesect.equals(row.get("timesect"))){
									if(vark.equals(row.get("cararea"))){
										String a = (String)row.get("daycount");
										out.print(a);
									}
								}
							}
							out.print("</td>");
						}
					out.print("</tr>");
					}
					out.print("<tr>");
					out.print("<td>总计</td>");
					
					for(int k=0; k<brandfortime.size();k++){
						String vark = (String)brandfortime.get(k); 
						int a =0;
						int b =0;				
						for(int i=0; i<timemates.size();i++){
							String timesect = String.valueOf(i+1);
							for(int j=0; j<result_time.size();j++){
								SaturnData row = (SaturnData)result_time.get(j);
								if(timesect.equals(row.get("timesect"))){
									if(vark.equals(row.get("brandseries"))){
										if("1".equals(row.get("flag_day"))){
											a += Integer.parseInt(row.get("daycount").toString());
										}
										if("2".equals(row.get("flag_day"))){
											b += Integer.parseInt(row.get("daycount").toString());
										}
									}
								}
							}
							
						}
						out.print("<td>"+a+"</td>");
						out.print("<td>"+b+"</td>");
					}
					for(int k=0; k<carar.size();k++){
						out.print("<td style='background-color:#e3f2fb;'>");
						int a =0;
						for(int i=0; i<timemates.size();i++){
							String timesect = String.valueOf(i+1);
							String vark = (String)carar.get(k); 
							for(int j=0; j<result_pro.size();j++){
								SaturnData row = (SaturnData)result_pro.get(j);
								if(timesect.equals(row.get("timesect"))){
									if(vark.equals(row.get("cararea"))){
										a += Integer.parseInt(row.get("daycount").toString());
									}
								}
							}
						}
						out.print(a);
						out.print("</td>");
					}
					
					out.print("</tr>");
				}
				%>
			</table>
			</div>
			<div style="float: right;">
			<table style="width: 320px">
			<%
				List<Map<String, Object>> resultcomplaintstatisticday = (List)request.getAttribute("resultcomplaintstatisticday");
				if(resultcomplaintstatisticday == null){
					resultcomplaintstatisticday = new ArrayList();
				}
				List<Map<String, Object>> resultcomplaintstatisticmon = (List)request.getAttribute("resultcomplaintstatisticmon");
				if(resultcomplaintstatisticmon == null){
					resultcomplaintstatisticmon = new ArrayList();
				}
			%>
				<tr>
					<td rowspan="15" style="width: 80px">问题统计</td>
					<td style="width: 80px"></td>
					<td style="width: 80px">当日投诉</td>
					<td style="width: 80px">当月投诉</td>
				</tr>
				<%
					for(int i=0;i<cararname.size(); i++){
						out.print("<tr>");
							String a = (String)cararname.get(i);
							String b =(String)carar.get(i);
							out.print("<td>"+a+"</td>");
							out.print("<td>");
								for(int j=0; j<resultcomplaintstatisticday.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
									if(b.equals(comday.get("cararea"))){
										out.print(comday.get("complaintcount"));
									}
								}
							out.print("</td>");
							out.print("<td>");
								for(int j=0; j<resultcomplaintstatisticmon.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
									if(b.equals(comday.get("cararea"))){
										out.print(comday.get("complaintcount"));
									}
								}
							out.print("</td>");
						out.print("</tr>");
					}
				%>
				<tr>
					<td>其他地区</td>
					<td>
						<%
						for(int j=0; j<resultcomplaintstatisticday.size();j++){
							SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
							if("1".equals(comday.get("cararea"))){
								out.print(comday.get("complaintcount"));
							}
						}
						%>
					</td>
					<td>
						<%
						for(int j=0; j<resultcomplaintstatisticmon.size();j++){
							SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
							if("1".equals(comday.get("cararea"))){
								out.print(comday.get("complaintcount"));
							}
						}
						%>
					</td>
				</tr>
				<tr>
					<td>总计</td>
					<td>
						<%
							int varday =0;
							for(int i=0;i<cararname.size(); i++){
								for(int j=0; j<resultcomplaintstatisticday.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
									if(comday.get("cararea")!=""){
										varday += Integer.parseInt(comday.get("complaintcount").toString());
									}
									
								}
							}
							out.print(varday);
						%>
					</td>
					<td>
						<%
							int varmon =0;
							for(int i=0;i<cararname.size(); i++){
								String a = (String)cararname.get(i);
								String b =(String)carar.get(i);
								for(int j=0; j<resultcomplaintstatisticmon.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
									if(comday.get("cararea")!= null){
										varmon += Integer.parseInt(comday.get("complaintcount").toString());
									}
								}
							}
							out.print(varmon);
						%>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<table style="border-bottom-style: none;height: 10px;width: 1500px; margin-top: 10px;">&nbsp;</table>
		<%
			}
		%>	
    </div>
</div>
</body>
</html>