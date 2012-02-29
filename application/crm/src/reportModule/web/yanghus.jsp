<%@ page contentType="application/vnd.ms-excel; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>


</head>
<body>

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
    
    <div class="tbDiv">
		<table style="width: 320px; color: #000" border="1">
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

</body>
</html>