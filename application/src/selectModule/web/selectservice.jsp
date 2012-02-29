<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>维修管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/selectModule/action/SelectService.action">
		<fieldset id="formFiled">
		  	<legend>维修管理</legend>
             	<table cellspacing="5" cellpadding="0">
                   	<tr class="rowClass">
                     	<td class="colName">进厂日期:</td>
                     	<td class="detailColVal" style="width: 340px;height: 22px;">
                     		<input type="text" name="min_servintime" id="min_servintime" value="${min_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                     		<span>至</span>
                     		<input type="text" name="max_servintime" id="max_servintime" value="${max_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                     	</td>
                   		<td class="colName">档案级别:</td>
                     	<td class="detailColVal">
                     		<select id="carcardlevel" name="carcardlevel">
	                       		<option value=""></option>
	                           	<c:forEach items="${dict.crm_cardLevel$}" var="var">				
				           		<c:if test="${var.key==carcardlevel}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=carcardlevel}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>			
				           		</c:forEach>
                       		</select>
                    	</td>
                    	<td class="colName">地区:</td>
                     	<td class="detailColVal">
                     		<select id="cararea" name="cararea">
                       		<option value=""></option>
                        	<c:forEach items="${dict.crm_carArea}" var="var">				
			           			<c:if test="${var.key==cararea}">
		             				<option value="${var.key}" selected>${var.value}</option>
		             			</c:if>	
		             		<c:if test="${var.key!=cararea}">
		             			<option value="${var.key}">${var.value}</option>
		             		</c:if>			
			           		</c:forEach>
                    		</select>
                    	</td>
                	</tr>
            </table>   
             <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询" />
                    <input type="reset" value="重置" />
             </div>   
		</fieldset>           
	</form>
	<table class="optDiv">
		<tr>
			<td><div id="paginate"></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<div>
			<table cellspacing="0" cellpadding="0">
            	<tr>
                   	<th>地区</th>
                   	<th>级别</th>
                   	<th>进厂台次</th>
                   	<th>维修金额</th>
                   	<th>保险金额</th>                  
            	</tr>
           	</table>
		</div>
		<div id="dataDiv">
			<c:if test="${empty result}">
				没有符合条件的数据！
			</c:if>
			<table id="dataTb" cellspacing="0" cellpadding="0">
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
				List carCardLevel = new ArrayList();
					carCardLevel.add("101001");
					carCardLevel.add("101002");
					carCardLevel.add("101003");
					carCardLevel.add("101004");
					carCardLevel.add("101005");
					carCardLevel.add("101006");
				List carCardLevelname = new ArrayList();
					carCardLevelname.add("优");
					carCardLevelname.add("良");
					carCardLevelname.add("中");
					carCardLevelname.add("差");
					carCardLevelname.add("新");
					carCardLevelname.add("死档");
					List<Map<String, Object>> result = (List)request.getAttribute("result"); 
					String fcararea = (String)request.getAttribute("cararea"); 
					String fcarcardlevel = (String)request.getAttribute("carcardlevel"); 
					if(result != null){
						int k = carar.size();
						int karea =0;
						System.out.println(fcararea+"r111111111111");
						if(fcararea != null && fcararea != ""){
							for(int d=0;d<k;d++){
								if(fcararea.equals(carar.get(d))){
									karea = d;
									k = 1;
								}
							}
						}
						for(int ki = 0; ki<k;ki++){
							int lev = carCardLevel.size();
							int levone = 0;
							if(fcarcardlevel != null && fcarcardlevel != ""){
								for(int d=0;d<lev;d++){
									if(fcarcardlevel.equals(carCardLevel.get(d))){
										levone = d;
										lev = 1;
									}
								}
							}
							for(int levi=0;levi<lev;levi++){
								out.print("<tr>");
								if(fcararea != null && fcararea != ""){
									if(levi==0){
										out.print("<td rowspan='6'>");
										out.print(cararname.get(karea));
										out.print("</td>");
									}
								}else{
									if(fcarcardlevel != null && fcarcardlevel != ""){
										if(levi==0){
											out.print("<td>");
											out.print(cararname.get(ki));
											out.print("</td>");
										}
									}else{
										if(levi==0){
											out.print("<td rowspan='6'>");
											out.print(cararname.get(ki));
											out.print("</td>");
										}
									}
								}
								if(fcarcardlevel != null && fcarcardlevel != ""){
									out.print("<td>");
									out.print(carCardLevelname.get(levone));
									out.print("</td>");
								}else{
									out.print("<td>");
									out.print(carCardLevelname.get(levi));
									out.print("</td>");
								}
								int i = result.size();
								int num =0;
								float serviceexp = 0;
								float insourexp = 0;
								for(int j=0; j<i;j++){
									SaturnData carlist = (SaturnData)result.get(j);
									if(fcararea != null && fcararea != ""){
										if(carar.get(karea).equals(carlist.get("cararea"))){
											if(fcarcardlevel != null && fcarcardlevel != ""){
												if(fcarcardlevel.equals(carlist.get("carcardlevel"))){
													num++;
													serviceexp += Float.parseFloat(carlist.get("servrepairexp").toString());
													insourexp += Float.parseFloat(carlist.get("servinsureexp").toString());
												}
											}else{
												if(carCardLevel.get(levi).equals(carlist.get("carcardlevel"))){
													num++;
													serviceexp += Float.parseFloat(carlist.get("servrepairexp").toString());
													insourexp += Float.parseFloat(carlist.get("servinsureexp").toString());
												}
											}
										}
									}else{
										if(carar.get(ki).equals(carlist.get("cararea"))){
											if(fcarcardlevel != null && fcarcardlevel != ""){
												if(fcarcardlevel.equals(carlist.get("carcardlevel"))){
													num++;
													serviceexp += Float.parseFloat(carlist.get("servrepairexp").toString());
													insourexp += Float.parseFloat(carlist.get("servinsureexp").toString());
												}
											}else{
												if(carCardLevel.get(levi).equals(carlist.get("carcardlevel"))){
													num++;
													serviceexp += Float.parseFloat(carlist.get("servrepairexp").toString());
													insourexp += Float.parseFloat(carlist.get("servinsureexp").toString());
												}
											}
										}
									}
								}
								out.print("<td>");
								out.print(num);
								out.print("</td>");
								out.print("<td>");
								out.print(serviceexp);
								out.print("</td>");
								out.print("<td>");
								out.print(insourexp);
								out.print("</td>");
								out.print("</tr>");
							}
						}
					}
				%>
	        </table>
    	</div>
	</div>
</body>
</html>