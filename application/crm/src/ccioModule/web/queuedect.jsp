<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path=request.getContextPath();
String a ="";
if(request.getAttribute("car_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("car_saturnData");
	a+="carcardid:"+sd.get("carcardid")+",";
	a+="carmodel:"+sd.get("carmodel_dict")+",";
	a+="carseries:"+sd.get("carseries_dict")+",";
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
	//a+="carlrepairdate:"+sd.get("carlrepairdate")+",";
	//a+="carlrepairmile:"+sd.get("carlrepairmile")+",";
}else{
	a+="carcardid: ,";//档案编号
	a+="carmodel: ,";//车型
	a+="carseries: ,";//车系
	a+="carvin: ,";//vin
	a+="carlicenceno: ,";//车牌号
	a+="carcolor: ,";//颜色
	a+="cararea: ,";//区域
	a+="carsource: ,";//车辆来源
	a+="carcardlevel: ,";//档案级别
}

if(request.getAttribute("servcare_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("servcare_saturnData");
	a+="carlmaintaintime:"+sd.get("servintime")+",";
	a+="carlmaintainmile:"+sd.get("servkilometer")+",";
	a+="carestaff:"+sd.get("servstaff_dict")+",";
}else{
	a+="carlmaintaintime: ,";//上次保养时间
	a+="carlmaintainmile: ,";//上次保养里程
	a+="carestaff: ,";
}
if(request.getAttribute("integral_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("integral_saturnData");
	a+="intglamount:"+sd.get("intglamount")+",";
}else{
	a+="intglamount: ,";
}
if(request.getAttribute("customer_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("customer_saturnData");
	a+="cstmcontact:"+sd.get("cstmcontact")+",";
	a+="cstmcontmobile:"+sd.get("cstmcontmobile")+",";
	a+="cstmmobile:"+sd.get("cstmmobile")+",";
	a+="cstmname:"+sd.get("cstmname")+",";
	a+="cstmsex:"+sd.get("cstmsex_dict")+",";
	a+="cstmaddress:"+sd.get("cstmaddress")+",";
	a+="cstmcontsex:"+sd.get("cstmcontsex_dict")+",";
	a+="cstmzipcode:"+sd.get("cstmzipcode")+",";
	a+="cstmnotes:"+sd.get("cstmnotes")+",";
}else{
	a+="cstmcontact: ,";//联系人
	a+="cstmcontmobile: ,";//联系人手机
	a+="cstmmobile: ,";//车主手机
	a+="cstmname: ,";//车主姓名
	a+="cstmsex: ,";//车主性别
	a+="cstmaddress: ,";//车主地址
	a+="cstmcontsex: ,";//联系人性别
	a+="cstmzipcode: ,";//邮编
	a+="cstmnotes: ,";//车辆客户备注
	
}
if(request.getAttribute("member_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("member_saturnData");
	a+="membcardid:"+sd.get("membcardid")+",";
	a+="membtype:"+sd.get("membtype_dict")+",";
}else{
	a+="membcardid: ,";
	a+="membtype: ,";
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
	//a+="carestaff:"+sd.get("carestaff_dict")+",";
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
	a+="careintime: ,";
	a+="isshop: ,";
	//a+="carestaff: ,";
	a+="careitems: ,";
}
if(request.getAttribute("jy_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("jy_saturnData");
	a+="jytype:"+sd.get("jytype_dict")+",";
}else{
	a+="jytype: ,";
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
	a+="isoil:是,";
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
	a+="isoil:否,";
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
if(request.getAttribute("visit_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("visit_saturnData");
	a+="visitnotes:"+sd.get("visitnotes")+",";
}else{
	a+="visitnotes: ,";//回访备注
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
<html>
<head>
<title>详细</title>
<style  type="text/css">
* {
	margin:0 auto;
}
img {
	border:0px;
}
#content {
	width:800px;
	height:480px;
}
#brower {
	text-align:center;
	background-color:#d4e3ff;
	border-collapse:collapse;
	width:800px;
	height:480px;
	margin:0 auto;
	font-size:18px;
	color:#000000;
	font-family:"方正大黑简体",Arial, Helvetica, sans-serif,;
	border:2px solid #a5c0ca;
	margin-top:5px;
}
#brower tr, td {
	padding-left:10px;
	/*width:187px;*/
	height:30px;
	border:2px solid #a5c0ca;
	line-height:35px;
}
.xx {
	background:#5e8cdf;
}
#brower .an {
	width:800px;
}
</style>
</head>
<body>
<center>
<div id="content">
  <table id="brower" cellpadding="0" cellspacing="0">
    <tr>
      <td width="130px" class="xx">车系</td>
      <td width="140px"><%=mapz.get("carseries")%></td>
      <td width="150px" class="xx">车牌号</td>
      <td width="125px"><%=mapz.get("carlicenceno")%></td>
      <td width="130px" class="xx">档案编号</td>
      <td width="125px"><%=mapz.get("carcardid")%></td>
    </tr>
    <tr>
      <td class="xx">车主姓名</td>
      <td><%=mapz.get("cstmname")%></td>
      <td class="xx">车主电话</td>
      <td><%=mapz.get("cstmmobile")%></td>
      <td class="xx">联系人姓名</td>
      <td><%=mapz.get("cstmcontact")%></td>
     </tr>
    <tr>
      <td class="xx">车主地址</td>
      <td colspan="3" align="left"><%=mapz.get("cstmaddress")%></td>
      <td class="xx">联系人电话</td>
      <td><%=mapz.get("cstmcontmobile")%></td>
     </tr>
    <tr>
      <td class="xx">VIN</td>
      <td colspan="3"><%=mapz.get("carvin")%></td>
      <td class="xx">档案级别</td>
      <%
      if("优".equals(mapz.get("carcardlevel"))||"良".equals(mapz.get("carcardlevel"))){
    	  %>
    	  <td style="background-color: #B4EEB4;"><%=mapz.get("carcardlevel")%></td>
    	  <%
      }else if("中".equals(mapz.get("carcardlevel"))||"差".equals(mapz.get("carcardlevel"))){
    	  %>
    	  <td style="background-color: #EEE685;"><%=mapz.get("carcardlevel")%></td>
    	  <%
      }else if("新".equals(mapz.get("carcardlevel"))||"死档".equals(mapz.get("carcardlevel"))||request.getAttribute("service_saturnData")==null){
    	  %>
    	  <td style="background-color: #FFA07A;"><%=mapz.get("carcardlevel")%></td>
    	  <%
      }else{
    	  %>
    	  <td><%=mapz.get("carcardlevel")%></td>
    	  <%
      }
      %>
     </tr>
    <tr>
      <td class="xx">会员级别</td>
      <td><%=mapz.get("membtype")%></td>
      <td class="xx">会员卡号</td>
      <td><%=mapz.get("membcardid")%></td>
      <td class="xx">会员积分</td>
      <td><%=mapz.get("intglamount")%></td>
     </tr>
    <tr>
      <td class="xx">上次保养时间</td>
      <td><%=mapz.get("carlmaintaintime")%></td>
      <td class="xx">上次保养里程</td>
      <td><%=mapz.get("carlmaintainmile")%></td>
      <td class="xx">上次保养接待</td>
      <td><%=mapz.get("carestaff")%></td>
     </tr>
    <tr>
      <td class="xx">上次保养机油</td>
      <td><%=mapz.get("jytype")%></td>
      <td class="xx">上次保养养护品</td>
      <td colspan="3" align="left"><%=mapz.get("careitems")%></td>
     </tr>
    <tr>
      <td class="xx">是否有存油</td>
      <td><%=mapz.get("isoil")%></td>
      <td class="xx">保险截止日期</td>
      <td><%=mapz.get("insuendtime")%></td>
      <td class="xx">保险公司</td>
      <td><%=mapz.get("insucompany")%></td>
    </tr>
	<tr>
      <td class="xx">最后一次<br/>回访内容</td>
      <td colspan="5" align="left"><%=mapz.get("visitnotes")%></td>
     </tr>
	 <tr>
      <td class="xx">备注</td>
      <td colspan="5" align="left"><%=mapz.get("cstmnotes")%></td>
     </tr>
	 <tr>
      <td colspan="6">
	  <img src="<%=path %>/crm/ccioModule/web/image/fanhui.png" onclick="javascript:history.back();" />
	  </td>
     </tr>
  </table>
</div>
</center>
</body>
</html>
