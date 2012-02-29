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

<title>台次</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/Quantity.action">
		<fieldset>
		  <legend>台次</legend>
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">日期:</td>
                     <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_servintime" value="${min_servintime}" id="min_servintime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_servintime" value="${max_servintime}" id="max_servintime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td style="text-align:center;">
						<input id="sub" type="submit" value="查询"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty resultin}">
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
		List<Map<String, Object>> resultin = (List)request.getAttribute("resultin");
		if (resultin != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><div id="paginate">台次</div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table style="width: 320px">
			<%
				List<Map<String, Object>> resultout= (List)request.getAttribute("resultout");
				if(resultin == null){
					resultin = new ArrayList();
				}
				if(resultout == null){
					resultout = new ArrayList();
				}
			%>
			<%
				List result = new ArrayList();
				for(int a = 0;a<resultin.size();a++){
					SaturnData ai = (SaturnData)resultin.get(a);
					if(ai.get("value")!=null){
						result.add(ai.get("value"));
					}
				}
				for(int b = 0;b<resultout.size();b++){
					SaturnData bi = (SaturnData)resultout.get(b);
					if(bi.get("value")!=null){
						result.add(bi.get("value"));
					}
				}
				Iterator it1 = result.iterator();
				  Hashtable ht = new Hashtable();
				  while(it1.hasNext()){
				   Object obj = it1.next();
				   ht.put(obj, obj);
				  }
				  Iterator it2 = ht.keySet().iterator();
				  result = new ArrayList();
				  while(it2.hasNext()){
				   result.add(it2.next());
				  }
				
				
			%>
				<tr>
					<td style="width: 80px" rowspan="2">服务顾问</td>
					<td colspan="2" style="width: 100px">首保</td>
					<td colspan="2" style="width: 100px">定保</td>
					<td colspan="2" style="width: 100px">一般维修</td>
					<td colspan="2" style="width: 100px">钣喷</td>
					<td colspan="2" style="width: 100px">保修</td>
					<td colspan="2" style="width: 100px">保险事故</td>
					<td colspan="2" style="width: 100px">小计</td>
					<td colspan="1" rowspan="2" style="width: 80px">总计</td>
				</tr>
				<tr>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
					<td colspan="1" >进厂</td>
					<td colspan="1" >交车</td>
				</tr>
			<%
				List servtypelist = new ArrayList();
				servtypelist.add("112004");
				servtypelist.add("112001");
				servtypelist.add("112005");
				servtypelist.add("112002");
				servtypelist.add("112009");
				servtypelist.add("112003");
			%>
			<%
				//List<Map<String, Object>> result= (List)request.getAttribute("result");
				for(Integer i=0; i< result.size(); i++){
					out.print("<tr>");
						out.print("<td>");
							out.print(result.get(i));
						out.print("</td>");
						int a =0;
						int b =0;
						for(Integer j = 0; j<6;j++){
							out.print("<td>");
							for(int k=0;k<resultin.size();k++){
								SaturnData incode = (SaturnData)resultin.get(k);
								if(result.get(i).equals(incode.get("value"))){
									if(servtypelist.get(j).equals(incode.get("servtype"))&& incode.get("servtype")!=null){
										out.print(incode.get("countn"));
										a += Integer.parseInt(incode.get("countn").toString());
									}
								}
							}
							out.print("</td>");	
							out.print("<td>");
							for(int k=0;k<resultout.size();k++){
								SaturnData incode = (SaturnData)resultout.get(k);
								if(result.get(i).equals(incode.get("value"))){
									if(servtypelist.get(j).equals(incode.get("servtype"))&& incode.get("servtype")!=null){
										out.print(incode.get("countn"));
										b += Integer.parseInt(incode.get("countn").toString());
									}
									
								}
							}
							out.print("</td>");	
						}
						
						out.print("<td>");
							if(a!=0){
								out.print(a);
							}
						out.print("</td>");	
						out.print("<td>");
							if(b!=0){
								out.print(b);
							}
						out.print("</td>");	
						out.print("<td>");
						if(a+b!=0){
							out.print(a+b);
						}
					out.print("</td>");	
					out.print("</tr>");
				}	
			%>
			<%
			out.print("<tr>");
				out.print("<td>");
					out.print("总计");
				out.print("</td>");
				
					int a =0;
					int b =0;
					for(Integer j = 0; j<6;j++){
						out.print("<td>");
						int c=0;
						for(Integer i=0; i< result.size(); i++){
							for(int k=0;k<resultin.size();k++){
								SaturnData incode = (SaturnData)resultin.get(k);
								if(result.get(i).equals(incode.get("value"))){
									if(servtypelist.get(j).equals(incode.get("servtype"))&& incode.get("servtype")!=null){
										c+=Integer.parseInt(incode.get("countn").toString());
										a += Integer.parseInt(incode.get("countn").toString());
									}
								}
							}
						}
							out.print(c);
						out.print("</td>");	
						out.print("<td>");
						int d=0;
						for(Integer i=0; i< result.size(); i++){
							for(int k=0;k<resultout.size();k++){
								SaturnData incode = (SaturnData)resultout.get(k);
								if(result.get(i).equals(incode.get("value"))){
									if(servtypelist.get(j).equals(incode.get("servtype"))&& incode.get("servtype")!=null){
										d+=Integer.parseInt(incode.get("countn").toString());
										b += Integer.parseInt(incode.get("countn").toString());
									}
									
								}
							}
						}
						out.print(d);
						out.print("</td>");	
					}
					
					out.print("<td>");
						if(a!=0){
							out.print(a);
						}
					out.print("</td>");	
					out.print("<td>");
						if(b!=0){
							out.print(b);
						}
					out.print("</td>");	
					out.print("<td>");
					if(a+b!=0){
						out.print(a+b);
					}
				out.print("</td>");	
			out.print("</tr>");
			%>			
		</table>
    </div>
    <%
		}
	%>
</div>
</body>
</html>