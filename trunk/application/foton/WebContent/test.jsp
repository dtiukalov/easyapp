<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="foton.picture.vo.LOVProperty"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>造型图片管理</title>
<script type="text/javascript">
	function getSelectedValue(value){
		var obj = document.getElementById(value);

		var country = obj.value;

		if (country != ""){
			band.disabled="disabled";		
		}else {
			band.disabled="";
		}
	}
</script>
  <script src="js/jquery-1[1].2.6.js" type="text/javascript"></script>
  <script src="js/jquery.provincesCity.js" type="text/javascript"></script>
  <script>
/********** 省级数据 **********/
var GP =['','中国','美国','德国'];
/********** 市级数据 **********/
var GT = [
    [],
	['北京','奔腾','比亚迪','长安'],
	['广东1','广东2','广东3'],
	['阿根廷1','埃及1']
];
/********** 市二级数据 **********/
var GC =[
    [[]
	],
	[
		['B40','B60','勇士'],
		['B50','B70'],
		['F0','F3','F6','M6','S8']
	],
	[
		['广东11','广东12','广东13'],
		['广东21','广东22'],
		['广东31']
	],
	[
		['阿根廷1'],
		['埃及1']
	]
];

//调用插件
$(function(){
	$("#test").ProvinceCity();
});
 </script>
 
</head>
<%
  //Map<String, List<String>> lovMap = (Map<String, List<String>>)request.getSession().getAttribute("lovs");
  Map<String, List<String>> lovMap = LOVProperty.getInstance().initLOV();
  String temp = "";
  %>
<body>


<select id="country" name="country" onchange="getSelectedValue()">
	<option value=""></option>
	<%  List<String> countrys = lovMap.get("country");
		for(String country : countrys) {
		 %>
	<option value="<%=country%>"><%=country%></option>
	<%
	temp = country;
		}%>
</select>

<select id="band" name="band">
	<option value=""></option>
	<%  List<String> bands = lovMap.get(temp);
		for(String band : bands) {
		 %>
	<option value="<%=band%>"><%=band%></option>
	<%
	temp = band;
		}%>
</select>

<select id="subband" name="subband">
    <option value=""></option>
 	<%  List<String> subbands = lovMap.get(temp);
		for(String subband : subbands) {
		 %>
	<option value="<%=subband%>"><%=subband%></option>
	<%}%>
</select>
<div id="test"></div>
</body>
</html>
