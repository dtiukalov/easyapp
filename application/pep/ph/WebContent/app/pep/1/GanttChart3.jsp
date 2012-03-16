<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.ph.FormManager"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>	

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>New Page 1</title>
	</head>
<script>
function Task(from, to, task, resource, progress, level, color) {
	var _from = getKw(from);	
	var _to = getKw(to);
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
				var yearWeek = getWeeksInYear(_maxDate);
				var currentWeek = parseInt(_maxDate.split('/')[1]);
				if(currentWeek + 3 > yearWeek) {
					_maxDate = _maxArr[0] + "/" + yearWeek;
				} else {
					_maxDate = _maxArr[0] + "/" + (currentWeek + 3);
				}
				//_maxDate = _maxArr[0] + "/" + getWeeksInYear(_maxDate);
				_maxArr = getYearWeeks(_maxDate);
				
				var _minArr = getYearWeeks(_minDate);
				if (_minArr[1] > 50) {
					_minArr[1] = 51;
				} 
				_minDate = _minArr[0] + "/" + _minArr[1];
			//	_minDate = _minArr[0] + "/" + 1;
			//	_minArr = getYearWeeks(_minDate);
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr>";
				_dTemp = _minDate;
				var dArr = getYearWeeks(_minDate);
				while (dArr[0] < _maxArr[0] || (parseInt(dArr[1], 10) <= parseInt(_maxArr[1], 10))) {	
				
					
					_gStr += "<td class='GDay'><div style='width:" + width + "px;'>" + dArr[1] + "</div></td>";
					_secondRow += "<td class='GDay'><div style='width: + width + px;'>" + (dArr[1]) + "</div></td>";
					_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 21) + "'>&nbsp;</td>";
					
					_colSpan++;
				
					if (dArr[1] == getWeeksInYear(_dTemp)) { //December
						_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + dArr[0] + "</td>";
						_colSpan = 0;
						_dTemp = (parseInt(dArr[0], 10)+1) + "/1";
					} else {
						if (_dTemp == _maxArr[0] + '/' + _maxArr[1]) {
							_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + dArr[0] + "</td>";
						}
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
				_gStr = _firstRowStr + _gStr + _thirdRow + _secondRow + "</table>";
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
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + 4) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTaska' style='height:30px;float:left; width:" + (offWidth * _dateDiff +6) + "px;" + task.getColor() + "'>" + task.getResource() + "</div></div>";
					} else {
						_gStr += "<div style='position:absolute; top:" + (20 * (_level + 2)) + "; left:" + (_offSet * offWidth + 4) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTask' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;" + task.getColor() + "'>" + task.getResource() + "</div></div>";
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
		
		return getYearAllWeeks(year);
	}
	function getKw(from) {
		var dvArr = from.split('-');
		var date = new Date();
		date.setFullYear(parseInt(dvArr[0], 10), parseInt(dvArr[1], 10) - 1, parseInt(dvArr[2], 10));

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
			k++;
			if (time > t) {
				break;
			}
		}
		
		return date.getYear() + "/" + k;
	}
	
	function getYearAllWeeks(year) {
		var firstDate = new Date();
		firstDate.setFullYear(parseInt(year), 0, 1);

		var last = new Date();
		last.setFullYear(parseInt(year), 11, 31);
		
		var week = (24 * 60 * 60 * 1000) * 7;
		var k = 0;
		
		var days = firstDate.getDay();
		if (days >= 3) {
			k = 0;
		} else {
			k = 1;
		}
		
		var time = firstDate.getTime();
		var t = last.getTime();
		if (last.getDay < 3) {
			k--;
		}
		
		while (true) {
			time += week;
			
			if (time < t) {
				k++;
			} else {
				break;
			}
		}
		
		days = last.getDay();
		if (days >= 3) {
			k += 1;
		} else {
			k += 0;
		}
		return k;
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
		font-size:9px;
		text-align:center;
		font-weight:bold;
		line-height:19px;
		color:#000000;
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

	String fv9VFFTBTZP5 = (String)form.get("fv9VFFTBTZP5");
	String fv9VFFTBTZP7 = (String)form.get("fv9VFFTBTZP7");
	String fv9VFFVorStart = (String)form.get("fv9VFFVorStart");
	String fv9VFFVorEnd = (String)form.get("fv9VFFVorEnd");
	String fv9VFFVorBatches = (String)form.get("fv9VFFVorBatches");
	String fv9VFFVorFzg = (String)form.get("fv9VFFVorFzg");
	String fv9VFFAbsMeter = (String)form.get("fv9VFFAbsMeter");
	String fv9VFFAbsStart = (String)form.get("fv9VFFAbsStart");
	String fv9VFFAbsEnd = (String)form.get("fv9VFFAbsEnd");

	String fv9PVSTBTZP5 = (String)form.get("fv9PVSTBTZP5");	//"8/1/2008";//		
	String fv9PVSTBTZP7 = (String)form.get("fv9PVSTBTZP7");//"8/1/2008";//
	String fv9PVSVorStart = (String)form.get("fv9PVSVorStart");//"8/1/2008";//		
	String fv9PVSVorEnd = (String)form.get("fv9PVSVorEnd");//"8/1/2008";//		
	String fv9PVSVorBatches = (String)form.get("fv9PVSVorBatches");//"8/1/2008";//		
	String fv9PVSVorFzg = (String)form.get("fv9PVSVorFzg");//"8/1/2008";//		
	String fv9PVSAbsMeter = (String)form.get("fv9PVSAbsMeter");//"8/1/2008";//		
	String fv9PVSAbsStart = (String)form.get("fv9PVSAbsStart");//
	String fv9PVSAbsEnd = (String)form.get("fv9PVSAbsEnd");//

	String fv90STBTZP5 = (String)form.get("fv90STBTZP5");	//"8/1/2008";//		
	String fv90STBTZP7 = (String)form.get("fv90STBTZP7");//"8/1/2008";//	
	String fv90SVorStart = (String)form.get("fv90SVorStart");//"8/1/2008";//		
	String fv90SVorEnd = (String)form.get("fv90SVorEnd");//"8/1/2008";//		
	String fv90SVorBatches = (String)form.get("fv90SVorBatches");//"8/1/2008";//		
	String fv90SVorFzg = (String)form.get("fv90SVorFzg");//"8/1/2008";//		
	String fv90SAbsMeter = (String)form.get("fv90SAbsMeter");//"8/1/2008";//		
	String fv90SAbsStart = (String)form.get("fv90SAbsStart");//
	String fv90SAbsEnd = (String)form.get("fv90SAbsEnd");//
	
	String fv9TPPA_ME = (String)form.get("fv9TPPA_ME");//		TPPA_ME日期
	String fv9QFTPPA_Kunde = (String)form.get("fv9QFTPPA_Kunde");//		QFTPPA_Kunde日期
	String sop_start = (String)request.getSession().getAttribute("DATE_SOP");
	
%>
<body>	
	<div style="position:relative" class="Gantt" id="GanttChart"></div>
</body>
<script>
	var g = new Gantt(document.all.GanttChart);
	
<%if(Web.getDateStrNotNull(fv9VFFTBTZP5)){%>
	g.AddTaskDetail(new Task('<%=fv9VFFTBTZP5%>', '<%=fv9VFFTBTZP5%>', '', '<%=DateUtils.getWeekOfYear(fv9VFFTBTZP5 + " 00:00")%>', 50, 0, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9VFFTBTZP5%>', '<%=fv9VFFTBTZP5%>', '', 'ZP5', 50, 1, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv9VFFTBTZP7)){%>	
g.AddTaskDetail(new Task('<%=fv9VFFTBTZP7%>', '<%=fv9VFFTBTZP7%>', '', '<%=DateUtils.getWeekOfYear(fv9VFFTBTZP7 + " 00:00")%>', 50, 0, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9VFFTBTZP7%>', '<%=fv9VFFTBTZP7%>', '', 'ZP7', 50, 1, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv9VFFVorStart)
	&& Web.getDateStrNotNull(fv9VFFVorEnd)){%>
	g.AddTaskDetail(new Task('<%=fv9VFFVorStart%>', '<%=fv9VFFVorStart%>', '', '<%=DateUtils.getWeekOfYear(fv9VFFVorStart + " 00:00")%>', 50, 0, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9VFFVorEnd%>', '<%=fv9VFFVorEnd%>', '', '<%=DateUtils.getWeekOfYear(fv9VFFVorEnd + " 00:00")%>', 50, 0, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9VFFVorStart%>', '<%=fv9VFFVorEnd%>', '', 'VFF&nbsp&nbspFzge. fertig',  50, 1, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	g.AddTaskDetail(new Task('<%=fv9VFFVorEnd%>', '<%=DateUtils.getCurrDateAddTwoMonth(fv9VFFVorEnd)%>', '', '<b><%=fv9VFFVorBatches%> Batches(<%=fv9VFFVorFzg%> Fzg.)*</b>',  50, 1, 'background-color:#FFF;color:#000000;'));

<%	}%>
<%if(Web.getDateStrNotNull(fv9VFFAbsStart)
		&& Web.getDateStrNotNull(fv9VFFAbsEnd)){%>
	g.AddTaskDetail(new Task('<%=fv9VFFAbsStart%>', '<%=fv9VFFAbsEnd%>', '', 'Absicherungslauf VFF <%=fv9VFFAbsMeter%> km', 50, 2));
<%	}%>	
	
	
	
	
	
	
<%if(Web.getDateStrNotNull(fv9PVSTBTZP5)){%>	
	g.AddTaskDetail(new Task('<%=fv9PVSTBTZP5%>', '<%=fv9PVSTBTZP5%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSTBTZP5 + " 00:00")%>', 50, 3, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9PVSTBTZP5%>', '<%=fv9PVSTBTZP5%>', '', 'ZP5', 50, 4, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv9PVSTBTZP7)){%>
	g.AddTaskDetail(new Task('<%=fv9PVSTBTZP7%>', '<%=fv9PVSTBTZP7%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSTBTZP7 + " 00:00")%>', 50, 3, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9PVSTBTZP7%>', '<%=fv9PVSTBTZP7%>', '', 'ZP7', 50, 4, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv9PVSVorStart)
		&& Web.getDateStrNotNull(fv9PVSVorEnd)){%>
		
	g.AddTaskDetail(new Task('<%=fv9PVSVorStart%>', '<%=fv9PVSVorStart%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSVorStart + " 00:00")%>', 50, 3, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9PVSVorEnd%>', '<%=fv9PVSVorEnd%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSVorEnd + " 00:00")%>', 50, 3, 'background:url(../images/bg3.gif) no-repeat 0 0;'));

	g.AddTaskDetail(new Task('<%=fv9PVSVorStart%>', '<%=fv9PVSVorEnd%>', '<%=fv9PVSVorBatches%> Batches(<%=fv9PVSVorFzg%> Fzg.)*', 'PVS&nbsp&nbspFzge. fertig', 50, 4, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	g.AddTaskDetail(new Task('<%=fv9PVSVorEnd%>', '<%=DateUtils.getCurrDateAddTwoMonth(fv9PVSVorEnd)%>', '', '<b><%=fv9PVSVorBatches%> Batches(<%=fv9PVSVorFzg%> Fzg.)*</b>',  50, 4, 'background-color:#FFF;color:#000000;'));

<%	}%>
<%if(Web.getDateStrNotNull(fv9PVSAbsStart)
		&& Web.getDateStrNotNull(fv9PVSAbsEnd)){%>

	g.AddTaskDetail(new Task('<%=fv9PVSAbsStart%>', '<%=fv9PVSAbsStart%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSAbsStart + " 00:00")%>', 50, 5, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9PVSAbsEnd%>', '<%=fv9PVSAbsEnd%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSAbsEnd + " 00:00")%>', 50, 5, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9PVSAbsStart%>', '<%=fv9PVSAbsEnd%>', '', 'Absicherungslauf PVS <%=fv9PVSAbsMeter%> km', 50, 6));
<%	}%>	






<%if(Web.getDateStrNotNull(fv90STBTZP5)){%>
	g.AddTaskDetail(new Task('<%=fv90STBTZP5%>', '<%=fv90STBTZP5%>', '', '<%=DateUtils.getWeekOfYear(fv90STBTZP5 + " 00:00")%>', 50, 7, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90STBTZP5%>', '<%=fv90STBTZP5%>', '', 'ZP5', 50, 8, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv90STBTZP7)){%>
	g.AddTaskDetail(new Task('<%=fv90STBTZP7%>', '<%=fv90STBTZP7%>', '', '<%=DateUtils.getWeekOfYear(fv90STBTZP7 + " 00:00")%>', 50, 7, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90STBTZP7%>', '<%=fv90STBTZP7%>', '', 'ZP7', 50, 8, 'background:url(../images/bg3.jpg) no-repeat 0 0;'));
<%	}%>
<%if(Web.getDateStrNotNull(fv90SVorStart)
		&& Web.getDateStrNotNull(fv90SVorEnd)){%>
		
	g.AddTaskDetail(new Task('<%=fv90SVorStart%>', '<%=fv90SVorStart%>', '', '<%=DateUtils.getWeekOfYear(fv90SVorStart + " 00:00")%>', 50, 7, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90SVorEnd%>', '<%=fv90SVorEnd%>', '', '<%=DateUtils.getWeekOfYear(fv9PVSAbsEnd + " 00:00")%>', 50, 7, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90SVorStart%>', '<%=fv90SVorEnd%>', '<%=fv90SVorBatches%> Batches(<%=fv90SVorFzg%> Fzg.)*', 'OS&nbsp&nbspFzge. fertig', 50, 8, 'background-color:#000000;color:#FFF;font-weight:bold;'));
	g.AddTaskDetail(new Task('<%=fv90SVorEnd%>', '<%=DateUtils.getCurrDateAddTwoMonth(fv90SVorEnd)%>', '', '<b><%=fv90SVorBatches%> Batches(<%=fv90SVorFzg%> Fzg.)*</b>',  50, 8, 'background-color:#FFF;color:#000000;'));

<%	}%>
<%if(Web.getDateStrNotNull(fv90SAbsStart)
		&& Web.getDateStrNotNull(fv90SAbsEnd)){%>
		
	g.AddTaskDetail(new Task('<%=fv90SAbsStart%>', '<%=fv90SAbsStart%>', '', '<%=DateUtils.getWeekOfYear(fv90SAbsStart + " 00:00")%>', 50, 9, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90SAbsEnd%>', '<%=fv90SAbsEnd%>', '', '<%=DateUtils.getWeekOfYear(fv90SAbsEnd + " 00:00")%>', 50, 9, 'background:url(../images/bg3.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv90SAbsStart%>', '<%=fv90SAbsEnd%>', '', 'Absicherungslauf PVS <%=fv90SAbsMeter%> km', 50, 10));
<%	}%>





<%if(Web.getDateStrNotNull(fv9TPPA_ME)){  String descStart = "";  String descEnd = ""; %>
	g.AddTaskDetail(new Task('<%=fv9TPPA_ME%>', '<%=fv9TPPA_ME%>', '', '', 50, 12, 'background:url(../images/bg2.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9TPPA_ME%>', '<%=DateUtils.getCurrDateAddOneMonth(fv9TPPA_ME)%>', '', '<b>FreigabeMarkteinführungs-Volumen</b>',  50, 13, 'background-color:#FFF;color:#000000;'));
	
<%	}%>
<%if(Web.getDateStrNotNull(fv9QFTPPA_Kunde)){ String descStart = "";  String descEnd = ""; %>
	g.AddTaskDetail(new Task('<%=fv9QFTPPA_Kunde%>', '<%=fv9QFTPPA_Kunde%>', '', '', 50, 12, 'background:url(../images/bg2.gif) no-repeat 0 0;'));
	g.AddTaskDetail(new Task('<%=fv9QFTPPA_Kunde%>', '<%=DateUtils.getCurrDateAddOneMonth(fv9QFTPPA_Kunde)%>', '', '<b>Q-Freigabe Freigabe Kundenfahrzeuge</b>',  50, 13, 'background-color:#FFF;color:#000000;'));
<%	}%>	


<%if(Web.getDateStrNotNull(sop_start)){%>
	g.AddTaskDetail(new Task('<%=sop_start%>', '<%=sop_start%>', '', 'SOP', 50, 15, 'background:url(../images/bg.gif) no-repeat 0 0;'));
<%	}%>	




	g.Draw(49, 14);	

	
</script>
</html>