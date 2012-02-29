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
	//车型
	List brandser = new ArrayList();
		brandser.add("105007");
		brandser.add("105006");
		brandser.add("105008");
	
	List carsourcelist = new ArrayList();		carsourcelist.add("103001");		carsourcelist.add("103002");
	List carCardLevel = new ArrayList();		carCardLevel.add("101001");		carCardLevel.add("101002");		carCardLevel.add("101003");		carCardLevel.add("101004");		carCardLevel.add("101005");		carCardLevel.add("101006");
	
	
	List carecode = new ArrayList();
		carecode.add("123013");
		carecode.add("123014");
		carecode.add("123015");
		carecode.add("123016");
		carecode.add("123017");
		carecode.add("123018");
	List carename = new ArrayList();
		carename.add("高效进气系统清洗剂");
		carename.add("燃油系统快速高效清洗剂");
		carename.add("发动机润滑系统快速高效清洗剂");
		carename.add("发动机保护剂");
		carename.add("三元催化专用清洗液");
		carename.add("空调清洗剂");
	
%>
<title>售后车辆当日流量表</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/HondaFlowstatistic.action">
		<fieldset>
		  <legend>售后车辆当日流量表</legend>
		
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
    <table class="optDiv" style='width:1100px;'>
		<tr>
			<td><label class="rsTitle" style='width:900px;'>${statisticdate}售后车辆当日流量</label></td>
			<td><div id="paginate"><a href="javascript:$('#exportForm').submit();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
      <%
		List<Map<String, Object>> result = (List)request.getAttribute("result");
      	List<Map<String, Object>> resultmon = (List)request.getAttribute("resultmon");
      	if(resultmon == null){
      		resultmon =new ArrayList();
      	}
      	List<Map<String,Object>> resultoilday = (List)request.getAttribute("resultoilday");
      	if(resultoilday == null){
      		resultoilday =new ArrayList();
      	}
      	List<Map<String,Object>> resultoilmon = (List)request.getAttribute("resultoilmon");
      	if(resultoilmon == null){
      		resultoilmon =new ArrayList();
      	}
		if (result != null){
	  %>
		<table  style="width:1100px;">
			<tr>
				<td rowspan="37" colspan="1"  style='width:20px;'>东本</td>
				<td rowspan="3" colspan="2"  style='width:40px;'></td>
				<td colspan="10">当日流量</td>
				<td colspan="6" style="background-color:#e3f2fb;">存油统计（日）</td>
				<td colspan="10">当月流量</td>
				<td colspan="6" style="background-color:#e3f2fb;">存油统计（月）</td>
			</tr>
			<tr>
				<td rowspan="2" colspan="1">优</td>
				<td rowspan="2">良</td>
				<td rowspan="2">中</td>
				<td rowspan="2">差</td>
				<td rowspan="2">新</td>
				<td rowspan="2">死档</td>
				<td rowspan="1" colspan="4">小计</td>
				
				<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">小油桶出库</td>
				<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
					<%
						for(int i=0; i< resultoilday.size();i++){
							SaturnData oillist = (SaturnData)resultoilday.get(i);
							if("0".equals(oillist.get("cararea"))){
								if("125002".equals(oillist.get("oilstate"))){
								String oilcount = (String)oillist.get("oilamount");
								out.print(oilcount);
								}
							}
						}
					%>
				</td>
				
				<td rowspan="2" colspan="1">优</td>
				<td rowspan="2">良</td>
				<td rowspan="2">中</td>
				<td rowspan="2">差</td>
				<td rowspan="2">新</td>
				<td rowspan="2">死档</td>
				<td rowspan="1" colspan="4">小计</td>
				<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">小桶油出库</td>
				<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
					<%
						for(int i=0; i< resultoilmon.size();i++){
							SaturnData oillist = (SaturnData)resultoilmon.get(i);
							if("0".equals(oillist.get("cararea"))){
								if("125002".equals(oillist.get("oilstate"))){
								String oilcount = (String)oillist.get("oilamount");
								out.print(oilcount);
								}
							}
						}
					%>
				</td>
			</tr>
			<tr>
				<td>总台次</td>
				<td>CRV</td>
				<td>CIVIC</td>
				<td>SPIROR</td>
				
				
				<td>总台次</td>
				<td>CRV</td>
				<td>CIVIC</td>
				<td>SPIROR</td>
			</tr>
			<tr>
				<td colspan="2">当日\当月总计</td>
				<%
					for(int j=0;j<6;j++){
						out.print("<td>");
						String listcar = (String)carCardLevel.get(j);
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if("2".equals(rowmap.get("flag"))){
								if(listcar.equals(rowmap.get("carcardevel"))){
									String varcount = (String)rowmap.get("count");
									out.print(varcount);
								}
							}
						}
						out.print("</td>");
					}
					out.print("<td>");
					for(int a=0; a< result.size(); a++){
						SaturnData rowmap = (SaturnData)result.get(a);
						if("2".equals(rowmap.get("flag"))){
							if("0".equals(rowmap.get("carcardevel"))){
								if("0".equals(rowmap.get("carseries"))){
									String var1 = "";
									var1 = (String)rowmap.get("count");
									out.print(var1);
								}
							}
						}
					}
					out.print("</td>");
					for(int j=0;j<3;j++){
						String listbrand = (String)brandser.get(j);
						out.print("<td>");
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if("2".equals(rowmap.get("flag"))){
								if(listbrand.equals(rowmap.get("carseries"))){
									String varcount = (String)rowmap.get("count");
									out.print(varcount);
								}
							}
						}
						out.print("</td>");
					}
				%>
				<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">外销</td>
				<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
					<%
						for(int i=0; i< resultoilday.size();i++){
							SaturnData oillist = (SaturnData)resultoilday.get(i);
							if("0".equals(oillist.get("cararea"))){
								if("125004".equals(oillist.get("oilstate"))){
								String oilcount = (String)oillist.get("oilamount");
								out.print(oilcount);
								}
							}
						}
					%>
				</td>
				<%
					for(int j=0;j<6;j++){
						out.print("<td>");
						String listcar = (String)carCardLevel.get(j);
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if("2".equals(rowmap.get("flag"))){
								if(listcar.equals(rowmap.get("carcardevel"))){
									String varcount = (String)rowmap.get("count");
									out.print(varcount);
								}
							}
						}
						out.print("</td>");
					}
					out.print("<td>");
					for(int a=0; a< resultmon.size(); a++){
						SaturnData rowmap = (SaturnData)resultmon.get(a);
						if("2".equals(rowmap.get("flag"))){
							if("0".equals(rowmap.get("carcardevel"))){
								if("0".equals(rowmap.get("carseries"))){
									String var1 = "";
									var1 = (String)rowmap.get("count");
									out.print(var1);
								}
							}
						}
					}
					out.print("</td>");
					for(int j=0;j<3;j++){
						String listbrand = (String)brandser.get(j);
						out.print("<td>");
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if("2".equals(rowmap.get("flag"))){
								if(listbrand.equals(rowmap.get("carseries"))){
									String varcount = (String)rowmap.get("count");
									out.print(varcount);
								}
							}
						}
						out.print("</td>");
					}
				%>
				<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">外销</td>
				<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
					<%
						for(int i=0; i< resultoilmon.size();i++){
							SaturnData oillist = (SaturnData)resultoilmon.get(i);
							if("0".equals(oillist.get("cararea"))){
								if("125004".equals(oillist.get("oilstate"))){
								String oilcount = (String)oillist.get("oilamount");
								out.print(oilcount);
								}
							}
						}
					%>
				</td>
			</tr>
				<%
				//第二行日
					for(int ii =0;ii<2 ; ii++){
						out.print("<tr>");
						if( ii == 0 ){
							out.print("<td rowspan='2'>东本</td>");
							out.print("<td>自店</td>");
						}else{
							out.print("<td>它店</td>");
						}
						String sourcei = (String)carsourcelist.get(ii);
						for(int j=0;j<6;j++){
							out.print("<td>");
							String listcar = (String)carCardLevel.get(j);
							for(int a=0; a< result.size(); a++){
								SaturnData rowmap = (SaturnData)result.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("0".equals(rowmap.get("flag"))){
										if(listcar.equals(rowmap.get("carcardevel"))){
											String varcount = "";
											varcount = (String)rowmap.get("count");
											out.print(varcount);
										}
									}
								}
							}
							out.print("</td>");
						}
						out.print("<td>");
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if(sourcei.equals(rowmap.get("carsource"))){
								if("1".equals(rowmap.get("flag"))){
									if("0".equals(rowmap.get("carcardevel"))){
										if("0".equals(rowmap.get("carseries"))){
											String var2 = (String)rowmap.get("count");
											out.print(var2);
										}
									}
								}
							}
						}
						out.print("</td>");
						for(int j=0;j<3;j++){
							String listbrand = (String)brandser.get(j);
							out.print("<td>");
							for(int a=0; a< result.size(); a++){
								SaturnData rowmap = (SaturnData)result.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("0".equals(rowmap.get("flag"))){
										if(listbrand.equals(rowmap.get("carseries"))){
											String varcount = (String)rowmap.get("count");
											out.print(varcount);
										}
									}
								}
							}
							out.print("</td>");
						}
						if(ii==1){
							%>
							<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">本店换</td>
							<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
								<%
									for(int i=0; i< resultoilday.size();i++){
										SaturnData oillist = (SaturnData)resultoilday.get(i);
										if("0".equals(oillist.get("cararea"))){
											if("0".equals(oillist.get("oilstate"))){
												String oilcount = (String)oillist.get("oilamount");
												out.print(oilcount);
											}
										}
									}
								%>
							</td>
							<%
						}
				//第2行月
						for(int j=0;j<6;j++){
							out.print("<td>");
							String listcar = (String)carCardLevel.get(j);
							for(int a=0; a< resultmon.size(); a++){
								SaturnData rowmap = (SaturnData)resultmon.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("0".equals(rowmap.get("flag"))){
										if(listcar.equals(rowmap.get("carcardevel"))){
											String varcount = "";
											varcount = (String)rowmap.get("count");
											out.print(varcount);
										}
									}
								}
							}
							out.print("</td>");
						}
						out.print("<td>");
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if(sourcei.equals(rowmap.get("carsource"))){
								if("1".equals(rowmap.get("flag"))){
									if("0".equals(rowmap.get("carcardevel"))){
										if("0".equals(rowmap.get("carseries"))){
											String var2 = (String)rowmap.get("count");
											out.print(var2);
										}
									}
								}
							}
						}
						out.print("</td>");
						for(int j=0;j<3;j++){
							String listbrand = (String)brandser.get(j);
							out.print("<td>");
							for(int a=0; a< resultmon.size(); a++){
								SaturnData rowmap = (SaturnData)resultmon.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("0".equals(rowmap.get("flag"))){
										if(listbrand.equals(rowmap.get("carseries"))){
											String varcount = (String)rowmap.get("count");
											out.print(varcount);
										}
									}
								}
							}
							out.print("</td>");
						}
						if(ii==1){
							%>
								<td rowspan="2" colspan="2" style="background-color:#e3f2fb;">本店换</td>
								<td rowspan="2" colspan="4" style="background-color:#e3f2fb;">
									<%
										for(int i=0; i< resultoilmon.size();i++){
											SaturnData oillist = (SaturnData)resultoilmon.get(i);
											if("0".equals(oillist.get("cararea"))){
												if("0".equals(oillist.get("oilstate"))){
												String oilcount = (String)oillist.get("oilamount");
												out.print(oilcount);
												}
											}
										}
									%>
								</td>
							<%
						}
						out.print("</tr>");
					}
				
				//新增  日流量
					for(int ii =0;ii<2 ; ii++){
						out.print("<tr>");
						if( ii == 0 ){
							out.print("<td rowspan='2'>新增</td>");
							out.print("<td>自店</td>");
						}else{
							out.print("<td>它店</td>");
						}
						String sourcei = (String)carsourcelist.get(ii);
						String varcount = "";
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if("0".equals(rowmap.get("carseries"))){
								if(sourcei.equals(rowmap.get("carsource"))){
									if("1".equals(rowmap.get("carcardevel"))){
										varcount = (String)rowmap.get("count");
									}
								}
							}
						}
						if(varcount != ""){
							out.print("<td colspan='6'>"+varcount+"</td>");
							out.print("<td colspan='1'>"+varcount+"</td>");
						}else{
							out.print("<td colspan='6'>&nbsp;</td>");
							out.print("<td colspan='1'>&nbsp;</td>");
						}
						for(int j=0;j<3;j++){
							String listbrand = (String)brandser.get(j);
							out.print("<td>");
							for(int a=0; a< result.size(); a++){
								SaturnData rowmap = (SaturnData)result.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("1".equals(rowmap.get("carcardevel"))){
										if(listbrand.equals(rowmap.get("carseries"))){
											String varcount1 = (String)rowmap.get("count");
											out.print(varcount1);
										}
									}
								}
							}
							out.print("</td>");
						}
						if(ii==1){
							%>
							<td colspan="2" style="background-color:#e3f2fb;">存油</td>
							<td colspan="2" style="background-color:#e3f2fb;">出油</td>
							<td colspan="2" style="background-color:#e3f2fb;">带走</td>
							<%
						}
						//新增  月流量
						String varcounty = "";
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if("0".equals(rowmap.get("carseries"))){
								if(sourcei.equals(rowmap.get("carsource"))){
									if("1".equals(rowmap.get("carcardevel"))){
										varcounty = (String)rowmap.get("count");
									}
								}
							}
						}
						if(varcounty != ""){
							out.print("<td colspan='6'>"+varcounty+"</td>");
							out.print("<td colspan='1'>"+varcounty+"</td>");
						}else{
							out.print("<td colspan='6'>&nbsp;</td>");
							out.print("<td colspan='1'>&nbsp;</td>");
						}
						for(int j=0;j<3;j++){
							String listbrand = (String)brandser.get(j);
							out.print("<td>");
							for(int a=0; a< resultmon.size(); a++){
								SaturnData rowmap = (SaturnData)resultmon.get(a);
								if(sourcei.equals(rowmap.get("carsource"))){
									if("1".equals(rowmap.get("carcardevel"))){
										if(listbrand.equals(rowmap.get("carseries"))){
											String varcount1 = (String)rowmap.get("count");
											out.print(varcount1);
										}
									}
								}
							}
							out.print("</td>");
						}
						if(ii==1){
							%>
							<td colspan="2" style="background-color:#e3f2fb;">存油</td>
							<td colspan="2" style="background-color:#e3f2fb;">出油</td>
							<td colspan="2" style="background-color:#e3f2fb;">带走</td>
							<%
						}
						out.print("</tr>");
					}
			%>
			<%
			//地区流量 日
			for(int i =0;i< carar.size() ; i++){
				out.print("<tr>");
				if( i == 0 ){
					out.print("<td rowspan='13'>地区分布</td>");
				}
				out.print("<td>"+ cararname.get(i)+"</td>");
				String carcode = (String)carar.get(i); 
				for(int j=0;j<6;j++){
					String varcount = "";
					String listcar = (String)carCardLevel.get(j);
					for(int a=0; a< resultmon.size(); a++){
						SaturnData rowmap = (SaturnData)resultmon.get(a);
						if(carcode.equals(rowmap.get("cararea"))){
							if("0".equals(rowmap.get("flag"))){
								if(listcar.equals(rowmap.get("carcardevel"))){
									varcount = (String)rowmap.get("count");
								}
							}
						}
					}
					if(varcount != ""){
						out.print("<td>"+varcount+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
					}
				}
				out.print("<td>");
				for(int a=0; a< resultmon.size(); a++){
					SaturnData rowmap = (SaturnData)resultmon.get(a);
					if(carcode.equals(rowmap.get("cararea"))){
						if("1".equals(rowmap.get("flag"))){
							if("0".equals(rowmap.get("carcardevel"))){
								if("0".equals(rowmap.get("carseries"))){
									String var2 = (String)rowmap.get("count");
									out.print(var2);
								}
							}
						}
					}
				}
				out.print("</td>");
				for(int j=0;j<3;j++){
					String listbrand = (String)brandser.get(j);
					String varcount = "";
					for(int a=0; a< resultmon.size(); a++){
						SaturnData rowmap = (SaturnData)resultmon.get(a);
						if(carcode.equals(rowmap.get("cararea"))){
							if("0".equals(rowmap.get("flag"))){
								if(listbrand.equals(rowmap.get("carseries"))){
									varcount = (String)rowmap.get("count");
								}
							}
						}
					}
					if(varcount != ""){
						out.print("<td>"+varcount+"</td>");
					}else{
						out.print("<td>&nbsp;</td>");
					}
				}
				//区域分布日存油
				List oils = new ArrayList();
				oils.add("125001");
				oils.add("125002");
				oils.add("125003");
				
				
					String carareaid = (String)carar.get(i);
					for(int j=0;j<3;j++){
						String oillisti= (String)oils.get(j);
						String oilcountval = "";
						for(int k=0; k< resultoilday.size();k++){
							SaturnData oillist = (SaturnData)resultoilday.get(k);
							if(carareaid.equals(oillist.get("cararea"))){
								if(oillisti.equals(oillist.get("oilstate"))){
									oilcountval = (String)oillist.get("oilamount");
								}
							}
						}
						if(oilcountval !=null){
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>"+ oilcountval +"</td>");
						}else{
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>&nbsp;</td>");
						}
					}
				
				
				
				//地区流量 月
					for(int j=0;j<6;j++){
						String varcount = "";
						String listcar = (String)carCardLevel.get(j);
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if(carcode.equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listcar.equals(rowmap.get("carcardevel"))){
										varcount = (String)rowmap.get("count");
									}
								}
							}
						}
						if(varcount != ""){
							out.print("<td>"+varcount+"</td>");
						}else{
							out.print("<td>&nbsp;</td>");
						}
					}
					out.print("<td>");
					for(int a=0; a< resultmon.size(); a++){
						SaturnData rowmap = (SaturnData)resultmon.get(a);
						if(carcode.equals(rowmap.get("cararea"))){
							if("1".equals(rowmap.get("flag"))){
								if("0".equals(rowmap.get("carcardevel"))){
									if("0".equals(rowmap.get("carseries"))){
										String var2 = (String)rowmap.get("count");
										out.print(var2);
									}
								}
							}
						}
					}
					out.print("</td>");
					for(int j=0;j<3;j++){
						String listbrand = (String)brandser.get(j);
						String varcount = "";
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if(carcode.equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listbrand.equals(rowmap.get("carseries"))){
										varcount = (String)rowmap.get("count");
									}
								}
							}
						}
						if(varcount != ""){
							out.print("<td>"+varcount+"</td>");
						}else{
							out.print("<td>&nbsp;</td>");
						}
					}
	//	区域存油月		
					for(int j=0;j<3;j++){
						String oillisti= (String)oils.get(j);
						String oilcountval = "";
						for(int k=0; k< resultoilmon.size();k++){
							SaturnData oillist = (SaturnData)resultoilmon.get(k);
							if(carareaid.equals(oillist.get("cararea"))){
								if(oillisti.equals(oillist.get("oilstate"))){
									oilcountval = (String)oillist.get("oilamount");
								}
							}
						}
						if(oilcountval !=null){
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>"+ oilcountval +"</td>");
						}else{
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>&nbsp;</td>");
						}
					}
				out.print("</tr>");
			}
			%>
			<%
					out.print("<tr>");
					out.print("<td>其他地区</td>");
					//  日
					for(int j=0;j<6;j++){
						out.print("<td>");
						String listcar = (String)carCardLevel.get(j);
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if("1".equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listcar.equals(rowmap.get("carcardevel"))){
										String varcount = (String)rowmap.get("count");
										out.print(varcount);
									}
								}
							}
						}
						out.print("</td>");
					}
					out.print("<td>");
					for(int a=0; a< result.size(); a++){
						SaturnData rowmap = (SaturnData)result.get(a);
						if("1".equals(rowmap.get("cararea"))){
							if("1".equals(rowmap.get("flag"))){
								if("0".equals(rowmap.get("carcardevel"))){
									if("0".equals(rowmap.get("carseries"))){
										String var2 = (String)rowmap.get("count");
										out.print(var2);
									}
								}
							}
						}
					}
					out.print("</td>");
					for(int j=0;j<3;j++){
						String listbrand = (String)brandser.get(j);
						out.print("<td>");
						for(int a=0; a< result.size(); a++){
							SaturnData rowmap = (SaturnData)result.get(a);
							if("1".equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listbrand.equals(rowmap.get("carseries"))){
										String varcount = (String)rowmap.get("count");
										out.print(varcount);
									}
								}
							}
						}
						out.print("</td>");
					}
					//区域其他存油
					List oils = new ArrayList();
					oils.add("125001");
					oils.add("125002");
					oils.add("125003");
					for(int j=0;j<3;j++){
						out.print("<td colspan='2' style='background-color:#e3f2fb;'>");
						String oillisti= (String)oils.get(j);
						for(int k=0; k< resultoilday.size();k++){
							SaturnData oillist = (SaturnData)resultoilday.get(k);
							if("1".equals(oillist.get("cararea"))){
								if(oillisti.equals(oillist.get("oilstate"))){
									String oilcountval = (String)oillist.get("oilamount");
									out.print(oilcountval);
								}
							}
						}
						out.print("</td>");
					}
					//月
					for(int j=0;j<6;j++){
						out.print("<td>");
						String listcar = (String)carCardLevel.get(j);
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if("1".equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listcar.equals(rowmap.get("carcardevel"))){
										String varcount = (String)rowmap.get("count");
										out.print(varcount);
									}
								}
							}
						}
						out.print("</td>");
					}
					out.print("<td>");
					for(int a=0; a< resultmon.size(); a++){
						SaturnData rowmap = (SaturnData)resultmon.get(a);
						if("1".equals(rowmap.get("cararea"))){
							if("1".equals(rowmap.get("flag"))){
								if("0".equals(rowmap.get("carcardevel"))){
									if("0".equals(rowmap.get("carseries"))){
										String var2 = (String)rowmap.get("count");
										out.print(var2);
									}
								}
							}
						}
					}
					out.print("</td>");
					for(int j=0;j<3;j++){
						String listbrand = (String)brandser.get(j);
						out.print("<td>");
						for(int a=0; a< resultmon.size(); a++){
							SaturnData rowmap = (SaturnData)resultmon.get(a);
							if("1".equals(rowmap.get("cararea"))){
								if("0".equals(rowmap.get("flag"))){
									if(listbrand.equals(rowmap.get("carseries"))){
										String varcount = (String)rowmap.get("count");
										out.print(varcount);
									}
								}
							}
						}
						out.print("</td>");
					}
					for(int j=0;j<3;j++){
						String oillisti= (String)oils.get(j);
						String oilcountval = "";
						for(int k=0; k< resultoilmon.size();k++){
							SaturnData oillist = (SaturnData)resultoilmon.get(k);
							if("1".equals(oillist.get("cararea"))){
								if(oillisti.equals(oillist.get("oilstate"))){
									oilcountval = (String)oillist.get("oilamount");
								}
							}
						}
						if(oilcountval !=null){
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>"+ oilcountval +"</td>");
						}else{
							out.print("<td colspan='2' style='background-color:#e3f2fb;'>&nbsp;</td>");
						}
					}
				out.print("</tr>");
			%>
			
			 <%
	////////////保险
			  	List<Map<String,Object>> resultinsuday = (List)request.getAttribute("resultinsuday");
			 	List<Map<String,Object>> resultinsumon= (List)request.getAttribute("resultinsumon");
			 	if(resultinsumon == null){
			 		resultinsumon =new ArrayList();
		      	}
				List<Map<String,Object>> resultcareday= (List)request.getAttribute("resultcareday");
				if(resultcareday == null){
					resultcareday =new ArrayList();
		      	}
		      	List<Map<String,Object>> resultcaremon= (List)request.getAttribute("resultcaremon");
		      	if(resultcaremon == null){
		      		resultcaremon =new ArrayList();
		      	}
			  	if(resultinsuday != null){
			  %>
			  		<tr>
			  			<td rowspan="2" colspan="2"></td>
			  			<td colspan="9">当日保险情况</td>
			  			<td rowspan='2' colspan="7" style='background-color:#80d3d6;'>当日养护品统计</td>
			  			
			  			<td colspan="9">当月保险情况</td>
			  			<td rowspan='2' colspan="7" style='background-color:#80d3d6;'>当月养护品统计</td>
			  		</tr>
			  		<tr>
			  			<td>平安</td>
			  			<td>人保</td>
			  			<td>大地</td>
			  			<td>太平洋</td>
			  			<td>安华</td>
			  			<td>中保</td>
			  			<td>安邦</td>
			  			<td>其他</td>
			  			<td>合计</td>
			  			
			  			
			  			<td>平安</td>
			  			<td>人保</td>
			  			<td>大地</td>
			  			<td>太平洋</td>
			  			<td>安华</td>
			  			<td>中保</td>
			  			<td>安邦</td>
			  			<td>其他</td>
			  			<td>合计</td>
			  		</tr>
			  		<tr>
			  			<td colspan="2">当日总计</td>
			  			<%
			  				List insucp = new ArrayList();
			  				insucp.add("126007");
			  				insucp.add("126002");
			  				insucp.add("126003");
			  				insucp.add("126001");
			  				insucp.add("126004");
			  				insucp.add("126006");
			  				insucp.add("126005");
			  				
			  				for(int i=0; i<7; i++){
			  					String tdi = "";
			  					String insuid = (String)insucp.get(i);
			  					for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				
			  			%>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if("0".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if("1".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td colspan="2" style='background-color:#80d3d6;'>种类</td>
			  			<td style='background-color:#80d3d6;'>总计</td>
			  			<td style='background-color:#80d3d6;'>CRV</td>
			  			<td style='background-color:#80d3d6;'>CIVIC</td>
			  			<td style='background-color:#80d3d6;'>SPIRIOR</td>
			  			<td style='background-color:#80d3d6;'>其他</td>
			  			
					  	<%
			  				for(int i=0; i<7; i++){
			  					String tdi = "";
			  					String insuid = (String)insucp.get(i);
			  					for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				
			  			%>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if("0".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("1".equals(res.get("cararea"))){
			  							if("1".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td colspan="2" style='background-color:#80d3d6;'>种类</td>
			  			<td style='background-color:#80d3d6;'>总计</td>
			  			<td style='background-color:#80d3d6;'>CRV</td>
			  			<td style='background-color:#80d3d6;'>CIVIC</td>
			  			<td style='background-color:#80d3d6;'>SPIRIOR</td>
			  			<td style='background-color:#80d3d6;'>其他</td>
			  			
			  		</tr>
			  		<%
			  			for(int i=0; i<carar.size(); i++){
			  				out.print("<tr>");
			  				if(i==0){
			  					out.print("<td rowspan='13'>地区分布</td>");
			  				}
			  				out.print("<td>"+cararname.get(i)+"</td>");
			  				String areaid=(String)carar.get(i);
			  				for(int j=0;j<insucp.size();j++){
			  					String insuid = (String)insucp.get(j);
			  					String tdi = "";
			  					for(int k=0; k<resultinsuday.size();k++){
			  						SaturnData res = (SaturnData)resultinsuday.get(k);
			  						if(areaid.equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				out.print("<td>");
		  					for(int k=0; k<resultinsuday.size();k++){
		  						SaturnData res = (SaturnData)resultinsuday.get(k);
		  						if(areaid.equals(res.get("cararea"))){
		  							if("0".equals(res.get("insurancecompany"))){
		  								String tdi = (String)res.get("count");
		  								out.print(tdi);
		  							}
		  						}
		  					}
		  					out.print("</td>");
		  					
		  					out.print("<td>");
		  					for(int k=0; k<resultinsuday.size();k++){
		  						SaturnData res = (SaturnData)resultinsuday.get(k);
		  						if(areaid.equals(res.get("cararea"))){
		  							if("1".equals(res.get("insurancecompany"))){
		  								String tdj = (String)res.get("count");
		  								out.print(tdj);
		  							}
		  						}
		  					}
		  					out.print("</td>");
					// 当日护养品统计
		  					if(i%2==0){
		  						int n = i/2;
		  						String carecodei = (String)carecode.get(n);
		  		  				out.print("<td colspan='2' rowspan='2' style='background-color:#80d3d6;'>"+carename.get(n)+"</td>");
			  		  			out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
				  					for(int k=0; k<resultcareday.size();k++){
				  						SaturnData listday = (SaturnData)resultcareday.get(k);
				  						if("1".equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								out.print(listday.get("carecount"));
				  							}
				  						}
				  					}
				  				out.print("</td>");		
				  				for(int j =0; j<brandser.size();j++){
				  					out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
				  					String brandid = (String)brandser.get(j);
				  					for(int k=0; k<resultcareday.size();k++){
				  						SaturnData listday = (SaturnData)resultcareday.get(k);
				  						if(brandid.equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								out.print(listday.get("carecount"));
				  							}
				  						}
				  					}
				  					out.print("</td>");
				  				}
				  				out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
			  					for(int k=0; k<resultcareday.size();k++){
			  						SaturnData listday = (SaturnData)resultcareday.get(k);
			  						if("0".equals(listday.get("carseries"))){
			  							if(carecodei.equals(listday.get("careitemvame"))){
			  								out.print(listday.get("carecount"));
			  							}
			  						}
			  					}
			  					out.print("</td>");
		  					}
		  					////月。。。。。。。。。。。。。。。。。。。。。。。。。。。。
		  					
		  					for(int j=0;j<insucp.size();j++){
			  					String insuid = (String)insucp.get(j);
			  					String tdi = "";
			  					for(int k=0; k<resultinsumon.size();k++){
			  						SaturnData res = (SaturnData)resultinsumon.get(k);
			  						if(areaid.equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				String tdi = "";
		  					for(int k=0; k<resultinsumon.size();k++){
		  						SaturnData res = (SaturnData)resultinsumon.get(k);
		  						if(areaid.equals(res.get("cararea"))){
		  							if("0".equals(res.get("insurancecompany"))){
		  								tdi = (String)res.get("count");
		  							}
		  						}
		  					}
		  					if(tdi != null){
		  						out.print("<td>"+tdi+"</td>");
		  					}else{
		  						out.print("<td>&nbsp;</td>");
		  					}
		  					
		  					String tdj = "";
		  					for(int k=0; k<resultinsumon.size();k++){
		  						SaturnData res = (SaturnData)resultinsumon.get(k);
		  						if(areaid.equals(res.get("cararea"))){
		  							if("1".equals(res.get("insurancecompany"))){
		  								tdj = (String)res.get("count");
		  							}
		  						}
		  					}
		  					if(tdj != null){
		  						out.print("<td>"+tdj+"</td>");
		  					}else{
		  						out.print("<td>&nbsp;</td>");
		  					}
		  			////当月护养品
		  					if(i%2==0){
		  						int n = i/2;
		  						String carecodei = (String)carecode.get(n);
		  		  				out.print("<td colspan='2' rowspan='2' style='background-color:#80d3d6;'>"+carename.get(n)+"</td>");
			  		  			out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
				  					for(int k=0; k<resultcaremon.size();k++){
				  						SaturnData listday = (SaturnData)resultcaremon.get(k);
				  						if("1".equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								out.print(listday.get("carecount"));
				  							}
				  						}
				  					}
				  				out.print("</td>");
				  				for(int j =0; j<brandser.size();j++){
				  					out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
				  					String brandid = (String)brandser.get(j);
				  					for(int k=0; k<resultcaremon.size();k++){
				  						SaturnData listday = (SaturnData)resultcaremon.get(k);
				  						if(brandid.equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								out.print(listday.get("carecount"));
				  							}
				  						}
				  					}
				  					out.print("</td>");
				  				}
				  				out.print("<td rowspan='2' style='background-color:#80d3d6;'>");
			  					for(int k=0; k<resultcaremon.size();k++){
			  						SaturnData listday = (SaturnData)resultcaremon.get(k);
			  						if("0".equals(listday.get("carseries"))){
			  							if(carecodei.equals(listday.get("careitemvame"))){
			  								out.print(listday.get("carecount"));
			  							}
			  						}
			  					}
			  					out.print("</td>");
		  		  				
		  					}
			  				out.print("</tr>");
			  			}
			  		%>
			  		<tr>
			  			<td>其他地区</td>
			  			<%
			  				for(int i=0; i<7; i++){
			  					String tdi = "";
			  					String insuid = (String)insucp.get(i);
			  					for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				
			  			%>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if("0".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsuday.size();j++){
			  						SaturnData res = (SaturnData)resultinsuday.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if("1".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<%
			  			///当日养护统计 总计
				  			out.print("<td colspan='2' style='background-color:#80d3d6;'>总计</td>");
				  			out.print("<td style='background-color:#80d3d6;'>");
				  				int varla = 0;
					  			for(int i=0;i<carecode.size();i++){
					  				String carecodei = (String)carecode.get(i);
				  					for(int k=0; k<resultcareday.size();k++){
				  						SaturnData listday = (SaturnData)resultcareday.get(k);
				  						if("1".equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								varla += Integer.parseInt(listday.get("carecount").toString());
				  							}
				  						}
				  					}
					  			}
					  			out.print(varla);
				  			out.print("</td>");
			  				for(int j =0; j<brandser.size();j++){
			  					int varlb = 0;
			  					String brandid = (String)brandser.get(j);
			  					out.print("<td style='background-color:#80d3d6;'>");
			  					for(int i=0;i<carecode.size();i++){
			  						String carecodei = (String)carecode.get(i);
				  					for(int k=0; k<resultcareday.size();k++){
				  						SaturnData listday = (SaturnData)resultcareday.get(k);
				  						if(brandid.equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								varlb += Integer.parseInt(listday.get("carecount").toString());
				  							}
				  						}
				  					}
			  					}
			  					out.print(varlb);
			  					out.print("</td>");
			  				}
			  				out.print("<td style='background-color:#80d3d6;'>");
			  				int varlc = 0;
				  			for(int i=0;i<carecode.size();i++){
				  				String carecodei = (String)carecode.get(i);
			  					for(int k=0; k<resultcareday.size();k++){
			  						SaturnData listday = (SaturnData)resultcareday.get(k);
			  						if("0".equals(listday.get("carseries"))){
			  							if(carecodei.equals(listday.get("careitemvame"))){
			  								varlc += Integer.parseInt(listday.get("carecount").toString());
			  							}
			  						}
			  					}
				  			}
				  			out.print(varlc);
			  				out.print("</td>");
			  			%>

			  			<%
			  			///月
			  				for(int i=0; i<7; i++){
			  					String tdi = "";
			  					String insuid = (String)insucp.get(i);
			  					for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if(insuid.equals(res.get("insurancecompany"))){
			  								tdi = (String)res.get("count");
			  							}
			  						}
			  					}
			  					if(tdi != null){
			  						out.print("<td>"+tdi+"</td>");
			  					}else{
			  						out.print("<td>&nbsp;</td>");
			  					}
			  				}
			  				
			  			%>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if("0".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<td>
			  				<%
				  				for(int j=0; j<resultinsumon.size();j++){
			  						SaturnData res = (SaturnData)resultinsumon.get(j);
			  						if("0".equals(res.get("cararea"))){
			  							if("1".equals(res.get("insurancecompany"))){
			  								String tdi = (String)res.get("count");
			  								out.print(tdi);
			  							}
			  						}
			  					}
			  				%>
			  			</td>
			  			<%
				  			out.print("<td colspan='2' style='background-color:#80d3d6;'>总计</td>");
				  			out.print("<td style='background-color:#80d3d6;'>");
				  				int varlai = 0;
					  			for(int i=0;i<carecode.size();i++){
					  				String carecodei = (String)carecode.get(i);
				  					for(int k=0; k<resultcaremon.size();k++){
				  						SaturnData listday = (SaturnData)resultcaremon.get(k);
				  						if("1".equals(listday.get("carseries"))){
				  							if(carecodei.equals(listday.get("careitemvame"))){
				  								varlai += Integer.parseInt(listday.get("carecount").toString());
				  							}
				  						}
				  					}
					  			}
					  			out.print(varlai);
				  			out.print("</td>");
		  				for(int j =0; j<brandser.size();j++){
		  					int varlb = 0;
		  					String brandid = (String)brandser.get(j);
		  					out.print("<td style='background-color:#80d3d6;'>");
		  					for(int i=0;i<carecode.size();i++){
		  						String carecodei = (String)carecode.get(i);
			  					for(int k=0; k<resultcaremon.size();k++){
			  						SaturnData listday = (SaturnData)resultcaremon.get(k);
			  						if(brandid.equals(listday.get("carseries"))){
			  							if(carecodei.equals(listday.get("careitemvame"))){
			  								varlb += Integer.parseInt(listday.get("carecount").toString());
			  							}
			  						}
			  					}
		  					}
		  					out.print(varlb);
		  					out.print("</td>");
		  				}
		  				out.print("<td style='background-color:#80d3d6;'>");
		  				int varlci = 0;
			  			for(int i=0;i<carecode.size();i++){
			  				String carecodei = (String)carecode.get(i);
		  					for(int k=0; k<resultcaremon.size();k++){
		  						SaturnData listday = (SaturnData)resultcaremon.get(k);
		  						if("0".equals(listday.get("carseries"))){
		  							if(carecodei.equals(listday.get("careitemvame"))){
		  								varlci += Integer.parseInt(listday.get("carecount").toString());
		  							}
		  						}
		  					}
			  			}
			  			out.print(varlci);
		  				out.print("</td>");
			  			%>
			  		</tr>
			  
			  <%} %>
			
			
		</table>
		
	  <%
		}
	  %>
	  
	 
	 
	  
	   <%
	  	List<Map<String,Object>> resultaccordrepairstatistic= (List)request.getAttribute("resultaccordrepairstatistic");
	  	if(resultaccordrepairstatistic != null){
	  %>
	  	<table style="width:600px;">
	  		<tr>
	  			<td rowspan="3" colspan="1">广本</td>
	  			<td></td>
	  			<td>当日</td>
	  			<td>当月</td>
	  		</tr>
			<%
				for(int i=0;i<2;i++){
					out.print("<tr>");
					
					String icode = "";
					if(i==0){
						out.print("<td>正常维修</td>");
						icode = "112001";
					}else{
						out.print("<td>保险维修</td>");
						icode = "112005";
					}
					for(int k=0; k<2;k++){
						out.print("<td>");
						String b1 = "";
						if(k==0){
							b1 = "1";
						}else{
							b1 = "2";
						}
						for(int j=0;j<resultaccordrepairstatistic.size();j++){
							SaturnData a1 = (SaturnData)resultaccordrepairstatistic.get(j);
							if(icode.equals(a1.get("normalrepaircount"))){
								if(b1.equals(a1.get("day_count"))){
									out.print(a1.get("insurancerepaircount"));
								}
							}
						}
						out.print("</td>");
					}
					out.print("</tr>");
				}
			%>
	  	</table>
	  <%} %>	
	  
	   <%
	  	List<Map<String,Object>> resultticketstatistic= (List)request.getAttribute("resultticketstatistic");
	  	if(resultticketstatistic != null){
	  %>
	  	<table style="width:600px;">
	  		<tr>
	  			<td rowspan="3" colspan="1">优惠券</td>
	  			<td></td>
	  			<td>当日</td>
	  			<td>当月</td>
	  		</tr>
			<%
				for(int i=0;i<2;i++){
					out.print("<tr>");
					String icode = "";
					if(i==0){
						out.print("<td>发放</td>");
						icode = "122001";
					}else{
						out.print("<td>使用</td>");
						icode = "122002";
					}
					for(int k=0; k<2;k++){
						out.print("<td>");
						String b1 = "";
						if(k==0){
							b1 = "1";
						}else{
							b1 = "2";
						}
						for(int j=0;j<resultticketstatistic.size();j++){
							SaturnData a1 = (SaturnData)resultticketstatistic.get(j);
							if(icode.equals(a1.get("delivermoney"))){
								if(b1.equals(a1.get("day_flag"))){
									out.print(a1.get("usemoney"));
								}
							}
						}
						out.print("</td>");
					}
					out.print("</tr>");
				}
			%>
	  	</table>
	  <%} %>
	  
	    <%
	  	List<Map<String,Object>> resultmaintainstatistic= (List)request.getAttribute("resultmaintainstatistic");
	  	if(resultmaintainstatistic != null){
	  %>
	  	<table style="width:600px;">
	  		<tr>
	  			<td rowspan="2" colspan="1">保养台次</td>
	  			<td>当日</td>
	  			<td>当月</td>
	  		</tr>
			<tr>
	  			<%
						
					for(int k=0; k<2;k++){
						out.print("<td>");
						String b1 = "";
						if(k==0){
							b1 = "1";
						}else{
							b1 = "2";
						}
						for(int j=0;j< resultmaintainstatistic.size();j++){
							SaturnData a1 = (SaturnData)resultmaintainstatistic.get(j);
							if(b1.equals(a1.get("day_flag"))){
								out.print(a1.get("maintaincount"));
							}
						}
  					out.print("</td>");
					}
				%>
	  		</tr>
	  	</table>
	  <%} %>	
    </div>
</div>
</body>
</html>