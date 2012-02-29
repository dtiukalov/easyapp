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
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}','${carmodel}']
			});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/insuranceModule/action/QueryInsuranceList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(insuranceid){
			if(window.confirm("确认删除此条记录？")){
				window.location = ""; 
			}
		}
		
		function delConf(insuranceid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/insuranceModule/action/DeleteInsur.action?insuranceid="+insuranceid;
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(insuranceid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/insuranceModule/action/QueryInsuranceData.action?insuranceid="+insuranceid;
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "";
			$('#hiddenForm')[0].submit();
		}
		
</script> 
<title>保险管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/insuranceModule/action/QueryInsuranceList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>保险管理</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      
                    </tr>
                    
                    <tr>
                      <td class="colName">地区:</td>
                      <td class="detailColVal">
                      	<select id="cararea" name="cararea">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carArea}" var="var">				
				           		<c:if test="${var.key==cararea}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=cararea}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>			
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">保险日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_insudate}" name="min_insudate" id="min_insudate" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_insudate}" name="max_insudate" id="max_insudate" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车主:</td>
                      <td class="detailColVal">
                      	<input type="text" name="cstmname" id="cstmname" value="${cstmname}"/>
                      </td>
                    </tr>
                     <tr>
                      <td class="colName">品牌:</td>
                      <td class="detailColVal">
                      	<select id="carbrand" name="carbrand">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carModel$}" var="var">				
				           		<option value="${var.key}">${var.value}</option>			
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">车系:</td>
                      <td class="detailColVal">
                      	<select id="carseries" name="carseries"></select>
                      </td>
                      <td class="colName">车型:</td>
                      <td class="detailColVal">
                      	<select id="carmodel" name="carmodel"></select>
                      </td>
                    </tr> 
                    <tr>
                       <td class="colName">保险公司:</td>
                      <td class="detailColVal">
                      	<select id="insucompany" name="insucompany">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_insuCompany$}" var="var">				
				           		<c:if test="${var.key==insucompany}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=insucompany}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                      </td>
					  <td class="colName">保险结束日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_insuendtime}" name="min_insuendtime" id="min_insuendtime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_insuendtime}" name="max_insuendtime" id="max_insuendtime" onfocus="dayCalender(this)" class="Wdate"/>
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/insuranceModule/web/addInsurance.jsp">新增</a></div></td>
			</tr>
		</table>
     <div class="tbDiv">
     	<div style="width:2100px;">
     	   <table style="width:2080px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>车型</th>                      
                        <th>地区</th>
                        <th>保险公司</th>
                        <th>服务顾问</th>
                        <th>保险金额</th>
                        <th>保险日期</th>
                        <th>保险结束日期</th>
                        <th>车主</th>
                        <th>性别</th>
                        <th>电话</th>
                        <th>手机</th>
                        <th>基本操作</th>                                   
                    </tr>
               </table>
           </div>
           <div id="dataDiv" style="width:2120px;">
			   <table id="dataTb" style="width:2080px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>
                        <td>${var.carmodel_dict}</td>
                        <td>${var.cararea_dict}</td>
                        <td>${var.insucompany_dict}</td>
                         <td>${var.insustaff_dict}</td>
						<td>${var.insuamount}</td>
                        <td>${var.insudate}</td>
                        <td>${var.insuendtime}</td>
                        <td>${var.cstmname}</td>
                        <td>${var.cstmsex_dict}</td>
                        <td>${var.cstmtel}</td>
                        <td>${var.cstmmobile}</td>
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.insuranceid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.insuranceid}')">删除</a></div>
                        </td>
                 </c:forEach>		
           		 </table>
           	</div>	 
    </div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_insuendtime" value="${min_insuendtime}">
		<input type="hidden" name="max_insuendtime" value="${max_insuendtime}">
		<input type="hidden" name="insucompany" value="${insucompany}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="carmodel" value="${carmodel}">
		<input type="hidden" name="carseries" value="${carseries}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="cstmname" value="${cstmname}">
		<input type="hidden" name="min_insudate" value="${min_insudate}">
		<input type="hidden" name="max_insudate" value="${max_insudate}">
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
