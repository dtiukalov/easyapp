<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Page 1</title>
</head>
<script>
	function Task(from, to, task, resource, progress, level, color) {
		var _from = from;	
		var _to = to;
		var _task = task;
		var _resource = resource;						
		var _progress = progress;
		var _level = level;
		var _color = color;
		
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
			var _maxDate = "";
			var _minDate = "";	
			var _maxLevel = 0;
			var _dTemp = "";
			var _firstRowStr = "<table border=1 style='border-collapse:collapse;border:#000000 2px solid'><tr style='background-color:feffbe;text-align:center;'>";
			var _secondRow = "";
			var _thirdRow = ""; 
			var _gStr = "";		
			var _colSpan = 0;
			var counter = 0;
			
			if (_taskList.length > 0) {
				var task = _taskList[0];
				_maxDate = task.getTo();
				_minDate = task.getFrom();
				_maxLevel = task.getLevel();
				for (i = 0; i < _taskList.length; i++) {
					task = _taskList[i];
					if (task.getFrom() < _minDate) {
						_minDate = task.getFrom();
					}
					
					if (task.getTo() > _maxDate) {
						_maxDate = task.getTo();
					}		
					
					if (_maxLevel < task.getLevel()) {
						_maxLevel = task.getLevel();
					}				
				}

				//---- Fix _maxDate value for better displaying-----
				// Add at least 5 days
				var _maxArr = getYearWeeks(_maxDate);
				_maxDate = _maxArr[0] + "/" + getWeeksInYear(_maxDate);
				_maxArr = getYearWeeks(_maxDate);
				
				var _minArr = getYearWeeks(_minDate);
			//	_minDate = _minArr[0] + "/" + 1;
			//	_minArr = getYearWeeks(_minDate);
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr>";
				_dTemp = _minDate;
				var dArr = getYearWeeks(_minDate);
				while (dArr[0] <= _maxArr[0] && parseInt(dArr[1], 10) <= parseInt(_maxArr[1], 10)) {	
				
					
					_gStr += "<td class='GDay'><div style='width:" + width + "px;'>" + dArr[1] + "</div></td>";
					_secondRow += "<td class='GDay'><div style='width: + width + px;'>" + (start--) + "</div></td>";
					_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21) + "'>&nbsp;</td>";
					
					_colSpan++;
				
					if (dArr[1] == getWeeksInYear(_dTemp)) { //December
						_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + dArr[0] + "</td>";
						_colSpan = 0;
						_dTemp = (parseInt(dArr[0], 10)+1) + "/1";
					} else {
						_dTemp= dArr[0] + "/" + (parseInt(dArr[1], 10) + 1);
					}
					
					var dArr = getYearWeeks(_dTemp);
				}
		//		_thirdRow += "</tr>"; 				
	//			_gStr += "</tr>" + _thirdRow + "</table>";			
	//			_gStr = _firstRowStr + _gStr;			
			

				_thirdRow += "</tr>"; 	
				_firstRowStr += "</tr>";	
				_gStr += "</tr>";
				_secondRow += "</tr>"
				_gStr = _firstRowStr + _gStr + _secondRow + _thirdRow + "</table>";
			//	_gStr = _firstRowStr + _thirdRow + "</table>";	
					
				var offWidth = 27;
				if (width == 14) {
					offWidth = 17;
				}
				
				for(i = 0; i < _taskList.length; i++)
				{	
					var task = _taskList[i];
					var _level = task.getLevel();
					
			//		_offSet = (Date.parse(task.getFrom()) - Date.parse(_minDate)) / (24 * 60 * 60 * 1000);
			//		_dateDiff = (Date.parse(task.getTo()) - Date.parse(task.getFrom())) / (24 * 60 * 60 * 1000) + 1;
					
					//TODO:&#27492;&#22788;&#38656;&#35201;&#26356;&#25913;&#65306;&#19981;&#26159;&#27599;&#24180;&#37117;52&#21608;
					var fromArr = getYearWeeks(task.getFrom());
					var toArr = getYearWeeks(task.getTo());
					_offSet = (parseInt(fromArr[0], 10) - parseInt(_minArr[0], 10)) * 52 + (parseInt(fromArr[1], 10) - parseInt(_minArr[1], 10));
					_dateDiff = (parseInt(toArr[0], 10) - parseInt(fromArr[0], 10)) * 52 + (parseInt(toArr[1], 10) - parseInt(fromArr[1], 10)) + 1;
					
				//	_dateDiff = (task.getTo().getFullYear() - task.getFrom().getFullYear()) * 12 + (task.getTo().getMonth() - task.getFrom().getMonth()) + 1;
					if (task.getFrom() == task.getTo()) {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + 204) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTaska' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;'>" + task.getResource() + "</div></div>";
					} else {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + 204) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTask' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;" + task.getColor() + "'>" + task.getResource() + "</div></div>";
					}
				}
				_GanttDiv.innerHTML = _gStr;
			}
		}
	}		
	
	function getProgressDiv(progress) {
		return "<div class='GProgress' style='width:" + progress + "%; overflow:hidden'></div>"
	}

	function getYearWeeks(date) {
		return date.split('/');
	}
	
	function getWeeksInYear(date) {
		var arr = date.split('/');
		var year = arr[0];
			
		if ("2011" == year) {
			return "52";
		} else {
			return "52";
		}
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
		background-color: #FDFDE0;	
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
		height:14px;
		background-color:#4ba1ff;
		border:#000000 1px solid;
		text-align:center;
	}
	
	.GTaska
	{
		height:19px;
		background-color:yellow;
		background:url(../images/bg.gif) no-repeat 0 0;
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

	String fv9_VFFTBTZP5 = "8/1/2008";//	VFF TBT ZP5日期
	String fv9_VFFTBTZP7 = "8/1/2008";//	VFF TBT ZP7日期
	String fv9_VFFVorStart = "8/1/2008";//		VFF装车开始日期
	String fv9_VFFVorEnd = "8/1/2008";//		VFF装车结束日期
	String fv9_VFFAbsMeter = "8/1/2008";//		VFF路试里程
	String fv9_VFFAbsStart = "8/1/2008";//		VFF路试开始日期
	String fv9_VFFAbsEnd = "8/1/2008";//		VFF路试结束日期
	String fv9_PVSTBTZP5 = "8/1/2008";//		PVS TBT ZP5日期
	String fv9_PVSTBTZP7 = "8/1/2008";//		PVS TBT ZP7日期
	String fv9_PVSVorStart = "8/1/2008";//		PVS装车开始日期
	String fv9_PVSVorEnd = "8/1/2008";//		PVS装车结束日期
	String fv9_PVSAbsMeter = "8/1/2008";//		PVS路试里程
	String fv9_PVSAbsStart = "8/1/2008";//		PVS路试开始日期
	String fv9_PVSAbsEnd = "8/1/2008";//		PVS路试结束日期
	String fv9_ErstmusterZP5 = "8/1/2008";//		ErstmusterZP5日期
	String fv9_ErstmusterZP7 = "8/1/2008";//		ErstmusterZP7日期
	String fv9_0STBTZP5 = "8/1/2008";//		0S TBT ZP5日期
	String fv9_0STBTZP7 = "8/1/2008";//		0S TBT ZP7日期
	String fv9_0SVorStart = "8/1/2008";//		0S装车开始日期
	String fv9_0SVorEnd = "8/1/2008";//		0S装车结束日期
	String fv9_0SAbsMeter = "8/1/2008";//		0S路试里程
	String fv9_0SAbsStart = "8/1/2008";//		0S路试开始日期
	String fv9_0SAbsEnd = "8/1/2008";//		0S路试结束日期
	String fv9_TPPA_ME = "8/1/2008";//		TPPA_ME日期
	String fv9_QFTPPA_Kunde = "8/1/2008";//		QFTPPA_Kunde日期

%>
<body>	
	<div style="position:relative" class="Gantt" id="GanttChart"></div>
</body>
<script>
	var g = new Gantt(document.all.GanttChart);
	g.AddTaskDetail(new Task('2011/40', '2011/40', '<b>Sample task 1 1</b>', 'ZP5', 50, 1));
	g.AddTaskDetail(new Task('2011/44', '2011/44', '<b>Sample task 1 1</b>', 'ZP7', 50, 1));
	g.AddTaskDetail(new Task('2011/49', '2011/52', '<b>Sample task 1 1</b>', 'VFF',  50, 1, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	
	g.AddTaskDetail(new Task('2011/49', '2012/30', '<b>Sample task 1 1</b>', 'Absicherungslauf VFF 150.000 km', 50, 2));
	
	g.AddTaskDetail(new Task('2011/49', '2011/49', '<b>Sample task 1 1</b>', 'ZP5', 50, 3));
	g.AddTaskDetail(new Task('2012/1', '2012/1', '<b>Sample task 1 1</b>', 'ZP7', 50, 3));
	g.AddTaskDetail(new Task('2012/6', '2012/9', '<b>Sample task 1 1</b>', 'PVS', 50, 3, 'background-color:#000000;color:#FFF;font-weight:bold;'));

	g.AddTaskDetail(new Task('2011/45', '2011/45', '<b>Sample task 1 1</b>', 'ZP5', 50, 4));
	g.AddTaskDetail(new Task('2011/49', '2011/49', '<b>Sample task 1 1</b>', 'ZP7', 50, 4));
	g.AddTaskDetail(new Task('2012/6', '2012/27', '<b>Sample task 1 1</b>', 'Absicherungslauf PVS 100.000 km', 50, 4));
	
	g.AddTaskDetail(new Task('2012/10', '2012/10', '<b>Sample task 1 1</b>', 'ZP5', 50, 5));
	g.AddTaskDetail(new Task('2012/14', '2012/14', '<b>Sample task 1 1</b>', 'ZP7', 50, 5));
	g.AddTaskDetail(new Task('2012/19', '2012/22', '<b>Sample task 1 1</b>', 'OS', 50, 5, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	
	g.AddTaskDetail(new Task('2012/19', '2012/30', '<b>Sample task 1 1</b>', 'Absicherungslauf PVS 50.000 km', 50, 6));
	
	g.AddTaskDetail(new Task('2012/23', '2012/23', '<b>Sample task 1 1</b>', 'TPPA', 50, 7));
	g.AddTaskDetail(new Task('2012/31', '2012/31', '<b>Sample task 1 1</b>', 'QPPA', 50, 7));
	
	g.AddTaskDetail(new Task('2012/32', '2012/32', '<b>Sample task 1 1</b>', 'SOP', 50, 8, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	
	g.Draw(49, 14);	
</script>
</html>