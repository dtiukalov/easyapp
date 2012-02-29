<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>进厂车辆管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:${count}, 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyDetail.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(dutyitemid,dutyid){
			if(window.confirm("确认删除此条记录？")){
				window.location = "<%=request.getContextPath()%>/crm::/dutyModule/action/DeleteDutyItem.action?dutyitemid="+dutyitemid+"&dutyid="+dutyid+"&startIndex=0&endIndex=9"; 
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" method="post">
	<input type="hidden" value="<%=request.getParameter("min_dutyintime")%>" name="min_dutyintime" id="min_dutyintime">
<input type="hidden" value="<%=request.getParameter("max_dutyintime")%>" name="max_dutyintime" id="max_dutyintime">
	
	<fieldset>
	<legend>进厂车辆管理</legend>
       <table cellspacing="10" cellpadding="0">
				    <tr>
				      <td class="colName">车牌号:</td>
				      <td class="detailColVal">
				          ${saturnData.carlicenseno}
					  </td>
				      <td class="colName">进厂时间:</td>
				      <td class="detailColVal">
				        ${saturnData.dutyintime}
					  </td>
				      <td class="colName">车型:</td>
				      <td class="detailColVal">
				      	  ${saturnData.dutycarmodel_dict}
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">接待人员:</td>
				      <td class="detailColVal">
				         ${saturnData.dutystaff_dict}
					  </td>
				      <td class="colName">提车员:</td>
				      <td class="detailColVal">
				         ${saturnData.dutyprovide_dict}
					  </td>
				      <td class="colName">预计交车时间:</td>
				      <td class="detailColVal">
				          ${saturnData.dutypredelivtime}
					  </td>
				    </tr>
				    <tr>
					      <td class="colName">作业项目:</td>
					      <td class="detailColVal" style="width:30%;">
					          ${saturnData.dutywkcontent}
						  </td>
				    </tr>
              </table>        
			</fieldset>           
		</form>
		<table class="optDiv">
			<tr>
				<td><label class="rsTitle">进厂车辆管理</label></td>
				<td><div id="paginate"></div></td>
				<td>
				<div class="optAdd"><a href="<%=request.getContextPath()%>/crm/dutyModule/web/addDutyItem.jsp?carlicenseno=${saturnData.carlicenseno}&dutyid=${saturnData.dutyid}">新增</a></div>
				</td>
			</tr>
		</table>

        <div class="tbDiv">
			<div>
				<table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>作业类型</th>
                        <th>作业人</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>工位</th>
                        <th>基本操作</th>                                  
                    </tr>
                 </table>
			</div>
			<div id="dataDiv">
				<table id="dataTb" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.ditemtype_dict}</td>
                        <td>${var.ditemoperator}</td>
                        <td>${var.ditemstarttime}</td>
                        <td>${var.ditemendtime}</td>
                        <td>${var.ditemstation}</td>
                        <td>
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/dutyModule/action/QueryDutyItemData.action?dutyitemid=${var.dutyitemid}&dutyid=${var.dutyid}&carlicenseno=${saturnData.carlicenseno}&startIndex=0&endIndex=9">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.dutyitemid}','${var.dutyid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>