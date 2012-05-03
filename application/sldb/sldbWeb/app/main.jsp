<%@page import="com.saturn.auth.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function addTab(pageTab, node) {
		pageTab.tabs('add', {
			title : node.text,
			content : '<iframe scrolling="yes" frameborder="0"  src="<%=request.getContextPath()%>' + node.attributes.path + '" style="width:100%;height:100%;"></iframe>',
			iconCls : 'icon-tap',
			closable : true
		});
	}
	
	$(function() {
		$('#navigateTree').tree({
			url: '<%=request.getContextPath()%>/app/auth/resource/listUserResource.action?userId=<%=((User)session.getAttribute("authUser")).getId()%>',
			onClick : function(node) {
				var text = node.text;
				var pageTab = $('#pageTab');
				var tab = pageTab.tabs('getTab', text);
				if (($('#navigateTree').tree('isLeaf',
						node.target) == true ) && (node.attributes!=null)) {
             
					if (tab == null) {
						addTab(pageTab, node);
					} else {
						$.messager.confirm('提示', '"'+text+'"已打开,是否重新打开', function(result){
							if (result){
								pageTab.tabs('close', text);
								addTab(pageTab, node);
							} else {
								pageTab.tabs('select', text);
							}
						});
					}
				}
			}
		});
	});
	
/* 	function show(){
		var date = new Date(); //日期对象
		var now = "";
		now = date.getFullYear()+"年"; //读英文就行了
		now = now + (date.getMonth()+1)+"月"; //取月的时候取的是当前月-1如果想取当前月+1就可以了
		now = now + date.getDate()+"日";
		now = now + date.getHours()+"时";
		now = now + date.getMinutes()+"分";
		now = now + date.getSeconds()+"秒";
		document.getElementById("nowDiv").innerHTML = now; //div的html是now这个字符串 
		setTimeout("show()",1000); //设置过1000毫秒就是1秒，调用show方法
		} */

</script>
</head>
<body class="easyui-layout" onload="show()">
	<div region="north" split="false"
		style="height: 100px; overflow: hidden;">
		<div class="top_img">
	    <div class="user-info" style="float:right;margin-right:-150px;">${authUser.name}    　[<a href="<%=request.getContextPath()%>/app/auth/user/logout.action">退出</a>] </div>
		<div class="menu-info"></div>	
		</div> 
	</div>
	<div region="west" split="true" title="导航栏"
		style="width: 200px; padding1: 10px; overflow: hidden;">
		<div style="padding: 10px;">
			<ul id="navigateTree" class="easyui-tree"></ul>
		</div>
	</div>
	<div region="center" style="overflow: hidden;">
		<div id="pageTab" class="easyui-tabs" fit="true" border="false">
			<div title="首页" style="padding: 10px; overflow: hidden;">欢迎</div>
		</div>
	</div>
</body>
</html>