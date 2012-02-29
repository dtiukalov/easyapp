<%@ page contentType="text/html; charset=utf-8" pageEncoding="gb2312" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%
String path=request.getContextPath();
String a ="";
if(request.getAttribute("car_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("car_saturnData");
	a+="carcardid:"+sd.get("carcardid")+",";
	a+="carmodel:"+sd.get("carmodel_dict")+",";
	a+="carvin:"+sd.get("carvin")+",";
	a+="carlicenceno:"+sd.get("carlicenceno")+",";
	a+="carcolor:"+sd.get("carcolor_dict")+",";
	if(sd.get("cararea_dict")!=null
			&&("九台".equals(sd.get("cararea_dict").toString().trim())
					||"农安".equals(sd.get("cararea_dict").toString().trim())
					||"榆树".equals(sd.get("cararea_dict").toString().trim())
					||"德惠".equals(sd.get("cararea_dict").toString().trim())
					||"双阳".equals(sd.get("cararea_dict").toString().trim()))){
		a+="cararea:长春,";
	}else{
		a+="cararea:"+sd.get("cararea_dict")+",";
	}
	a+="carsource:"+sd.get("carsource_dict")+",";
	a+="carcardlevel:"+sd.get("carcardlevel_dict")+",";
	a+="carlmaintainmile:"+sd.get("carlmaintainmile")+",";
	//a+="carlrepairdate:"+sd.get("carlrepairdate")+",";
	//a+="carlrepairmile:"+sd.get("carlrepairmile")+",";
}else{
	a+="carcardid: ,";//档案编号
	a+="carmodel: ,";//车型
	a+="carvin: ,";//vin
	a+="carlicenceno: ,";//车牌号
	a+="carcolor: ,";//颜色
	a+="cararea: ,";//区域
	a+="carsource: ,";//车辆来源
	a+="carcardlevel: ,";//档案级别
	a+="carlmaintainmile: ,";//上次里程
}
if(request.getAttribute("integral_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("integral_saturnData");
	a+="intglamount:"+sd.get("intglamount")+",";
}else{
	a+="intglamount: ,";//会员积分
}
if(request.getAttribute("customer_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("customer_saturnData");
	a+="cstmcontact:"+sd.get("cstmcontact")+",";
	a+="cstmcontmobile:"+sd.get("cstmcontmobile")+",";
	a+="cstmmobile:"+sd.get("cstmmobile")+",";
	a+="cstmname:"+sd.get("cstmname")+",";
}else{
	a+="cstmcontact: ,";//联系人
	a+="cstmcontmobile: ,";//联系人手机
	a+="cstmmobile: ,";//车主手机
	a+="cstmname: ,";//车主姓名
}
if(request.getAttribute("member_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("member_saturnData");
	a+="membcardid:"+sd.get("membcardid")+",";
	a+="membtype:"+sd.get("membtype_dict")+",";
}else{
	a+="membcardid: ,";//会员卡号
	a+="membtype: ,";//会员级别
}
//if(request.getAttribute("service_saturnData")!=null){
//	SaturnData sd=(SaturnData)request.getAttribute("service_saturnData");
//	a+="servintime:"+sd.get("servintime")+",";
//}
if(request.getAttribute("care_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("care_saturnData");
	String ctime=sd.get("careintime")!=null?sd.get("careintime").toString().trim().substring(0,10):"";
	a+="careintime:"+ctime+",";
	if(!"".equals(ctime)){
		a+="isshop:否,";
	}else{
		a+="isshop:是,";
	}
	a+="carestaff:"+sd.get("carestaff_dict")+",";
	if(sd.get("careitems")!=null&&!"".equals(sd.get("careitems").toString().trim())){
		SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
		a+="careitems:";
		String[] str=sd.get("careitems").toString().split(",");
		int i=0;
		for(String s:str){
			if(i++==0){
				a+=inst.getDataDictItemInfo("crm_careItemName",s).getValue();
			}else{
				a+="、"+inst.getDataDictItemInfo("crm_careItemName",s).getValue();
			}
		}
		a+=",";
	}else{
		a+="careitems:"+sd.get("careitems")+",";
	}
}else{
	a+="careintime: ,";//上次保养时间
	a+="isshop: ,";//是否首次来店
	a+="carestaff: ,";//养护接待
	a+="careitems: ,";//养护项目
}
if(request.getAttribute("jy_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("jy_saturnData");
	a+="jytype:"+sd.get("jytype_dict")+",";
}else{
	a+="jytype: ,";//机油
}
if(request.getAttribute("oil_result")!=null){
	List<SaturnData> list=(List<SaturnData>)request.getAttribute("oil_result");
	int i=0;
	for(SaturnData sd:list){
		if(++i>3)break;
		String otime=sd.get("oilstoretime")!=null?sd.get("oilstoretime").toString().trim().substring(0,10):"";
		a+="oilstoretime"+i+":"+otime+",";
		a+="oiltype"+i+":"+sd.get("oiltype_dict")+",";
		a+="oilnumber"+i+":"+sd.get("oilnumber")+",";
	}
}else{
	a+="oilstoretime1: ,";
	a+="oiltype1: ,";
	a+="oilnumber1: ,";
	a+="oilstoretime2: ,";
	a+="oiltype2: ,";
	a+="oilnumber2: ,";
	a+="oilstoretime3: ,";
	a+="oiltype3: ,";
	a+="oilnumber3: ,";
}
if(request.getAttribute("insurance_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("insurance_saturnData");
	a+="insucompany:"+sd.get("insucompany_dict")+",";
	a+="insudate:"+sd.get("insudate")+",";
	a+="insuendtime:"+sd.get("insuendtime")+",";
}else{
	a+="insucompany: ,";
	a+="insudate: ,";
	a+="insuendtime: ,";
}
a+="servintime:"+new SimpleDateFormat("yyyy年MM月dd日 HH时mm分").format(new Date())+",";
//System.out.println("a----"+a);
a=a.replace("null"," ");
//System.out.println("b----"+a);
String[] str=a.split(",");
Map mapz=new HashMap();
for(String s : str){
	String[] str1=s.split(":");
	try{
		mapz.put(str1[0],str1[1]);
	}catch(Exception e){
		mapz.put(str1[0]," ");
	}
	//mapz.put(str1[0],str1[1]);
	//System.out.println(str1[0]+"----"+str1[1]);
}
//out.print(a);
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<style>
.autocomplete-w1 { background:url(img/shadow.png) no-repeat bottom right; position:absolute; top:0px; left:0px; margin:6px 0 0 6px; /* IE6 fix: */ _background:none; _margin:1px 0 0 0; }
.autocomplete { border:1px solid #999; background:#FFF; cursor:default; text-align:left; max-height:350px; overflow:auto; margin:-6px 6px 6px -6px; /* IE6 specific: */ _height:350px; _margin:0; _overflow-x:hidden; }
.autocomplete .selected { background:#F0F0F0; }
.autocomplete div { padding:2px 5px; white-space:nowrap; overflow:hidden; }
.autocomplete strong { font-weight:normal; color:#3399FF; } 
</style>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="bb.files/filelist.xml">
<link rel=Edit-Time-Data href="bb.files/editdata.mso">
<link rel=OLE-Object-Data href="bb.files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>jyb</o:Author>
  <o:LastAuthor>user</o:LastAuthor>
  <o:LastPrinted>2011-07-12T02:18:52Z</o:LastPrinted>
  <o:Created>2010-12-24T13:17:30Z</o:Created>
  <o:LastSaved>2011-07-12T02:44:49Z</o:LastSaved>
  <o:Company>Microsoft Corporation</o:Company>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.39in .39in .39in .39in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;}
.font20
	{color:black;
	font-size:10.5pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font21
	{color:black;
	font-size:10.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font22
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
.font23
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.font24
	{color:black;
	font-size:10.5pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:常规;
	mso-style-id:0;}
.style51
	{mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	mso-style-name:"千位分隔\[0\]";
	mso-style-id:6;}
td
	{mso-style-parent:style0;
	padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl65
	{mso-style-parent:style0;
	text-align:center;}
.xl66
	{mso-style-parent:style0;
	text-align:left;}
.xl67
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;}
.xl73
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFFCC;
	mso-pattern:auto none;}
.xl77
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:7.0pt;}
.xl80
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	font-weight:700;
	text-align:left;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl84
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl85
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl87
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl88
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl89
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl90
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl91
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl96
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl97
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	text-align:right;
	vertical-align:middle;}
.xl108
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl109
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl110
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl113
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl114
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl115
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl120
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl121
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:1.0pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl122
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl123
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl124
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl125
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFFCC;
	mso-pattern:auto none;}
.xl126
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFFCC;
	mso-pattern:auto none;}
.xl127
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl128
	{mso-style-parent:style0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl129
	{mso-style-parent:style0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl130
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl131
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl132
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl133
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:.5pt solid windowtext;}
.xl134
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl135
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl136
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl137
	{mso-style-parent:style0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl138
	{mso-style-parent:style0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl139
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl140
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl141
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl142
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl143
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl144
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;}
.xl145
	{mso-style-parent:style0;
	font-size:12.0pt;
	text-align:right;}
.xl146
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl147
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl148
	{mso-style-parent:style0;
	font-size:12.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl149
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:1.0pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl150
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl151
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:1.0pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl152
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl153
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;}
.xl154
	{mso-style-parent:style0;
	font-size:20.0pt;
	text-align:center;
	vertical-align:middle;}
.xl155
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl156
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl157
	{mso-style-parent:style0;
	color:red;
	font-size:8.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:red;
	font-size:8.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:red;
	font-size:8.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl161
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl162
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl163
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl164
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl165
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl166
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl167
	{mso-style-parent:style51;
	font-size:9.0pt;
	font-weight:700;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl168
	{mso-style-parent:style51;
	font-size:9.0pt;
	font-weight:700;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl169
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl170
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl171
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl172
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl173
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl174
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl175
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>users</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>240</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>18</x:ActiveRow>
       <x:ActiveCol>12</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>5310</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
  <x:CreateBackup/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>users</x:Name>
  <x:Formula>=users!$A$3:$B$20</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>
<object ID='WebBrowser1' WIDTH=0 HEIGHT=0 CLASSID='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>
<!-- <script language="javascript" src="${pageContext.request.contextPath}/crm/ccioModule/web/lodop4.0/CheckActivX.js"></script>
<OBJECT  ID="LODOP" CLASSID="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" WIDTH=0 HEIGHT=0> </OBJECT> 
<script language="javascript">CheckLodop();</script> -->

<center>
<div id="searchz">
<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetIOTable.action" method="post">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>兑换积分</legend>
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
                      <div id="selection"></div>
                      	<input type="text" name="io_vin" id="io_vin" value="${io_vin}" autocomplete="off" style="width:200px;"/>
                      
                      </td>
                    </tr>
              </table> 
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="生成"/>
					<input type="button" value="打印" onclick="print();"/>
              </div>        
			</fieldset>  
		</form>
  </div>
<table x:str border=0 cellpadding=0 cellspacing=0 width=804 style='border-collapse:
 collapse;table-layout:fixed;width:556pt'>
 <col width=38 style='mso-width-source:userset;mso-width-alt:1389;width:29pt'>
 <col width=81 style='mso-width-source:userset;mso-width-alt:2962;width:61pt'>
 <col width=124 style='mso-width-source:userset;mso-width-alt:4534;width:93pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1645;width:34pt'>
 <col width=35 span=2 style='mso-width-source:userset;mso-width-alt:1280;
 width:26pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:2157;width:44pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:987;width:20pt'>
 <col width=58 style='mso-width-source:userset;mso-width-alt:2121;width:44pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1353;width:28pt'>
 <col width=102 style='mso-width-source:userset;mso-width-alt:3730;width:77pt'>
 
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td colspan=12 height=42 width=740 style='height:31.5pt;width:556pt'
  align=left valign=top><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:4px;margin-top:15px;width:158px;
  height:26px'><img width=158 height=26 src="<%=path%>/crm/ccioModule/web/bb.files/image001.png" v:shapes="Picture_x0020_1"></span><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=12 height=42 class=xl153 width=740 style='height:31.5pt;
    width:556pt'>接 车 问 诊 表</td>
   </tr>
  </table>
  </span></td>
  
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl107 style='height:12.75pt'>档案号：</td>
  <td class=xl72><%=mapz.get("carcardid")%></td>
  <td class=xl72></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl107>本次到店时间：</td>
  <td colspan=3 class=xl160><font class="font0"><%=mapz.get("servintime")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td rowspan=7 height=126 width=38 style='border-bottom:2.0pt double black;
  height:94.5pt;width:29pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
   id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path gradientshapeok="t" o:connecttype="rect"/>
  </v:shapetype><v:shape id="TextBox_x0020_4" o:spid="_x0000_s1923" type="#_x0000_t202"
   style='position:absolute;margin-left:0;margin-top:7.5pt;width:30pt;height:62.25pt;
   z-index:2;visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='layout-flow:vertical;mso-layout-flow-alt:top-to-bottom;
    mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <![if RotText]>
    <div><font class="font20">基本信息</font></div>
    <![endif]></v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
    <x:TextHAlign>Right</x:TextHAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:2;margin-left:0px;margin-top:10px;width:40px;
  height:83px'><![endif]><![if !RotText]><img width=40 height=83
  src="<%=path%>/crm/ccioModule/web/bb.files/image013.gif" alt="文本框: 基本信息" v:shapes="TextBox_x0020_4"
  class=shape v:dpi="96"><![endif]><![if !vml]></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=7 height=126 class=xl167 width=38 style='border-bottom:2.0pt double black;
    height:94.5pt;width:29pt'><a name=users>　</a></td>
   </tr>
  </table>
  </span></td>
  <td class=xl68 style='border-left:none'>车 系</td>
  <td class=xl84 style='border-left:none'><font class="font0"><%=mapz.get("carmodel")%></font></td>
  <td colspan=2 class=xl108 style='border-right:.5pt solid black;border-left:
  none'>车身号</td>
  <td colspan=3 class=xl171 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("carvin")%></font></td>
  <td colspan=2 class=xl108 style='border-right:.5pt solid black;border-left:
  none'>车牌号</td>
  <td colspan=2 class=xl171 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("carlicenceno")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl75 style='height:13.5pt;border-left:none'>颜 色</td>
  <td class=xl85 style='border-left:none'><font class="font0"><%=mapz.get("carcolor")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>地 区</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("cararea")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>是否首次来店</td>
  <td colspan=2 class=xl77 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("isshop")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl69 style='height:13.5pt;border-top:none;border-left:
  none'>会员级别</td>
  <td class=xl86 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("membtype")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>会员卡号</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("membcardid")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>会员积分</td>
  <td colspan=2 class=xl77 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("intglamount")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl69 style='height:13.5pt;border-top:none;border-left:
  none'>客户级别</td>
  <td class=xl86 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("carcardlevel")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>车主姓名</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("cstmname")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>联系人姓名</td>
  <td colspan=2 class=xl77 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("cstmcontact")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl69 style='height:13.5pt;border-top:none;border-left:
  none'>车辆来源</td>
  <td class=xl86 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("carsource")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>车主电话</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("cstmmobile")%></font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>联系人电话</td>
  <td colspan=2 class=xl77 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("cstmcontmobile")%></font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl69 style='height:13.5pt;border-top:none;border-left:
  none'>到店里程</td>
  <td class=xl86 style='border-top:none;border-left:none'><font class="font0">&nbsp;</font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>到店人姓名</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0">&nbsp;</font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>到店人电话</td>
  <td colspan=2 class=xl77 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0">&nbsp;</font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl70 style='height:13.5pt;border-top:none;border-left:
  none'>性 别</td>
  <td class=xl87 style='border-top:none;border-left:none'><font class="font0">&nbsp;</font></td>
  <td colspan=2 class=xl123 style='border-right:.5pt solid black;border-left:
  none'>身<span style='mso-spacerun:yes'>&nbsp; </span>份</td>
  <td colspan=7 class=xl83 style='border-right:1.0pt solid black;border-left:
  none'><font class="font0">&nbsp;</font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td rowspan=6 height=108 width=38 style='border-bottom:2.0pt double black;
  height:81.0pt;width:29pt' align=left valign=top><!--[if gte vml 1]><v:shape
   id="TextBox_x0020_5" o:spid="_x0000_s1924" type="#_x0000_t202" style='position:absolute;
   margin-left:0;margin-top:9pt;width:30pt;height:63.75pt;z-index:3;
   visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='layout-flow:vertical;mso-layout-flow-alt:top-to-bottom;
    mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <![if RotText]>
    <div><font class="font20">保养记录</font></div>
    <![endif]></v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
    <x:TextHAlign>Right</x:TextHAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:3;margin-left:0px;margin-top:12px;width:40px;
  height:85px'><![endif]><![if !RotText]><img width=40 height=85
  src="<%=path%>/crm/ccioModule/web/bb.files/image014.gif" alt="文本框: 保养记录" v:shapes="TextBox_x0020_5"
  class=shape v:dpi="96"><![endif]><![if !vml]></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=6 height=108 class=xl119 width=38 style='border-bottom:2.0pt double black;
    height:81.0pt;width:29pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td class=xl80>上次保养时间</td>
  <td class=xl74 style='border-top:none;border-left:none'><%=mapz.get("careintime")%></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black'>接待员</td>
  <td colspan=2 class=xl74 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("carestaff")%></font></td>
  <td colspan=5 class=xl75 style='border-right:1.0pt solid black;border-left:
  none'>存油情况</td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl69 style='height:13.5pt;border-top:none'>上次保养里程</td>
  <td class=xl73 style='border-top:none;border-left:none'><%=mapz.get("carlmaintainmile")%></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'>使用机油</td>
  <td colspan=2 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><font class="font0"><%=mapz.get("jytype")%></font></td>
  <td colspan=2 class=xl125 style='border-right:.5pt solid black;border-left:
  none'>存油时间</td>
  <td colspan=2 class=xl125 style='border-right:.5pt solid black;border-left:
  none'>存油种类</td>
  <td class=xl76 style='border-top:none;border-left:none'>存油编号</td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td rowspan=4 height=72 class=xl78 style='border-bottom:2.0pt double black;
  height:54.0pt;border-top:none'>养护品</td>
  <td colspan=5 rowspan=4 class=xl98 width=338 style='border-right:.5pt solid black;
  border-bottom:2.0pt double black;width:253pt'><font class="font0"><%=mapz.get("careitems")%></font></td>
  <td colspan=2 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><%=mapz.get("oilstoretime1")!=null?mapz.get("oilstoretime1"):""%></td>
  <td colspan=2 class=xl77 style='border-right:.5pt solid black;border-left:
  none'><%=mapz.get("oiltype1")!=null?mapz.get("oiltype1"):""%></td>
  <td class=xl82 style='border-top:none;border-left:none'><%=mapz.get("oilnumber1")!=null?mapz.get("oilnumber1"):""%></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=2 height=18 class=xl128 style='border-right:.5pt solid black;
  height:13.5pt;border-left:none'><%=mapz.get("oilstoretime2")!=null?mapz.get("oilstoretime2"):""%></td>
  <td colspan=2 class=xl128 style='border-right:.5pt solid black;border-left:
  none'><%=mapz.get("oiltype2")!=null?mapz.get("oiltype2"):""%></td>
  <td class=xl82 style='border-top:none;border-left:none'><%=mapz.get("oilnumber2")!=null?mapz.get("oilnumber2"):""%></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=2 height=18 class=xl128 style='border-right:.5pt solid black;
  height:13.5pt;border-left:none'><%=mapz.get("oilstoretime3")!=null?mapz.get("oilstoretime3"):""%></td>
  <td colspan=2 class=xl128 style='border-right:.5pt solid black;border-left:
  none'><%=mapz.get("oiltype3")!=null?mapz.get("oiltype3"):""%></td>
  <td class=xl82 style='border-top:none;border-left:none'><%=mapz.get("oilnumber3")!=null?mapz.get("oilnumber3"):""%></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl70 style='height:13.5pt;border-top:none;border-left:
  none'>维修建议</td>
  <td colspan=4 class=xl83 style='border-right:1.0pt solid black;border-left:
  none'>&nbsp;</td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td rowspan=3 height=54 width=38 style='border-bottom:2.0pt double black;
  height:40.5pt;width:29pt' align=left valign=top><!--[if gte vml 1]><v:shape
   id="TextBox_x0020_6" o:spid="_x0000_s1925" type="#_x0000_t202" style='position:absolute;
   margin-left:0;margin-top:2.25pt;width:30pt;height:33pt;z-index:4;
   visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='layout-flow:vertical;mso-layout-flow-alt:top-to-bottom;
    mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <![if RotText]>
    <div><font class="font20">保险</font></div>
    <![endif]></v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
    <x:TextHAlign>Right</x:TextHAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:4;margin-left:0px;margin-top:3px;width:40px;
  height:44px'><![endif]><![if !RotText]><img width=40 height=44
  src="<%=path%>/crm/ccioModule/web/bb.files/image015.gif" alt="文本框: 保险" v:shapes="TextBox_x0020_6"
  class=shape v:dpi="96"><![endif]><![if !vml]></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=3 height=54 class=xl149 width=38 style='border-bottom:2.0pt double black;
    height:40.5pt;border-top:none;width:29pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td class=xl71 style='border-top:none'>保险公司</td>
  <td class=xl74 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("insucompany")%></font></td>
  <td colspan=2 class=xl88 style='border-right:.5pt solid black'>险 种</td>
  <td colspan=2 class=xl74 style='border-left:none'><font class="font0">&nbsp;</font></td>
  <td class=xl81 style='border-top:none'>备注：</td>
  <td colspan=4 class=xl115 style='border-right:1.0pt solid black'><font
  class="font0">&nbsp;</font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl78 style='height:13.5pt;border-top:none'>参保时间</td>
  <td class=xl77 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("insudate")%></font></td>
  <td colspan=3 rowspan=2 class=xl92 style='border-right:.5pt solid black;
  border-bottom:2.0pt double black'>是否本公司投保</td>
  <td rowspan=2 class=xl132 style='border-bottom:2.0pt double black;border-top:
  none'><font class="font0">&nbsp;</font></td>
  <td colspan=5 rowspan=2 class=xl162 style='border-right:1.0pt solid black;
  border-bottom:2.0pt double black'><font class="font0">&nbsp;</font></td>
  
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl70 style='height:13.5pt'>结束时间</td>
  <td class=xl83 style='border-top:none;border-left:none'><font class="font0"><%=mapz.get("insuendtime")%></font></td>
  
 </tr>
 <tr height=132 style='mso-height-source:userset;height:99.0pt'>
  <td colspan=2 height=132 width=119 style='height:99.0pt;width:90pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="TextBox_x0020_8"
   o:spid="_x0000_s1926" type="#_x0000_t202" style='position:absolute;
   margin-left:.75pt;margin-top:2.25pt;width:90.75pt;height:33pt;z-index:5;
   visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <div style='text-align:left'><font class="font20">用户陈诉 ：</font><font
    class="font21"><br>
        </font><font class="font22">(</font><font class="font23">准确记录车主陈诉</font><font
    class="font22">)</font></div>
   </v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:5;margin-left:1px;margin-top:3px;width:121px;
  height:44px'><img width=121 height=44 src="<%=path%>/crm/ccioModule/web/bb.files/image006.gif"
  alt="文本框: 用户陈诉 ：&#10;(准确记录车主陈诉)" v:shapes="TextBox_x0020_8"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=132 class=xl113 width=119 style='height:99.0pt;
    width:90pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=10 class=xl86 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
  
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=12 height=16 class=xl157 width=740 style='border-right:1.0pt solid black;
  height:12.0pt;width:556pt'>5W2H:何事,何人,何时,何地,何因,怎样做,需要花费多少钱<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>故障发生状况提示:速度,时间,天气,路况,声音,发动机状况,发生频率</td>
  
 </tr>
 <tr height=124 style='mso-height-source:userset;height:93.0pt'>
  <td colspan=2 height=124 width=119 style='height:93.0pt;width:90pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="TextBox_x0020_9"
   o:spid="_x0000_s1927" type="#_x0000_t202" style='position:absolute;
   margin-left:3pt;margin-top:2.25pt;width:82.5pt;height:34.5pt;z-index:6;
   visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <div style='text-align:left'><font class="font20">接待员建议及</font><font
    class="font24"><br>
        </font><font class="font20">维修费用说明</font></div>
   </v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:6;margin-left:4px;margin-top:3px;width:110px;
  height:46px'><img width=110 height=46 src="<%=path%>/crm/ccioModule/web/bb.files/image007.gif"
  alt="文本框: 接待员建议及&#10;维修费用说明" v:shapes="TextBox_x0020_9"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=124 class=xl113 width=119 style='height:93.0pt;
    width:90pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=10 class=xl86 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
  
 </tr>
 <tr height=121 style='mso-height-source:userset;height:90.75pt'>
  <td colspan=2 height=121 width=119 style='border-right:.5pt solid black;
  height:90.75pt;width:90pt' align=left valign=top><!--[if gte vml 1]><v:shape
   id="TextBox_x0020_10" o:spid="_x0000_s1928" type="#_x0000_t202" style='position:absolute;
   margin-left:3.75pt;margin-top:3.75pt;width:78.75pt;height:48.75pt;z-index:7;
   visibility:visible' filled="f" stroked="f" o:insetmode="auto">
   <v:textbox style='mso-direction-alt:auto;mso-rotate-with-shape:t'>
    <div style='text-align:left'><font class="font20">车间确认结果</font><font
    class="font24"><br>
        </font><font class="font20">及主要故障零</font><font class="font24"><br>
        </font><font class="font20">部件</font></div>
   </v:textbox>
   <x:ClientData ObjectType="Text">
    <x:SizeWithCells/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:7;margin-left:5px;margin-top:5px;width:105px;
  height:65px'><img width=105 height=65 src="<%=path%>/crm/ccioModule/web/bb.files/image008.gif"
  alt="文本框: 车间确认结果&#10;及主要故障零&#10;部件" v:shapes="TextBox_x0020_10"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=121 class=xl117 width=119 style='border-right:.5pt solid black;
    height:90.75pt;width:90pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=10 class=xl155 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
  
 </tr>
 <tr height=16 style='height:12.0pt'>
  <td colspan=2 height=16 class=xl135 style='border-right:.5pt solid black;
  height:12.0pt' x:str="                   "><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
  <td colspan=10 class=xl137 style='border-right:1.0pt solid black'
  x:str="检查者签字确认：                     ">检查者签字确认：<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
  
 </tr>
 <tr height=195 style='mso-height-source:userset;height:146.25pt'>
  <td colspan=4 height=195 width=288 style='border-right:.5pt solid black;
  height:146.25pt;width:217pt' align=left valign=top><span style='mso-ignore:vglayout;
  position:absolute;z-index:9;margin-left:7px;margin-top:6px;width:273px;
  height:180px'><img width=273 height=180 src="<%=path%>/crm/ccioModule/web/bb.files/image009.jpg"
  alt=a.jpg v:shapes="图片_x0020_12"></span><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=4 height=195 class=xl139 width=288 style='border-right:.5pt solid black;
    height:146.25pt;width:217pt'>　</td>
   </tr>
  </table>
  </span></td>
  <td colspan=8 height=195 width=452 style='border-right:1.0pt solid black;
  height:146.25pt;width:339pt' align=left valign=top><span style='mso-ignore:vglayout;
  position:absolute;z-index:8;margin-left:13px;margin-top:6px;width:429px;
  height:182px'><img width=429 height=182 src="<%=path%>/crm/ccioModule/web/bb.files/image011.jpg"
  alt=aaa.jpg v:shapes="图片_x0020_11"></span><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=8 height=195 class=xl142 width=452 style='border-right:1.0pt solid black;
    height:146.25pt;border-left:none;width:339pt'>　</td>
   </tr>
  </table>
  </span></td>
  
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=10 height=17 class=xl127 style='height:12.75pt'>*检查费用说明:本次检查出的故障如用户在本店维修,检查费用包含在维修费用内;如用户不在本店维修,请您支付检查费,本次检查费用:￥</td>
  <td class=xl67>　</td>
  <td class=xl79>元。</td>
  
 </tr>
 <tr height=16 style='height:12.0pt'>
  <td colspan=12 height=16 class=xl144 style='height:12.0pt'>*贵重物品：在将车辆交给我店检查修理前，已提示将车内贵重物品自行收起并保存好，如有遗失本店恕不负责。白：车间联\黄：前台联\粉：客户取车联</td>
  
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl145 style='height:21.75pt'>用户签字：</td>
  <td colspan=3 class=xl146>　</td>
  <td class=xl65></td>
  <td colspan=3 class=xl145>接待员签字：</td>
  <td colspan=3 class=xl148>　</td>
  
 </tr>

</table>
</center>
</body>

</html>
<script type="text/javascript">
$('#io_vin').autocomplete({
        serviceUrl: '', // Page for processing autocomplete requests
        minChars: 2, // Minimum request length for triggering autocomplete
        delimiter: /(,|;)\s*/, // Delimiter for separating requests (a character or regex)
        maxHeight: 400, // Maximum height of the suggestion list, in pixels
        width: 300, // List width
        zIndex: 9999, // List's z-index
        deferRequestBy: 0, // Request delay (milliseconds), if you prefer not to send lots of requests while the user is typing. I usually set the delay at 300 ms.
        params: { country: 'Yes'}, // Additional parameters
        onSelect: function(data, value){ }, // Callback function, triggered if one of the suggested options is selected,
        lookup: ['January', 'February', 'March'] // List of suggestions for local autocomplete
    });
	
</script>
<script>
var onAutocompleteSelect = function(value, data) {
      $('#selection').html('<img src="\/global\/flags\/small\/' + data + '.png" alt="" \/> ' + value);
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

	var ac = $('#io_vin').autocomplete(options);
    ac.disable();
    ac.enable();
    ac.setOptons({ zIndex: 1001 });
</script>
<script language="javascript">
		function print() {
			document.getElementById("searchz").style.display="none";
			WebBrowser1.ExecWB(6,1);
			//LODOP.ADD_PRINT_HTM(20,40,610,900,document.documentElement.innerHTML);
			//LODOP.PRINT();
			document.getElementById("searchz").style.display="block";
		}
		function printset() {
			document.getElementById("searchz").style.display="none";
			WebBrowser1.ExecWB(8,1);
			document.getElementById("searchz").style.display="block";
		}
	
		function view() {
			document.getElementById("searchz").style.display="none";
			//buttons.style.display="none";
			WebBrowser1.ExecWB(7,1);
			document.getElementById("searchz").style.display="block";
		}
	//view();
	</script>
