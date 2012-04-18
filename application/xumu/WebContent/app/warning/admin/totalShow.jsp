<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>数据汇总</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
	$(function(){
		$('#queryTable').datagrid({
			title:'数据采集汇总',
			iconCls:'icon-datalist',
			/* width:700,*/
			 height:350,  
			nowrap: false,
			striped: true,
			collapsible:true,
			/*url:'<%=request.getContextPath()%>/app/warning/farmer/listFarmer.action',*/
			url:'<%=request.getContextPath()%>/app/warning/admin/demo.json',
			sortName: 'code',
			sortOrder: 'desc',
			remoteSort: false,
			idField:'code'
			/*  frozenColumns:[[
                 {field:'ck',checkbox:false}, 
                {title:'时间',field:'col',width:180,sortable:true}
			]], 
			columns:[[
		        {title:'育肥猪',colspan:8}
			],[
				{field:'col00',title:'饲养量(头)',width:120},
				{title:'其中',width: 100, rowspan:5 [
				      				 {field:'col0',title:'存栏(头)',width:80},
				    				 {field:'col1',title:'出栏(头)',width:80},
				    				 {field:'col2',title:'自宰自食(头)',width:100},
				    				 {field:'col3',title:'死亡(头)',width:100}]},
				{field:'col4',title:'平均单价(元/斤)',width:150},
				{field:'col5',title:'累计销售收入(万元)',width:150},
				{field:'col6',title:'平均出栏重(斤/头)',width:150}
			]],
			pagination:false,
			rownumbers:false */
		});
		var p = $('#test').datagrid('getPager');
		$(p).pagination({
			onBeforeRefresh:function(){
				alert('before refresh');
			}
		});
	});
	function resize(){
		$('#test').datagrid('resize', {
			width:700,
			height:400
		});
	}
	function getSelected(){
		var selected = $('#test').datagrid('getSelected');
		if (selected){
			alert(selected.code+":"+selected.name+":"+selected.addr+":"+selected.col4);
		}
	}
	function getSelections(){
		var ids = [];
		var rows = $('#test').datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].code);
		}
		alert(ids.join(':'));
	}
	function clearSelections(){
		$('#test').datagrid('clearSelections');
	}
	function selectRow(){
		$('#test').datagrid('selectRow',2);
	}
	function selectRecord(){
		$('#test').datagrid('selectRecord','002');
	}
	function unselectRow(){
		$('#test').datagrid('unselectRow',2);
	}
	function mergeCells(){
		$('#test').datagrid('mergeCells',{
			index:2,
			field:'addr',
			rowspan:2,
			colspan:2
		});
	}
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>开始时间:</td>
					<td align="left"><input id="startTime" name="startTime" class="easyui-datebox" type="text"></input></td>
					<td>结束时间:</td>
					<td align="left"><input id="endime" name="endTime" class="easyui-datebox" type="text"></input></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">统计</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	 <!-- <table id="queryTable">
    <thead>  
    	<tr>
    		<th colspan=9>育肥猪</th>
    	</tr>
        <tr>  
            <th field="col" rowspan="2" width="180" align="center">时间</th>  
            <th field="col00" rowspan="2" width="150" align="center">饲养量(头)</th>  
            <th colspan="4">其中</th>
            <th field="col4" rowspan="2" width="150" align="center">平均单价(元/斤)</th>  
            <th field="col5" rowspan="2" width="150" align="center">累计销售收入(万元)</th>  
            <th field="col6" rowspan="2" width="150" align="center">平均出栏重(斤/头)</th>  
        </tr>  
        <tr>  
            <th field="col0" width="80" align="right">存栏(头)</th>  
            <th field="col1" width="80" align="right">出栏(头)</th> 
            <th field="col2" width="80" align="right">自宰自食(头)</th> 
            <th field="col3" width="80" align="right">死亡(头)</th>  
        </tr>  
    </thead>  
	</table> -->
	<table id="queryTable">
    <thead>  
     <tr>
     <th colspan=9>育肥猪</th>
     </tr>
        <tr>  
            <th field="col" rowspan="3" width="180" align="center">时间</th>  
            <th field="col00" rowspan="3" width="150" align="center">饲养量(头)</th>  
            <th colspan="4">其中</th>
            <th field="col4" rowspan="3" width="150" align="center">平均单价(元/斤)</th>  
            <th field="col5" rowspan="3" width="150" align="center">累计销售收入(万元)</th>  
            <th field="col6" rowspan="3" width="150" align="center">平均出栏重(斤/头)</th>  
        </tr>  
        <tr>  
            <th width="80" rowspan="2" align="center" field="col0">存栏(头)</th>  
            <th width="80" rowspan="2" align="center" field="col1">出栏(头)</th> 
            <th width="80" align="right">其中</th> 
            <th width="80" rowspan="2" align="center" field="col3">死亡(头)</th>  
        </tr>
        <tr>
          <th field="col2" width="80" align="center">自宰自食(头)</th>
        </tr>  
    </thead>  
</table>
</body>
</html>




