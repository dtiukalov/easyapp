<%-- saturn calendar --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/saturnCalendar/WdatePicker.js"></script>
<script>
var dayCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy-MM-dd'
	 })
}
var monthCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy-MM'
	 })
}
var yearCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy'
	 })
}
var secondCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy-MM-dd HH:mm:ss'
	 })
}
var hourCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy-MM-dd HH'
	 })
}
var minuteCalender = function(j){
	 WdatePicker({
	        dateFmt:'yyyy-MM-dd HH:mm'
	 })
}
</script>