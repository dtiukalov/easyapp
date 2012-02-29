<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/dictModule/action/QueryCarList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function modify(type,code,hidden_flag,pinyin){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/dictModule/action/HiddenDict.action?dict_type="+type+"&dict_code="+code+"&dict_hidden_flag="+hidden_flag+"&var_pinyin="+pinyin;
			$('#hiddenForm')[0].submit();
		}
	 
	 	function addWorker(){
			window.open("<%=request.getContextPath()%>/crm/dictModule/web/addCarModel1.jsp", "", "height=300, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
		}
</script> 
<title>车系管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/dictModule/action/QueryCarList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>车系管理</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">车系编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="code" id="code" value="${code}"/>
                      </td>
                      <td class="colName">车系名称:</td>
                      <td class="detailColVal">
                      	<input type="text" name="value" id="value" value="${value}"/>
                      </td>
                      <td class="colName">品牌:</td>
                      <td class="detailColVal">
                      	<select name="parent_code" id="parent_code">
                      		<option value="" ${parent_code=="" ? "selected" :""}></option>
                      		<option value="104001" ${parent_code=='104001' ? "selected" :""}>东风HONDA</option>
                      		<option value="104002" ${parent_code=='104002' ? "selected" :""}>广本</option>
                      		<option value="104003" ${parent_code=='104003' ? "selected" :""}>进口本田</option>
                      		<option value="104004" ${parent_code=='104004' ? "selected" :""}>其他</option>
                      	</select>
                      </td>
                    </tr>
              </table>   
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询" />
                    <input type="reset" value="重置" />
              </div>     
			</fieldset>           
		</form>
        <table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;"><div class="optAdd"><a href="javascript:addWorker();">新增</a></div></td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th>车系编号</th>
	                        <th>车系名称</th>
	                        <th>是否可用</th>
	                        <th>基本操作</th>                                   
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td>${var.code}</td>
                        <td>${var.value}</td>
                        <td>
                        	<c:if test="${var.hidden_flag=='1'}">否</c:if>
                        	<c:if test="${var.hidden_flag!='1'}">是</c:if>
                        </td>
                        <td>
                            <c:if test="${var.hidden_flag=='1'}">
                            	 <div class="edit"><a href="javascript:modify('${var.type}','${var.code}','0','${var.pinyin}');">起用</a></div>
                            </c:if>
                           	<c:if test="${var.hidden_flag!='1'}">
                            	 <div class="edit"><a href="javascript:modify('${var.type}','${var.code}','1','${var.pinyin}');">止用</a></div>
                            </c:if>
                        </td>
                     </tr>
                 </c:forEach>
            </table>
    </div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="code" value="${code}">
		<input type="hidden" name="value" value="${value}">
		<input type="hidden" name="hiddenFlag" value="${hiddenFlag}">
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
