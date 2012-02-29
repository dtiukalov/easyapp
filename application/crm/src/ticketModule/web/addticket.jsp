<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增代金</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					tikt_carvin:{
						required: true
					},
					tikt_tiktstate:{
						required: true
					},
					tikt_tiktamount:{
						required: true
					},
					tikt_tiktnumber:{
						maxlength: 12
					}
				},
				messages:{

				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/ticketModule/action/AddTicket.action?startIndex=0&endIndex=9">
  <fieldset>
    <legend>新增代金</legend>
    <table cellspacing="15" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
			<input type="text" name="tikt_carvin" id="tikt_carvin" value='<%=request.getParameter("carvin")==null?"":request.getParameter("carvin")%>'/>
	  </td>

      <td class="colName"">代金编号:</td>
      <td class="detailColVal">
      	 <input type="text" name="tikt_tiktnumber" id="tikt_tiktnumber"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">代金金额:</td>
      <td class="detailColVal">
          <input type="text" name="tikt_tiktamount" value='<%=request.getParameter("tiktamount")==null?"":request.getParameter("tiktamount")%>' id="tikt_tiktamount" class="auto"/>
	  </td>

      <td class="colName">发放时间:</td>
      <td class="detailColVal">
          <input type="text" name="tikt_tiktgranttime" id="tikt_tiktgranttime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">代金状态:</td>
      <td class="detailColVal">
        <select name="tikt_tiktstate" id="tikt_tiktstate"">
			<option value=""></option>
            <c:forEach items="${dict.crm_ticketState}" var="var">
            <c:if test='${var.key==param.tiktstate}'>			
            	<option value="${var.key}" selected>${var.value}</option>
            </c:if>
             <c:if test='${var.key!=param.tiktstate}'>			
            	<option value="${var.key}">${var.value}</option>
            </c:if>
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">使用时间:</td>
      <td class="detailColVal">
          <input type="text" name="tikt_tiktusetime" id="tikt_tiktusetime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:15px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketList.action?startIndex=0&endIndex=9'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
