<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<style type="text/css">
	.coo .tab {
		background:#000;
		font-size:12px;
		width:700px;
	}
	.coo .tab td{
		background:#fff;
		width:20px;
	}
	.coo .tab .taba {
		width: 850px;
	}
	.coo .tab .taba .lg{
		width:200px;
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
		String project = (String)request.getSession().getAttribute("project");
	%>
</head>
<body>	
	<div id="container">
		<div id="nr" style="margin-left:35px;">
		<div id="top">
			<div class="fl"><%=status_left %></div>
			<div class="fr"><%=status_right %></div>
			<h1><%=title %></h1>
		</div>
		<div id="content" style="margin:60px 30px;height:480px;">
			<div class="coo">
				<table border="0" cellpadding="1" cellspacing="1" class="tab" >
					  <tr>
					    <td>
					    	<table height="60" border="0" cellpadding="0" cellspacing="0" class="taba">
						      <tr>
						        <td class="lg"><div style="margin-left:10px"><img src="../images/logo.jpg"/></div></td>
						        <td class="bt"><h3><%=project%> Anlaufübersicht</h3>
						       	</td>
						        <td class="bz">
						        	<h3><i><div style="float:right;margin-right:80px;font-size:14px;">Version:6.0</div></i></h3><br>
						        	<h3><i><div style="float:right;margin-right:20px;font-size:14px;">Ausgabe:18.10.2011</div></i></h3>
						         </td>
						      </tr>
					   	 	</table>
					    </td>
					  </tr>
				 	 <tr>
					    <td>
						    <iframe id="ff" name= "ff" frameborder="0" scrolling="no"
						    src="<%=request.getContextPath() %>/app/pep/1/GanttChart2.jsp?uid=<%=uid %>" 
						    style="width:850px;height:300px;margin:0 10px;">
						    </iframe>
					    </td>
				 	 </tr>
				</table>
			</div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
	</div>
</body>
</html>