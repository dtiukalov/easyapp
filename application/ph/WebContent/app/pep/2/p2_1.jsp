<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			List<String> fv9ErprobStyle = (List)form.get("fv9ErprobStyle"); //实验及路试
			List<String> fv9ErprobStatus = (List)form.get("fv9ErprobStatus"); //实验及路试状态
			List<String> fv9ErprobStCom_GM = (List)form.get("fv9ErprobStCom_GM"); //当前状态描述-德文
			List<String> fv9ErprobStCom_CN = (List)form.get("fv9ErprobStCom_CN"); //当前状态描述-中文
			List<String> fv9ErprobNachSch_GM = (List)form.get("fv9ErprobNachSch_GM"); //下一步工作描述-德文
			List<String> fv9ErprobNachSch_CN = (List)form.get("fv9ErprobNachSch_CN"); //下一步工作描述-中文
		%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
			<div id="content" style="margin:5px 30px;font-size:12px;height:590px;">
				<div id="german">
					<input type="button" class="china" onclick="changeChinese()" />
				</div>
				<div id="datatable1" style="width: 800px;margin:10px auto">
					<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
				        <tr>
				        	<td width="19%">&nbsp;</td>
				        	<td width="81%" style="border-bottom:2px solid #424242;">
					        	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:16px">
						            <tr>
							            <td>Aktueller Status</td>
							            <td>Nachste Status</td>
						            </tr>
					            </table>
					        </td>
				        </tr>
				        <%
							if (fv9ErprobStyle != null && fv9ErprobStyle.size() >0) {
								for (int i=0; i<fv9ErprobStyle.size(); i++){
									String Style = (String)fv9ErprobStyle.get(i);
									String status = (String)fv9ErprobStatus.get(i);
									String stcom_gm = (String)fv9ErprobStCom_GM.get(i);
									String nachsch_gm = (String)fv9ErprobNachSch_GM.get(i);
						%>
						 <tr>
				          <td width="19%">
					          <div class="kbg">
					          	<div class="he">
						          	<div class="wz"><h3><%=Style %></h3></div>
						          	<div class="tupian">
						          	<%
						          	if ("红".equals(status)) {
						          	%>
						          		<img src="../images/redStatus.png" style="height:75px;width:25px;" />
						          	<%
						          	}
						          	if ("黄".equals(status)) {
						          	%>
						          		<img src="../images/yellowStatus.png" style="height:75px;width:25px;" />
						          	<%
							        }
						          	if ("绿".equals(status)) {
						          	%>
						          		<img src="../images/greenStatus.png" style="height:75px;width:25px;" />
						          	<%
						          	}
						          	%>
						          	</div>
						          	<div class="clear"></div>
						          </div>
					          </div>
				          </td>
				          <td width="81%"  valign="top" class="xx">
					          <table width="98%" border="0" cellspacing="2" cellpadding="0">
						            <tr>
						              <td>
						              	<table width="98%" border="0" cellspacing="2" cellpadding="0" > 
								            <tr>
								              <td width="60%"><%=stcom_gm %></td>
								              <td width="40%" valign="top"><%=nachsch_gm %></td>
								            </tr>
								        </table>
						              </td>
						            </tr>
					          </table>
				          </td>
				        </tr>
						<%
								}
							}
				        %>		
				       
				      </table>
			      </div>
			      <div id="china" style="display: none;">
				  	<input type="button" class="german" onclick="changeGerman()"/>
				  </div>
			      <div id="datatable2" style="width: 800px; display: none;margin:10px auto">
					<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
				        <tr>
				        	<td width="19%">&nbsp;</td>
				        	<td width="81%"  style="border-bottom:2px solid #424242;">
					        	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:16px">
						            <tr>
							            <td>Aktueller Status</td>
							            <td>Nachste Status</td>
						            </tr>
					            </table>
					        </td>
				        </tr>
				        <%
							if (fv9ErprobStyle != null && fv9ErprobStyle.size() >0) {
								for (int i=0; i<fv9ErprobStyle.size(); i++){
									String Style = (String)fv9ErprobStyle.get(i);
									String status = (String)fv9ErprobStatus.get(i);
									String stcom_cn = (String)fv9ErprobStCom_CN.get(i);
									String nachsch_cn = (String)fv9ErprobNachSch_CN.get(i);
						%>
						 <tr>
				          <td width="19%">
					          <div class="kbg">
					          	<div class="he">
						          	<div class="wz"><h3><%=Style %></h3></div>
						          	<div class="tupian">
						          	<%
						          	if ("红".equals(status)) {
						          	%>
						          		<img src="../images/redStatus.png" style="height:75px;width:25px;"/>
						          	<%
						          	}
						          	if ("黄".equals(status)) {
						          	%>
						          		<img src="../images/yellowStatus.png" style="height:75px;width:25px;"/>
						          	<%
							        }
						          	if ("绿".equals(status)) {
						          	%>
						          		<img src="../images/greenStatus.png" style="height:75px;width:25px;"/>
						          	<%
						          	}
						          	%>
						          	</div>
						          	<div class="clear"></div>
						          </div>
					          </div>
				          </td>
				          <td width="81%" valign="top" class="xx"><table width="98%" border="0" cellspacing="2" cellpadding="0">
				            <tr>
				              <td height="25">
				              	<table width="98%" border="0" cellspacing="2" cellpadding="0">
						            <tr>
						              <td width="60%" height="25"><%=stcom_cn %></td>
						              <td width="40%" valign="top"><%=nachsch_cn %></td>
						            </tr>
						          </table>
				              </td>
				            </tr>
				          </table></td>
				        </tr>
						<%
								}
							}
				        %>		
				       
				      </table>
			      </div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
