<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>机油管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$('#jy_jystaff').selectDict({type:'crm_waiter',id:'jy_jystaff',value:'${jystaff}'});
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJYList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(jyid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/jiyouModule/action/DeleteJY.action?jyid="+jyid;
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(jyid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJY.action?jyid="+jyid;
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/jiyouModule/action/ExportJYList.action";
			$('#hiddenForm')[0].submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJYList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>机油管理</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr class="rowClass">
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">服务顾问:</td>
                      <td class="detailColVal">
                      	<select id="jy_jystaff" name="jystaff">                        	
                        </select>
                      </td> 
                      <td class="colName">录入时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_jyselltime" id="min_jyselltime" value="${min_jyselltime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_jyselltime" id="max_jyselltime" value="${max_jyselltime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                  	</tr>
                  	<tr>
                  	  <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" value="${servorderid}" name="servorderid" id="servorderid"/>
                      </td>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" value="${carcardid}" name="carcardid" id="carcardid"/>
                      </td>
                      <td class="colName">节余机油:</td>
                      <td class="detailColVal">
                      	<select name="jystate" id="jystate">
                      		<option value=""></option>
                      		<c:if test="${jystate=='1'}">
                      			<option value="1" selected>外销</option>
                      			<option value="0">带走</option>
                      		</c:if>
                      		<c:if test="${jystate=='0'}">
                      			<option value="0" selected>带走</option>
                      			<option value="1">外销</option>
                      		</c:if>
                      		<c:if test="${jystate!='1'&&jystate!='0'}">
                      			<option value="0">带走</option>
                      			<option value="1">外销</option>
                      		</c:if>
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
				<td style="width:15%;">
				<div class="optAdd"><a href="<%=request.getContextPath()%>/crm/jiyouModule/web/addJY.jsp">新增</a></div>
				<div class="optAdd"><a href="javascript:exportExcel();">导出</a></div>
				</td>
			</tr>
		</table>
         <div class="tbDiv">
     		<div style="width:1280px;">
	      		<table style="width:1280px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th style="width:160px;">工单号</th>
                        <th>机油类型</th>
                        <th>大桶数量</th>
                        <th>小桶数量</th>
                        <th>录入时间</th>
                        <th>节余机油</th>
                        <th>服务顾问</th>
                        <th>基本操作</th>                          
                    </tr>
                  </table>
            </div>	
             <div id="dataDiv" style="width:1300px;">
			   <table id="dataTb" style="width:1280px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                 	 	<td>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td style="width:160px;">${var.servorderid}</td>
                        <td>${var.jytype_dict}</td>
                        <td>${var.jybignum}</td>
                        <td>${var.jysmallnum}</td>
                        <td>${var.jyselltime}</td>
                        <td>
                        	<c:if test="${var.jystate=='1'}">外销</c:if>
                        	<c:if test="${var.jystate=='0'}">带走</c:if>
                        </td>
                        <td>${var.jystaff_dict}</td>
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.jyid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.jyid}')">删除</a></div>
                        </td>
                 </c:forEach>		
            </table>
    </div>
</div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="servorderid" value="${servorderid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="jystaff" value="${jystaff}">
		<input type="hidden" name="jystate" value="${jystate}">
		<input type="hidden" name="min_jyselltime" value="${min_jyselltime}">
		<input type="hidden" name="max_jyselltime" value="${max_jyselltime}">
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
