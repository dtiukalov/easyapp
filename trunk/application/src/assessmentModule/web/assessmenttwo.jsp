<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="edu.ccut.saturn.component.SaturnDataDefaultValidate"%>
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

<title>考核测试</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/assessmentModule/action/AssessmentTwo.action">
		<fieldset>
		  <legend>考核</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">考核日期:</td>
                     <td class="detailColVal">
                     	<input type="text" value="${servintime}" name="servintime" id="servintime" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   </tr>
                   <tr>
                      <td colspan="8" style="text-align:center;margin-top: 5px;height: 30px;">
						<input id="sub" type="submit" value="查询" />
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>考核结果</label></td>
		</tr>
	</table>

    <div class="tbDiv">
		<table cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
				<td style="width: 100px;height: 20px;">有工单固定客户</td>
				<td>${fixedresult.fixed}</td>
				<td style="width: 100px;height: 20px;">所有固定客户</td>
				<td>${fixedztresult.fixedzt}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">有工单新增客户</td>
				<td>${newcustomernoztresult.newcustomernozt}</td>
				<td style="width: 100px;height: 20px;">所有新增客户</td>
				<td>${newcustomerresult.newcustomer}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">有工单回流客户</td>
				<td>${returncustomernoztresult.returncustomernozt}</td>
				<td style="width: 100px;height: 20px;">所有回流客户</td>
				<td>${returncustomerresult.returncustomer}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">流失客户</td>
				<td>${lostcustomerresult.lostcustomer}</td>
           		<td style="width: 100px;height: 20px;"></td>
				<td></td>
           	</tr>
           	<tr>
           		<td style="width: 100px;height: 20px;">有工单客户内化率</td>
				<td>
					<%
			           	SaturnData fixedresult = (SaturnData)request.getAttribute("fixedresult");
						SaturnData fixedztresult = (SaturnData)request.getAttribute("fixedztresult");
			           	SaturnData newcustomerresult = (SaturnData)request.getAttribute("newcustomerresult");
			           	SaturnData newcustomernoztresult = (SaturnData)request.getAttribute("newcustomernoztresult");
			           	SaturnData returncustomerresult = (SaturnData)request.getAttribute("returncustomerresult");
			           	SaturnData returncustomernoztresult = (SaturnData)request.getAttribute("returncustomernoztresult");
			           	double fixed = 0;
			           	double fixedzt = 0;
			           	double newcustomer = 0;
			           	double newcustomernozt = 0;
			           	double returncustomer = 0;
			           	double returncustomernozt = 0;
			           	double archievs = 0;
			           		if(fixedresult!=null){
			           			fixed = Integer.parseInt(fixedresult.get("fixed").toString());
			           		}
			           		if(fixedztresult!=null){
			           			fixedzt = Integer.parseInt(fixedztresult.get("fixedzt").toString());
			           		}
			           		if(newcustomerresult!=null){
			           			newcustomer = Integer.parseInt(newcustomerresult.get("newcustomer").toString());
			           		}
			           		if(newcustomernoztresult!=null){
			           			newcustomernozt = Integer.parseInt(newcustomernoztresult.get("newcustomernozt").toString());
			           		}
			           		if(returncustomerresult!=null){
			           			returncustomer = Integer.parseInt(returncustomerresult.get("returncustomer").toString());
			           		}
			           		if(returncustomernoztresult!=null){
			           			returncustomernozt = Integer.parseInt(returncustomernoztresult.get("returncustomernozt").toString());
			           		}
			           		if(request.getAttribute("count") != null){
			           			archievs = (Integer)request.getAttribute("count");
			           		}
			           	double aa = 0;
			           	double ab = 0;
			           	if(archievs != 0){
			           		aa = (fixed + newcustomernozt + returncustomernozt)/archievs;
			           		ab = (fixedzt + newcustomer + returncustomer)/archievs;
			           	}
			           out.print(aa);
		           	%>
				</td>
				<td style="width: 100px;height: 20px;">所有客户内化率</td>
				<td><%out.print(ab); %></td>
			</tr>
		</tbody>
		</table>
    </div>
</div>
</body>
</html>