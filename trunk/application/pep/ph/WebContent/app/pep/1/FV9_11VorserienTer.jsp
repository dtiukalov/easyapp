<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
			<style type="text/css">
	.coo .tab {
		background:#000;
		font-size:12px;
		width:800px;
	}
	.coo .tab td{
		background:#fff;
		width:20px;
	}
	.coo .tab .taba {
		width:800px;
	}
	.coo .tab .taba .lg{
		width:230px;
	}
	.coo .tab .taba .bt{
		width:444px;
	}
	.coo .tab  .taba .bz{
		width:230px;
	}
	.coo .bt h3 {
		text-align:center;
		font-size:18px;
	}
	.coo .ka {
		width:64px;
		height:15px;
		border:1px solid #d0d0d0;
	}
	.coo .kb {
		background-color:#afafaf;
		width:190px;
	}
	.coo .kc {
		background-color:#3e3e3e;
		color:#FFF;
		width:103px;
	}
	.coo .tab .a {
		width:232px;
	}
	.coo .tab .b {
		width:440px;
	}
	.coo .tab .c {
		width:232px;
	}
		
	</style>
	<%
		String uid = (String)request.getAttribute("uid");
		String sop_start = (String)request.getSession().getAttribute("DATE_SOP");
		String year = "";
		String week = "";
		
		if(sop_start != null ){
			week = String.valueOf(DateUtils.getWeekOfYear(sop_start + " 00:00"));
		}
		
		if(sop_start != null){
			year = sop_start.split("-")[0];
		}
		
		String project = (String)request.getSession().getAttribute("project");
		
		if(project == null){
			project = "";
		}
		
		String version = "( V2 )Entwurf";
		String date = "30.01.12";

		Map __form = (Map)request.getAttribute("form");
		out.print(Web.getFormState(__form));	
	
		List indexes = (List)request.getSession().getAttribute("indexes"); 
		String current = (String)request.getAttribute("current");
		
		if (current == null) {
			current = "1";
		} 
		
		int cur = Integer.parseInt(current);
		
		/* String next = "<img src=\"/ph/app/pep/images/n.jpg\" width=\"40\" height=\"70\">";
		String prev = "<img src=\"/ph/app/pep/images/p.jpg\" width=\"40\" height=\"70\">"; */
		String next = "<img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\">";
		String prev = "<img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\">";
		if (indexes != null) {
			int pageSize = indexes.size();
			
			if (cur > 1) {
				prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'><img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			}
			
			if (cur < pageSize) {
				next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'><img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			}
		}
	%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top" style="margin-left: 35px;">
					<div class="fl"><%=status_left %></div>
					<div class="fr"><%=status_right %></div>
					<h1><%=title %></h1>
				</div>
				<div id="content" style="padding-left: 65px;">
					<p></p>
					<div class="coo"><table border="0" cellpadding="1" cellspacing="1" class="tab">
					  <tr>
					    <td><table  height="60" border="0" cellpadding="0" cellspacing="0" class="taba">
					      <tr>
					        <td width="260" class="lg"><img src="../images/FAWVW-logo.jpg"/></td>
					        <td width="384" class="bt"><h3><%=project %> Vorserien-Ablauf </h3>
					        <h3>SOP <%=week%>/<%=year %></h3></td>
					        <td width="287" class="bz">
					        	<h3><div style="float:right;margin-right:20px;font-size:12px;">Status:<%=version %></div></h3><br>
								<h3><div style="float:right;margin-right:20px;font-size:12px;">Ausgabe:<%=date %></div></h3>
							</td>
					      </tr>
					    </table></td>
					  </tr>
					  <tr>
					    <td style="hight:400px">
					    <iframe id="ff" name= "ff" frameborder="0" scrolling="no" 
					    src="<%=request.getContextPath() %>/app/pep/1/GanttChart3.jsp?uid=<%=uid %>" style="width:850px;height:400px;">
					    </iframe>
					    </td>
					  </tr>
					</table>
					</div>
				</div>
				<div id="footer" style="margin-left: 35px;">
					<div class="foot">
						<!-- <div class="lanst">&nbsp;</div> -->
						<div class="lanstk"><%=oraganization %></div>
						<div class="clear"></div>
				    </div>
					<div class="ft">
						<div class="ztu">
							<a href="<%=request.getContextPath() %>/app/pep/initworkspace.jsp" class="link">
								<img src="<%=request.getContextPath() %>/app/pep/images/footerlogo.jpg" width="130px" height="37px" style="border: 0px;"/>
							</a>
						</div>
					    <div class="page">
					    <%-- <div id="texiao" height="200px" width="50px">
					    	<div class="P"><%=prev %></div>
							<div class="N"><%=next %></div>
						</div> --%>
						    <P><%=prev %>Seite<%=current %><%=next %></P>
					    </div>
					    <div class="ylogo">
					    <%
					    if ("fawvw".equalsIgnoreCase(platformType)) {
				    	%>
				 	    <img src="<%=request.getContextPath() %>/app/pep/images/FAWVW-logo.jpg" width="120px" height="41px"/>
				 	    <%		
					    }
					    if ("audi".equalsIgnoreCase(platformType)) {
					    %>
					    <img src="<%=request.getContextPath() %>/app/pep/images/Audi-logo.jpg" width="120px" height="41px"/>
					    <%	
					    }
					    %>
					    
					    </div>
					    <div class="clear"></div>
				    </div>
				</div>
				<div class="clear"></div>

			</div>	
		</div>
	</body>
</html>
