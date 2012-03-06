<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.saturn.sldb.PersonSub"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>家庭成员信息页</title>
	<%@ include file="/app/includes/header.jsp"%>

	<%
		List<PersonSub> voPerson = (List<PersonSub>) request
				.getAttribute("personTab");
		//取到list数据放到变量voPerson
		String id = request.getParameter("id");
	%>
	<script type="text/javascript">
		
		function setsize(){
			$('#accordion').width(700).height(350);
			$('#tab').trigger('_resize');
		}
		function select(){
			$('#tab').accordion('select','家庭信息');
		}
		
		function submit() {
			$('#pass').submit();
		}
	</script>
	
	<style type="text/css">
		.table tr td {
			height:25px;
			width:200px;
			text-align:left;
			border-color:#000;
			
		}
		.a {
			background-color:#EAF3FD;
		}
	</style>
	
</head>
<body>
		<div id="accordion" fit="true" style="overflow:auto;">
		<div id="tab" class="easyui-accordion" fit="true" style="width:300px;height:440px;">
			<div title="家庭信息" selected="true" style="overflow:auto;padding:10px;">
				<div class="easyui-tabs"  plain="true" fit="true" style="height:500px;width:500px;">
				<div title="${person.name}-户主">
				<table class="table" border="1"; style="width:100%; border-collapse:collapse;">
					<tr>
						<td class="a" style="text-align:right">户主姓名：</td>
						<td >${person.name}</td>
						<td class="a" style="text-align:right">类型：</td>
						<td>${person.type}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">性别：</td>
						<td>${person.gender}</td>
						<td class="a" style="text-align:right">身份证号：</td>
						<td>${person.identify}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">民族：</td>
						<td>${person.race}</td>
						<td class="a" style="text-align:right">户口类别：</td>
						<td>${person.hukou}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">家庭类别：</td>
						<td>${person.home}</td>
						<td class="a" style="text-align:right">家庭人口：</td>
						<td>${person.homeSum}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">婚姻状况：</td>
						<td>${person.marry}</td>
						<td class="a" style="text-align:right">劳动能力：</td>
						<td>${person.workable}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">身份类别：</td>
						<td>${person.idType}</td>
						<td class="a" style="text-align:right">是否优抚对象：</td>
						<td>${person.first}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">患病种类：</td>
						<td>${person.ill}</td>
						<td class="a" style="text-align:right">残疾类型：</td>
						<td>${person.deformity}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">残疾等级：</td>
						<td>${person.deformityLevel}</td>
						<td class="a" style="text-align:right">企业类型：</td>
						<td>${person.companyType}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">所属行业：</td>
						<td>${person.trade}</td>
						<td class="a" style="text-align:right">参加保险类别：</td>
						<td>${person.insurance}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">工作单位：</td>
						<td>${person.company}</td>
						<td class="a" style="text-align:right">联系方式：</td>
						<td>${person.contact}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">所属街道：</td>
						<td>${person.street}</td>
						<td class="a" style="text-align:right">地址：</td>
						<td>${person.address}</td>
					</tr>
					<tr>
						<td class="a" style="text-align:right">备注：</td>
						<td colspan="3">${person.desc}</td>
					</tr>
				</table>
				</div>
				<%
					if (null != voPerson) {
						for (PersonSub personTab : voPerson) { //增强的FOR循环  将LIST VOPERSON 中每一个元素拿出来放到变量personTab
				%>
								<div title="<%=personTab.getName()%>-<%=personTab.getPersonRelation()%>">
									<table class="table-form" style="margin-left:20px;">
										<tr>
											<td style="text-align:right">类型：</td>
											<td><%=personTab.getType()%></td>
										</tr>
										<tr>
											<td style="text-align:right">姓名：</td>
											<td><%=personTab.getName()%></td>
										</tr>
										<tr>
											<td style="text-align:right">性别：</td>
											<td><%=personTab.getGender()%></td>
										</tr>
										<tr>
											<td style="text-align:right">身份证号：</td>
											<td><%=personTab.getIdentify()%></td>
										</tr>
										<tr>
											<td style="text-align:right">与户主关系：</td>
											<td><%=personTab.getPersonRelation()%></td>
										</tr>
										<tr>
											<td style="text-align:right">民族：</td>
											<td><%=personTab.getRace()%></td>
										</tr>
										<tr>
											<td style="text-align:right">户口类别：</td>
											<td><%=personTab.getHukou()%></td>
										</tr>
										<tr>
											<td style="text-align:right">婚姻状况：</td>
											<td><%=personTab.getMarry()%></td>
										</tr>
										<tr>
											<td style="text-align:right">劳动能力：</td>
											<td><%=personTab.getWorkable()%></td>
										</tr>
										<tr>
											<td style="text-align:right">身份类别：</td>
											<td><%=personTab.getIdType()%></td>
										</tr>
										<tr>
											<td style="text-align:right">是否优抚对象：</td>
											<td><%=personTab.getFirst()%></td>
										</tr>
										<tr>
											<td style="text-align:right">患病种类：</td>
											<td><%=personTab.getIll()%></td>
										</tr>
										<tr>
											<td style="text-align:right">残疾类型：</td>
											<td><%=personTab.getDeformity()%></td>
										</tr>
										<tr>
											<td style="text-align:right">残疾等级：</td>
											<td><%=personTab.getDeformityLevel()%></td>
										</tr>
										<tr>
											<td style="text-align:right">企业类型：</td>
											<td><%=personTab.getCompanyType()%></td>
										</tr>
										<tr>
											<td style="text-align:right">所属企业：</td>
											<td><%=personTab.getTrade()%></td>
										</tr>
										<tr>
											<td style="text-align:right">参加保险类别：</td>
											<td><%=personTab.getInsurance()%></td>
										</tr>
										<tr>
											<td style="text-align:right">工作单位：</td>
											<td><%=personTab.getCompany()%></td>
										</tr>
										<tr>
											<td style="text-align:right">联系方式：</td>
											<td><%=personTab.getContact()%></td>
										</tr>
										<tr>
											<td style="text-align:right">所属街道：</td>
											<td><%=personTab.getStreet()%></td>
										</tr>
										<tr>
											<td style="text-align:right">地址：</td>
											<td><%=personTab.getAddress()%></td>
										</tr>
										<tr>
											<td style="text-align:right">备注：</td>
											<td><%=personTab.getDesc()%></td>
										</tr>
									</table>
								</div>

					<%
						}
						}
					%>
				</div>
			
			</div>
			<div title="评审信息" style="padding: 10px; width: 500; height: 200px;">
				<div>
					<form id="pass" name="pass" method="post"
						action="<%=request.getContextPath()%>/app/sldb/person/confirm.action">
						<input type="hidden" id="id" name="id"
							value="<%=request.getParameter("id")%>">
						<table>
							<tr align="right">
								<td>乡镇街初审意见:</td>
								<td><textarea id="note" name="note"
										style="width: 500px; height: 100px;"></textarea>
								</td>
							</tr>
						</table>
						<div style="padding: 40px;">
							<a href="#" class="easyui-linkbutton" onclick="submit();"
								iconCls="icon-ok">通过</a> 
							<a href="javascript:history.back(-1)" class="easyui-linkbutton" 
								iconCls="icon-back">返回</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
