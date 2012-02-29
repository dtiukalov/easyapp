<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>兑换积分</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			getPRD('pr');
		});
		
</script> 
<script type="text/javascript">
			function getPRD(divid){
				jQuery.post("${pageContext.request.contextPath}/crm::/pointModule/action/GetPRListByDec.action",{},
					function(json,textStatus){
					        var num = json.prdec_result.length;
					        var i=0;
					        var code='<option value=""></option>';
							for(;i<num;i++){
					        	code+='<option value="'+json.prdec_result[i].pr_id+'">'+json.prdec_result[i].pr_lable+'</option>';
					        }
					        jQuery('#'+divid).html(code);
					},"json");
			}
	</script>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					d_lable:{
						required: true
					},
					d_value:{
						required: true
					},
					d_type:{
						required: true
					},
					d_order:{
						required: true
					}
				},
				messages:{
					d_lable:{
						remote:"请填写标签"
					},
					d_value:{
						remote:"请填写值"
					},
					d_type:{
						remote:"请选择类型"
					},
					d_order:{
						remote:"请填写排序"
					}
				}
			})
		});
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
<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/pointModule/action/DecPoint.action" method="post">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>兑换积分</legend>
              <table cellspacing="2" cellpadding="0">
                      <tr>
                      <!-- 
                      <td class="colName">VIN:</td>
                      <td class="detailColVal">
                      	<input type="text" name="p_vin" id="p_vin" value="${p_vin}"/>
                      </td>
                       -->
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
                      <td class="colName">兑换项目:</td>
                      <td class="detailColVal">
                      	<select id="pr" name="pr">
                      	
                      	</select>
                      </td>
                      <td class="colName">数量:</td>
                      <td class="detailColVal">
                      	<input type="text" name="p_num" id="p_num" value="${p_num}"/>
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
                    <input type="submit" value="兑换"/>
              </div>        
			</fieldset>  
		</form>
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