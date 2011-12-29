<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.saturn.sldb.Person"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>家庭成员信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
<%-- 	<% --%>
<!-- 		String pid = request.getParameter("id"); -->
<!-- 		Person voPerson = Person.get(pid); -->
<!-- 		request.setAttribute("person", voPerson); -->
<!-- 	%> -->
	
	<script type="text/javascript">
		$(function() {
			$('#querySabPersonTable').datagrid({
				title : '家庭成员信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/person/sub/listSabPerson.action?id=' + <%=request.getParameter("id") %>,
				queryParams : {
					state : '创建'
				},
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
					width : 40,
					align : 'center',
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'type',
					title : '类型',
					width : 60,
					align : 'center',
					sortable : true
				},{
					field : 'name',
					title : '姓名',
					width : 70,
					align : 'center',
					sortable : true
				}, {
					field : 'gender',
					title : '性别',
					width : 50,
					align : 'center',
					sortable : true
				}, {
					field : 'personRelation',
					title : '与户主关系',
					width : 70,
					align : 'center',
					sortable : true
				}, {
					field : 'identify',
					title : '身份证',
					width : 130,
					align : 'center',
					sortable : true
				}, {
					field : 'race',
					title : '民族',
					width : 50,
					align : 'center',
					sortable : true
				}, {
					field : 'ill',
					title : '患病种类',
					width : 70,
					align : 'center',
					sortable : true
				}, {
					field : 'deformity',
					title : '残疾类型',
					width : 70,
					align : 'center',
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 150,
					align : 'center',
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="14" height="14" border="0" /></a>' +
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a>' +
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/add.jsp?id=' + <%=request.getParameter("id")%>;
						return false;//解决IE6的不跳转的bug
					}
				}, {
					id : 'btnedit',
					text : '编辑',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#querySabPersonTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						editVO(rows[0].id);
						return false;
					}
				}, {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#querySabPersonTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择删除项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						$.messager.confirm('确认删除项', '确认删除该选项', function(result){
							if (result){
								window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/delete.action?id='+ids.join('__') + "&pid=" + $('#pid').val();
							}
						});
						return false;
					}
				},'-', {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='javascript:history.back(-1)';
						return false;//决绝IE6的bug
					}
				}]
			});
			
			$('#gender').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					state : '创建',
					identify : $('#identify').val(),
					gender : $('#gender').combobox('getValue'),
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/delete.action?id=' + id;
				}
			});
			return false;
		}

		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/querySabPerson.action?id='+ id + "&pid=" + $('#pid').val();
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="户主信息"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>户主姓名:</td>
					<td><input id="name" name="name" type="text" readonly="readonly" value="${person.name}"></input></td>
					<td></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text" readonly="readonly" value="${person.identify}"></input></td>
					<td></td>
					<td>性别:</td>
					<td><select  id="gender" name="gender" disabled="disabled" >
						<option value="${person.gender}" selected="selected" >${person.gender}</option>
					</select></td>
					<input type="hidden" id="pid" name="pid" value="${person.id}"></input>
				</tr>
			</table>
		</form>
	</div>
	<table id="querySabPersonTable"></table>
</body>
</html>
