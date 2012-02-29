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
		function findExcel(){
			$('#exportForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/DayResultExcel.action";
			$('#exportForm')[0].submit();
		}	
</script> 
<title>售后日报表</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/DayResult.action">
		<fieldset>
		  <legend>售后日报表</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">报表日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${servintime}" name="servintime" id="servintime" onfocus="dayCalender(this)" style="width:120px;"/>
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
	<c:if test="${empty dayresult}">
		<table>
			<tr><td colspan="30">
				<div class="clb-nodata">
					没有符合条件的数据！
				</div>	
				</td>
			</tr>
		</table>	
	</c:if>
	<%
		List<Map<String, Object>> result = (List)request.getAttribute("dayresult");
		if (result != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>${servintime}售后日报表</label></td>
			<td><div id="paginate"><a href="javascript:findExcel();">导出</a></div></td>
		</tr>
	</table>

    <div class="tbDiv">
		<table style='width:1500px;' cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
				<th>序号</th>
				<th>来厂日期</th>
				<th>档案号</th>
				<th>车牌号</th>
				<th>车型</th>
				<th>用户类别</th>
				<th>来厂时间</th>
				<th>修理单号</th>
				<th>交车日期</th>
				<th>维修种类</th>
				<th>分布地区</th>
				<th>用户级别</th>
				<th>接待人员</th>
				<th>零部件费</th>
				<th>零部件折扣</th>
				<th>零部件会员折扣</th>
				<th>工时费</th>
				<th>工时折扣</th>
				<th>工时会员折扣</th>
				<th>代金券</th>
				<th>保险零件</th>
				<th>保险零件折扣</th>
				<th>保险零件会员折扣</th>
				<th>保险工时</th>
				<th>保险工时折扣</th>
				<th>保险工时会员折扣</th>
				<th>维修费用合计</th>
			</tr>
			<%
			LinkedList clearResult = new LinkedList();
			if (!result.isEmpty()) {
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
				dataMap.put("saturnData", data);
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
				
				request.setAttribute("clearResult", clearResult);
			}
			%>
			<c:forEach items="${clearResult}" var="var" varStatus="sta">
	        <tr>
           		<td>
           			${sta.index+1}
           		</td>
           		<td>${var.servintime}</td>
           		<td>${var.carcardid}</td>
           		<td>${var.carlicenceno}</td>
           		<td>${var.carvin}</td>
           		<td>${var.saturnData.servusertype_dict}</td>
           		<td>${var.servintime1}</td>
           		<td>${var.servorderid}</td>
           		<td>${var.servouttime}</td>
           		<td>${var.saturnData.alltype_dict}</td>
           		<td>${var.saturnData.cararea_dict}</td>
           		<td>${var.saturnData.carcardlevel_dict}</td>
           		<td>${var.saturnData.servstaff_dict}</td>
           		<td>${var.servpartsexp}</td>
           		<td>${var.servpartsreb}</td>
           		<td>${var.servPartsMembReb}</td>
           		<td>${var.servhoursexp}</td>
           		<td>${var.servhoursreb}</td>
           		<td>${var.servHoursMembReb}</td>
           		<td>${var.servticketexp}</td>
           		<td>${var.in_servpartsexp}</td>
           		<td>${var.in_servpartsreb}</td>
           		<td>${var.in_servPartsMembReb}</td>
           		<td>${var.in_servhoursexp}</td>
           		<td>${var.in_servhoursreb}</td>
           		<td>${var.in_servHoursMembReb}</td>
           		<td>${var.servamountexp}</td>
	         </tr>
	         </c:forEach>
		</tbody>
		</table>
		<table style="border-bottom-style: none;height: 10px;width: 1500px; margin-top: 10px;">&nbsp;</table>
    </div>
 	<%
		}
	%>
</div>
<div style="display:none;">
	<form id="exportForm" name="exportForm" method="post">
		<input type="hidden" name="servintime" value="${servintime}">
		
	</form>
</div>
</body>
</html>