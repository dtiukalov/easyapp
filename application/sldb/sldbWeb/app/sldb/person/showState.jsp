<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>低保状态信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '低保状态信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/person/state.action',
				queryParams : {
					pid : '<%=request.getParameter("pid")%>'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'pid',
					title : '标识',
					width : 40,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'userId',
					title : '用户标识',
					width : 60,
					sortable : true
				}, {
					field : 'state',
					title : '审核状态',
					width : 100,
					sortable : true
				},{
					field : 'userName',
					title : '审核人',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '审核时间',
					width : 130,
					sortable : true
				}, {
					field : 'name',
					title : '户主姓名',
					width : 100,
					sortable : true
				}, {
					field : 'identify',
					title : '身份证号',
					width : 150,
					sortable : true
				},{
					field : 'note',
					title : '备注',
					width : 70,
					sortable : true
				}, {
					field : 'department',
					title : '部门',
					width : 120,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						if (rec.state == '驳回' && rec.type == 0) {
							return '<span><a href="#" onclick="replayVO(\'' + rec.pid + '\');">重申</a>'  +
							'</span>';
						} else if (rec.type == 2) {
							return '<span>已重申</span>'
						}
						return '<span></span>'
					}
				}] ],
				pagination : true,
				rownumbers : true,
				toolbar : [{
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
					identify : $('#identify').val(),
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function replayVO(pid){
			$.messager.confirm('确认重申', '确认重申该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/person/replay.action?id='+ pid;
				}
			});
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
					<td>姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
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




