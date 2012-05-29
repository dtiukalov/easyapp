<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.saturn.tc.utils.International"%>
<%@page import="com.teamcenter.soa.client.model.strong.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=International.get(request, "changepass")%></title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	$(function() {
		$('#old').focus();
		
		<%
		Object result = request.getParameter("result");
		if (result != null) {
			
		%>
			
			var flag = '<%=result%>';
			if (flag == '1') {
				alert('<%=International.get(request, "pass.success")%>');
				window.location = '<%=request.getContextPath()%>/app/tc/logout.do';
			}
			if (flag == '2') {
				alert('<%=International.get(request, "pass.fail")%>');
				window.history.back();
			}
			if (flag == '3') {
				alert('<%=International.get(request, "pass.err")%>');
				window.history.back();
			}
			
			/*$.messager.show({
				title:'信息',
				msg:'',
				showType:'show',
				location.href : ''
			});*/
		<%
		}
		%>
	});
</script>
</head>
<%
	String userid = (String)request.getAttribute("userid");
	if(userid == null){
		userid = (String) request.getParameter("userid");
	}
%>
<body>
	<%
	String company = "admin";
	String userName = "admin";
	if( !userid.equalsIgnoreCase("admin")){
		User user = (User) request.getSession().getAttribute("TC_USER");
		userName = user.get_user_name();
	    company = (String)request.getSession().getAttribute("company");
	}
	%>
	<div region="north" split="false"
		style="height: 100px; overflow: hidden;">
		<div class="top_img">
		<div class="menu-logo">
				<div class="menu-info"><%=International.get(request, "login_title") %></div>
			</div>
	    	<div  class="cnen-info">
	    		<table>
	    			<tr><td><%=company %></td><td><%=International.get(request, "username") %>:<%=userName%></td></tr>
	    		</table>
	    	</div>
	    	
		</div> 
	</div>

	<div id="panel" class="easyui-panel" title="<%=International.get(request, "changepass")%>"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/tc/changePassword.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span><%=International.get(request, "pass.old")%>:</td>
					<td><input id="old" name="old" type="password"></input></td>
					<td>
						<div id="oldTip"></div>
					</td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span><%=International.get(request, "pass.new")%>:</td>
					<td><input id="newP" name="newP" type="password"></input></td>
					<td>
						<div id="newPTip"></div>
					</td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span><%=International.get(request, "pass.re.enter")%>:</td>
					<td><input id="newP2" name="newP2" type="password"></input></td>
					<td>
						<div id="newP2Tip"></div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="edit()"><%=International.get(request, "ok")%></a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel"><%=International.get(request, "cancel")%></a>
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="<%=userid%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#old").formValidator({
			onfocus : "<%=International.get(request, "pass.lengthvalide")%>"
		}).inputValidator({
			min : 5,
			max : 12
		});
		
		$("#newP").formValidator({
			onfocus : "<%=International.get(request, "pass.lengthvalide")%>"
		}).inputValidator({
			min : 5,
			max : 12
		});
		
		$("#newP2").formValidator({
			onfocus : "<%=International.get(request, "pass.lengthvalide")%>"
		}).inputValidator({
			min : 5,
			max : 12
		}).functionValidator({
			fun : function() {
				var newP = $('#newP').val();
				var newP2 = $('#newP2').val();
				
				this.isvalid = (newP == newP2);
			},
			onerror : "<%=International.get(request, "pass.notmatch")%>"
		});
	});
</script>
</html>