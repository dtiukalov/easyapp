<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<html>
<%

//	Map<String, String> form = (Map<String, String>)request.getAttribute("form");
%>
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
		
		var dvArr = from.split('/');
		_from.setFullYear(parseInt(dvArr[2], 10), parseInt(dvArr[0], 10) - 1, parseInt(dvArr[1], 10));
		dvArr = to.split('/'); 
		_to.setFullYear(parseInt(dvArr[2], 10), parseInt(dvArr[0], 10) - 1, parseInt(dvArr[1], 10));		
		
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
			var _firstRowStr = "<table border=1 style='border-collapse:collapse;border:#000000 2px solid'><tr style='background-color:feffbe;text-align:center;'>";
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
				
				if (_maxDate.getMonth() != 11) { //December 12&#26376;				
					_maxDate.setFullYear(_maxDate.getFullYear(), 11, 1); //The fifth day of next month will be used
				}
				
				if (_minDate.getMonth() == 11) {
					_minDate.setFullYear(_minDate.getFullYear(), _minDate.getMonth()-1, 1);
				}
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr>";
				_dTemp.setFullYear(_minDate.getFullYear(), _minDate.getMonth(), _minDate.getDate());
				
				while (Date.parse(_dTemp) <= Date.parse(_maxDate)) {	
					
					_gStr += "<td class='GDay'><div style='width:" + width + "px;'>" + (_dTemp.getMonth()+1) + "</div></td>";
					_secondRow += "<td class='GDay'><div style='width: + width + px;'>" + (start--) + "</div></td>";
					if (_dTemp.getFullYear() == _currentDate.getFullYear() && _dTemp.getMonth() == _currentDate.getMonth())	{					
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GToDay' style='height:" + ((_maxLevel+1) * 21) + "'>&nbsp;</td>";
					} else {
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21) + "'>&nbsp;</td>";
					}
					
					_colSpan++;
				
					if (_dTemp.getMonth() == 11) { //December
						_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + _dTemp.getFullYear() + "</td>";
						_colSpan = 0;
						_dTemp.setFullYear(_dTemp.getFullYear() + 1, 0, 1);
					} else {
						_dTemp.setFullYear(_dTemp.getFullYear(), _dTemp.getMonth() + 1, 1);
					}
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
					
				var offWidth = width + 3;
				
				for(i = 0; i < _taskList.length; i++)
				{	
					var task = _taskList[i];
					var _level = task.getLevel();
					
			//		_offSet = (Date.parse(task.getFrom()) - Date.parse(_minDate)) / (24 * 60 * 60 * 1000);
			//		_dateDiff = (Date.parse(task.getTo()) - Date.parse(task.getFrom())) / (24 * 60 * 60 * 1000) + 1;
					
					_offSet = (task.getFrom().getFullYear() - _minDate.getFullYear()) * 12 + (task.getFrom().getMonth() - _minDate.getMonth());
					_dateDiff = (task.getTo().getFullYear() - task.getFrom().getFullYear()) * 12 + (task.getTo().getMonth() - task.getFrom().getMonth()) + 1;
					
					if (task.getFrom().getFullYear() == task.getTo().getFullYear() && task.getFrom().getMonth() == task.getTo().getMonth()) {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + 3) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTaska' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;'>" + task.getResource() + "</div></div>";
					} else {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTask' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;" + "background-color:" + task.getColor()+ ";border:#000000 1px solid;text-align:center;'>" + task.getResource() + "</div></div>";
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
<body>	
	<div style="position:relative" class="Gantt" id="GanttChart"></div>
</body>
<script><!--
	var g = new Gantt(document.all.GanttChart);
	g.AddTaskDetail(new Task('8/1/2008', '8/1/2008', '<b>Sample task 1 1</b>', 'PM', 50, 1));
	g.AddTaskDetail(new Task('11/1/2008', '11/1/2008', '<b>Sample task 1 1</b>', 'PP', 50, 1));
	g.AddTaskDetail(new Task('2/1/2009', '2/1/2009', '<b>Sample task 1 1</b>', 'PD', 50, 1));
	g.AddTaskDetail(new Task('5/1/2009', '5/1/2009', '<b>Sample task 1 1</b>', 'PF', 50, 1));
	g.AddTaskDetail(new Task('11/1/2009', '11/1/2009', '<b>Sample task 1 1</b>', 'KE', 50, 1));
	g.AddTaskDetail(new Task('5/1/2010', '5/1/2010', '<b>Sample task 1 1</b>', 'DE', 50, 1));
	g.AddTaskDetail(new Task('9/1/2010', '9/1/2010', '<b>Sample task 1 1</b>', 'DF', 50, 1));
	g.AddTaskDetail(new Task('2/1/2011', '2/1/2011', '<b>Sample task 1 1</b>', 'BF', 50, 1));
	g.AddTaskDetail(new Task('8/1/2011', '8/1/2011', '<b>Sample task 1 1</b>', 'LF', 50, 1));
	g.AddTaskDetail(new Task('12/1/2011', '12/1/2011', '<b>Sample task 1 1</b>', 'VFF', 50, 1));
	g.AddTaskDetail(new Task('2/1/2012', '2/1/2012', '<b>Sample task 1 1</b>', 'PVS', 50, 1));
	g.AddTaskDetail(new Task('5/1/2012', '5/1/2012', '<b>Sample task 1 1</b>', 'OS', 50, 1));
	g.AddTaskDetail(new Task('8/1/2012', '8/1/2012', '<b>Sample task 1 1</b>', 'SOP', 50, 1));
	g.AddTaskDetail(new Task('11/1/2012', '11/1/2012', '<b>Sample task 1 1</b>', 'ME', 50, 1));
		
	g.AddTaskDetail(new Task('8/1/2008', '5/1/2009', '<b>Sample task 1 1</b>', '9 MO', 50, 3, '#f3f3f3'));
	g.AddTaskDetail(new Task('6/1/2009', '7/1/2011', '<b>Sample task 1 1</b>', '27 MO', 50, 3, '#b0b0b0'));
	g.AddTaskDetail(new Task('8/1/2011', '11/1/2012', '<b>Sample task 1 1</b>', '15 MO', 50, 3, '#414141'));
	
	g.Draw(49, 19);	
</script>
</html>