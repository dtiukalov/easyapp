<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.List"%>
<%
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
	//a+="carlrepairdate:"+sd.get("carlrepairdate")+",";
	//a+="carlrepairmile:"+sd.get("carlrepairmile")+",";
}
if(request.getAttribute("integral_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("integral_saturnData");
	a+="intglamount:"+sd.get("intglamount")+",";
}
if(request.getAttribute("customer_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("customer_saturnData");
	a+="cstmcontact:"+sd.get("cstmcontact")+",";
	a+="cstmcontmobile:"+sd.get("cstmcontmobile")+",";
	a+="cstmmobile:"+sd.get("cstmmobile")+",";
	a+="cstmname:"+sd.get("cstmname")+",";
}
if(request.getAttribute("member_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("member_saturnData");
	a+="membcardid:"+sd.get("membcardid")+",";
	a+="membtype:"+sd.get("membtype_dict")+",";
}
//if(request.getAttribute("service_saturnData")!=null){
//	SaturnData sd=(SaturnData)request.getAttribute("service_saturnData");
//	a+="servstaff:"+sd.get("servstaff_dict")+",";
//}
if(request.getAttribute("care_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("care_saturnData");
	String ctime=sd.get("careintime")!=null?sd.get("careintime").toString().trim().substring(0,10):"";
	a+="careintime:"+ctime+",";
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
}
if(request.getAttribute("jy_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("jy_saturnData");
	a+="jytype:"+sd.get("jytype_dict")+",";
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
}
if(request.getAttribute("insurance_saturnData")!=null){
	SaturnData sd=(SaturnData)request.getAttribute("insurance_saturnData");
	a+="insucompany:"+sd.get("insucompany_dict")+",";
	a+="insudate:"+sd.get("insudate")+",";
	a+="insuendtime:"+sd.get("insuendtime")+",";
}

out.print(a);
%>
