<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
//List<Map<String, String>> ml=(List<Map<String, String>>)request.getAttribute("result");
//for(Map mvo : ml){
//	System.out.println(mvo.get("carvin")+"---"+mvo.get("memberid"));
//	
//}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			//控制数字输入
			$('#min_intglamount').autoNumeric({mDec:0});
			$('#max_intglamount').autoNumeric({mDec:0});
			
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}']
			});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/memberModule/action/QueryMemberList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(memberid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/memberModule/action/DeleteMember.action?memberid="+memberid; 
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(memberid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/memberModule/action/QueryMember.action?memberid="+memberid;
			$('#hiddenForm')[0].submit();
		}
		
		function excel(){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/memberModule/action/MemberExcel.action";
			$('#hiddenForm')[0].submit();
		}
		
		function detail(carvin,memberid){
			//window.open ("${pageContext.request.contextPath}/crm::/memberModule/action/QueryIntegralList.action?carvin="+carvin+"&memberid="+memberid+"&startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
			window.open ("${pageContext.request.contextPath}/crm::/pointModule/action/PointListByVin.action?p_vin="+carvin+"&startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
		}
</script> 
<title>会员管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/memberModule/action/QueryMemberList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>会员管理</legend>
               <table cellspacing="2" cellpadding="0">
               		<tr>
               		  <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td> 
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">入会日期:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_membjoindate" id="min_membjoindate" value="${min_membjoindate}" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_membjoindate" id="max_membjoindate" value="${max_membjoindate}" onfocus="dayCalender(this)" class="Wdate"/>
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
                      <td class="colName">积分数量:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" value="${min_intglamount}" name="min_intglamount" id="min_intglamount"/>
                        <span>至</span>
                        <input type="text" value="${max_intglamount}" name="max_intglamount" id="max_intglamount"/>
                      </td> 
                    </tr>
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <td class="colName">会员卡号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="membcardid" id="membcardid" value="${membcardid}"/>
                      </td>
                      <td class="colName">会员类别:</td>
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
				<td style="width:65%;"><div id="paginate"></div></td>
				<td style="width:35%;"><div class="optAdd" style="width:100px;"><a href="<%=request.getContextPath()%>/crm/memberModule/web/addMember.jsp">新增</a>
				<a href="javascript:excel();">导出</a>
				</div></td>
			</tr>
		</table>
     	<div class="tbDiv">
     		<div style="width:1900px;">
	      		<table style="width:1880px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>                    
                        <th>地区</th>
                        <th>会员卡号</th>
                        <th>会员类别</th>
                        <th>入会日期</th>
                        <th>积分数量</th>
                        <th>车主</th>
                        <th>电话</th>
                        <th>手机</th>
                        <th style="width:160px;">基本操作</th>                                   
                    </tr>
                </table>
                </div>    
               <div id="dataDiv" style="width:1900px;">
			   <table id="dataTb" style="width:1880px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>
                        <td>${var.cararea_dict}</td>
                        <td>${var.membcardid}</td>
                        <td>${var.membtype_dict}</td>
                        <td>${var.membjoindate}</td>
                        <td>${var.sumpoint}</td>
                        <td>${var.cstmname}</td>
                        <td>${var.cstmtel}</td>
                        <td>${var.cstmmobile}</td>
                        <td style="width:160px;">
                        	<div class="detail"><a href="javascript:detail('${var.carvin}','${var.memberid}');">积分</a></div> 
                        	<div class="edit"><a href="javascript:modify('${var.memberid}');">修改</a></div> 
                            <div class="delete"><a href="javascript:delConf('${var.memberid}');">删除</a></div>  
                        </td>
                 </c:forEach>		
            </table>
    	</div>
	</div>
	<div style="display:none;">
		<form id="hiddenForm" name="hiddenForm" method="post">
			<input type="hidden" name="carcardid" value="${carcardid}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="min_membjoindate" value="${min_membjoindate}">
			<input type="hidden" name="max_membjoindate" value="${max_membjoindate}">
			<input type="hidden" name="carbrand" value="${carbrand}">
			<input type="hidden" name="carseries" value="${carseries}">
			<input type="hidden" name="min_intgltime" value="${min_intgltime}">
			<input type="hidden" name="max_intgltime" value="${max_intgltime}">
			<input type="hidden" name="carlicenceno" value='${carlicenceno}'>
			<input type="hidden" name="membcardid" value='${membcardid}'>
			<input type="hidden" name="min_intglamount" value='${min_intglamount}'>
			<input type="hidden" name="max_intglamount" value='${max_intglamount}'>
			<input type="hidden" name="membtype" value='${membtype}'>
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
		</form>
	</div>
</body>
</html>
