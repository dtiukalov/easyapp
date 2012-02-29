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
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/assessmentModule/action/Assessment.action">
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
				<td style="width: 100px;height: 20px;">管理内客户</td>
				<td>${magcustomerresult.magcustomer}</td>
				<td style="width: 100px;height: 20px;">管理内自售客户</td>
				<td>${ownmagcustomerresult.ownmagcustomer}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">自售N月首保台次</td>
				<td>${firsthenumresult.firsthenum}</td>
				<td style="width: 100px;height: 20px;">自售N-3月累计销售台次</td>
				<td>${firsthe3numresult.firsthe3num}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">首保客户</td>
				<td>${firstthecustomerresult.firstthecustomer}</td>
				<td style="width: 100px;height: 20px;">自售首保客户</td>
				<td>${ownfirstthecustomerresult.ownfirstthecustomer}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">当月定保车辆回厂台次</td>
				<td>${setthenumresult.setthenum}</td>
				<td style="width: 100px;height: 20px;">当月自售定保车辆回厂台次</td>
				<td>${ownsetthenumresult.ownsetthenum}</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">当月自售过保车回厂台次</td>
				<td>${ownmonthsetthenumresult.ownmonthsetthenum}</td>
				<td style="width: 100px;height: 20px;">自售首保客户维系率</td>
				<td>
				<%
					SaturnData firsthenumresult = (SaturnData)request.getAttribute("firsthenumresult");
					SaturnData firsthe3numresult = (SaturnData)request.getAttribute("firsthe3numresult");
					double firsthenum = 0;
					double firsthe3num = 0;
					double firsthenuml=0;
					if(firsthenumresult!=null){
						firsthenum = Integer.parseInt(firsthenumresult.get("firsthenum").toString());
	           		}
					if(firsthe3numresult!=null){
						firsthe3num = Integer.parseInt(firsthe3numresult.get("firsthe3num").toString());
	           		}
					if(firsthe3num!=0){
						firsthenuml = firsthenum/firsthe3num;
	           		}
					
					out.print(firsthenuml);
				%>
				</td>
			</tr>
			<tr>
				<td style="width: 100px;height: 20px;">定保维系率</td>
				<td>
				<%
					SaturnData setthenumresult = (SaturnData)request.getAttribute("setthenumresult");
					SaturnData magcustomerresult = (SaturnData)request.getAttribute("magcustomerresult");
					SaturnData firstthecustomerresult = (SaturnData)request.getAttribute("firstthecustomerresult");
					double setthenum = 0;
					double magcustomer = 0;
					double firstthecustomer = 0;
					double setthenuml = 0;
					if(setthenumresult!=null){
						setthenum = Integer.parseInt(setthenumresult.get("setthenum").toString());
	           		}
					if(magcustomerresult!=null){
						magcustomer = Integer.parseInt(magcustomerresult.get("magcustomer").toString());
	           		}
					if(firstthecustomerresult!=null){
						firstthecustomer = Integer.parseInt(firstthecustomerresult.get("firstthecustomer").toString());
	           		}
					if((magcustomer-firstthecustomer)!=0){
						setthenuml = (setthenum*3 /(magcustomer-firstthecustomer));
	           		}
					out.print(setthenuml);
				%>
				</td>
				<td style="width: 100px;height: 20px;">自售定保维系率</td>
				<td>
				<%
					SaturnData ownsetthenumresult = (SaturnData)request.getAttribute("ownsetthenumresult");
					SaturnData ownmagcustomerresult = (SaturnData)request.getAttribute("ownmagcustomerresult");
					SaturnData ownfirstthecustomerresult = (SaturnData)request.getAttribute("ownfirstthecustomerresult");
					double ownsetthenum = 0;
					double ownmagcustomer = 0;
					double ownfirstthecustomer = 0;
					double ownmagcustomerl = 0;
					if(ownsetthenumresult!=null){
						ownsetthenum = Integer.parseInt(ownsetthenumresult.get("ownsetthenum").toString());
	           		}
					if(ownmagcustomerresult!=null){
						ownmagcustomer = Integer.parseInt(ownmagcustomerresult.get("ownmagcustomer").toString());
	           		}
					if(ownfirstthecustomerresult!=null){
						ownfirstthecustomer = Integer.parseInt(ownfirstthecustomerresult.get("ownfirstthecustomer").toString());
	           		}
					if((ownmagcustomer-ownfirstthecustomer)!=0){
						ownmagcustomerl = (ownsetthenum*3 /(ownmagcustomer-ownfirstthecustomer));
	           		}
					
					out.print(ownmagcustomerl);
				%>
				</td>
           	</tr>
           	<tr>
				<td style="width: 100px;height: 20px;">过保维系率</td>
				<td>
				<%
					SaturnData monthsetthenumresult = (SaturnData)request.getAttribute("monthsetthenumresult");
					double monthsetthenum = 0;
					double monthsetthenuml = 0;
					if(monthsetthenumresult!=null){
						monthsetthenum = Integer.parseInt(monthsetthenumresult.get("monthsetthenum").toString());
	           		}
					if((magcustomer-firstthecustomer)!=0){
						monthsetthenuml = (monthsetthenum*3 /(magcustomer-firstthecustomer));
	           		}
					out.print(monthsetthenuml);
				%>
				</td>
				<td style="width: 100px;height: 20px;">自售过保维系率</td>
				<td>
				<%
					SaturnData ownmonthsetthenumresult = (SaturnData)request.getAttribute("ownmonthsetthenumresult");
					double ownmonthsetthenum = 0;
					double ownmonthsetthenuml = 0;
					if(ownmonthsetthenumresult!=null){
						ownmonthsetthenum = Integer.parseInt(ownmonthsetthenumresult.get("ownmonthsetthenum").toString());
	           		}
					if((ownmagcustomer-ownfirstthecustomer)!=0){
						ownmonthsetthenuml = (ownmonthsetthenum*3 /(ownmagcustomer-ownfirstthecustomer));
	           		}
					out.print(ownmonthsetthenuml);
				%>
				</td>
           	</tr>
		</tbody>
		</table>
    </div>
</div>
</body>
</html>