<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/recall/admin/json/demo.json',
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
					width : 30,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'name',
					title : '畜禽养殖档案',
					width : 120,
					sortable : true
				}, {
					field : 'number',
					title : '动物防疫合格证编号',
					width : 150,
					sortable : true
				}, {
					field : 'type',
					title : '畜禽种类',
					width : 100,
					sortable : true
				}, {
					field : 'num',
					title : '圈舍号',
					width : 100,
					sortable : true
				},{field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" />'+
						'&nbsp;&nbsp;<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/culture/add.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}, {
					id : 'btnedit',
					text : '编辑',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
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
						var rows = $('#queryTable').datagrid('getSelections');
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
								window.location.href='<%=request.getContextPath()%>/app/recall/admin/culture/show.jsp';
							}
						});
						return false;
					}
				}, '-', {
					id : 'btndelete',
					text : '饲料',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/feed/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				},{
					id : 'btndelete',
					text : '免疫',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/immune/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				},{
					id : 'btndelete',
					text : '诊疗',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/medical/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				},{
					id : 'btndelete',
					text : '种畜调运',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/transport/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				},{
					id : 'btndelete',
					text : '防疫监测',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/monitor/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}, {
					id : 'btndelete',
					text : '病死无害化',
					iconCls : 'icon-datalist',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/recall/admin/dead/show.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
			
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					number : $('#number').val(),
					title : $('#title').val(),
					createTime : $('#createTime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/recall/admin/culture/show.jsp';
				}
			});
			return false;
		}
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/recall/admin/culture/edit.jsp';
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>品种名称:</td>
					<td align="left"><input id="name" name="name" type="text"></input></td>
					<td>个体编号:</td>
					<td align="left"><input id="num" name="num" type="text"></input></td>
					<td>母号:</td>
					<td align="left"><input id="mnum" name="mnum" class="easyui-datebox" type="text"></input></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




