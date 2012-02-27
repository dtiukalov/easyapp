<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="foton.picture.xml.DictionaryLoader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	String type = (String)request.getParameter("type");
    String oldvalue = (String)request.getParameter("oldvalue");
%>
	<title>修改数据字典</title>
	<script src="js/function.js"></script>
	<script src="js/jquery-1.4.2.js"></script>
	<script src="js/jquery-1.4.2.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/additional-methods.js"></script>
	
	<link rel="stylesheet" type=text/css href="css/photo.css">
	<link rel="stylesheet" type=text/css href="css/dictDetail.css">
	
	<script type="text/javascript">
	function submitForm(){
		$("#updateForm").titanValidate ({
			rules: {
				newvalue:{
					required:true,
					maxlength:20,
					userName:true
				}
			},
			messages: {
				newvalue: {
					required:"请输入新增数据字典",
					maxlength:"数据字典不能超过20个字符",
					userName:"数据字典只能是中文、英文、数字和下划线"
				}
			}
		});
		$("#updateForm").submit();
	}
	</script>
		
</head>
<body>
	<div class="wrap">
		<div class="ph_menu clearfix"></div>
	    
	    <div class="top">
			<div class="img_bnt_1"><a href="/foton/dict/dictIndex.jsp">数据字典管理</a></div>
		</div>
		
		<div class="main">
			<form id="updateForm" action="<%=request.getContextPath()%>/UpdateDictServlet" method="post">
			  <label></label>
			  <div align="center">
			      <input type="hidden" id="type" name="type" value="<%=type%>"/>
    		      <input type="hidden" id="oldvalue" name="oldvalue" value="<%=oldvalue%>"/>	
			 	  <input type="text" id="newvalue" name="newvalue" size="40" value="<%=oldvalue%>"/>
			      <input type="button" name="Submit" value="完成" onclick="submitForm()" />
			      <%if (DictionaryLoader.ANGLE.equalsIgnoreCase(type)
							|| DictionaryLoader.YEAR.equalsIgnoreCase(type)
							|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(type)
							|| DictionaryLoader.OUTER.equalsIgnoreCase(type)
							|| DictionaryLoader.INTER.equalsIgnoreCase(type)
							|| DictionaryLoader.CARTYPE.equalsIgnoreCase(type)){ %>
			      <input type="button" name="Submit2" value="返回" onclick="javascript:window.location.href='<%=request.getContextPath()%>/dict/commonList.jsp';"/>	
			      <%} else{  %>	
			       <input type="button" name="Submit2" value="返回" onclick="javascript:window.location.href='<%=request.getContextPath()%>/dict/countryList.jsp';"/>	
			      <%} %>				
			   </div>
			</form>

		</div>
	</div>
</body>
</html>