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
			List<String> fv9ErprobStyle = new ArrayList<String>(); //实验及路试
			List<String> fv9ErprobStatus = new ArrayList<String>(); //实验及路试状态
			List<String> fv9ErprobStCom_GM = new ArrayList<String>(); //当前状态描述-德文
			List<String> fv9ErprobStCom_CN = new ArrayList<String>(); //当前状态描述-中文
			List<String> fv9ErprobNachSch_GM = new ArrayList<String>(); //下一步工作描述-德文
			List<String> fv9ErprobNachSch_CN = new ArrayList<String>(); //下一步工作描述-中文
			
			if(form.get("fv9ErprobStyle") != null){
				fv9ErprobStyle = (List)form.get("fv9ErprobStyle"); //实验及路试
			}
			if(form.get("fv9ErprobStatus") != null){
				fv9ErprobStatus = (List)form.get("fv9ErprobStatus"); //实验及路试状态
			}
			if(form.get("fv9ErprobStCom_GM") != null){
				fv9ErprobStCom_GM = (List)form.get("fv9ErprobStCom_GM"); //当前状态描述-德文
			}
			if(form.get("fv9ErprobStCom_CN") != null){
				fv9ErprobStCom_CN = (List)form.get("fv9ErprobStCom_CN"); //当前状态描述-中文
			}
			if(form.get("fv9ErprobNachSch_CN") != null){
				fv9ErprobNachSch_GM = (List)form.get("fv9ErprobNachSch_GM"); //下一步工作描述-德文
			}
			if(form.get("fv9ErprobNachSch_CN") != null){
				fv9ErprobNachSch_CN = (List)form.get("fv9ErprobNachSch_CN"); //下一步工作描述-中文
			}
			%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1>
					<a href="javascript:changeChinese()" id="german"><%=title %></a>
					<a href="javascript:changeGerman()" id="china" style="display: none;"><%=title %></a>
				</h1>
			</div>
			<div id="content">
				<div id="datatable1" style="margin:10px 10px auto; font-size: 12px;">
					<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
				        <tr>
				        	<td width="18%">&nbsp;</td>
				        	<td width="82%" style="border-bottom:2px solid #424242;">
					        	<table width="98%" border="0" cellspacing="0" cellpadding="0" style="font-size:18px; font-weight: bolder;">
						            <tr>
							            <td width="60%">Aktueller Status</td>
							            <td width="40%">Naechste Status</td>
						            </tr>
					            </table>
					        </td>
				        </tr>
				        <%
							if (fv9ErprobStyle != null && fv9ErprobStyle.size() >0) {
								for (int i=0; i<fv9ErprobStyle.size(); i++){
									String Style = Web.replaceSpecial((String)fv9ErprobStyle.get(i));
									String status = Web.replaceSpecial((String)fv9ErprobStatus.get(i));
									String stcom_gm = Web.replaceSpecial((String)fv9ErprobStCom_GM.get(i));
									String nachsch_gm = Web.replaceSpecial((String)fv9ErprobNachSch_GM.get(i));
						%>
						 <tr>
				          <td width="18%">
					          <div class="kbg">
					          	<div class="he">
						          	<div class="wz"><%=Style %></div>
						          	<div class="tupian" style="padding-top: 10px; vertical-align: middle;text-align: center;">
						          	<%
						          	if ("红".equals(status)) {
						          	%>
						          		<img src="../images/redStatus.png" style="height:59px;width:25px;" />
						          	<%
						          	}
						          	if ("黄".equals(status)) {
						          	%>
						          		<img src="../images/yellowStatus.png" style="height:59px;width:25px;" />
						          	<%
							        }
						          	if ("绿".equals(status)) {
						          	%>
						          		<img src="../images/greenStatus.png" style="height:59px;width:25px;" />
						          	<%
						          	}
						          	%>
						          	</div>
						          	<div class="clear"></div>
						          </div>
					          </div>
				          </td>
				          <td width="82%"  valign="top" class="xx"">
					          <table width="100%" border="0" cellspacing="2" cellpadding="0">
						            <tr>
						              <td>
						              	<table width="100%" border="0" cellspacing="2" cellpadding="0" > 
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
			      <div id="datatable2" style=" display: none; margin:10px 10px auto; font-size: 12px;">
					<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
				        <tr>
				        	<td width="18%">&nbsp;</td>
				        	<td width="82%"  style="border-bottom:2px solid #424242;">
					        	<table width="98%" border="0" cellspacing="0" cellpadding="0" style="font-size:18px; font-weight: bolder;">
						            <tr>
							            <td width="60%">Aktueller Status</td>
							            <td width="40%">Naechste Status</td>
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
				          <td width="18%">
					          <div class="kbg">
					          	<div class="he">
						          	<div class="wz"><%=Style %></div>
						          	<div class="tupian" style="padding-top: 10px; vertical-align: middle;text-align: center;">
						          	<%
						          	if ("红".equals(status)) {
						          	%>
						          		<img src="../images/redStatus.png" style="height:59px;width:25px;"/>
						          	<%
						          	}
						          	if ("黄".equals(status)) {
						          	%>
						          		<img src="../images/yellowStatus.png" style="height:59px;width:25px;"/>
						          	<%
							        }
						          	if ("绿".equals(status)) {
						          	%>
						          		<img src="../images/greenStatus.png" style="height:59px;width:25px;"/>
						          	<%
						          	}
						          	%>
						          	</div>
						          	<div class="clear"></div>
						          </div>
					          </div>
				          </td>
				          <td width="82%" valign="top" class="xx"><table width="98%" border="0" cellspacing="2" cellpadding="0">
				            <tr>
				              <td height="25">
				              	<table width="98%" border="0" cellspacing="2" cellpadding="0" >
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
