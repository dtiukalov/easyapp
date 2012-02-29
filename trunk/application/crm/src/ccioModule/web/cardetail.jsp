<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
//String a ="";
String carcardid="&nbsp;";
String carmodel="&nbsp;";
String carvin="&nbsp;";
String carlicenceno="&nbsp;";
String carcolor="&nbsp;";
String cararea="&nbsp;";
String carsource="&nbsp;";
String carcardlevel="&nbsp;";
String intglamount="&nbsp;";
String cstmcontact="&nbsp;";
String cstmcontmobile="&nbsp;";
String cstmmobile="&nbsp;";
String cstmname="&nbsp;";
String membcardid="&nbsp;";
String membtype="&nbsp;";
String careintime="&nbsp;";
String carestaff="&nbsp;";
String careitems="&nbsp;";
String jytype="&nbsp;";
String oilstoretime1="&nbsp;";
String oiltype1="&nbsp;";
String oilnumber1="&nbsp;";
String oilstoretime2="&nbsp;";
String oiltype2="&nbsp;";
String oilnumber2="&nbsp;";
String oilstoretime3="&nbsp;";
String oiltype3="&nbsp;";
String oilnumber3="&nbsp;";
String insucompany="&nbsp;";
String insudate="&nbsp;";
String insuendtime="&nbsp;";
String isfirst="&nbsp;";
if(request.getAttribute("car_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("car_saturnData");
	carcardid=sd.get("carcardid")!=null?sd.get("carcardid").toString():"&nbsp;";
	carmodel=sd.get("carmodel")!=null?sd.get("carmodel").toString():"&nbsp;";
	carvin=sd.get("carvin")!=null?sd.get("carvin").toString():"&nbsp;";
	carlicenceno=sd.get("carlicenceno")!=null?sd.get("carlicenceno").toString():"&nbsp;";
	carcolor=sd.get("carcolor_dict")!=null?sd.get("carcolor_dict").toString():"&nbsp;";
	if(sd.get("cararea_dict")!=null
			&&("九台".equals(sd.get("cararea_dict").toString().trim())
					||"农安".equals(sd.get("cararea_dict").toString().trim())
					||"榆树".equals(sd.get("cararea_dict").toString().trim())
					||"德惠".equals(sd.get("cararea_dict").toString().trim())
					||"双阳".equals(sd.get("cararea_dict").toString().trim()))){
		cararea="长春";
	}else{
		cararea=sd.get("cararea_dict")!=null?sd.get("cararea_dict").toString():"&nbsp;";
	}
	carsource=sd.get("carsource_dict")!=null?sd.get("carsource_dict").toString():"&nbsp;";
	carcardlevel=sd.get("carcardlevel_dict")!=null?sd.get("carcardlevel_dict").toString():"&nbsp;";
	//carlrepairdate=sd.get("carlrepairdate");
	//carlrepairmile=sd.get("carlrepairmile");
}
if(request.getAttribute("integral_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("integral_saturnData");
	intglamount=sd.get("intglamount")!=null?sd.get("intglamount").toString():"&nbsp;";
}
if(request.getAttribute("customer_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("customer_saturnData");
	cstmcontact=sd.get("cstmcontact")!=null?sd.get("cstmcontact").toString():"&nbsp;";
	cstmcontmobile=sd.get("cstmcontmobile")!=null?sd.get("cstmcontmobile").toString():"&nbsp;";
	cstmmobile=sd.get("cstmmobile")!=null?sd.get("cstmmobile").toString():"&nbsp;";
	cstmname=sd.get("cstmname")!=null?sd.get("cstmname").toString():"&nbsp;";
}
if(request.getAttribute("member_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("member_saturnData");
	membcardid=sd.get("membcardid")!=null?sd.get("membcardid").toString():"&nbsp;";
	membtype=sd.get("membtype_dict")!=null?sd.get("membtype_dict").toString():"&nbsp;";
}
//if(request.getAttribute("service_saturnData")!=null){
//	SaturnData sd=(SaturnData)request.getAttribute("service_saturnData");
//	servstaff=sd.get("servstaff_dict");
//}
if(request.getAttribute("care_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("care_saturnData");
	String ctime=sd.get("careintime")!=null?sd.get("careintime").toString().trim().substring(0,10):"&nbsp;";
	careintime=ctime;
	carestaff=sd.get("carestaff_dict")!=null?sd.get("carestaff_dict").toString():"&nbsp;";
	if(sd.get("careitems")!=null&&!"".equals(sd.get("careitems").toString().trim())){
		SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
		String a="";
		String[] str=sd.get("careitems").toString().split(",");
		int i=0;
		for(String s:str){
			if(i++==0){
				a+=inst.getDataDictItemInfo("crm_careItemName",s).getValue();
			}else{
				a+="、"+inst.getDataDictItemInfo("crm_careItemName",s).getValue();
			}
		}
		careitems=!"".equals(a)?a:"&nbsp;";
	}else{
		careitems=sd.get("careitems")!=null?sd.get("careitems").toString():"&nbsp;";
	}
}
if(request.getAttribute("jy_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("jy_saturnData");
	jytype=sd.get("jytype_dict")!=null?sd.get("jytype_dict").toString():"&nbsp;";
}
if(request.getAttribute("oil_result")!=null){
	List<SaturnData> list=(List<SaturnData>)request.getAttribute("oil_result");
	int i=0;
	for(SaturnData sd:list){
		if(++i>3)break;
		String otime=sd.get("oilstoretime")!=null?sd.get("oilstoretime").toString().trim().substring(0,10):"&nbsp;";
		if(i==1){
			oilstoretime1=otime;
			oiltype1=sd.get("oiltype_dict")!=null?sd.get("oiltype_dict").toString():"&nbsp;";
			oilnumber1=sd.get("oilnumber")!=null?sd.get("oilnumber").toString():"&nbsp;";
		}else if(i==2){
			oilstoretime2=otime;
			oiltype2=sd.get("oiltype_dict")!=null?sd.get("oiltype_dict").toString():"&nbsp;";
			oilnumber2=sd.get("oilnumber")!=null?sd.get("oilnumber").toString():"&nbsp;";
		}else if(i==3){
			oilstoretime3=otime;
			oiltype3=sd.get("oiltype_dict")!=null?sd.get("oiltype_dict").toString():"&nbsp;";
			oilnumber3=sd.get("oilnumber")!=null?sd.get("oilnumber").toString():"&nbsp;";
		}else{
			break;
		}
	}
}
if(request.getAttribute("insurance_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("insurance_saturnData");
	insucompany=sd.get("insucompany_dict")!=null?sd.get("insucompany_dict").toString():"&nbsp;";
	insudate=sd.get("insudate")!=null?sd.get("insudate").toString():"&nbsp;";
	insuendtime=sd.get("insuendtime")!=null?sd.get("insuendtime").toString():"&nbsp;";
}
if("&nbsp;".equals(careintime)){
	isfirst="是";
}else{
	isfirst="否";
}
//out.print(a);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.util.List"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车辆档案详细</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<script type="text/javascript">
	function goBack(){
	 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/ccioModule/action/GetIodateList.action';
	    document.getElementById('hiddenForm').submit();
	}
</script>
</head>
<body>
<div id="man_zone">
<form class="contentForm" id="crmform">
<fieldset><legend>车辆工单基础信息</legend>
<table cellspacing="1" cellpadding="1" style="background-color: #000;padding:1px;">
	<tr style="background-color: #fff;height:21px;">
		<td rowspan="5" width="6">基本信息</td>
		<td width="100">车型</td>
		<td width="180"><%=carmodel%></td>
		<td width="80">车身号</td>
		<td width="180"><%=carvin%></td>
		<td width="100">车牌号</td>
		<td colspan="2"><%=carlicenceno%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>颜色</td>
		<td><%=carcolor%></td>
		<td>地区</td>
		<td><%=cararea%></td>
		<td>是否首次来店</td>
		<td colspan="2"><%=isfirst%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>会员级别</td>
		<td><%=membtype%></td>
		<td>会员卡号</td>
		<td><%=membcardid%></td>
		<td>会员积分</td>
		<td colspan="2"><%=intglamount%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>客户级别</td>
		<td><%=carcardlevel%></td>
		<td>车主姓名</td>
		<td><%=cstmname%></td>
		<td>联系人姓名</td>
		<td colspan="2"><%=cstmcontact%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>车辆来源</td>
		<td><%=carsource%></td>
		<td>车主电话</td>
		<td><%=cstmmobile%></td>
		<td>联系人电话</td>
		<td colspan="2"><%=cstmcontmobile%></td>
	</tr>
	<!--
	<tr style="background-color: #fff;height:21px;">
		<td>到店里程</td>
		<td>&nbsp;</td>
		<td>到店人姓名</td>
		<td>&nbsp;</td>
		<td>到店人电话</td>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>性别</td>
		<td>&nbsp;</td>
		<td>身份</td>
		<td colspan="4">&nbsp;</td>
	</tr>
	-->
	<tr style="background-color: #fff;height:21px;">
		<td rowspan="6">保养记录</td>
		<td>上次保养时间</td>
		<td><%=careintime%></td>
		<td>接待员</td>
		<td><%=carestaff%></td>
		<td colspan="3">存油情况</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>上次保养里程</td>
		<td>------</td>
		<td>使用机油</td>
		<td><%=jytype%></td>
		<td width="100">存油时间</td>
		<td width="90">存油种类</td>
		<td width="90">存油编号</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td rowspan="4">养护品</td>
		<td colspan="3" rowspan="4"><%=careitems%></td>
		<td><%=oilstoretime1%></td>
		<td><%=oiltype1%></td>
		<td><%=oilnumber1%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td><%=oilstoretime2%></td>
		<td><%=oiltype2%></td>
		<td><%=oilnumber2%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td><%=oilstoretime3%></td>
		<td><%=oiltype3%></td>
		<td><%=oilnumber3%></td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td colspan="3">维修建议:-------</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td rowspan="3">保险</td>
		<td>保险公司</td>
		<td><%=insucompany%></td>
		<td>险种</td>
		<td>-----</td>
		<td colspan="3" rowspan="3">备注:-------</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>参保时间</td>
		<td><%=insudate%></td>
		<td width="80" rowspan="2">是否本公司投保</td>
		<td rowspan="2">-----</td>
	</tr>
	<tr style="background-color: #fff;height:21px;">
		<td>结束时间</td>
		<td><%=insuendtime%></td>
	</tr>
</table>
<table width="100%">
<tr style="background-color: #fff;">
		<td colspan="8" style="text-align: center;"><input type="button"
			value="返回" onclick="javascript:goBack();" /></td>
	</tr>
</table>
</fieldset>
</form>
</div>
<div style="display: none;">
<form id="hiddenForm" name="hiddenForm" method="post">
<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}" /> 
<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}" /> 
<input type="hidden" name="pageValue" value='${pageValue}' />
<input type="hidden" name="s_card" id="s_card" value="${s_card}"/>
	<input type="hidden" name="s_type" id="s_type" value="${s_type}"/>
	<input type="hidden" name="s_vin" id="s_vin" value="${s_vin}"/>
	<input type="hidden" name="in_date" id="in_date" value="${in_date}"/>
	<input type="hidden" name="out_date" id="out_date" value="${out_date}"/>
</form>
</div>
</body>
</html>
