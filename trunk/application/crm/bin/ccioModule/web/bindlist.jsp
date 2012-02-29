<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>到店离店时间列表</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindList.action',
				form:'crmform',
				percount:10
			});
		});
		function delConf(b_id){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/ccioModule/action/DelBindById.action";
				$('#b_id').val(b_id);
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(b_id){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/ccioModule/action/GetBindById.action";
			$('#b_id').val(b_id);
			$('#hiddenForm')[0].submit();
		}
		
		function excel(){
			$('#excelForm')[0].submit();
		}
</script> 
</head>
<body>
<div id="man_zone"> 
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>查询</legend>
              <table cellspacing="5" cellpadding="0">
              	<tr class="rowClass">
			      <td class="colName">卡:</td>
			      <td class="detailColVal">
			          <input type="text" name="card" id="card" value="${card }" style="width:200px;"/>
				  </td>
				  <td class="colName">VIN:</td>
			      <td class="detailColVal">
			         <input type="text" name="vin" id="vin" value="${vin }" style="width:200px;"/>
				  </td>
			  </tr>
              </table>   
              <div style="margin-buttom:10px;text-align:center;">
                     <input type="submit" value="查询" />
                     <input type="reset" value="重置" />
              </div>   
			</fieldset> 
		</form>
		<form id="hiddenForm" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<input type="hidden" name="b_id" id="b_id" value="" />
		</form>
		<form id="excelForm" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/BindingExcel.action">
			<input type="hidden" name="card" id="card" value="${card }"/>
			<input type="hidden" name="vin" id="vin" value="${vin }"/>
		</form>
		<table class="optDiv">
			<tr>
				<td style="width:65%;"><div id="paginate"></div></td>
				<td style="width:35%;">&nbsp;
				<div class="optAdd" style="width:100px;"><a href="${pageContext.request.contextPath}/crm/ccioModule/web/bindforvb.jsp">卡绑定</a>
				<a href="javascript:excel();">导出</a>
				</div>
				</td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th>卡号</th>
	                        <th>VIN</th>
	                        <th>创建时间</th>
	                        <th>操作</th>
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td>${fn:substring(var.b_card, 16, 22)}</td>
                        <td>${var.b_vin}</td>
                        <td>${var.b_date}</td>
                        <td>
                        	<div class="edit"><a href="javascript:modify('${var.b_id}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.b_id}');">删除</a></div>
                        </td>
                        </tr>
                 </c:forEach>
            </table>
    </div>
</div>

</body>
</html>
