<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="foton.picture.vo.ListOfValuesVO"%>
<%@ page import="java.util.List"%>
<%@ page import="foton.picture.xml.DictionaryManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="foton.picture.xml.DictionaryLoader"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查询</title>
	<style>
		*{margin:0px;padding:0px;}
		#content{min-height:100px; height:auto !important; height:800px;}
		select{width:100px;}
		table tr td{font-size:12px;font-weight:400px;width:80px;}
	</style>
	<script src="js/jquery-1.4.2.min.js"></script> 
	<script src="js/jquery-1.3.2.js"></script>
	<%
		List<String> cartypes = DictionaryManager.getInstance().getCarTypeList();
		List<String> countryList = (List<String>)request.getSession().getAttribute("countryList");
		List<String> bandList = (List<String>)request.getSession().getAttribute("bandList");
		List<String> subbandList = (List<String>)request.getSession().getAttribute("subbandList");
		List<String> years = DictionaryManager.getInstance().getYearList();
		List<String> interOunter = DictionaryManager.getInstance().getInterOuterList();
		List<String> outers = DictionaryManager.getInstance().getOuterList();
		List<String> inters = DictionaryManager.getInstance().getInterList();
    	List<String> angles = DictionaryManager.getInstance().getAngleList();
		String countryValue = (String)request.getSession().getAttribute("countryValue");
		String bandValue = (String)request.getSession().getAttribute("bandValue");
		String carTypeValue = (String)request.getSession().getAttribute("carTypeValue");
		String yearValue = (String)request.getSession().getAttribute("yearValue");
		String interouterValue = (String)request.getSession().getAttribute("interouterValue");
		String outerValue = (String)request.getSession().getAttribute("outerValue");
		String interValue = (String)request.getSession().getAttribute("interValue");
		String angleValue = (String)request.getSession().getAttribute("angleValue");
		
	%>
	<script>
		function doQuery(){
			var country = $('#country').val();
			var band = $('#band').val();
			var subband = $('#subband').val();
			var interouter = $('#interouter').val();
			var year = $('#year').val();
			var outer = $('#outer').val();
			var inter = $('#inter').val();
			var angle = $('#angle').val();
			var carType = $('#carType').val();
			
			$(window.parent.rightFrame.document).find("#country").val(country);
			$(window.parent.rightFrame.document).find("#band").val(band);
			$(window.parent.rightFrame.document).find("#subband").val(subband);
			$(window.parent.rightFrame.document).find("#interouter").val(interouter);
			$(window.parent.rightFrame.document).find("#year").val(year);
			$(window.parent.rightFrame.document).find("#outer").val(outer);
			$(window.parent.rightFrame.document).find("#inter").val(inter);
			$(window.parent.rightFrame.document).find("#angle").val(angle);
			$(window.parent.rightFrame.document).find("#carType").val(carType);
			
			$(window.parent.rightFrame.document).find("#hiddeForm").attr("action","<%=request.getContextPath()%>/search.action");
			$(window.parent.rightFrame.document).find("#hiddeForm").submit();
		}
	
		function getSelectedValue(name, inter, outer){
			var obj = document.getElementById(name);
			var int = document.getElementById(inter);
			var out = document.getElementById(outer);
			var interouter = obj.value;
	
			if (interouter == "内饰"){
				out.value = "";
				out.disabled = "disabled";
				int.disabled = "";
			}else if(interouter == "外饰"){
				int.value = "";
				int.disabled = "disabled";
				out.disabled = "";
			}else {
				int.value = "";
				int.disabled = "disabled";
				out.value = "";
				out.disabled = "disabled";
			}
		}
		
		function initIO(){
			var interouter = '<%=interouterValue%>';
			var countryList = '<%=countryList%>';
			var bandList ='<%=bandList%>';
			var subbandList = '<%=subbandList%>';
			
			var int = document.getElementById('inter');
			var out = document.getElementById('outer');
			var band = document.getElementById('band');
			var subband = document.getElementById('subband');
			
			if (interouter == "内饰"){
				out.value = "";
				out.disabled = "disabled";
				int.disabled = "";
				
			}else if(interouter == "外饰"){
				int.value = "";
				int.disabled = "disabled";
				out.disabled = "";
				
			}else {
				int.value = "";
				out.value = "";
				int.disabled = "disabled";
				out.disabled = "disabled";
			}
			
			if (countryList == 'null' || bandList == 'null') {
				band.disabled = "disabled";
				subband.disabled = "disabled";
			} else if (subbandList == 'null'){
				subband.disabled = "disabled";
			} 
			
		}
		
		function resetForm(){
			$("#queryForm")[0].reset();
			$("#country").val("");
			$("#band").val("");
			$("#subband").val("");
			$("#carType").val("");
			$("#year").val("");
			$("#interouter").val("");
			$("#inter").val("");
			$("#outer").val("");
			$("#angle").val("");
		}
	
		$(document).ready(function(){
		
			//三级级联菜单
			var bandSelect = $("#country");
			var subbandSelect = $("#band");
			var xmlHttp;	
			function createXMLHttpRequest() {
			    if (window.ActiveXObject) {
			        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			    } else if (window.XMLHttpRequest) {
			        xmlHttp = new XMLHttpRequest();
			   		
			    }
			}	
			
			function handleStateChange(){
				if(xmlHttp.readyState==4){
					if(xmlHttp.status==200){
						return true;
						//parseResults()
					}
				}
			}
			
			function doRequestUsingPOST(type, flag) {
				//将查询条件一并提交
				var carType = $('#carType').val();
				var year = $('#year').val();
				var interouter = $('#interouter').val();
				var outer = $('#outer').val();
				var inter = $('#inter').val();
				var angle = $('#angle').val();
			    createXMLHttpRequest();
			    var url = "SelectDictServlet";
				var condition = "type=" + type + "&flag=" + flag + "&carType=" + carType + "&year=" + year + "&interouter=" + interouter + 
								"&outer=" + outer + "&inter=" + inter + "&angle=" + angle;
			    xmlHttp.open("POST", url, true);
			    xmlHttp.onreadystatechange = handleStateChange;
			    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
			    xmlHttp.send(condition);
			    document.execCommand("refresh")
			}
			
			// 第一个下拉框change事件	
			bandSelect.change(function(){
				var countryNameValue = $('#country').val();
				if(countryNameValue != "") {
					doRequestUsingPOST(countryNameValue, 'bandFlag');
				} else {
					doRequestUsingPOST(countryNameValue, 'nullCountryFlag');
				}
			})
			
			// 第二个下拉框change事件
			subbandSelect.change(function(){
				var bandNameValue = $('#band').val();
				if(bandNameValue != "") {
					doRequestUsingPOST(bandNameValue, 'subbandFlag');
				} else {
					doRequestUsingPOST(bandNameValue, 'nullbandFlag');
				}   
			})
			
			
		})
	</script>
</head>

<body style="background:#EBEBEB;" onload="initIO()">
<%!
	public boolean compareStr(String str1, String str2){
		boolean flag = false;
		if (!"".equals(str1) && str1 != null && str1.equals(str2)){
			flag = true;
		}
		return flag;
	}
%>
<div id="content" style="width:100%; margin-top:15px; padding:10px 10px;">
	<form id="queryForm" name="queryForm" action="<%=request.getContextPath()%>/search.action?target=rightFrame" method="post">
    	<table cellspacing="8" cellspacing="0">
           <tr>
	           	<td>车种：</td>
	               <td>
	               	<select id="carType" name="carType">
	               		<option value="">请选择</option>
	               	<%  
						for(String cartype : cartypes) {
					%>
						<option value="<%=cartype%>" 
							<%if(compareStr(carTypeValue, cartype)){out.print("selected=\"selected\"");}%>>
							<%=cartype%>
						</option>			
					 <%
					   }
					 %>			
	               	</select>
	              </td>
            </tr>

        	<tr>
            	<td>国家：</td>
                <td>
	                <select id="country" name="country" class="countryName">
	                	<option value="" >请选择</option>
					 <%
				if (countryList != null) {
						for(String country : countryList){
					%>
						<option value="<%=country%>" 
							<%if(compareStr(countryValue, country)){out.print("selected=\"selected\"");}%>>
							<%=country%>
						</option>		
					<%	
						}
					} 
				%>   
	                </select>
                </td>
            </tr>
            
            <tr>
            	<td>品牌：</td>
                <td>
                	<select id="band" name="band" class="bandName" onchange="selectSubbandDict()">
                		<option value="">请选择</option>
                		 <%
						if (bandList != null) {
							for(String band : bandList){
							%>
							<option value="<%=band%>" 
								<%if(compareStr(bandValue, band)){out.print("selected=\"selected\"");}%>>
								<%=band%>
							</option>	
						<%	
							}
						}
						%>   
                	</select>
                </td>
            </tr>
             <tr>
            	<td>子品牌：</td>
                <td>
                	<select id="subband" name="subband" class="subbandName">
                		<option value="">请选择</option>
                	 <%
                	 if (subbandList != null){
                		 for(String subband : subbandList){ 
                	 %>
                	 		<option value="<%=subband %>"><%=subband %></option>
                	 <%  
                	 	} 
                	 }
                	 %>   
                	</select>
                </td>
            </tr>
			 <tr>
            	<td>年代：</td>
                <td>
                	<select id="year" name="year">
                		<option value="">请选择</option>
                	<%  
						for(String year : years) {
					%>
						<option value="<%=year%>" 
							<%if(compareStr(yearValue, year)){out.print("selected=\"selected\"");}%>>
							<%=year%>
						</option>			
					<%
					   }
					%>	
                	</select>
                </td>
            </tr>
            <tr>
            	<td>内外饰：</td>
                <td>
                	<select id="interouter" name="interouter" onchange="getSelectedValue('interouter','inter','outer')">
                		<option value="">请选择</option>
                	<%  
						for(String io : interOunter) {
					%>
						<option value="<%=io%>" 
							<%if(compareStr(interouterValue, io)){out.print("selected=\"selected\"");}%>>
							<%=io%>
						</option>		
				    <%
					  }
					%>	
                	</select>
                </td>
            </tr>
             <tr>
            	<td>外饰局部：</td>
                <td>
                	<select id="outer" name="outer">
                		<option value="">请选择</option>
                	<%  
						for(String outer : outers) { 
				    %>
						<option value="<%=outer%>" 
							<%if(compareStr(outerValue, outer)){out.print("selected=\"selected\"");}%>>
							<%=outer%>
						</option>				
					<% 
					    }
					%>	
                	</select>
                </td>
            </tr>
            <tr>
            	<td>内饰局部：</td>
                <td>
                	<select id="inter" name="inter">
                		<option value="">请选择</option>
                	<%  
                		for(String inter : inters) { 
					%>
						<option value="<%=inter%>" 
							<%if(compareStr(interValue, inter)){out.print("selected=\"selected\"");}%>>
							<%=inter%>
						</option>				
					<%
					  }
					%>	
                	</select>
                </td>
            </tr>
            <tr>
            	<td>整  体：</td>
                <td>
                	<select id="angle" name="angle">
                		<option value="">请选择</option>
                	<%   
                		for(String angle : angles) { 
					%>
						<option value="<%=angle%>" 
							<%if(compareStr(angleValue, angle)){out.print("selected=\"selected\"");}%>>
							<%=angle%>
						</option>			
					<%
					  }
					%>	
                	</select>
                </td>
            </tr>
            <tr>
            	<td colspan="2" style="text-align:center;width:200px;">
	            	<input type="button" onclick="doQuery();" value="搜 索" style="width:40px;"></input>
	            	<input type="button" value="清 空" style="width:40px;" onclick="resetForm()"></input>
	            </td>
            </tr>
        </table>
     
    </form>
</div>
</body>
</html>
    