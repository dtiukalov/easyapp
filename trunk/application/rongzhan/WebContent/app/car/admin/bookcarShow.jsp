<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>预约信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<%
		String cid = request.getParameter("cid");
	%>
	
	<script type="text/javascript">
		$(function() {
			
			$('#brand').combobox({
				onSelect:function(record){
					$('#model').combobox('enable');
					$('#model').combobox('clear');
					$('#model').combobox('reload', '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#brand').combobox('getValue'));
					
					$('#series').combobox('clear');
					$('#series').combobox('disable');
					
					queryVO();
			    }
			});
			
			$('#model').combobox({
				onSelect:function(record){
					$('#series').combobox('enable');
					$('#series').combobox('clear');
					$('#series').combobox('reload', 
						'<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'));
					
					queryVO();
			    }
			});
			
			$('#series').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#type').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#state').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#model').combobox('disable');
			$('#series').combobox('disable');
			
			$('#queryTable').datagrid({
				title : '预约列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/car/bookcar/list.action?cid=<%=cid%>',
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
					field : 'brandName',
					title : '品牌',
					width : 70,
					sortable : true
				}, {
					field : 'modelName',
					title : '型号',
					width : 70,
					sortable : true
				},{
					field : 'seriesName',
					title : '系列',
					width : 70,
					sortable : true
				}, {
					field : 'license',
					title : '车牌',
					width : 90,
					sortable : true
				}, {
					field : 'userName',
					title : '预约人',
					width : 90,
					sortable : true
				}, {
					field : 'phone',
					title : '电话',
					width : 90,
					sortable : true
				}, {
					field : 'typeName',
					title : '类型',
					width : 60,
					sortable : true
				}, {
					field : 'bookTime',
					title : '预约时间',
					width : 80,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 80,
					sortable : true
				}, {
					field : 'text',
					title : '预约内容',
					width : 100,
					sortable : true
				}, {
					field : 'stateName',
					title : '状态',
					width : 50,
					sortable : true,
					formatter : function(value, rec) {
						return '<span><a href="<%=request.getContextPath()%>/app/car/admin/state.action?state=' + rec.id + '">' + rec.stateName +'</a>';
					}
				}
				/*
				, {
					field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
						}
					}
				*/
				 ] ],
				pagination : true,
				rownumbers : true
				/*,
				toolbar : [ {
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/car/bookcar/add.jsp';
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
				},{
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
								window.location.href='<%=request.getContextPath()%>/app/car/bookcar/delete.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
				*/
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					cid : $('#cid').val(),
					brand : $('#brand').combobox('getValue'),
					model : $('#model').combobox('getValue'),
					series : $('#series').combobox('getValue'),
					type : $('#type').combobox('getValue'),
					license : $('#license').val(),
					phone : $('#phone').val(),
					bookTime : $('#bookTime').datebox('getValue'),
					createTime : $('#createTime').datebox('getValue'),
					text : $('#text').val(),
					state : $('#state').combobox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/car/bookcar/delete.action?ids=' + id;
				}
			});
			return false;
		}
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/car/bookcar/query.action?id='+ id;
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
					<td>类型:</td>
					<td align="left"><select id="type" class="easyui-combobox"
						name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=bookcar.type" valueField="id"
						textField="text" mode="remote"></select></td>
					<td>品牌:</td>
					<td align="left"><select id="brand" class="easyui-combobox"
						name="brand" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=car" valueField="id"
						textField="text" mode="remote"></select></td>
					<td>型号:</td>
					<td align="left"><select id="model" class="easyui-combobox"
						name="model" valueField="id"
						textField="text" mode="remote"></select></td>
					<td>系列:</td>
					<td align="left"><select id="series" class="easyui-combobox"
						name="series" valueField="id"
						textField="text" mode="remote"></select></td>	
				</tr>
				<tr align="right">
					<td>车牌:</td>
					<td><input id="license" name="license" type="text"></input></td>
					<td>预约人:</td>
					<td><input id="userName" name="userName" type="text"></input></td>
					<td>电话:</td>
					<td><input id="phone" name="phone" type="text"></input></td>
					<td>内容:</td>
					<td><input id="text" name="text" type="text"></input></td>
				</tr>
				<tr align="right">
					<td>预约时间:</td>
					<td align="left"><input id="bookTime" name="bookTime" class="easyui-datebox" type="text"></input></td>
					<td>创建时间:</td>
					<td align="left"><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
					<td>状态:</td>
					<td align="left"><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=bookcar.state" valueField="id"
						textField="text" mode="remote"></select></td>
				</tr>
			</table>
			<input id="cid" name="cid" type="hidden" value="<%=cid%>"></input>
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




