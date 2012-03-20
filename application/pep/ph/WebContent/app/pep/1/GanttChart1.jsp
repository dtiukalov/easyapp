<%@page import="com.saturn.ph.FormManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.tc.utils.DateUtils"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Page 1</title>
</head>
<script>
	function Task(from, to, task, resource, progress, level, color) {
		var _from = new Date();	
		var _to = new Date();
		var _task = task;
		var _resource = resource;						
		var _progress = progress;
		var _level = level;
		var _color = color;
		
		var dvArr = from.split('-');
		_from.setFullYear(parseInt(dvArr[0], 10), parseInt(dvArr[1], 10) - 1, parseInt(dvArr[2], 10));
		dvArr = to.split('-'); 
		_to.setFullYear(parseInt(dvArr[0], 10), parseInt(dvArr[1], 10) - 1, parseInt(dvArr[2], 10));		
		
		this.getFrom = function(){ return _from};
		this.getTo = function(){ return _to};
		this.getTask = function(){ return _task};
		this.getResource = function(){ return _resource};
		this.getProgress = function(){ return _progress};
		this.getLevel = function(){return _level};
		this.getColor = function(){return _color};
	}
	
	function Gantt(gDiv) {
		var _GanttDiv = gDiv;
		var _taskList = new Array();	
			
		this.AddTaskDetail = function(value) {
			_taskList.push(value);
		}
		
		this.Draw = function(start, width) {
			var _offSet = 0;
			var _dateDiff = 0;
			var _currentDate = new Date();
			var _maxDate = new Date();
			var _minDate = new Date();	
			var _maxLevel = 0;
			var _dTemp = new Date();
			var _firstRowStr = 
"<table border=1 style='border-collapse:collapse;border:#000000 2px solid'><tr style='background-color:feffbe;text-align:center;'><td rowspan='2' width='50' style='width:50px;font-size:12px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Porjekt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			var _secondRow = "";
			var _thirdRow = ""; 
			var _gStr = "";		
			var _colSpan = 0;
			var counter = 0;
			
			_currentDate.setFullYear(_currentDate.getFullYear(), _currentDate.getMonth(), _currentDate.getDate());
			if (_taskList.length > 0) {
				var task = _taskList[0];
				_maxDate.setFullYear(task.getTo().getFullYear(), task.getTo().getMonth(), task.getTo().getDate());
				_minDate.setFullYear(task.getFrom().getFullYear(), task.getFrom().getMonth(), task.getFrom().getDate());
				_maxLevel = task.getLevel();
				for (i = 0; i < _taskList.length; i++) {
					task = _taskList[i];
					if (Date.parse(task.getFrom()) < Date.parse(_minDate)) {
						_minDate.setFullYear(task.getFrom().getFullYear(), task.getFrom().getMonth(), task.getFrom().getDate());
					}
					
					if (Date.parse(task.getTo()) > Date.parse(_maxDate)) {
						_maxDate.setFullYear(task.getTo().getFullYear(), task.getTo().getMonth(), task.getTo().getDate());
					}		
					
					if (_maxLevel < task.getLevel()) {
						_maxLevel = task.getLevel();
					}				
				}
				
				//---- Fix _maxDate value for better displaying-----
				// Add at least 5 days
				//控制最大时间和最小时间前后显示的月份
				if (_maxDate.getMonth() != 11) { //December 12&#26376;				
					_maxDate.setFullYear(_maxDate.getFullYear(), _maxDate.getMonth() + 2, 1); //The fifth day of next month will be used
				} else {
					_maxDate.setFullYear(_maxDate.getFullYear() + 1, 2, 1); //The fifth day of next month will be used
				}
				
				if (_minDate.getMonth() == 0) {
					_minDate.setFullYear(_minDate.getFullYear() - 1 , 10, 1);
				} else {
					_minDate.setFullYear(_minDate.getFullYear(), _minDate.getMonth()-1, 1);
				} 
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				//_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr style='height:180px;'><td>&nbsp;</td>";
				_dTemp.setFullYear(_minDate.getFullYear(), _minDate.getMonth(), _minDate.getDate());
				
				while (Date.parse(_dTemp) <= Date.parse(_maxDate)) {	
					
					_gStr += "<td class='GDay'><div style='width:" + width + "px;'>" + (_dTemp.getMonth()+1) + "</div></td>";
					//_secondRow += "<td class='GDay'><div style='width: + width + px;'>" + (start--) + "</div></td>";
					if (_dTemp.getFullYear() == _currentDate.getFullYear() && _dTemp.getMonth() == _currentDate.getMonth())	{					
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21) + "'><label class=\"line\"></label></td>";
					} else {
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21) + "'>&nbsp;</td>";
					}
					
					_colSpan++;
				
					if (_dTemp.getMonth() == 11) { //December
						_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + _dTemp.getFullYear() + "</td>";
						_colSpan = 0;
						_dTemp.setFullYear(_dTemp.getFullYear() + 1, 0, 1);
					} else {
						if (_dTemp.getFullYear() == _maxDate.getFullYear() && _dTemp.getMonth() == _maxDate.getMonth()) {
							_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + _dTemp.getFullYear() + "</td>";
						}
						_dTemp.setFullYear(_dTemp.getFullYear(), _dTemp.getMonth() + 1, 1);
						//if (_dTemp.getFullYear() == _maxDate.getFullYear() && _dTemp.getMonth() == _maxDate.getMonth() ) {
						//	_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan+1) + "'>" + _dTemp.getFullYear() + "</td>";
						//}
					}
				}
		//		_thirdRow += "</tr>"; 				
	//			_gStr += "</tr>" + _thirdRow + "</table>";			
	//			_gStr = _firstRowStr + _gStr;			
			

				_thirdRow += "</tr>"; 	
				_firstRowStr += "</tr>";	
				_gStr += "</tr>";
			//	_secondRow += "</tr>"
				_gStr = _firstRowStr + _gStr + _secondRow + _thirdRow + "</table>";
			//	_gStr = _firstRowStr + _thirdRow + "</table>";	
					
				var offWidth = width + 3;
				var preWidth = 83;
				
				for(i = 0; i < _taskList.length; i++)
				{	
					var task = _taskList[i];
					var _level = task.getLevel();
					
			//		_offSet = (Date.parse(task.getFrom()) - Date.parse(_minDate)) / (24 * 60 * 60 * 1000);
			//		_dateDiff = (Date.parse(task.getTo()) - Date.parse(task.getFrom())) / (24 * 60 * 60 * 1000) + 1;
					
					_offSet = (task.getFrom().getFullYear() - _minDate.getFullYear()) * 12 + (task.getFrom().getMonth() - _minDate.getMonth());
					_dateDiff = (task.getTo().getFullYear() - task.getFrom().getFullYear()) * 12 + (task.getTo().getMonth() - task.getFrom().getMonth()) + 1;
					
					if (task.getFrom().getFullYear() == task.getTo().getFullYear() && task.getFrom().getMonth() == task.getTo().getMonth()) {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth - 9 + preWidth) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' style='float:left; width:" + (offWidth * _dateDiff - 1 + 3 ) + "px;'>" + task.getResource() + "</div></div>";
						_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:5px;font-family: Arial,宋体,verdana;font-size: 12px;'>" + task.getTask() + "</div>";						
					} else {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + preWidth) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;" + "background-color:" + task.getColor()+ ";border:#000000 1px solid;text-align:center; '>" + task.getResource() + "</div></div>";
					}
				}
				_GanttDiv.innerHTML = _gStr;
			}
		}
	}		
	// GET NUMBER OF DAYS IN MONTH
	function getDaysInMonth(month, year)  
	{
		
		var days;		
		switch(month)
		{
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				days = 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				days = 30;
				break;
			case 2:
				if (((year% 4)==0) && ((year% 100)!=0) || ((year% 400)==0))				
					days = 29;				
				else								
					days = 28;				
				break;
		}
		return (days);
	}				
	/*----- END OF MY CODE FOR Gantt CHART GENERATOR -----*/
</script>
<style>
/*----- SICON GANTT CHART STYLE CLASSES --------------------------
	 * DESCRIPTION	: Theses class is required for SIcon Gantt Chart
	 * NOTE			: Should change the color, the text style only
	 *----------------------------------------------------------------*/
.Gantt {
	font-family: Arial,宋体;
	font-size: 11px;
}

.GTaskTitle {
	font-family: Arial,宋体;
	font-size: 11px;
	font-weight: bold;
}

.GMonth {
	padding-left: 5px;
	font-family: Arial,宋体;
	font-size: 11px;
	font-weight: bold;
}

.GToday {
	font-family: Arial,宋体;
	font-size: 11px;
	text-align: center;
}

.line{   
    width:2px;   
    background:#f785f4;   
    height:180 px;
}

.GWeekend {
	font-family: Arial,宋体;
	font-size: 11px;
	background-color: #F5F5F5;
	text-align: center;
}

.GDay {
	font-family: Arial,宋体;
	font-size: 11px;
	text-align: center;
}

.GTask {
	border-top: 1px solid #CACACA;
	border-bottom: 1px solid #CACACA;
	height: 14px;
	background-color: yellow;
}

.GTaska {
	height: 19px;
	background-color: yellow;
	background: url(../images/bg.gif) no-repeat 0 0;
	font-size: 9px;
	font-weight: bolder;
	text-align: center;
	font-weight: bold;
	line-height: 19px;
	color: #FFF;
}

.GProgress {
	background-color: black;
	height: 2px;
	overflow: hidden;
	margin-top: 5px;
}

</style>
<%
	String uid = request.getParameter("uid");
	Map form = FormManager.getFormValue(uid,true);
	
	List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	
	Map<String,String> mapPM = new HashMap<String,String>();
	mapPM.put("lichengbei","PM");
	mapPM.put("date", (String)form.get("fv9PMMLDate"));//	里程碑日期_PM
	mapPM.put("org", (String)form.get("fv9PMMLOrg"));//	验收机构_PM
	list.add(mapPM);
	
	Map<String,String> mapPP = new HashMap<String,String>();
	mapPP.put("lichengbei","PP");
	mapPP.put("date",(String)form.get("fv9PPMLDate"));//	里程碑日期_PP
	mapPP.put("org",(String)form.get("fv9PPMLOrg"));//	验收机构_PP
	list.add(mapPP);
	
	Map<String,String> mapPD = new HashMap<String,String>();
	mapPD.put("lichengbei","PD");
	mapPD.put("date",(String)form.get("fv9PDMLDate"));//	里程碑日期_PD
	mapPD.put("org",(String)form.get("fv9PDMLOrg"));//	验收机构_PD
	list.add(mapPD);
	
	Map<String,String> mapPF = new HashMap<String,String>();
	mapPF.put("lichengbei","PF");
	mapPF.put("date",(String)form.get("fv9PFMLDate"));//	里程碑日期_PF
	mapPF.put("org",(String)form.get("fv9PFMLOrg"));//	验收机构_PF
	list.add(mapPF);
	
	Map<String,String> mapKE = new HashMap<String,String>();
	mapKE.put("lichengbei","KE");
	mapKE.put("date",(String)form.get("fv9KEMLDate"));//	里程碑日期_KE
	mapKE.put("org",(String)form.get("fv9KEMLOrg"));//	验收机构_KE
	list.add(mapKE);
	
	Map<String,String> mapDE = new HashMap<String,String>();
	mapDE.put("lichengbei","DE");
	mapDE.put("date",(String)form.get("fv9DEMLDate"));//	里程碑日期_DE
	mapDE.put("org",(String)form.get("fv9DEMLOrg"));//	验收机构_DE
	list.add(mapDE);
	
	Map<String,String> mapDFExt = new HashMap<String,String>();
	mapDFExt.put("lichengbei","<span>DF</span><span style=\"font-size:9px;\">Exte</span>");
	mapDFExt.put("date",(String)form.get("fv9DFExtMLDate"));//	里程碑日期_DF
	mapDFExt.put("org",(String)form.get("fv9DFExtMLOrg"));//	验收机构_DF
	list.add(mapDFExt);

	Map<String,String> mapDFInt = new HashMap<String,String>();
	mapDFInt.put("lichengbei","<span>DF</span><span style=\"font-size:9px;\">Int</span>");
	mapDFInt.put("date",(String)form.get("fv9DFIntMLDate"));//	里程碑日期_DF
	mapDFInt.put("org",(String)form.get("fv9DFIntMLOrg"));//	验收机构_DF
	list.add(mapDFInt);
	
	Map<String,String> mapBF = new HashMap<String,String>();
	mapBF.put("lichengbei","BF");
	mapBF.put("date", (String)form.get("fv9BFMLDate"));//	里程碑日期_BF
	mapBF.put("org",(String)form.get("fv9BFMLOrg"));//	验收机构_BF
	list.add(mapBF);
	
	Map<String,String> mapLF = new HashMap<String,String>();
	mapLF.put("lichengbei","LF");
	mapLF.put("date",(String)form.get("fv9LFMLDate"));//	里程碑日期_LF
	mapLF.put("org",(String)form.get("fv9LFMLOrg"));//	验收机构_LF
	list.add(mapLF);
	
	Map<String,String> mapVFF = new HashMap<String,String>();
	mapVFF.put("lichengbei","VFF");
	mapVFF.put("date",(String)form.get("fv9VFFMLDate"));//	里程碑日期_VFF
	mapVFF.put("org",(String)form.get("fv9VFFMLOrg"));//	验收机构_VFF
	list.add(mapVFF);
	
	Map<String,String> mapPVS = new HashMap<String,String>();
	mapPVS.put("lichengbei","PVS");
	mapPVS.put("date",(String)form.get("fv9PVSMLDate"));//	里程碑日期_PVS
	mapPVS.put("org",(String)form.get("fv9PVSMLOrg"));//	验收机构_PVS
	list.add(mapPVS);
	
	Map<String,String> map0S = new HashMap<String,String>();
	map0S.put("lichengbei","0S");
	map0S.put("date",(String)form.get("fv90SMLDate"));//	里程碑日期_0S
	map0S.put("org",(String)form.get("fv90SMLOrg"));//	验收机构_0S
	list.add(map0S);
	
	Map<String,String> mapSOP = new HashMap<String,String>();
	mapSOP.put("lichengbei","SOP");
	mapSOP.put("date", (String)form.get("fv9SOPMLDate"));//	里程碑日期_SOP
	mapSOP.put("org", (String)form.get("fv9SOPMLOrg"));//	验收机构_SOP
	list.add(mapSOP);
	
	Map<String,String> mapME = new HashMap<String,String>();
	mapME.put("lichengbei","ME");
	mapME.put("date",(String)form.get("fv9MEMLDate"));//	里程碑日期_ME
	mapME.put("org",(String)form.get("fv9MEMLOrg"));//	验收机构_ME
	list.add(mapME);

	String Producktidefinition_S = (String)form.get("fv9PFMLDate"); 
	String Producktidefinition_E = (String)form.get("fv9LFMLDate"); 
	String Konzept_S = (String)form.get("fv9LFMLDate");
	String Konzept_E = (String)form.get("fv9SOPMLDate");
	String Serienvorboreitung_S = (String)form.get("fv9SOPMLDate");
	String Serienvorboreitung_E = (String)form.get("fv9MEMLDate");
	list = Web.getHeBingLichengbeiList(list);
	
	String project = (String)request.getSession().getAttribute("project");
	if(project == null){
		project = "";
	}
	int ret1[] = null;
	if(Web.getDateStrNotNull(Producktidefinition_S) && Web.getDateStrNotNull(Producktidefinition_E)){
		ret1 = DateUtils.getDateLength(Producktidefinition_S.replaceAll("-",""), Producktidefinition_E.replaceAll("-",""));
	}
	int ret2[] = null;
	if(Web.getDateStrNotNull(Konzept_S) && Web.getDateStrNotNull(Konzept_E)){
		ret2 = DateUtils.getDateLength(Konzept_S.replaceAll("-",""), Konzept_E.replaceAll("-",""));
	}
	
%>
<body>
	<div style="position: relative" class="Gantt" id="GanttChart"></div>
</body>
<script>	var g = new Gantt(document.all.GanttChart);
	
	<%
	if(list != null){
		for(int j=0; j< list.size(); j++){
			Map<String,String> map = list.get(j);
			if(Web.getDateStrNotNull(map.get("date"))){
				%>
				g.AddTaskDetail(new Task('<%=map.get("date")%>', '<%=map.get("date")%>', '<%=project%>', '<div style="height:30px;float:left;font-weight: bold;"><%=map.get("lichengbei")%></div><br /><h6 style="color: white" class="GTaska" ><%=map.get("org")%></h6>', 50, 1));
				<%
			}
		}
	} 
	%>

	<%if(Web.getDateStrNotNull(Producktidefinition_S) && Web.getDateStrNotNull(Producktidefinition_E) && ret1 != null){%>	
	g.AddTaskDetail(new Task('<%=Producktidefinition_S%>', '<%=Producktidefinition_E%>', '', '<%=ret1[1]%> Mo\.', 50, 5, '#b0b0b0'));
	<%}%>
	<%if(Web.getDateStrNotNull(Konzept_S) && Web.getDateStrNotNull(Konzept_E) && ret2 != null){%>
	g.AddTaskDetail(new Task('<%=Konzept_S%>', '<%=Konzept_E%>', '', '<%=ret2[1]%> Mo\.', 50, 5, '#808080'));
	<%}%>
	
<%-- 	<%if(Web.getDateStrNotNull(Serienvorboreitung_S) && Web.getDateStrNotNull(Serienvorboreitung_E)){%>	
	g.AddTaskDetail(new Task('<%=Serienvorboreitung_S%>', '<%=Serienvorboreitung_E%>', '', '<font color="white">2 MO</font>', 50, 5, '#414141'));
<%}%> --%>
	g.Draw(49, 15);
</script>
</html>