<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
function selectType(){
	var value = $('#datetime :selected').val();
	if(value=='0'){
		$('#in_time').hide();
		$('#out_time').show();
	}
	if(value=='1'){
		$('#in_time').show();
		$('#out_time').hide();
	}
}
function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/yanghus.action";
			$('#hiddenForm')[0].submit();
}
		
</script>

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>

<title>养护</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/querycaresec.action">
		<fieldset>
		  <legend>养护</legend>
              <table cellspacing="0" cellpadding="0">
                   <tr> 
                   <td style="width:5%;"></td>                   
				  	<td>
				  		<select id="datetime" onChange="selectType();">
				  			<option value="1" selected="selected">进厂日期</option>
				  			<option value="0">出厂日期</option>
				  		</select>
				  	</td>
                     <td class="detailColVal" style="width:35%;">
                     <div id="in_time">
                    	<input type="text" name="min_careInTime" value="" id="min_careInTime" onfocus="dayCalender(this)" class="Wdate"/>
                        	<span>至</span>
                        <input type="text" name="max_careInTime" value="" id="max_careInTime" onfocus="dayCalender(this)" class="Wdate"/>
                     </div>
                     <div id="out_time" style="display:none;">
                     	<input type="text" name="min_careOutTime" value="" id="min_careOutTime" onfocus="dayCalender(this)" class="Wdate"/>
                        	<span>至</span>
                        <input type="text" name="max_careOutTime" value="" id="max_careOutTime" onfocus="dayCalender(this)" class="Wdate"/>
                     </div>
                      </td>
                      <td style="text-align:center;">
						<input id="sub" type="submit" value="查询"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty resultlist}">
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
		List<Map<String, Object>> resultlist = (List)request.getAttribute("resultlist");
		if (resultlist != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><div id="paginate">养护</div></td>
			<td><div class="optAdd"><a href="javascript:exportExcel();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table style="width: 320px">
			<%
				List aaa = new ArrayList();
				for(int a = 0;a<resultlist.size();a++){
					SaturnData ai = (SaturnData)resultlist.get(a);
					aaa.add(ai.get("value"));
				}
				Iterator it1 = aaa.iterator();
				  Hashtable ht = new Hashtable();
				  while(it1.hasNext()){
				   Object obj = it1.next();
				   ht.put(obj, obj);
				  }
				  Iterator it2 = ht.keySet().iterator();
				  aaa = new ArrayList();
				  while(it2.hasNext()){
				   aaa.add(it2.next());
				  }
				
				
			%>
			<%
				if(resultlist == null){
					resultlist = new ArrayList();
				}
			%>
			<tr>
				<td rowspan="2" style="width: 80px">服务顾问</td>
				<%
					for(int i=0;i<aaa.size();i++){
						out.print("<td colspan='2' style='width: 120px'>");
							out.print(aaa.get(i));
						out.print("</td>");
					}
				%>
				<td colspan="2" style="width: 120px">小计</td>
			</tr>
			<tr>
				<%
					for(int i=0;i<aaa.size();i++){
						out.print("<td>");
							out.print("金额");
						out.print("</td>");
						out.print("<td>");
							out.print("桶数");
						out.print("</td>");
					}
				%>
				<td>金额</td>
				<td>桶数</td>
			</tr>
			<%
			DecimalFormat formater = new DecimalFormat("#.##");
			List<Map<String, Object>> result= (List)request.getAttribute("result");
			for(int i=0;i<result.size();i++){
				SaturnData rowst = (SaturnData)result.get(i);
				out.print("<tr>");
					out.print("<td>");
						out.print(rowst.get("value"));
					out.print("</td>");
					double cexpense = 0;
					int cbtnum = 0;
					for(int j=0;j<aaa.size();j++){
						double xf = 0;
						int xi = 0;
						for(int a = 0;a<resultlist.size();a++){
							SaturnData ai = (SaturnData)resultlist.get(a);
							if(rowst.get("carestaff").equals(ai.get("carestaff"))){
								if(aaa.get(j).equals(ai.get("value"))){
									xf = Double.parseDouble(ai.get("careexpense").toString());
									cexpense += Double.parseDouble(ai.get("careexpense").toString());
									xi = Integer.parseInt(ai.get("carebucketnum").toString());
									cbtnum += Integer.parseInt(ai.get("carebucketnum").toString());
								}
							}
						}
						out.print("<td>");
						if(xi != 0){
							out.print(formater.format(xf));	
						}
						out.print("</td>");
						out.print("<td>");
						if(xi != 0){
							out.print(xi);	
						}
						out.print("</td>");
					}
					out.print("<td>");
					if(cbtnum != 0){
						out.print(formater.format(cexpense));	
					}
					out.print("</td>");
					out.print("<td>");
					if(cbtnum != 0){
						out.print(cbtnum);	
					}
					out.print("</td>");
				out.print("</tr>");
			}
			%>
			<tr>
				<td>总计</td>
				<%
				double fa = 0;
				int ia = 0;
				for(int j=0;j<aaa.size();j++){
					double cexpense = 0;
					int cbtnum = 0;		
					for(int i=0;i<result.size();i++){
						SaturnData rowst = (SaturnData)result.get(i);
							for(int a = 0;a<resultlist.size();a++){
								SaturnData ai = (SaturnData)resultlist.get(a);
								if(rowst.get("carestaff").equals(ai.get("carestaff"))){
									if(aaa.get(j).equals(ai.get("value"))){
										cexpense += Double.parseDouble(ai.get("careexpense").toString());
										fa += Double.parseDouble(ai.get("careexpense").toString());
										cbtnum += Integer.parseInt(ai.get("carebucketnum").toString());
										ia += Integer.parseInt(ai.get("carebucketnum").toString());
									}
								}
							}
						}
						out.print("<td>");
						if(cbtnum != 0){
							out.print(formater.format(cexpense));	
						}
						out.print("</td>");
						out.print("<td>");
						if(cbtnum != 0){
							out.print(cbtnum);	
						}
						out.print("</td>");
					}
					out.print("<td>");
					if(ia != 0){
						out.print(formater.format(fa));	
					}
					out.print("</td>");
					out.print("<td>");
					if(ia != 0){
						out.print(ia);	
					}
					out.print("</td>");
				%>	
			</tr>	
		</table>
    </div>
    <%
		}
	%>
</div>

<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="min_careInTime" id="min_careInTime" value='${min_careInTime}'>
		<input type="hidden" name="max_careInTime" id="max_careInTime" value='${max_careInTime}'>
		<input type="hidden" name="min_careOutTime" id="min_careOutTime" value='${min_careOutTime}'>
		<input type="hidden" name="max_careOutTime" id="max_careOutTime" value='${max_careOutTime}'>
	</form>
</div>
</body>
</html>