<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>初审低保信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '初审城镇低保信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/person/list.action',
				queryParams : {
					state : '申报',
					type : '城镇低保收入'
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
					width : 30,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'type',
					title : '类型',
					width : 60,
					sortable : true
				},{
					field : 'name',
					title : '户主姓名',
					width : 70,
					sortable : true
				}, {
					field : 'identify',
					title : '身份证',
					width : 130,
					sortable : true
				}, {
					field : 'gender',
					title : '性别',
					width : 30,
					sortable : true
				}, {
					field : 'race',
					title : '民族',
					width : 50,
					sortable : true
				}, {
					field : 'hukou',
					title : '户口类型',
					width : 70,
					sortable : true
				}, {
					field : 'homeSum',
					title : '家庭人数',
					width : 80,
					sortable : true
				}, {
					field : 'ill',
					title : '患病种类',
					width : 100,
					sortable : true
				}, {
					field : 'deformity',
					title : '残疾类型',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 110,
					sortable : true
				}, {
					field : 'createrName',
					title : '申报人',
					width : 50,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 120,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span>&nbsp&nbsp<a href="#" onclick="confirmVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/ok.png" width="14" height="14" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="showVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/author.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/back.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnedit',
					text : '查看',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择查看项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPersonTab.action?id='+rows[0].id;
						return false;
					}
				}, 
				/* '-', {
					id : 'btnItem',
					text : '通过',
					iconCls : 'icon-ok',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						confirmVO(ids.join('__'));
					}
				},  */
				{
					id : 'btnrefuse',
					text : '驳回',
					iconCls : 'icon-back',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						deleteVO(ids.join('__'));
					}
				}, {
					id : 'btnItem',
					text : '核对',
					iconCls : 'icon-ok',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						confirmVO(ids.join('__'));
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
					state : '申报',
					identify : $('#identify').val(),
					gender : $('#gender').combobox('getValue'),
					name : $('#name').val(),
					type : $('#type').combobox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/refuse.jsp?ids=' + id;
			return false;
		}
		
		function showVO(id) {
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPersonTab.action?id='+ id;
			return false;	
		}
		function showResultVO(id) {
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/showResult.jsp?pid='+ id;
			return false;	
		}
		
		function endVO(id){
			$.messager.confirm('确认通过', '确认通过该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/person/checkPass.jsp?ids=' + id;
				}
			});
			return false;
		}
		
		function confirmVO(id){
			$.messager.confirm('确认核对', '确认核对该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/person/confirm.action?ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/view.action?id='+ id;
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
					<td>类型</td>
					<td>
						<select id="type" class="easyui-combobox"
									name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.person.type" valueField="id"
									textField="text" editable="false"></select>
					</td>
					<td>姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
					<td>性别:</td>
					<td><select id="gender" class="easyui-combobox"
								name="gender" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
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




