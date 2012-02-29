<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>积分列表</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${deccount}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/pointModule/action/PointListByVinDec.action',
				form:'crmform',
				percount:10
			});
		});
</script> 
<script type="text/javascript">
			function getPL(divid,p_title,p_note){
				if(p_title=='0'){
					jQuery('#'+divid).html('<div style="text-align: right;"><span>'+p_note+'&nbsp;&nbsp;&nbsp;</span></div>');
				}else{
					jQuery.post("${pageContext.request.contextPath}/crm::/pointModule/action/PointlogListByPtitle.action",{'p_title':p_title},
					function(json,textStatus){
					        var num = json.plresult.length;
					        var i=0;
					        var code='';
							for(;i<num;i++){
					        	code+='<div style="text-align: right;"><span>'+json.plresult[i].pr_lable+'</span><span style="width:50px;">&nbsp;&nbsp;&nbsp;小计：'+json.plresult[i].pl_point+'分&nbsp;&nbsp;&nbsp;</span></div>';
					        }
					        jQuery('#'+divid).html(code);
					},"json");
				}
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
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/pointModule/action/PointListByVinDec.action" method="post">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>兑换查询</legend>
              <table cellspacing="2" cellpadding="0">
                      <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <!-- 
                      <td class="colName">发动机号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carengineno" id="carengineno" value="${carengineno}"/>
                      </td>
                       -->
                      <td class="colName">VIN:</td>
                      <td class="detailColVal">
                      	<input type="text" name="p_vin" id="p_vin" value="${p_vin}" autocomplete="off" style="width:200px;"/>
                      </td>
                      <!-- 
                      <td class="colName">日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="in_date" value="${in_date}" id="in_date" onfocus="secondCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="out_date" value="${out_date}" id="out_date" onfocus="secondCalender(this)" class="Wdate"/>
                      </td>
                       -->
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
				<td style="width:75%;"><div id="paginate"></div></td>
				<td style="width:25%;">&nbsp;<div class="optAdd" style="width:75px;"><a href="${pageContext.request.contextPath}/crm/pointModule/web/decpoint.jsp">兑换积分</a></div></td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                    	<th>明细</th>
	                        <th>合计兑换积分</th>
	                        <th>时间</th>
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${decresult}" var="var" varStatus="sta">
                 	 <tr>
                 	 <td>
                        <div id="vin_${sta.index}" style="width:100%;padding:0;"></div>
                        <script type="text/javascript">getPL("vin_"+${sta.index},'${var.p_title}','${var.p_note}');</script>
                        </td>
                        <td>${var.p_addpoint}分</td>
                        <td>${var.p_datetime}</td>
                        </tr>
                 </c:forEach>
                 <tr>
                 	 <td colspan="3" style="text-align: right;"><div>有效积分：总分 ${addpoint}分，兑换 ${decpoint}分，剩余 ${sumpoint}分。</div></td>
                        </tr>
            </table>
    </div>
</div>
        </div>
</body>
</html>
<script type="text/javascript">
$('#p_vin').autocomplete({
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

	var ac = $('#p_vin').autocomplete(options);
    ac.disable();
    ac.enable();
    ac.setOptons({ zIndex: 1001 });
</script>
