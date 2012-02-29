<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>到店离店时间列表</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/ccioModule/action/GetIodateList.action',
				form:'crmform',
				percount:10
			});
		});
		
</script> 
<script type="text/javascript">
			function getVin(divid,card){
				jQuery.post("${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindByCard.action",{'b_card':card},
					function(json,textStatus){
					        var num = json.bindSaturnData.length;
					        if(json.bindSaturnData!=""){
					        	jQuery('#'+divid).html(json.bindSaturnData.b_vin);
					        }
					},"json");
			}
			function detail(i_card){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/ccioModule/action/GetCarDet.action?i_card="+i_card;
				$('#hiddenForm')[0].submit();
			}
			function delConf(i_id){
				if(window.confirm("确认删除此条记录？")){
					$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/ccioModule/action/DelIODataById.action";
					$('#i_id').val(i_id);
					$('#hiddenForm')[0].submit();
				}
			}
	</script>
</head>
<body>
<div id="man_zone"> 
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetIodateList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>在店查询</legend>
              <table cellspacing="2" cellpadding="0">
                    <tr>
                    	<td class="colName">卡号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="s_card" id="s_card" value="${s_card}" style="width:150px;"/>
                      </td>
                      <td class="colName">到店类型:</td>
                      <td class="detailColVal">
                      	<select id="s_type" name="s_type">
                        	<option value=""></option>
                            <option value="1" ${s_type==1?"selected":""}>卡</option>
	             			<option value="2" ${s_type==2?"selected":""}>总值</option>
                        </select>
                      </td>
                      </tr>
                      <tr>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="s_vin" id="s_vin" value="${s_vin}"/>
                      </td>
                      <td class="colName">在店日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="in_date" value="${in_date}" id="in_date" onfocus="secondCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="out_date" value="${out_date}" id="out_date" onfocus="secondCalender(this)" class="Wdate"/>
                      </td>
                    </tr>
              </table> 
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询"/>
                    <input type="reset" value="重置" />
              </div>        
			</fieldset>  
		</form>
        <table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;">&nbsp;<!-- <div class="optAdd"><a href="javascript:addCareItem();">新增</a></div> --></td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th>到店类型</th>
	                        <th>VIN</th>
	                        <th>到店时间</th>
	                        <th>离店时间</th>
	                        <th>创建时间</th>   
	                        <th>基本操作</th>                                
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var" varStatus="sta">
                 	 <tr>
                        <td>${var.i_type==1?"卡":var.i_type==2?"总值":"&nbsp;"}${fn:substring(var.i_card, 16, 22) }</td>
                        <td>
                        ${var.i_vin}
                        <!-- 
                        <div id="vin_${sta.index}"></div>
                        <script type="text/javascript">getVin("vin_"+${sta.index},'${var.i_card}');</script>
                         -->
                        </td>
                        <td>${var.i_indate}</td>
                        <td>${var.i_outdate}</td>
                        <td>${var.i_date}</td>
                        <td>
                            <div class="detail" style="display:none;"><a href="javascript:detail('${var.i_card}');">详细</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.i_id}');">删除</a></div>
                        </td>
                        </tr>
                 </c:forEach>
            </table>
    </div>
</div>
<form id="hiddenForm" method="post" style="display:none;">
<input type="hidden" name="startIndex" value='${startIndex}'>
	<input type="hidden" name="endIndex" value='${endIndex}'>
	<input type="hidden" name="pageValue" value='${pageValue}'>
	<input type="hidden" name="s_card" id="s_card" value="${s_card}"/>
	<input type="hidden" name="s_type" id="s_type" value="${s_type}"/>
	<input type="hidden" name="s_vin" id="s_vin" value="${s_vin}"/>
	<input type="hidden" name="in_date" id="in_date" value="${in_date}"/>
	<input type="hidden" name="out_date" id="out_date" value="${out_date}"/>
	<input type="hidden" name="i_id" id="i_id" value=""/>
</form>
</body>
</html>
