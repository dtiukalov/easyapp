<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="edu.ccut.saturn.component.IDataItem"%>
<%@page import="edu.ccut.saturn.component.IDictItemInfo"%>
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
	function hondanewsscarestatistic(){
			$('#exportForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/HondaNewCarestatistic.action";
			$('#exportForm')[0].submit();
		}
</script>
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
	
	//List carecode = new ArrayList();
	
		//carecode.add("123001");
		//carecode.add("123002");
		//carecode.add("123003");
		//carecode.add("123004");
		//carecode.add("123005");
		//carecode.add("123006");
		//carecode.add("123007");
		//carecode.add("123008");
		//carecode.add("123009");
		//carecode.add("123010");
		//carecode.add("123011");
		//carecode.add("123012");
		//carecode.add("123013");
		//carecode.add("123014");
		//carecode.add("123015");
		//carecode.add("123016");
		//carecode.add("123017");
		//carecode.add("123018");
		//carecode.add("123101");
	//List carename = new ArrayList();
		//carename.add("引擎清洗剂");
		//carename.add("引擎保护剂");
		//carename.add("喷油嘴清洗剂");
		//carename.add("空调清洗剂");
		//carename.add("油路清洗剂");
		//carename.add("超强修复剂");
		//carename.add("三元催化清洗剂");
		//carename.add("节气门清洗剂");
		//carename.add("水箱清洗剂");
		//carename.add("水箱保护剂");
		//carename.add("机油添加剂");
		//carename.add("燃油清洁剂");
		//carename.add("高效进气系统清洗剂");
		//carename.add("燃油系统快速高效清洗剂");
		//carename.add("发动机润滑系统快速高效清洗剂");
		//carename.add("发动机保护剂");
		//carename.add("三元催化专用清洗液");
		//carename.add("空调清洗剂");
		//carename.add("燃油清洁剂（油箱）");
	
%>
<title>售后车辆当日流量表</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/HondaCarestatistic.action">
		<fieldset>
		  <legend>售后车辆当日流量表</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">统计日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${statisticdate}" name="statisticdate" id="statisticdate" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   </tr>
                   <tr>
                      <td colspan="8" style="text-align:center;">
						<input id="sub" type="submit" value="查询"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty resultcareday}">
		<table>
			<tr><td colspan="30">
				<div style="width: 200px;height: auto;">
					没有符合条件的数据！
				</div>	
				</td>
			</tr>
		</table>	
	</c:if>
	<%
////////////保险
			List<Map<String,Object>> resultcareday= (List)request.getAttribute("resultcareday");
	      	List<Map<String,Object>> resultcaremon= (List)request.getAttribute("resultcaremon");
		  	if(resultcareday != null){
		  %>
    <table class="optDiv">
		<tr>
			<td><label class="rsTitle" >${statisticdate}售后车辆当日流量(养护品)</label></td>
			<td><div id="paginate"><a href="javascript:hondanewsscarestatistic();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
	<table>
	  		<tr>
	  			<td rowspan='1' colspan="6" style='background-color:#80d3d6;width: 200px'>当日养护品统计(桶数)</td>
	  			<td rowspan='1' colspan="6" style='background-color:#80d3d6;width: 200px'>当月养护品统计(桶数)</td>
	  		</tr>
	  		<tr>
	  			<td colspan="1" style='background-color:#80d3d6;'>种类</td>
	  			<td style='background-color:#80d3d6;'>总计</td>
	  			<td style='background-color:#80d3d6;'>CRV</td>
	  			<td style='background-color:#80d3d6;'>CIVIC</td>
	  			<td style='background-color:#80d3d6;'>SPIRIOR</td>
	  			<td style='background-color:#80d3d6;'>其他</td>
	  			
	  			<td colspan="1" style='background-color:#80d3d6;'>种类</td>
	  			<td style='background-color:#80d3d6;'>总计</td>
	  			<td style='background-color:#80d3d6;'>CRV</td>
	  			<td style='background-color:#80d3d6;'>CIVIC</td>
	  			<td style='background-color:#80d3d6;'>SPIRIOR</td>
	  			<td style='background-color:#80d3d6;'>其他</td>
	  		</tr>
	  		<%
	  			//日养护总计
	  			for(int i=0;i<carecode.size();i++){
	  				out.print("<tr>");
	  				out.print("<td>"+carename.get(i)+"</td>");
	  				String codei = (String)carecode.get(i);
	  				int zongji = 0;
	  				for(int j=0;j<resultcareday.size();j++){
	  					SaturnData row = (SaturnData)resultcareday.get(j);
	  					if(codei.equals(row.get("careitemvame"))){
		  					zongji += Integer.parseInt(row.get("carecount").toString());
		  				}
	  				}
	  				if(zongji == 0){
	  					out.print("<td>&nbsp;</td>");
	  				}else{
	  					out.print("<td>"+zongji+"</td>");
	  				}
	  				for(int m=0; m<brandser.size();m++){
	  					String ser = (String)brandser.get(m);
	  					int var = 0;
	  					for(int j=0;j<resultcareday.size();j++){
		  					SaturnData row = (SaturnData)resultcareday.get(j);
		  					if(codei.equals(row.get("careitemvame"))){
		  						if(ser.equals(row.get("carseries"))){
		  							var = Integer.parseInt(row.get("carecount").toString());
		  						}
			  				}
		  				}
	  					if(var == 0){
		  					out.print("<td>&nbsp;</td>");
		  				}else{
		  					out.print("<td>"+var+"</td>");
		  				}
	  				}
	  			//月养护总计
	  				int zongjim = 0;
	  				out.print("<td>"+carename.get(i)+"</td>");
	  				for(int j=0;j<resultcaremon.size();j++){
	  					SaturnData row = (SaturnData)resultcaremon.get(j);
	  					if(codei.equals(row.get("careitemvame"))){
	  						zongjim += Integer.parseInt(row.get("carecount").toString());
		  				}
	  				}
	  				if(zongjim == 0){
	  					out.print("<td>&nbsp;</td>");
	  				}else{
	  					out.print("<td>"+zongjim+"</td>");
	  				}
	  				for(int m=0; m<brandser.size();m++){
	  					String ser = (String)brandser.get(m);
	  					int var = 0;
	  					for(int j=0;j<resultcaremon.size();j++){
		  					SaturnData row = (SaturnData)resultcaremon.get(j);
		  					if(codei.equals(row.get("careitemvame"))){
		  						if(ser.equals(row.get("carseries"))){
		  							var = Integer.parseInt(row.get("carecount").toString());
		  						}
			  				}
		  				}
	  					if(var == 0){
		  					out.print("<td>&nbsp;</td>");
		  				}else{
		  					out.print("<td>"+var+"</td>");
		  				}
	  				}
	  			}
	  			out.print("</tr>");
	  		%>
	  		<tr>
	  			<td>总计</td>
				<%
					int allji = 0;
					for(int i = 0; i<brandser.size();i++){
						String ser = (String)brandser.get(i);
						for(int j=0;j<carecode.size();j++){
							String codeb = (String)carecode.get(j);
							for(int k=0;k<resultcareday.size();k++ ){
								SaturnData row = (SaturnData)resultcareday.get(k);
								if(ser.equals(row.get("carseries"))){
									if(codeb.equals(row.get("careitemvame"))){
										allji += Integer.parseInt(row.get("carecount").toString());
									}
								}
							}
						}
					}
					if(allji == 0){
						out.print("<td>&nbsp;</td>");
					}else{
						out.print("<td>"+allji+"</td>");
					}
					for(int i = 0; i<brandser.size();i++){
						String ser = (String)brandser.get(i);
						int oth = 0;
						for(int j=0;j<carecode.size();j++){
							String codeb = (String)carecode.get(j);
							for(int k=0;k<resultcareday.size();k++ ){
								SaturnData row = (SaturnData)resultcareday.get(k);
								if(ser.equals(row.get("carseries"))){
									if(codeb.equals(row.get("careitemvame"))){
										oth += Integer.parseInt(row.get("carecount").toString());
									}
								}
							}
						}
						if(oth == 0){
							out.print("<td>&nbsp;</td>");
						}else{
							out.print("<td>"+oth+"</td>");
						}
					}
					
				%>
				<td>总计</td>
				<%
				//月
					int othser = 0;
				
					for(int i = 0; i<brandser.size();i++){
						String ser = (String)brandser.get(i);
						for(int j=0;j<carecode.size();j++){
							String codeb = (String)carecode.get(j);
							for(int k=0;k<resultcaremon.size();k++ ){
								SaturnData row = (SaturnData)resultcaremon.get(k);
								if(ser.equals(row.get("carseries"))){
									if(codeb.equals(row.get("careitemvame"))){
										othser += Integer.parseInt(row.get("carecount").toString());
									}
								}
							}
						}
					}
					if(othser == 0){
						out.print("<td>&nbsp;</td>");
					}else{
						out.print("<td>"+othser+"</td>");
					}
					for(int i = 0; i<brandser.size();i++){
						String ser = (String)brandser.get(i);
						int oth = 0;
						for(int j=0;j<carecode.size();j++){
							String codeb = (String)carecode.get(j);
							for(int k=0;k<resultcaremon.size();k++ ){
								SaturnData row = (SaturnData)resultcaremon.get(k);
								if(ser.equals(row.get("carseries"))){
									if(codeb.equals(row.get("careitemvame"))){
										oth += Integer.parseInt(row.get("carecount").toString());
									}
								}
							}
						}
						if(oth == 0){
							out.print("<td>&nbsp;</td>");
						}else{
							out.print("<td>"+oth+"</td>");
						}
					}
					
				%>
	  		</tr>	
		 	
		</table>
	
    </div>
    <%} %>	
    <div style="display:none;">
	<form id="exportForm" name="exportForm" method="post">
		<input type="hidden" name="statisticdate" value="${statisticdate}">
	</form>
</div>
</div>
</body>
</html>