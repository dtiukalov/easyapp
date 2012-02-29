<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车辆档案管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action',
				form:'crmform',
				percount:10
			});
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}','${carmodel}']
			});
		});
		function modify(carid,customerid){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/carModule/action/QueryCarDetailInfo.action?carid="+carid+"&customerid="+customerid;
			$('#hiddenForm')[0].submit();
		}
		
		function detail(carid,customerid){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/carModule/action/QueryCarDetailInfo.action?carid="+carid+"&customerid="+customerid+"&type=detail";
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			//$('#hiddenForm')[0].action = "/crm::/carModule/action/ExportCarExcel.action";
			$('#crmform')[0].action = "<%=request.getContextPath()%>/crm/coreModule/web/carinfov.jsp?op=excelz";
			$('#crmform')[0].submit();
		}
		
		
		
		function setSubmit(){
			$('#crmform')[0].action = "${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=10";
			//$('#crmform')[0].submit();
		}
		
		function delConf(carid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/carModule/action/DeleteCarInfo.action?carid="+carid; 
				$('#hiddenForm')[0].submit();
			}
		}
</script>  
<script type="text/javascript">
			function getMore(divid,vin){
				jQuery.post("${pageContext.request.contextPath}/crm::/carModule/action/GetListMore.action",{'vin':vin},
					function(json,textStatus){
					        var num = json.resultMore.length;
					        if(json.resultMore!=""){
					        	jQuery('#a_'+divid).html(json.resultMore.servintime.substring(0,10));
					        	jQuery('#b_'+divid).html(json.resultMore.servkilometer);
					        	jQuery('#c_'+divid).html(json.resultMore.servitems);
					        	jQuery('#d_'+divid).html(json.resultMore.carlmaintaintime);
					        	jQuery('#e_'+divid).html(json.resultMore.carlmaintainmile);
					        }
					},"json");
			}
	</script>                                                
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=10">
			<fieldset id="formFiled">
			  <legend>车辆档案管理</legend>
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
                       <td class="colName">车辆来源:</td>
                      <td class="detailColVal">
                      	<select id="carsource" name="carsource">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_carSource$}" var="var">				
			            		<c:if test="${var.key==carsource}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=carsource}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			            	</c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">档案级别:</td>
                      <td class="detailColVal">
                      	<select id="carcardlevel" name="carcardlevel">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_cardLevel$}" var="var">				
				           		<c:if test="${var.key==carcardlevel}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=carcardlevel}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>			
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">&nbsp;</td>
                      <td class="detailColVal">
                      	&nbsp;
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
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
                      <td class="colName">车店距离:</td>
                      <td class="detailColVal">
                        <select id="carshoprange" name="carshoprange">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_shopRange$}" var="var">				
			             		<c:if test="${var.key==carshoprange}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=carshoprange}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">车主:</td>
                      <td class="detailColVal">
                      		<input type="text" name="cstmname" id="cstmname" value="${cstmname}"/>
                      </td>
                      <td class="colName">销售日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_carselldate" value="${min_carselldate}" id="min_carselldate" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_carselldate" value="${max_carselldate}" id="max_carselldate" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">联系人:</td>
                      <td class="detailColVal">
                      	<input type="text" name="cstmcontact" value="${cstmcontact}" id="cstmcontact"/>
                      </td>
                     
                      <td class="colName">会员类型:</td>
                      <td class="detailColVal">
                      	<select id="membtype" name="membtype">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_membType}" var="var">				
			            		<c:if test="${var.key==membtype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=membtype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			            	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">建档日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_carcreatetime}" name="min_carcreatetime" id="min_carcreatetime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_carcreatetime}" name="max_carcreatetime" id="max_carcreatetime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                    </tr>
                   
                    <tr>
                     <td class="colName">地区:</td>
                     <td class="detailColVal">
                      	<select id="cararea" name="cararea">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carArea$}" var="var">	
                           		<c:if test="${cararea==var.key}">
                           			<option value="${var.key}" selected="selected">${var.value}</option>
                           		</c:if>	
                           		<c:if test="${cararea!=var.key}">
                           			<option value="${var.key}">${var.value}</option>
                           		</c:if>			
				           	</c:forEach>
                        </select>
                      </td>
                      
                     <td class="colName">车色:</td>
                     <td class="detailColVal">
                      	<select id="carcolor" name="carcolor">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carColor$}" var="var">				
				           		<option value="${var.key}">${var.value}</option>			
				           	</c:forEach>
                        </select>
                      </td>
                      <!-- 
                      <td class="colName">进厂日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_servintime}" name="min_servintime" id="min_servintime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_servintime}" name="max_servintime" id="max_servintime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                       -->
                    </tr>
                   
                   <tr>
                    <td class="colName">固定电话:</td>
                     <td class="detailColVal">
                      	<input type="text" name="cstmtel" id="cstmtel" value="${cstmtel}"/>
                      </td>
                      
                      <td class="colName">其他联系方式:</td>
                     <td class="detailColVal">
                      	<input type="text" name="cstmcontmobile" id="cstmcontmobile" value="${cstmcontmobile}"/>
                      </td>
                      <!-- 
                      <td class="colName">出厂日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_servouttime}" name="min_servouttime" id="min_servouttime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_servouttime}" name="max_servouttime" id="max_servouttime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                       -->
                   </tr>
                   <tr>
                      <td class="colName">手机:</td>
                     <td class="detailColVal">
                      	<input type="text" name="cstmmobile" id="cstmmobile" value="${cstmmobile}"/>
                      </td>
                      
                    </tr>
              </table> 
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询" onclick="javascript:setSubmit();"/>
                    <input type="reset" value="重置" />
              </div>        
			</fieldset>           
		</form>
		<table class="optDiv">
			<tr>
				<td style="width:65%;"><div id="paginate"></div></td>
				<td style="width:35%;">
				<div class="optAdd" style="width: 160px;"><a href="<%=request.getContextPath()%>/crm/carModule/web/addcar.jsp">新增</a>
	
				<a href="<%=request.getContextPath()%>/crm/coreModule/web/carinfov.jsp">全部导出</a>
				<a href="javascript:exportExcel();">导出</a></div>
				</td>
			</tr>
		</table>
		
		<div class="tbDiv">
			<div style="width:3180px;">
				<table style="width:3160px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th>建档时间</th>
                        <th>档案级别</th>
                        <th>销售日期</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>车型</th>                      
                        <th>车色</th>
                        <th>年款</th>
                        <th>地区</th>
                        <th>车辆类别</th>
                        <th>车辆来源</th>
                        <th>车店距离</th>
                        <!-- 
                        <th>用户类别</th>
                         -->
                        <th>会员类型</th>
                        <th>车主</th>
                        <th>性别</th>
                        <th>电话</th>
                        <th>手机</th>
                        <th>联系人</th>
                        <th>联系人性别</th>
                        <th>电话</th>
                        <th>其他联系方式</th>
                        <!-- 
                        <th>最后一次<br/>进厂时间</th>
                        <th>最后一次<br/>进厂里程</th>
                        <th>最后一次<br/>进厂作业项目</th>
                        <th>最后一次<br/>保养时间</th>
                        <th>最后一次<br/>保养里程</th>
                         -->
                        <th style="width:100px;">基本操作</th>                                  
                    </tr>
                    </table>
			</div>
			<div id="dataDiv" style="width:3205px;">
				<table id="dataTb" style="width:3160px;" cellspacing="0" cellpadding="0">
                     <c:forEach items="${result}" var="var" varStatus="sta">
                   <tr>
                        <td>${var.carcardid}</td>
                        <td>${var.carcreatetime}</td>
                        <td>${var.carcardlevel_dict}</td>
                        <td>${var.carselldate}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>
                        <td>${var.carmodel_dict}</td>
                        <td>${var.carcolor}</td>
                        <td>${var.caryearstyle}</td>
                        <td>${var.cararea_dict}</td>
                        <td>${var.carownership_dict}</td>
                        <td>${var.carsource_dict}</td>
                        <td>${var.carshoprange_dict}</td>
                        <td>${var.membtype_dict}</td>
                        <td>${var.cstmname}</td>
                        <td>${var.cstmsex_dict}</td>
                        <td>${var.cstmtel}</td>
                        <td>${var.cstmmobile}</td>
                        <td>${var.cstmcontact}</td>
                        <td>${var.cstmcontsex_dict}</td>
                        <td>${var.cstmconttel}</td>
                        <td>${var.cstmcontmobile}</td>
                        <!-- 
                        <td id="a_${sta.index}"></td>
                        <td id="b_${sta.index}"></td>
                        <td id="c_${sta.index}"></td>
                        <td id="d_${sta.index}"></td>
                        <td id="e_${sta.index}"></td>
                        <script type="text/javascript">getMore('${sta.index}','${var.carvin}');</script>
                         -->
                        <td style="width:100px;">
						
                            <div class="edit"><a href="javascript:modify('${var.carid}','${var.customerid}');">修改</a></div>
                            <div class="detail"><a href="javascript:detail('${var.carid}','${var.customerid}');">详细</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.carid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>
                   </table>
			</div>
		
		</div>
</div>
<form id="hiddenForm" method="post" style="display:none;">
	<input type="hidden" name="carlicenceno" value="${carlicenceno}"/>
	<input type="hidden" name="carcardid" value="${carcardid}"/> 
	<input type="hidden" name="carcardtype" value="${carcardtype}"/>
	<input type="hidden" name="carcardlevel" value="${carcardlevel}"/> 
	<input type="hidden" name="carusertype" value="${carusertype}"/> 
	<input type="hidden" name="carvin" value="${carvin}"/>                      	
	<input type="hidden" name="carbrand" value="${carbrand}"/> 
	<input type="hidden" name="carseries" value="${carseries}"/>                    
	<input type="hidden" name="carmodel" value="${carmodel}"/>  
	<input type="hidden" name="cstmname" value="${cstmname}"/> 
	<input type="hidden" name="min_carselldate" value="${min_carselldate}"/>   
	<input type="hidden" name="max_carselldate" value="${max_carselldate}"/>  
	<input type="hidden" name="cstmcontact" value="${cstmcontact}" />    
	<input type="hidden" name="membtype" value="${membtype}"/>                     
	<input type="hidden" name="min_carcreatetime" value="${min_carcreatetime}" />    
	<input type="hidden" name="max_carcreatetime" value="${max_carcreatetime}" />              
	<input type="hidden" name="carsource" value="${carsource}"/>
	<input type="hidden" name="startIndex" value='${startIndex}'>
	<input type="hidden" name="endIndex" value='${endIndex}'>
	<input type="hidden" name="pageValue" value='${pageValue}'>
	<input type="hidden" name="cararea" value='${cararea}'>
	<input type="hidden" name="carcolor" value='${carcolor}'>
	<input type="hidden" name="cstmmobile" value='${cstmmobile}'>
	<input type="hidden" name="cstmtel" value='${cstmtel}'>
	<input type="hidden" name="cstmcontmobile" value='${cstmcontmobile}'>
</form>
</body>
</html>