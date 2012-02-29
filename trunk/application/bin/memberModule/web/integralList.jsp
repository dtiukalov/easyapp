<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			//控制数字输入
			$('#min_intglamount').autoNumeric({mDec:0});
			$('#max_intglamount').autoNumeric({mDec:0});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/memberModule/action/QueryIntegralList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(integralid,memberid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/memberModule/action/DeleteIntegral.action?integralid="+integralid+"&memberid="+memberid;
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(integralid,memberid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/memberModule/action/QueryIntegral.action?integralid="+integralid+"&memberid="+memberid;
			$('#hiddenForm')[0].submit();
		}
</script> 
<title>积分管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/memberModule/action/QueryIntegralList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>积分管理</legend>
               <table cellspacing="2" cellpadding="0">
               		<tr>
               		  <td class="colName">档案编号:</td>
                      <td class="detailColVal">${saturnData.carcardid}</td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">${saturnData.carlicenceno}</td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">${saturnData.carvin}
	                      <input type="hidden" name="carvin" value="${saturnData.carvin}"/>
	                      <input type="hidden" name="memberid" value="${saturnData.memberid}"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">品牌:</td>
                      <td class="detailColVal">${saturnData.carbrand_dict}</td>
                      <td class="colName">车系:</td>
                      <td class="detailColVal">${saturnData.carseries_dict}</td>
                      <td class="colName">入会时间:</td>
                      <td class="detailColVal">${saturnData.membjoindate}</td>
                    </tr>
                    <tr>
                      <td class="colName">会员卡号:</td>
                      <td class="detailColVal">${saturnData.membcardid}</td>
                      <td class="colName">会员类别:</td>
                      <td class="detailColVal">${saturnData.membtype_dict}</td>
                      <td class="colName">现有积分:</td>
                      <td class="detailColVal">${saturnData.intglamount}</td>
                    </tr>
                    <tr>
                      <td class="colName">积分类别:</td>
                      <td class="detailColVal">
					  	<select name="intgltype" id="intgltype">
						   <option value=""></option>
				           <c:forEach items="${dict.crm_intglType}" var="var">				
				           		<c:if test="${var.key==intgltype}">
				           			<option value="${var.key}" selected>${var.value}</option>
				           		</c:if>	
				           		<c:if test="${var.key!=intgltype}">
				           			<option value="${var.key}">${var.value}</option>
				           		</c:if>		
				           	</c:forEach>
				         </select>
					  </td>
                      <td class="colName">积分时间:</td>
                      <td class="detailColVal" colspan=3>
					  	<input type="text"  name="min_intgltime" id="min_intgltime" value="${min_intgltime}" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_intgltime" id="max_intgltime" value="${max_intgltime}" onfocus="dayCalender(this)" class="Wdate"/>
					  </td>
					  <td>
					  	<input type="submit" value="查询"/> 
					  </td>
                    </tr>
              </table> 
			</fieldset>           
		</form>
        <table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;">
				<div class="optAdd"><a href="<%=request.getContextPath()%>/crm::/memberModule/action/QueryMemberInfo.action?memberid=${saturnData.memberid}">新增</a></div>
				</td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%">
	      		<table style="width:100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>积分时间</th>
                        <th>积分项目</th>
                        <th>积分数量</th>
                        <th>积分类别</th>
                        <th>基本操作</th>                                   
                    </tr>
                </table>
             </div>       
               <div id="dataDiv" style="width:100%">
			   <table id="dataTb" style="width:100%" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                 	    <td>${fn:substring(var.intgltime,0,10)}</td>
                        <td>${var.intglitem}</td>
                        <td>${var.intglamount}</td>
                        <td>${var.intgltype_dict}</td>
                        <td>
                        	<div class="edit"><a href="javascript:modify('${var.integralid}','${saturnData.memberid}');">修改</a></div> 
                            <div class="delete"><a href="javascript:delConf('${var.integralid}','${saturnData.memberid}');">删除</a></div>  
                        </td>
                 </c:forEach>	
	            </table>
	    </div>
	</div>
	<div style="display:none;">
		<form id="hiddenForm" name="hiddenForm" method="post">
			<input type="hidden" name="memberid" value="${memberid}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="min_intgltime" value="${min_intgltime}">
			<input type="hidden" name="max_intgltime" value="${max_intgltime}">
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
		</form>
	</div>
</body>
</html>
