<%@page import="com.saturn.ph.FormManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
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
			var _firstRowStr = "<table border=1 style='border-collapse:collapse;border:#000000 2px solid'><tr style='background-color:feffbe;text-align:center;'><td rowspan='3' width='150px' style='width:150px;font-size:12px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stuff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			var _secondRow = "";
			var _thirdRow = ""; 
			var _gStr = "";		
			var _colSpan = 0;
			var counter = 0;
			var kw = 0;
			
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
				

				// Add at least 5 days
				
				if (_maxDate.getDate() > 21) { //December 12&#26376;				
					_maxDate.setFullYear(_maxDate.getFullYear(), _maxDate.getMonth() + 1, 1);
				}
				_maxDate.setFullYear(_maxDate.getFullYear(), _maxDate.getMonth(), _maxDate.getDate() + (5-_maxDate.getDay()));
				
				if (_minDate.getMonth() == 11) {
					_minDate.setFullYear(_minDate.getFullYear(), _minDate.getMonth()-1, 1);	
				}
				kw = getFirstKw(_minDate);
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr><td>&nbsp;</td>";
				_dTemp.setFullYear(_minDate.getFullYear(), _minDate.getMonth(), _minDate.getDate());
				
				var _monthColSpan = 0;
				while (Date.parse(_dTemp) <= Date.parse(_maxDate)) {			
					var day = _dTemp.getDay();
					_secondRow += "<td class='GDay'><div style='width:" + width + "px;'>" + _dTemp.getDate() + "</div></td>";
					if (_dTemp.getFullYear() == _currentDate.getFullYear() && _dTemp.getMonth() == _currentDate.getMonth() && _dTemp.getDate() == _currentDate.getDate())	{					
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GToDay' style='height:" + ((_maxLevel+1) * 21 + _taskList.length / 3 * 20) + "'>&nbsp;</td>";
					} else {
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21 + _taskList.length / 3 * 20) + "'>&nbsp;</td>";
					}

					if(_dTemp.getDay() != 0) {
						if(Date.parse(_dTemp) == Date.parse(_maxDate)) {
							if (kw != 0) {							
								_gStr += "<td class='GMonth' colspan='" + (_colSpan + 1) + "'>KW" + kw + "/" + _dTemp.getFullYear() + "</td>";	
							} else {
								_gStr += "<td class='GMonth' colspan='" + (_colSpan + 1) + "'>KW" + kw + "/" + (_dTemp.getFullYear()-1) + "</td>";
							}					
						}
						_colSpan++;
					} else {
						if (kw != 0) {							
							_gStr += "<td class='GMonth' colspan='" + (_colSpan + 1) + "'>KW" + kw + "/" + _dTemp.getFullYear() + "</td>";	
						} else {
							_gStr += "<td class='GMonth' colspan='" + (_colSpan + 1) + "'>KW" + kw + "/" + (_dTemp.getFullYear()-1) + "</td>";
						}
						
						_colSpan = 0;
						kw++;
					}
					
					if(_dTemp.getDate() < getDaysInMonth(_dTemp.getMonth() + 1, _dTemp.getFullYear())) {
						if(Date.parse(_dTemp) == Date.parse(_maxDate)) {							
							_firstRowStr += "<td class='GMonth' colspan='" + (_monthColSpan + 1) + "'>M" + (_dTemp.getMonth() + 1) + "/" + _dTemp.getFullYear() + "</td>";							
						}
						_dTemp.setDate(_dTemp.getDate() + 1);
						_monthColSpan++;
					} else {
						_firstRowStr += "<td class='GMonth' colspan='" + (_monthColSpan + 1) + "'>M" + (_dTemp.getMonth() + 1) + "/" + _dTemp.getFullYear() + "</td>";
						_monthColSpan = 0;
						if(_dTemp.getMonth() == 11) {//December 
							_dTemp.setFullYear(_dTemp.getFullYear() + 1, 0, 1);
							kw = getFirstKw(_dTemp);
						} else {
							_dTemp.setFullYear(_dTemp.getFullYear(), _dTemp.getMonth() + 1, 1);
						}
					}				
				}			

				_thirdRow += "</tr>"; 	
				_firstRowStr += "</tr>";	
				_gStr += "</tr>";
				_secondRow += "</tr>"
				_gStr = _firstRowStr + _gStr + _secondRow + _thirdRow + "</table>";

				var offWidth = width + 3;
				
				var some = 0;
				var top = 0;
				for(i = 0; i < _taskList.length; i++)
				{	
					var task = _taskList[i];
					var _level = task.getLevel();
					
					_offSet = (Date.parse(task.getFrom()) - Date.parse(_minDate)) / (24 * 60 * 60 * 1000);
					_dateDiff = (Date.parse(task.getTo()) - Date.parse(task.getFrom())) / (24 * 60 * 60 * 1000) + 1;
					
			//		_offSet = (task.getFrom().getFullYear() - _minDate.getFullYear()) * 12 + (task.getFrom().getMonth() - _minDate.getMonth());
			//		_dateDiff = (task.getTo().getFullYear() - task.getFrom().getFullYear()) * 12 + (task.getTo().getMonth() - task.getFrom().getMonth()) + 1;
					
					if (_level != 0 && (_level-1) % 3 == 0) {
						some ++;
					}
					
					top = (16 * _level + 40 + some*20);
					_gStr += "<div style='position:absolute; top:" + top + "; left:5px;width:150px;font-size:12px'>" + task.getTask() + "</div>";
					_gStr += "<div style='position:absolute; top:" + top + "; left:" + (_offSet * offWidth + 154) + "px; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTask' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;" + "background-color:" + task.getColor()+ ";border:#000000 1px solid;text-align:center;'>" + task.getResource() + "</div></div>";
				}
				_GanttDiv.innerHTML = _gStr;
			}
		}
	}		
	// GET NUMBER OF DAYS IN MONTH
	function getFirstKw(date) {
		var week = (24 * 60 * 60 * 1000) * 7;
		var firstDate = new Date();	
		var k = 0;
		firstDate.setFullYear(date.getYear(), 0, 1);
		
		var days = firstDate.getDay();
		if (days >= 3) {
			k = 0;
		} else {
			k = 1;
		}
		
		var time = firstDate.getTime();
		var t = date.getTime();
		
		while (true) {
			time += week;
			
			if (time < t) {
				k++;
			} else {
				break;
			}
		}
		
		return k;
	}
	
	function getDaysInMonth(month, year) {
		
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
	.Gantt
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
	}
	
	.GTaskTitle
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		font-weight:bold;
	}
	
	.GMonth
	{
		padding-left:5px;
		font-family:tahoma, arial, verdana;
		font-size:11px;
		font-weight:bold;	
	}
	
	.GToday
	{
		background-color: #f785f4;	
	}
	
	.GWeekend
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		background-color:#F5F5F5;
		text-align:center;
	}
	
	.GDay
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		text-align:center;
	}
	
	.GTask
	{
		border-top:1px solid #CACACA;
		border-bottom:1px solid #CACACA;
		height:14px;
		background-color:yellow;
	}
	
	.GTaska
	{
		height:19px;
		background-color:yellow;
		background:url(images/bg.gif) no-repeat 0 0;
		font-size:9px;
		text-align:center;
		font-weight:bold;
		line-height:19px;
		color:#FFF;
	}

	.GProgress
	{
		background-color:black;
		height:2px;
		overflow: hidden;
		margin-top:5px;
	}
	
</style>
<%
	String uid = request.getParameter("uid");
	Map form = FormManager.getFormValue(uid,true);
	
	List<String> fv9Stufe = (List<String>)form.get("fv9Stufe");
	List<String> fv9FahrSoll = (List<String>)form.get("fv9FahrSoll");
	List<String> fv9Fahrlst = (List<String>)form.get("fv9Fahrlst");
	List<String> fv9KarossSoll = (List<String>)form.get("fv9KarossSoll");
	List<String> fv9Karosslst = (List<String>)form.get("fv9Karosslst");
	
	List<String> fv9KarossStart = (List<String>)form.get("fv9KarossStart");
	List<String> fv9KarossEnd = (List<String>)form.get("fv9KarossEnd");
	List<String> fv9LackStart = (List<String>)form.get("fv9LackStart");
	List<String> fv9LackEnd = (List<String>)form.get("fv9LackEnd");
	List<String> fv9MontageStart = (List<String>)form.get("fv9MontageStart");
	List<String> fv9MontageEnd = (List<String>)form.get("fv9MontageEnd");
	List<String> fv9ObergabeStart = (List<String>)form.get("fv9ObergabeStart");
	List<String> fv9ObergabeEnd = (List<String>)form.get("fv9ObergabeEnd");
%>
<body>	
	<div style="position:relative" class="Gantt" id="GanttChart"></div>
</body>
<script>
	var g = new Gantt(document.all.GanttChart);
<%
	if(fv9Stufe.size() > 0){
		for(int i=0; i<fv9Stufe.size(); i++){
			int level = 3*i + 1;
			%>
			g.AddTaskDetail(new Task('<%=fv9KarossStart.get(i)%>', '<%=fv9KarossEnd.get(i)%>', '<b><%=fv9Stufe.get(i)%>Fahrzeuge<br \>Soll: <%=fv9FahrSoll.get(i)%>  Ist: <%=fv9Fahrlst.get(i)%> <br \>Karosserien <br \>Soll: <%=fv9KarossSoll.get(i)%>  Ist: <%=fv9Karosslst.get(i)%> </b>', 'A', 50, <%=level%>, '#AED4F8'));
			g.AddTaskDetail(new Task('<%=fv9LackStart.get(i)%>', '<%=fv9LackEnd.get(i)%>', '', 'B', 50, <%=level+1%>, '#BBC2C5'));
			g.AddTaskDetail(new Task('<%=fv9MontageStart.get(i)%>', '<%=fv9MontageEnd.get(i)%>', '', 'C', 50, <%=level+2%>, '#00235A'));
			g.AddTaskDetail(new Task('<%=fv9ObergabeStart.get(i)%>', '<%=fv9ObergabeEnd.get(i)%>', '', 'D', 50, <%=level+2%>, '#91AFFF'));
<%  	
		}	
	}
	%>
	
	g.Draw(49, 19);	
</script>
</html>