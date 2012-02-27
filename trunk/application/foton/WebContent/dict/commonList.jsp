<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="foton.picture.xml.DictionaryManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.UnsupportedEncodingException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	response.setCharacterEncoding("UTF-8");
    String type = (String)request.getSession().getAttribute("type");
	List<String> list = (List<String>)request.getSession().getAttribute("dictresultList");
%>
<title>数据字典项列表--<%=type %></title>
<link rel="stylesheet" href="js/pagination.css" />	
<link rel="stylesheet" type=text/css href="/foton/dict/css/photo.css">
<link rel="stylesheet" type=text/css href="/foton/dict/css/dictList.css">
<script src="/foton/dict/js/jquery-1.4.2.min.js"></script> 
<script src="/foton/dict/js/function.js"></script> 

<script type="text/javascript" src="js/jquery.pagination.js"></script>

<script>
	$(document).ready(function(){
		$("#Pagination").pagination(<%=request.getSession().getAttribute("dictcount")%>,{
				items_per_page:15,
				num_display_entries:15,
				current_page:<%=request.getSession().getAttribute("dict_current_page")==null?0:request.getSession().getAttribute("dict_current_page")%>,
				prev_text:"上一页",
				next_text:"下一页",
				callback: pageselectCallback,
				prev_show_always:true,
				next_show_always:true
		});
	
	 });
	 
	function pageselectCallback(page_index, jq){
		var page = parseInt(page_index)+1;
		var type = '<%=type %>';
    	$("#page").val(page);
    	$('#type').val(type);
    	$('#hiddeForm')[0].action = "<%=request.getContextPath()%>/PageDictServlet";
    	$('#hiddeForm').submit();
	}
	
	function delDict(type, dict){
		var flag = window.confirm('确认要删除' + dict + '？');
		if (flag == true) {
		var dictvalue = dict
			$("#key").val(type);
			$("#dictvalue").val(dictvalue);
    		$('#delForm').submit();
		} else {
			return;
		}
	}
	
	function updateDict(type, oldvalue){
		$('#type').val(type);
		$('#oldvalue').val(oldvalue);
		$('#hiddeForm')[0].action = "<%=request.getContextPath()%>/dict/updateDict.jsp";
		$('#hiddeForm').submit();
	}
	
	function insertDict(type) {
		$('#type').val(type);
		$('#hiddeForm')[0].action = "<%=request.getContextPath()%>/dict/insertDict.jsp";
		$('#hiddeForm').submit();
	}
</script>

</head>

<body>
    <form id="hiddeForm" action="" method="post">
    	<input type="hidden" id="type" name="type" />
    	<input type="hidden" id="page" name="page" />
    	<input type="hidden" id="oldvalue" name="oldvalue" />
    </form>

	<div class="wrap">
		<div class="ph_menu clearfix"></div>
	
		    <div class="top">
				<div class="img_bnt"><a href="javascript:insertDict('<%=type %>')">新 增</a></div> 
				<div class="img_bnt_1"><a href="/foton/dict/dictIndex.jsp">数据字典管理</a></div>
			</div>
		
			<div class="main">
			<%
				for(String value : list){ %>
				<div class="text">
					<div class="text_1"  id="value" name="value">
						<li>&nbsp;&nbsp;<%=value %></li>
					</div>
					<div class="text_2">
						<a href="javascript:updateDict('<%=type %>','<%=value %>')">修改</a> /  
						<a href="javascript:delDict('<%=type %>','<%=value %>')">删除</a>
						<form id="delForm" action="<%=request.getContextPath()%>/DelDictServlet" method="post">
	    					<input type="hidden" id="key" name="key" value="<%=type %>"/>
	    					<input type="hidden" id="dictvalue" name="dictvalue" />
	   	 				</form>
					</div>
				</div>
				
				<% } %>
			</div>
	</div>
	
    <div style="width:100%;margin-top:10px;">
    	<div id="Pagination" style="margin:0 auto;width:300px;"></div>
    </div>

</body>
</html>
