<%@page import="com.saturn.workflow.NodeState"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.workflow.FlowNode"%>
<%@page import="com.saturn.workflow.WorkFlow"%>
<%@page import="com.saturn.system.Dict"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/app/includes/header.jsp"%>
	<% 
		String flowId = request.getParameter("flowId");
		List nodes = FlowNode.getByFlowId(flowId);
		
		WorkFlow workFlow = WorkFlow.get(flowId);
		
		String flowName = workFlow.getName();
		String flowShowName = workFlow.getShowName();
		
		String workFlowname = flowShowName + "(" + flowName + ")";
	%>
	<title>节点表单状态信息</title>
	<script type="text/javascript">
		var lastIndex;
		
		var dictNodeState = <%=Dict.getDictJSONByType("node.state")%>;
		var itemStates = <%=NodeState.getJSONList(flowId)%>;
		
		function getDictValue(dict, value) {
			for (var i = 0; i < dict.length; i++) {
				if (dict[i].id == value) {
					return dict[i].text;
				}
			}
			
			return value;
		}
		
		function getNodeStateValueName(nodeId, itemName) {
			for (var i = 0; i < itemStates.length; i++) {
				var itemState = itemStates[i];
				
				if (itemState.nodeId == nodeId && itemState.itemName == itemName) {
					
					return itemState.state;
				}
			}
			
			return "";
		}
		
		$(function() {
			$('#queryTable').datagrid({
				title : '工作流: <%=workFlowname%>, 节点表单状态信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : true,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/item/list.action',
				queryParams : {
					flowId : '<%=flowId%>'
				},	
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'asc',
				remoteSort : true,
				frozenColumns : [ [ {
					field : 'name',
					title : '属性名',
					width : 80,
					sortable : true
				}, {
					field : 'showName',
					title : '中文名称',
					width : 80,
					sortable : true
				}] ],
				columns : [ [ 
				<%
					int size = nodes.size();
				
					for (int i = 0; i < size; ++i) {
						FlowNode node = (FlowNode)nodes.get(i);
						String id = node.getId();
						String name = node.getName();
					
				%>
				{
					field : 'process_<%=id%>',
					title : '<%=name%>',
					width : 100,
					sortable : true,
					formatter : function(value, rec) {
						if (value == null) {
							var stateName = getNodeStateValueName('<%=id%>', rec.name);
							
							if (stateName == '') {
								stateName = '只读';
							}
							
							rec['process_<%=id%>'] = stateName;
							return '<span>' + stateName + '<span>';
						} 
						
						return getDictValue(dictNodeState, value);
					},
					editor : {
						type : 'combobox',
						options : {
							valueField :'id',
							textField : 'text',
							url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=node.state',
							editable : true
						}
					}
				}
				<% 		if (i != size - 1) {
						%>
						,
						<%
						}
					}
				%> 
				] ],
				rownumbers : true,
				onClickRow: function(rowIndex){
					if (lastIndex != rowIndex){
						$('#queryTable').datagrid('endEdit', lastIndex);
						$('#queryTable').datagrid('beginEdit', rowIndex);
						
					}
					lastIndex = rowIndex;
				},
				onAfterEdit : function (rowIndex, rowData, changes) {
					
				},
				toolbar : [ {
					text:'保存',
					iconCls:'icon-save',
					handler: function() {
						if (lastIndex != -1){
							$('#queryTable').datagrid('endEdit', lastIndex);
							lastIndex = -1;
						}
						
						var rows = $('#queryTable').datagrid('getRows');
						
						var content = "";
						for (var i = 0; i < rows.length; ++i) {
							var row = rows[i];
							content += "process_3:" + row["process_3"]+ ","
						}
						
						$.ajax({
							url : '<%=request.getContextPath()%>/app/workflow/state/ajaxupdate.action?flowId=<%=flowId%>', 
							type : 'post',         
							dataType : 'json',     
							data : {
								states : rows  
							},
							success : function(data) {
								if (data) {
									$.messager.show({
										title:'信息',
										msg:'保存成功',
										showType:'show'
									});
								}
							} 
						});
						
						$('#queryTable').datagrid('acceptChanges');
						
					}
				}, {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/workflow/info/show.jsp';
						return false;
					}
				}]
			});
		});
	</script>
</head>
<body>
	<table id="queryTable"></table>
</body>
</html>




