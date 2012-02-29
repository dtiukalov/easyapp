<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>维修管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$('#servstaff').selectDict({type:'crm_waiter',id:'servstaff',value:'${servstaff}'});
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/serviceModule/action/QueryServiceList.action',
				form:'crmform',
				percount:10
			});
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries'],
					type:'crm_carModel',
					firstValue:[['','选择车型']],
					defaultValue:['${carbrand}','${carseries}']
			});
		});
		
		function delConf(serviceid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/serviceModule/action/DeleteService.action?serviceid="+serviceid; 
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(serviceid){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/serviceModule/action/QueryService.action?serviceid="+serviceid;
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/serviceModule/action/ExportServiceList.action";
			$('#hiddenForm')[0].submit();
		}
		
		function openVisit(servorderid){
			window.open ("${pageContext.request.contextPath}/crm::/visitModule/action/QueryVisitList.action?servorderid="+servorderid+"&startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/serviceModule/action/QueryServiceList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>维修管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr class="rowClass">
                      <td class="colName">档案号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">进厂日期:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_servintime" id="min_servintime" value="${min_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_servintime" id="max_servintime" value="${max_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                    </tr>
                    <tr class="rowClass">
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	 <input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                       <td class="colName">出厂时间:</td>
                      <td class="detailColVal">
                      	<input type="text" name="min_servouttime" id="min_servouttime" value="${min_servouttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_servouttime" id="max_servouttime" value="${max_servouttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">维修分类:</td>
                      <td class="detailColVal">
                        <select id="servtype" name="servtype">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_serviceType}" var="var">				
			             		<c:if test="${var.key==servtype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=servtype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr class="rowClass">
                      <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servorderid" id="servorderid" value="${servorderid}"/>
                      </td>
                      <td class="colName">是否交车:</td>
                      <td class="detailColVal">
                      	<select id="isFinished" name="isFinished">
                            <option value=""></option>			
		             		<c:if test="${isFinished=='1'}">
		             			<option value="1" selected>是</option>
		             			<option value="0">否</option>
		             		</c:if>	
		             		<c:if test="${isFinished=='0'}">
		             			<option value="1">是</option>
		             			<option value="0" selected>否</option>
		             		</c:if>	
		             		<c:if test="${isFinished!='0'&&isFinished!='1'}">
		             			<option value="1">是</option>
		             			<option value="0">否</option>
		             		</c:if>				
                        </select>
                      </td>
                      <td class="colName">服务顾问:</td>
                      <td class="detailColVal">
                        <select id="servstaff" name="servstaff">
                        </select>
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
					        <select id="carseries" name="carseries">
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
				<td><div id="paginate"></div></td>
				<td><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/serviceModule/web/addService.jsp">新增</a></div>
				<div class="optAdd"><a href="javascript:exportExcel();">导出</a></div></td>
			</tr>
		</table>
       <div class="tbDiv">
			<div style="width:3200px;">
				<table style="width:3180px;" cellspacing="0" cellpadding="0">
                    <tr>
                    	<th>档案编号</th>
                        <th style="width:160px;">进厂日期</th>
                        <th style="width:160px;">工单号</th>
                        <th>维修类型</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>是否返修</th>                          
                        <th>进厂行驶里程</th> 
                        <th style="width:300px;">维修项目</th>                           
                        <th>优惠劵</th>
                        <th>转账</th> 
                        <th>现金消费</th>  
                        <th>消费总额</th> 
                        <th>钣金主修</th>
                        <th>喷漆主修</th>
                        <th>机电主修</th>
                        <th>交车日期</th>
                        <th>是否回访</th>
						<th>预约单号</th> 
						<th>服务顾问</th>
                        <th>操作</th>                         
                    </tr>
                       </table>
			</div>
			<div id="dataDiv" style="width:3225px;">
				<table id="dataTb" style="width:3180px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                   		<td>${var.carcardid}</td>
                        <td style="width:160px;">${var.servintime}</td>
                        <td style="width:160px;">${var.servorderid}</td>
                        <td>${var.servtype_dict}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>                        
                        <td>${var.carbrand_dict}</td>
         				<td>${var.carseries_dict}</td>
                        <td>
                        	<c:if test="${var.isrework=='1'}">是</c:if>
	                        <c:if test="${var.isrework=='0'}">否</c:if>
                        </td>		                          
                        <td>${var.servkilometer}</td>
                        <td style="width:300px;">${var.servitems}</td>
                        <td>${floatFormat[var.servticketexp]}</td>                      
                        <td>${floatFormat[var.servtransfer]}</td> 
                        <td>${floatFormat[var.servcashexp]}</td> 
						<td>${floatFormat[var.servamountexp]}</td> 
					    <td>${var.servmetalworker_dict}</td> 
                        <td>${var.servpaintworker_dict}</td> 
                        <td>${var.servelecworker_dict}</td>  
                        <td>${var.servouttime}</td> 
                        <c:if test="${var.isvisited=='1'}">    
                        	<td>是</td>  
                        </c:if>
                        <c:if test="${var.isvisited=='0'}">
                        	<td>否</td>
                        </c:if>
                        <c:if test="${var.isvisited!='0'&&var.isvisited!='1'}">
                        	<td>&nbsp;</td>
                        </c:if>
                        <td>${var.resveorederid}</td>   
                        <td>${var.servstaff_dict}</td>                                    
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.serviceid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.serviceid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_servintime" value="${min_servintime}">
		<input type="hidden" name="max_servintime" value="${max_servintime}">
		<input type="hidden" name="servtype" value="${servtype}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="servorderid" value="${servorderid}">
		<input type="hidden" name="max_servouttime" value="${max_servouttime}">
		<input type="hidden" name="min_servouttime" value="${min_servouttime}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="isFinished" value="${isFinished}">
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
		<input type="hidden" name="servstaff" value='${servstaff}'>
		<input type="hidden" name="carbrand" value='${carbrand}'>
		<input type="hidden" name="carseries" value='${carseries}'>
		<input type="hidden" name="carmodel" value='${carmodel}'>
	</form>
</div>
</body>
</html>