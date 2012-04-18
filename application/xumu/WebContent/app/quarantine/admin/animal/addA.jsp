<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	
	function add() {
		/* var number = $('#number').val();
		if (number == "") {
			alert("编号不能为空!");
			return;
		}
		var title = $('#title').val();
		if (title == "") {
			alert("标签不能为空!");
			return;
		} 
		$('#addForm').submit();*/
		alert("添加成功！");
		window.location.href='<%=request.getContextPath() %>/app/quarantine/admin/animal/show.jsp';
	}
	
	$(function() {
		$('#number').focus();
	});
	
	$(function(){
		$('#tag').combogrid({
			panelWidth:450,
			value:'',

			idField:'code',
			textField:'name',
			url:'<%=request.getContextPath()%>/app/passing/pass/listPass.action',
			frozenColumns:[[
	                {field:'ck',checkbox:true}
				]],
				columns:[[
					{field:'station',title:'站点编号',width:120},
					{field:'card',title:'耳标信息码',width:120},
					{field:'createTime',title:'时间',width:220,rowspan:2,sortable:true}
				]],
				pagination : true,
				rownumbers : true
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/medication/addMedication.action"
			method="post">
			<input type="hidden" id="createTime" name="createTime" value="<%=DateUtils.getSystemTime() %>" />
			<center>
			<div style="font-size:25px;margin:0px auto;color:#2f6bbd;">动物检疫合格证明（动物A）</div>
			</center><br>
			<table class="table-form">
				<tr>
					<td style="text-align:right;">合格证编码:</td>
					<td><input id="number" name="number" type="text"></input></td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">货主:</td>
					<td><input id="number" name="number" type="text"></input></td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系方式:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">动物种类:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">数量及单位:</td>
					<td><input id="number" name="number" type="text"></input></td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">启动地点:</td>
					<td><input class="easyui-combobox" value="吉林">省
						<input class="easyui-combobox" 
						name="language" value="长春">市<br>
						<input class="easyui-combobox" 
						name="language" value="朝阳">县(市、区)
						<input class="easyui-combobox" value="新民">乡(镇)<br>
						<input id="" name="" value="山西">村(养殖场、屠宰场、交易市场)</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">到达地点:</td>
					<td><input class="easyui-combobox" value="吉林">省
						<input class="easyui-combobox" 
						name="language" value="长春">市<br>
						<input class="easyui-combobox" 
						name="language" value="朝阳">县(市、区)
						<input class="easyui-combobox" value="新民">乡(镇)<br>
						<input id="" name="" value="山西">村(养殖场、屠宰场、交易市场)</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">用途:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">承运人:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系电话:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载方式:</td>
					<td><input style="width:30px" type="checkbox" name="fruit" value ="apple" >公路
						<input style="width:30px" type="checkbox" name="fruit" value ="orange">铁路
						<input style="width:30px" type="checkbox" name="fruit" value ="orange">水路
						<input style="width:30px" type="checkbox" name="fruit" value ="mango">航空</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载工具牌号:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载工具消毒情况转运前经:</td>
					<td><input id="title" name="title" type="text"></input>消毒</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">本批动物检验合格,应于:</td>
					<td><input id="title" name="title" type="text"></input>内到达有效</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">官方兽医签字:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">签发日期:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">牲畜耳标号:</td>
					<td><select id="tag" name="tag" style="width:250px;"></select></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><textarea id="title" name="title" type="text"></textarea></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;margin-left:80px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">保存</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-back">返回</a>
						</div></td>
						<td></td>
				</tr>
			</table>
			<input id="datetime" type="hidden" name="datetime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		$("#number").formValidator({
			onfocus : "请填写编号"
		}).inputValidator({
			min : 1,
			onerror : "不能为空字符"
		});
		
		$("#title").formValidator({
			onfocus : "请填写标签"
		}).inputValidator({
			min : 1,
			onerror : "不能为空字符"
		});
		
	});
</script>
</html>