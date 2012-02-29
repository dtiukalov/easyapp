<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<script  type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
$(function(){ 
	var clientHeight = document.documentElement.clientHeight;
	$('#left_content').css("height",clientHeight);
	var navHeight = document.documentElement.clientHeight-document.getElementById("user_info").offsetHeight - 2;
	$('#main_nav').css("height",navHeight);
	initMenu();
	var mainFrameHeight = clientHeight - 77 + 'px';
	var main = parent.mainFrame.document.getElementById("man_zone");
	$(main).css("height",mainFrameHeight);
})
function initMenu(){
	$('#menu .list_tilte').bind("click",function(){
		if($(this).next('.list_detail').is(":hidden")){
			$('#menu .list_detail').not(":hidden").prev(".list_tilte").css('background-image', 'url(images/list_title_onclick.gif)');
			$('#menu .list_detail').not(":hidden").hide();
			$(this).next('.list_detail').show();
			$(this).css('background-image', 'url(images/list_title.gif)');
		}else{
			$(this).next('.list_detail').hide();
			$(this).css('background-image', 'url(images/list_title_onclick.gif)');
		}
	})
}

function exit(){
	window.location = "<%=request.getContextPath()%>/crm/coreModule/web/exit.jsp";
}
function updateLevel(){
	if(window.confirm("确认执行月级别变更？")){
		return true;
	}
	return false;
}
</script>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<jsp:useBean id="now" class="java.util.Date" />    
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowz"/> 

<title>左侧导航栏</title>
</head>
<body> 
<div id="left_content">
     <div id="user_info">欢迎您，<strong>${CRM_USER.username}</strong><br />[<a>系统操作员</a>，<a href="javascript:exit();">退出</a>]</div>
	 <div id="main_nav">
		 <div id="menu">
		 	<c:if test="${CRM_USER.username=='1'}">
         	<div class="list_tilte"><span>车辆管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/carModule/web/carinfo.jsp" target="mainFrame">车辆信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/insuranceModule/action/QueryInsuranceList.action?startIndex=0&endIndex=9" target="mainFrame">保险信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/carModule/action/TestLevelLog.action" target="mainFrame" onclick="return updateLevel();">月档案级别变更</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm/carModule/web/levelloglist.jsp" target="mainFrame">档案级别变更记录</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>特约考核</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/assessmentModule/web/assessmenttwo.jsp" target="mainFrame">内化率</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/assessmentModule/web/assessment.jsp" target="mainFrame">维系率</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>会员管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/memberModule/action/QueryMemberList.action?startIndex=0&endIndex=9" target="mainFrame">会员信息</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>维修管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/serviceModule/web/serviceList.jsp" target="mainFrame">维修信息</a></li>            
                    <li><a href="${pageContext.request.contextPath}/crm::/careModule/action/QueryCareList.action?startIndex=0&endIndex=9" target="mainFrame">养护品信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketDetailList.action?startIndex=0&endIndex=9" target="mainFrame">代金信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action?startIndex=0&endIndex=9" target="mainFrame">存油信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/partsModule/action/QueryPartsList.action?startIndex=0&endIndex=9" target="mainFrame">精品信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJYList.action?startIndex=0&endIndex=9" target="mainFrame">机油信息</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>信息管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/visitModule/action/QueryVisitList.action?startIndex=0&endIndex=9" target="mainFrame">回访信息</a></li>
                </ul>
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/reserveModule/action/QueryReserveList.action?startIndex=0&endIndex=9" target="mainFrame">预约信息</a></li>
                </ul>
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/remindModule/action/QueryRemindList.action?startIndex=0&endIndex=9" target="mainFrame">提醒信息</a></li>
                </ul>
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/complaitModule/action/QueryComplaintList.action?startIndex=0&endIndex=9" target="mainFrame">投诉信息</a></li>
                </ul>
            </div>   
		 	</c:if>          
            <div class="list_tilte"><span>售后总值</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyList.action?startIndex=0&endIndex=29&min_dutyintime=${nowz }&max_dutyintime=${nowz }&type=user" target="mainFrame">总值信息</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/dutyModule/web/dutyreport.jsp" target="mainFrame">总值日报表</a></li>
                </ul>
            </div>
            <c:if test="${CRM_USER.username=='1'}">
            <div class="list_tilte"><span>数据导入</span></div>
        	<div class="list_detail">
        	 <ul>
          		<li><a href="${pageContext.request.contextPath}/crm/importModule/web/dataImport.jsp" target="mainFrame">数据导入</a></li>
          		<li><a href="${pageContext.request.contextPath}/crm::/importModule/action/QueryImportResult.action?startIndex=0&endIndex=9" target="mainFrame">导入信息查询</a></li>
              </ul>
            </div>
            <!--
			 	<div class="list_tilte"><span>报表管理2</span></div>
	            <div class="list_detail">
	            	<ul>
	            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/staffBussinessStatistic.jsp" target="mainFrame">前台业务报表</a></li>
	            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/benefitestimates.jsp" target="mainFrame">效益统计报表</a></li>
	            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/hondaflowstatistic.jsp" target="mainFrame">售后车辆流量表</a></li>
	                </ul>																	
	            </div>
            -->
            <div class="list_tilte"><span>员工绩效</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/Quantity.jsp" target="mainFrame">台次</a></li>
                </ul>
                <ul>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/quarycare.jsp" target="mainFrame">养护</a></li>
                </ul>
                <ul>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/yingyee.jsp" target="mainFrame">营业额</a></li>
                </ul>
                <ul>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/queryjy.jsp" target="mainFrame">机油</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>报表管理</span></div>
             <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/dayresult.jsp" target="mainFrame">每日售后日报表</a></li>
            		<!-- 
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/queryservice.jsp" target="mainFrame">售后前台--接车情况</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/quertreserve.jsp" target="mainFrame">售后前台--招揽预约</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/queryoil.jsp" target="mainFrame">售后前台--节余机油</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/queryinsurance.jsp" target="mainFrame">售后前台--查询投保</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/queryparts.jsp" target="mainFrame">售后前台--精品金额</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/querycare.jsp" target="mainFrame">售后前台--养护品金额</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/querywarranty.jsp" target="mainFrame">售后前台--索赔台次</a></li>
            		-->
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report1.jsp" target="mainFrame">售后前台--接车情况</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report2.jsp" target="mainFrame">售后前台--招揽预约</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report3.jsp" target="mainFrame">售后前台--节余机油</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report4.jsp" target="mainFrame">售后前台--查询投保</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report5.jsp" target="mainFrame">售后前台--精品金额</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report6.jsp" target="mainFrame">售后前台--养护品金额</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/report7.jsp" target="mainFrame">售后前台--索赔台次</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/profitdiffusionarea.jsp" target="mainFrame">效益测试--地区分布</a></li>
	            	<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/profitdiffusiontime.jsp" target="mainFrame">效益测试--时间分布</a></li>
	            	<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/profitdiffusionquestion.jsp" target="mainFrame">效益测试--问题统计</a></li>
	            	<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/hondaflowstatistic1.jsp" target="mainFrame">售后车辆--当日流量</a></li>
	            		<li><a href="${pageContext.request.contextPath}/crm/reportModule/web/hondacarestatistic.jsp" target="mainFrame">售后车辆--养护品</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>权限管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/loginModule/action/QueryUserList.action?startIndex=0&endIndex=9" target="mainFrame">用户管理</a></li>
                </ul>
            </div>
            <div class="list_tilte"><span>字典管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryCareItemList.action?startIndex=0&endIndex=9" target="mainFrame">养护品管理</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryWorkerList.action?startIndex=0&endIndex=9" target="mainFrame">维修人员管理</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryWaiterList.action?startIndex=0&endIndex=9" target="mainFrame">服务顾问管理</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryCarList.action?startIndex=0&endIndex=9" target="mainFrame">车系管理</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryModelList3.action?startIndex=0&endIndex=9" target="mainFrame">车型管理</a></li>
            		<!-- 
            		<li><a href="${pageContext.request.contextPath}/crm::/dictModule/action/QueryCarList1.action?startIndex=0&endIndex=9" target="mainFrame">其他车型</a></li>
            		 -->
                </ul>
            </div>
            <!-- 
            <div class="list_tilte"><span>查询管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/selectModule/web/selectservice.jsp" target="mainFrame">维修档案地区级别</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/selectModule/web/selectmodels.jsp" target="mainFrame">车型时间段分布</a></li>
                </ul>
            </div>
             -->
            <div class="list_tilte"><span>到店管理</span></div>
            <div class="list_detail">
            	<ul>
            	<!-- 
            		<li><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictList.action?startIndex=0&endIndex=9&d_pid=0" target="mainFrame">基础数据</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetCardList.action?startIndex=0&endIndex=9" target="mainFrame">生成卡号</a></li>
            		 -->
            		<li><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetBindList.action?startIndex=0&endIndex=9" target="mainFrame">绑定列表</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetIodateList.action?startIndex=0&endIndex=9" target="mainFrame">到店离店时间</a></li>
					<li><a href="${pageContext.request.contextPath}/crm/ccioModule/web/cardet.jsp" target="_black">打印接车单</a></li>                </ul>
            </div>
            <div class="list_tilte"><span>积分管理</span></div>
            <div class="list_detail">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/crm/pointModule/web/pointlist.jsp" target="mainFrame">积分列表</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/pointModule/web/pointlistdec.jsp" target="mainFrame">兑换列表</a></li>
            		<li><a href="${pageContext.request.contextPath}/crm/pointModule/web/decpointcw.jsp" target="mainFrame">财务兑换</a></li>
                </ul>
            </div>
            </c:if>
         </div>
	 </div>
</div>
</body>
</html>
