<%@page import="com.saturn.sldb.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.saturn.sldb.PersonSub"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>家庭成员信息页</title>
	<%@ include file="/app/includes/header.jsp"%>

	<% 
		String pid = request.getParameter("pid");
	
		Person person = Person.get(pid);
		List subs = PersonSub.getByPid(pid);
	%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '核对结果',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/check/list.action?pid=<%=pid%>',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 150,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'key',
					title : '名称',
					width : 180,
					sortable : true
				}, {
					field : 'result',
					title : '结果',
					width : 350,
					sortable : true
				}, {
					field : 'infoType',
					title : '导入类型',
					width : 70,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						var urlStr = "";
						if(rec.result == '有' ) {
						  	urlStr = '<span><a href="#" onclick="showVO(\'' + rec.num + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/datalist.png" width="16" height="16" border="0" /></a>';
						  	urlStr += '</span>';
						}
						return urlStr;
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/check.jsp';
						return false;
					}
				}, {
					id : 'btnadd',
					text : '户主',
					iconCls : 'icon-author',
					handler : function() {
						queryVO('<%=request.getContextPath()%>/app/sldb/check/list.action?pid=<%=pid%>');
						return false;//解决IE6的不跳转的bug
					}
				}
				<%
					if (subs != null) {
						for (int i = 0; i < subs.size(); ++i) {
							PersonSub sub = (PersonSub)subs.get(i);
				%>
				, {
					id : 'btnadd',
					text : '<%=sub.getName()%>',
					iconCls : 'icon-add',
					handler : function() {
						queryVO('<%=request.getContextPath()%>/app/sldb/check/listSub.action?pid=<%=sub.getId()%>');
						return false;//解决IE6的不跳转的bug
					}
				}
				<% 
						}
					}
				%>
				]
			});
		});
		
		function queryVO(urlVar) {
			$('#queryTable').datagrid({
				url : urlVar,
				queryParams : {
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function showVO(num){
			window.location.href='<%=request.getContextPath()%>/app/sldb/check/show.action?num='+ num;
			return false;
		}
		
		function check() {
			$.ajax({
				url : '<%=request.getContextPath()%>/app/sldb/check/check.action?pid=<%=pid%>', 
				type : 'post',         
				dataType : 'json',     
				data : '',         
				success : function(data) {
					if (data) {
						$.messager.show({
							title:'信息',
							msg:'核对成功',
							showType:'show'
						});
						queryVO();
					} else {
						$.messager.show({
							title:'信息',
							msg:'核对失败',
							showType:'show'
						});
					}
				} 
			});
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="户主信息"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
		<input type="button" value="核对" onclick="check()"/>
		
		<table id="queryTable"></table>
    </div>
	
</body>
</html>
