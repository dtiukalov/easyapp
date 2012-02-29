<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提醒管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/remindModule/action/QueryRemindList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(remindid){
			if(window.confirm("确认删除此条记录？")){
				window.location = "<%=request.getContextPath()%>/crm::/remindModule/action/DeleteRemind.action?remindid="+remindid+"&startIndex=0&endIndex=9"; 
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/remindModule/action/QueryRemindList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>提醒管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">提醒时间:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_remdtime" id="min_remdtime" value="${min_remdtime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_remdtime" id="max_remdtime" value="${max_remdtime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                     
                    </tr>
                    <tr>
                      <td class="colName">提醒人:</td>
                      <td class="detailColVal">
                      	 <select id="remdname" name="remdname">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_waiter}" var="var">				
			             		<c:if test="${var.key==remdname}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=remdname}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                       <td class="colName">上次维修日期:</td>
                      <td class="detailColVal">
                      	<input type="text" name="min_servintime" id="min_servintime" value="${min_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_servintime" id="max_servintime" value="${max_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">提醒状态:</td>
                      <td class="detailColVal">
                        <select id="remdstate" name="remdstate">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_remdState}" var="var">				
			             		<c:if test="${var.key==remdstate}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=remdstate}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
	                    <td class="colName">车主性质:</td>
	                    <td class="detailColVal">
                      	<select id="carownership" name="carownership">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_carType}" var="var">				
			             		<c:if test="${var.key==carownership}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=carownership}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>		
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">车主:</td>
                      <td class="detailColVal">
                      	<input type="text" name="cstmname" id="cstmname" value="${cstmname}"/>
                      </td>
                      <!--
                      <td class="colName">送修人:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servdeliver" id="servdeliver" value="${servdeliver}"/>
                      </td>
                      -->
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/remindModule/web/addRemind.jsp">新增</a></div></td>
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:3445px;">
	      		<table style="width:3420px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>车牌号</th>
                        <th style="width:160px;">车架号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>车型</th>
                        <th>车主</th>
                        <th>车主电话</th>
                        <th>车主手机</th>
                        <th>车主性质</th> 
                        <!--
                        <th>送修人</th>                          
                        <th>送修人手机</th>
                        <th>送修人电话</th>
                        -->                            
                        <th>联系人</th>                                
                        <th>联系人手机</th>   		                          
                        <th>联系人电话</th>
                        <th>上次维修日期</th>
                        <th>上次维修里程</th> 
                        <!--
                        <th>预计下次保养日期</th> 
                        <th>下次保养里程</th>
						-->
                        <th>提醒人</th>  
                        <th style="width:300px;">提醒内容</th> 
                        <th>提醒状态</th>
                        <th style="width:200px;">提醒失败原因</th> 
                        <th>提醒时间</th>  
                        <th>客户反馈</th>   
                        <th>操作</th>                         
                    </tr>
             	 </table>
               </div>    
               <div id="dataDiv" style="width:3465px;">
			   <table id="dataTb" style="width:3420px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.carlicenceno}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>                        
                        <td>${var.carmodel_dict}</td>
         				<td>${var.cstmname}</td>
         			    <td>${var.cstmtel}</td>
                        <td>${var.cstmmobile}</td>
 						<td>${var.carownership_dict}</td>
 						<!--
                        <td>${var.servdeliver}</td>		
                        <td>${var.servdelivtel}</td>                            
                        <td>${var.servdelivmobile}</td>
                        -->
                        <td>${var.cstmcontact}</td>
                        <td>${var.cstmconttel}</td>
                        <td>${var.cstmcontmobile}</td>               
						<td>${var.servintime}</td>
                        <td>${var.servkilometer}</td>  
                        <!-- 
                        <td>${var.servmaintaindate}</td>                           
                        <td>${var.servmaintainmile}</td> 
                        -->
						<td>${var.remdname_dict}</td>                           
                        <td style="width:300px;">${var.remdcontent}</td> 
						<td>${var.remdstate_dict}</td> 
					    <td style="width:200px;">${var.remdfailreason}</td> 
                        <td>${var.remdtime}</td> 
                        <td>${var.remdfeedback}</td>                               
                        <td>
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/remindModule/action/QueryRemind.action?remindid=${var.remindid}">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.remindid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>		
            </table>
    </div>
</div>
</body>
</html>