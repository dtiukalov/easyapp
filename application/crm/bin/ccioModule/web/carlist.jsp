<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="crm.PageMenuBar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.util.ArrayList"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>排队列表</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/jquery.autocomplete.js"></script>
<style  type="text/css">
* {
	margin:0 auto;
}
img {
	border:0px;
}
#browero {
	border:2px solid #a5c0ca;
	background-color:#aecbff;
	border-collapse:collapse;
	width:800px;
	/*height:644px;*/
	margin:0 auto;
	font-size:40px;
	color:#000000;
	font-family:Arial, Helvetica, sans-serif, "方正大黑简体";
	margin-top:0px;
}
#browero tr, td {
	padding-left:5px;
	/*
	height:50px;
	line-height:50px;
	*/
	text-align:center;
}
#browero .an {
	width:800px;
}

#anniu {
	float:left;
	text-align:center;
	line-height:30px;
	padding-left:30px;
}
#anniu .sy {
	float:left;
	width:536px;
}
#browero .ys {
	width:140px;
	height:40px;
	line-height:60px;
	padding-right:30px;
	float:left;
	font-size:35px;
}
.x {
	background:#5e8cdf;
}
.xx {
	background:#9cbfff;
}
.clear {
	clear:both;
}
</style>
<style>
.autocomplete-w1 { background:url(img/shadow.png) no-repeat bottom right; position:absolute; top:0px; left:0px; margin:6px 0 0 6px; /* IE6 fix: */ _background:none; _margin:1px 0 0 0; }
.autocomplete { border:1px solid #999; background:#FFF; cursor:default; text-align:left; max-height:350px; overflow:auto; margin:-6px 6px 6px -6px; /* IE6 specific: */ _height:350px; _margin:0; _overflow-x:hidden; }
.autocomplete .selected { background:#F0F0F0; }
.autocomplete div { padding:2px 5px; white-space:nowrap; overflow:hidden; }
.autocomplete strong { font-weight:normal; color:#3399FF; } 
</style>
</head>
<body>
<%
String path = request.getContextPath();
String carlicenceno=request.getAttribute("carlicenceno")!=null?(String)request.getAttribute("carlicenceno"):"";
String io_vin=request.getAttribute("io_vin")!=null?(String)request.getAttribute("io_vin"):"";

    int pageNo=request.getParameter("pageNo")!=null?Integer.parseInt(request.getParameter("pageNo")):1;//页号
    int rowPerPage=11;//每页行数
	long sumRow=request.getAttribute("count")!=null?Long.parseLong(request.getAttribute("count").toString()):0;//总行数
	PageMenuBar bar=new PageMenuBar(path+"/crm::/ccioModule/action/GetCarByLike.action?carlicenceno="+carlicenceno+"&io_vin="+io_vin,rowPerPage,sumRow,pageNo,3,null);
	List result = request.getAttribute("result")!=null?(List)request.getAttribute("result"):new ArrayList();
    ///crm::/ccioModule/action/GetQueueDect.action
    %>
<div id="content">
  <form id="crmform" action="<%=path %>/crm::/ccioModule/action/GetCarByLike.action" method="post">
              <table cellspacing="0" cellpadding="0" width="800px" style="background-color:#eef5f5">
                      <tr>
                      <td><span style="font-size:28px;">车牌号:</span></td>
                      <td>
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}" style="width:120px;height:30px;line-height:30px;font-size:28px;"/>
                      </td>
                     <td><span style="font-size:28px;">VIN:</span></td>
                      <td>
                      	<input type="text" name="io_vin" id="io_vin" value="${io_vin}" autocomplete="off" style="width:310px;height:30px;line-height:30px;font-size:28px;"/>
                      </td>
                      <td><img src="<%=path %>/crm/ccioModule/web/image/tijiao.png" width="80" height="44" onclick="javascript:document.getElementById('crmform').submit();"  style="cursor: pointer;"/></td>
                      <td><img src="<%=path %>/crm/ccioModule/web/image/paidui.png" width="80" height="44" onclick="javascript:document.location.href='<%=path %>/crm::/ccioModule/action/GetQueueList.action?pageNo=1&startIndex=0&endIndex=10';"  style="cursor: pointer;"/></td>
                    </tr>
              </table> 
		</form>
  <table id="browero" cellpadding="0" cellspacing="0">
    <tr>
      <th height="30" style="height:35px;line-height:35px;color:#ff5500; font-size:28px;">车&nbsp;&nbsp;牌</th>
      <th style="height:35px;line-height:35px;color:#ff5500; font-size:28px;">上次保养时间</th>
      </tr>
      <%
      int i=0;
   	  for(Iterator it=result.iterator();it.hasNext();){
   	      	SaturnData sd=(SaturnData)it.next();
   	      	//System.out.println(sd.get("q_carln"));
   	      	%>
   	      	<tr class="<%=i%2==0?"x":"xx" %>" onclick="javascript:document.location.href='<%=path %>/crm::/ccioModule/action/GetQueueDect.action?io_vin=<%=sd.get("carvin") %>'" style="cursor: pointer;height:55px;line-height:55px;">
   	      <td><%=sd.get("carlicenceno")!=null?sd.get("carlicenceno"):"" %></td><td><%=sd.get("carlmaintaintime")!=null?sd.get("carlmaintaintime"):"" %></td>
   	      </tr>
   	      	<%
   	      	i++;
   	      }
      while(i<rowPerPage){
    	      	%>
    	      	<tr class="<%=i%2==0?"x":"xx" %>" style="height:55px;line-height:55px;">
    	      <td colspan="2">&nbsp;</td>
    	      </tr>
    	      	<%
    	  i++;
      }
      %>
    <tr>
      <td colspan="2">
      <div id="anniu"><div class="sy">
      <a href="<%=bar.url %>1&startIndex=<%=bar.shouPageFirst() %>&endIndex=<%=bar.shouPageLast() %>" title="首页"><img src="<%=path %>/crm/ccioModule/web/image/sy.png" /></a>
      <a href="<%=bar.url+bar.getPriviorPage()%>&startIndex=<%=bar.priviorPageFirst()%>&endIndex=<%=bar.priviorPageLast()%>" title="上一页"><img src="<%=path %>/crm/ccioModule/web/image/syy.png" /></a>
      <a href="<%=bar.url+bar.getNextPage()%>&startIndex=<%=bar.nextPageFirst()%>&endIndex=<%=bar.nextPageLast()%>" title="下一页"><img src="<%=path %>/crm/ccioModule/web/image/xyy.png" /></a>
      <a href="<%=bar.url+bar.sumPage%>&startIndex=<%=bar.moPageFirst()%>&endIndex=<%=bar.moPageLast()%>" title="尾页"><img src="<%=path %>/crm/ccioModule/web/image/wy.png" /></a>
      </div><div class="ys">第<font color="#FF0000"><%=bar.pageNo %></font>/<%=bar.sumPage %>页</div><div class="clear"></div></div>
      </td>
      <div class="clear"></div>
    </tr>
  </table>
</div>    
</body>
</html>
<script type="text/javascript">
$('#io_vin').autocomplete({
        serviceUrl: '', // Page for processing autocomplete requests
        minChars: 2, // Minimum request length for triggering autocomplete
        delimiter: /(,|;)\s*/, // Delimiter for separating requests (a character or regex)
        maxHeight: 400, // Maximum height of the suggestion list, in pixels
        width: 310, // List width
        zIndex: 9999, // List's z-index
        deferRequestBy: 0, // Request delay (milliseconds), if you prefer not to send lots of requests while the user is typing. I usually set the delay at 300 ms.
        params: { country: 'Yes'}, // Additional parameters
        onSelect: function(data, value){ }, // Callback function, triggered if one of the suggested options is selected,
        lookup: ['January', 'February', 'March'] // List of suggestions for local autocomplete
    });
	
</script>
<script>
var onAutocompleteSelect = function(value, data) {
      //$('#selection').html('<img src="\/global\/flags\/small\/' + data + '.png" alt="" \/> ' + value);
      //alert(data);
    }

var options = {
      //serviceUrl: '<%=request.getContextPath() %>/crm/ccioModule/web/vinsdata.jsp',
      serviceUrl: '<%=request.getContextPath() %>/crm::/ccioModule/action/GetVinByLike.action',
      width: 310,
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