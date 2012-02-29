<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增会员</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
	$(function() {
			$('#queryCarListForm').submit();
			//校验
			$('#crmform').saturnValidate({
				rules:{
					memb_membcardid:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/coreModule/data::crm_member',
						        membcardid: function () {
						            return $('#memb_membcardid').val();
						        }
						    }
							
						},
						required: true,
						maxlength: 12
					},
					memb_carvin:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/coreModule/data::crm_member',
						        carvin: function () {
						            return $('#memb_carvin').val();
						        }
						    }
							
						},
						required: true,
						maxlength: 17 
					},
					car_carcardlevel:{
						required: true
					},
					memb_membtype:{
						required: true 
					},
					memb_membenjoyed:{
						maxlength: 300
					},
					memb_membenjoying:{
						maxlength: 300
					}
				},
				messages:{
					memb_membcardid:{
						remote:"该会员卡号已经存在"
					},
					memb_carvin:{
						remote:"该车架号的会员已经存在"
					}
				}
			})
		});
		
	function openwin() {
		var carvin = $('#memb_carvin').val();
		if(carvin!=''){ 
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarByVin.action?carvin="+carvin, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}else{
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}
	} 
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/memberModule/action/AddMember.action?startIndex=0&endIndex=9">
  <fieldset>
    <legend>新增会员</legend>
    <table cellspacing="3" cellpadding="0">
    <tr>
      <td class="colName">会员卡号:</td>
      <td class="detailColVal">
    	  <input type="text" name="memb_membcardid" id="memb_membcardid"/>
      </td>

      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="memb_carvin" id="memb_carvin"/>
    	  <a title="打开查询窗口" href="javascript:openwin();" style="color:#326EE9">查询</a>
      </td>
    </tr>
	<tr>
   	  <td class="colName">会员类别:</td>
      <td class="detailColVal">
         <select name="memb_membtype" id="memb_membtype">
		   <option value=""></option>
           <c:forEach items="${dict.crm_membType}" var="var">				
           		<option value="${var.key}">${var.value}</option>		
           	</c:forEach>
         </select>
	  </td>

      <td class="colName">入会日期:</td>
      <td class="detailColVal">
          <input type="text" name="memb_membjoindate" id="memb_membjoindate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">已享优惠:</td>
      <td class="detailColVal" colspan="2">
        <textarea name="memb_membenjoyed" id="memb_membenjoyed" style="width:100%;height:50px;"></textarea>
	  </td>
    </tr>
    <tr>
      <td class="colName">未享优惠:</td>
      <td class="detailColVal" colspan="2">
        <textarea name="memb_membenjoying" id="memb_membenjoying" style="width:100%;height:50px;"></textarea>
	  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:5px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/memberModule/action/QueryMemberList.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
