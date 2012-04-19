<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
	
	function query() {
		window.location.href='<%=request.getContextPath() %>/app/quarantine/admin/showAll.jsp';
	}
</script>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '检疫列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/quarantine/admin/json/showAllDemo.json',
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
					field : 'book',
					title : '检疫证书类型',
					width : 120,
					sortable : true
				},{
					field : 'name',
					title : '货主',
					width : 120,
					sortable : true
				}, {
					field : 'contact',
					title : '联系电话',
					width : 100,
					sortable : true
				}, {
					field : 'type',
					title : '动物种类',
					width : 100,
					sortable : true
				}, {
					field : 'number',
					title : '数量及单位',
					width : 100,
					sortable : true
				}, {
					field : 'dateTime',
					title : '签发日期',
					width : 100,
					sortable : true
				},{
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');">查看</a>'+
						'&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/app/quarantine/admin/deal.jsp">监管结果</a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true
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
					window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/tagShow.jsp';
				}
			});
			return false;
		}
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/show.jsp';
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
					<td>动物检疫合格证编号:</td>
					<td align="left"><input id="name" name="name" type="text"></input></td>
					<td>检疫证书:</td>
					<td align="left"><select class="easyui-combobox" name="state" style="width:200px;" required="true">
					<option value="AL">动物A证</option>
					<option value="AK">动物B证</option>
					<option value="AZ">产品A证</option>
					<option value="AR">产品B证</option>
					</select></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<!-- <a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">查询</a> -->
					<a href="#" class="easyui-linkbutton" onclick="query();" 
					iconCls="icon-search">查询</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




