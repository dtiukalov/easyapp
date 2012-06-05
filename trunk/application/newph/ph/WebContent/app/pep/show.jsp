<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pilothallengespräche</title>
<%@ include file="/app/pep/include/mainheader.jsp"%>
<script type="text/javascript">

jQuery(document).ready(function(){
	$('#navigateTree').tree({
		//url: 'demoTree.json',
		url: '<%=request.getContextPath()%>/app/pep/ListTree.do',
		onClick : function(node) {
		$('#ff').attr("src", "<%=request.getContextPath()%>" + node.attributes.path); 
		}
	});
});

</script>
</head>
<body class="easyui-layout">
	<div region="west" split="true" title="目录"
		style="width: 200px; padding: 1px;">
		<div style="padding: 1px;">
			<ul id="navigateTree" class="easyui-tree"></ul>
		</div>
	</div>
		
	<div region="center" style="overflow: hidden;">
		<iframe id="ff" name= "ff" scrolling="yes" frameborder="0"  src="<%=request.getContextPath()%>/app/pep/titlePage.jsp" style="width:100%;height:100%;"></iframe>
	</div>
</body>
</html>