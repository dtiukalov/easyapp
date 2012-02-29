<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>档案级别变更记录</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/carModule/action/GetLevelList.action',
				form:'crmform',
				percount:10
			});
			$("#dataTb tr").dblclick(function (){ 
				var strHref =  $(this).find('.edit').find('a').attr("href");
				document.location.href=strHref;
				//window.open(strHref, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
			}); 
		});
		
</script> 
<script type="text/javascript">
			function getCar(divid,carid){
				jQuery.post("${pageContext.request.contextPath}/crm::/carModule/action/GetCarById.action",{'carid':carid},
					function(json,textStatus){
					        var num = json.carSaturnData.length;
					        if(json.carSaturnData!=""){
					        	jQuery('#card_'+divid).html(json.carSaturnData.carcardid);
					        	jQuery('#licno_'+divid).html(json.carSaturnData.carlicenceno);
					        	jQuery('#vin_'+divid).html(json.carSaturnData.carvin);
					        	var hrefz="${pageContext.request.contextPath}/crm::/carModule/action/QueryCarDetailInfo.action?typez=level&carid="+json.carSaturnData.carid+"&customerid="+json.carSaturnData.customerid;
					        	jQuery('#xg_'+divid).attr('href',hrefz);
					        }
					},"json");
			}
	</script>
	<style>
.autocomplete-w1 { background:url(img/shadow.png) no-repeat bottom right; position:absolute; top:0px; left:0px; margin:6px 0 0 6px; /* IE6 fix: */ _background:none; _margin:1px 0 0 0; }
.autocomplete { border:1px solid #999; background:#FFF; cursor:default; text-align:left; max-height:350px; overflow:auto; margin:-6px 6px 6px -6px; /* IE6 specific: */ _height:350px; _margin:0; _overflow-x:hidden; }
.autocomplete .selected { background:#F0F0F0; }
.autocomplete div { padding:2px 5px; white-space:nowrap; overflow:hidden; }
.autocomplete strong { font-weight:normal; color:#3399FF; } 
</style>
</head>
<body>
<div id="man_zone"> 
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/carModule/action/GetLevelList.action" method="post">
		<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>档案级别变更记录</legend>
              <table cellspacing="2" cellpadding="0">
                    <tr>
                    	<td class="colName">档案号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}" style="width:150px;"/>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvinzz" value="${carvin}" autocomplete="off" style="width:200px;"/>
                      </td>
                      </tr>
                      <tr>
                      <td class="colName">变更类型:</td>
                      <td class="detailColVal">
                      	<select id="l_type" name="l_type">
                        	<option value=""></option>
                            <option value="1" ${l_type==1?"selected":""}>月操作</option>
	             			<option value="2" ${l_type==2?"selected":""}>单次操作</option>
	             			<option value="3" ${l_type==3?"selected":""}>死档操作</option>
                        </select>
                      </td>
                      <td class="colName">变更步骤:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<select id="l_oldlevel" name="l_oldlevel">
			            <option value=""></option>
			           	<c:forEach items="${dict.crm_cardLevel$}" var="var">	
			           	    <c:if test="${var.key==l_oldlevel}">
			           			<option value="${var.key}" selected>${var.value}</option>
			           		</c:if>	
			           		<c:if test="${var.key!=l_oldlevel}">
			           			<option value="${var.key}">${var.value}</option>
			           		</c:if>					
			           	</c:forEach>
			         </select>
                        <span>至</span>
                        <select id="l_newlevel" name="l_newlevel">
			            <option value=""></option>
			           	<c:forEach items="${dict.crm_cardLevel$}" var="var">	
			           	    <c:if test="${var.key==l_newlevel}">
			           			<option value="${var.key}" selected>${var.value}</option>
			           		</c:if>	
			           		<c:if test="${var.key!=l_newlevel}">
			           			<option value="${var.key}">${var.value}</option>
			           		</c:if>					
			           	</c:forEach>
			         </select>
                      </td>
                      </tr>
                      <tr>
                      <td class="colName">变更时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="start_datetime" value="${start_datetime}" id="start_datetime" onfocus="secondCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="end_datetime" value="${end_datetime}" id="end_datetime" onfocus="secondCalender(this)" class="Wdate"/>
                      </td>
                      <td></td>
                      <td></td>
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
	                    	<th>档案号</th>
	                    	<th>车牌号</th>
	                    	<th>VIN</th>
	                        <th style="width:50px;">原级别</th>
	                        <th style="width:50px;">新级别</th>
	                        <th style="width:50px;">操作类别</th>
	                        <th>变更说明</th>
	                        <th>变更时间</th>  
	                        <th style="width:30px;">操作</th>                              
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var" varStatus="sta">
                 	 <tr>
                 	 	<td>
                 	 	<div id="card_${sta.index}"></div>
                 	 	</td>
                 	 	<td>
                 	 	<div id="licno_${sta.index}"></div>
                 	 	</td>
                 	 	<td>
                 	 	<div id="vin_${sta.index}"></div>
                 	 	</td>
                        <td style="width:50px;">${var.l_oldlevel_dict}</td>
                        <td style="width:50px;">${var.l_newlevel_dict}</td>
                        <td style="width:50px;">${var.l_type==1?"月操作":var.l_type==2?"单次操作":var.l_type==3?"死档操作":""}</td>
                        <td title="${var.l_note}">${var.l_note}</td>
                        <td>${var.l_datetime}</td>
                        <td style="width:30px;">
                        <div class="edit"><a id="xg_${sta.index}" href="javascript:void(0);">修改</a></div>
                        <script type="text/javascript">getCar('${sta.index}','${var.cardid}');</script>
                        </td>
                        </tr>
                 </c:forEach>
            </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
$('#carvinzz').autocomplete({
        serviceUrl: '', // Page for processing autocomplete requests
        minChars: 2, // Minimum request length for triggering autocomplete
        delimiter: /(,|;)\s*/, // Delimiter for separating requests (a character or regex)
        maxHeight: 400, // Maximum height of the suggestion list, in pixels
        width: 200, // List width
        zIndex: 9999, // List's z-index
        deferRequestBy: 0, // Request delay (milliseconds), if you prefer not to send lots of requests while the user is typing. I usually set the delay at 300 ms.
        params: { country: 'Yes'}, // Additional parameters
        onSelect: function(data, value){ }, // Callback function, triggered if one of the suggested options is selected,
        lookup: ['January', 'February', 'March'] // List of suggestions for local autocomplete
    });
	
</script>
<script>
var onAutocompleteSelect = function(value, data) {
      //$('#selection').html('<img src="\/global\/flags\/small\/' + data + '.png" alt="" \/> ' + value);
      //alert(data);
    }

var options = {
      //serviceUrl: '<%=request.getContextPath() %>/crm/ccioModule/web/vinsdata.jsp',
      serviceUrl: '<%=request.getContextPath() %>/crm::/ccioModule/action/GetVinByLike.action',
      width: 200,
      delimiter: /(,|;)\s*/,
      //onSelect: onAutocompleteSelect,
      deferRequestBy: 0, //miliseconds
      params: { country: 'Yes' },
      noCache: false //set to true, to disable caching
    };

	var ac = $('#carvinzz').autocomplete(options);
    ac.disable();
    ac.enable();
    ac.setOptons({ zIndex: 1001 });
</script>