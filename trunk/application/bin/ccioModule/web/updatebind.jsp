<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.List"%>
<%
//String a ="0";
//if(request.getAttribute("result")!=null){
//	a=request.getAttribute("result").toString();
//}
//out.print(a);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					t_b_card:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/ccioModule/data::Binding',
						        b_card: function () {
									var cardz = ('0001001300140001'+($('#t_b_card').val().substring(2, $('#t_b_card').val().length))+'00').toUpperCase();
									$('#b_card').val(cardz);
						            return cardz;
						        },
						        b_id: function () {
									return $('#b_id').val();
						        }
						    }
							
						},
						required: true,
						maxlength: 8,
						minlength: 8
					},
					b_vin:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/ccioModule/data::Binding',
						        b_vin: function () {
						            return $('#b_vin').val();
						        },
						        b_id: function () {
									return $('#b_id').val();
						        }
						    }
							
						},
						required: true
					}
				},
				messages:{
					t_b_card:{
						remote:"此卡已经绑定"
					},
					b_vin:{
						remote:"此VIN已经绑定"
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/ccioModule/action/UpdateBind.action">
<input type="hidden" name="startIndex" value="0"/>
<input type="hidden" name="endIndex" value="9"/>
<input type="hidden" name="b_id"  id="b_id"  value="${result.b_id }"/>
<input type="hidden" name="b_card" id="b_card" value="${result.b_card }"/>
<fieldset>
<legend>绑定卡</legend>
<table cellspacing="10" cellpadding="0">
   <tr>
      <td class="colName">卡:</td>
      <td class="detailColVal">
          <input type="text" name="t_b_card" id="t_b_card" value="00${fn:substring(result.b_card, 16, 22) }" style="width:200px;"/>
	  </td>
  </tr>
  <tr>
      <td class="colName">VIN:</td>
      <td class="detailColVal">
         <input type="text" name="b_vin" id="b_vin" value="${result.b_vin }" autocomplete="off" style="width:200px;"/>
	  </td>
   <tr>
  </table>
  <div style="text-align:center;margin-top:20px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindList.action?startIndex=0&endIndex=9'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
<script type="text/javascript">
$('#b_vin').autocomplete({
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

	var ac = $('#b_vin').autocomplete(options);
    ac.disable();
    ac.enable();
    ac.setOptons({ zIndex: 1001 });
</script>