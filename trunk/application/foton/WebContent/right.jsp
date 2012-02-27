<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List"%>
<%@ page import="foton.picture.vo.PictureVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%String sessionTime = (String)request.getAttribute("sessionTime"); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图片列表</title>
<script src="js/jquery-1.4.2.min.js"></script> 
<script src="js/function.js"></script> 
<link rel="stylesheet" type=text/css href="css/photo.css"/>
<link rel="stylesheet" href="js/pagination.css" />
<script type="text/javascript" src="js//jquery.pagination.js"></script>
<script>
$(document).ready(function(){
	
	$("#Pagination").pagination(<%=request.getSession().getAttribute("count")%>,{
			items_per_page:30,
			num_display_entries:30,
			current_page:<%=request.getSession().getAttribute("current_page")==null?0:request.getSession().getAttribute("current_page")%>,
			prev_text:"上一页",
			next_text:"下一页",
			callback: pageselectCallback,
			prev_show_always:true,
			next_show_always:true
	});
 });
 
  function pageselectCallback(page_index, jq){

		var page = parseInt(page_index)+1;
    	$("#page").val(page);
    	$('#hiddeForm').submit();
  }
  
</script>
<script type="text/javascript">         
   function b() {   
       var m = document.getElementsByName('select');   
       var l = m.length;   
       for (var i = 0; i < l; i++) {   
            m[i].checked == true ? m[i].checked = false: m[i].checked = true;   
       }   
    } 
    
            function checkEvent(name, allCheckId) {   
                var allCk = document.getElementById(allCheckId);   
                if (allCk.checked == true) checkAll(name);   
                else checkAllNo(name);   
  
            }   
  
            //全选   
            function checkAll(name) {   
                var names = document.getElementsByName(name);   
                var len = names.length;   
                if (len > 0) {   
                    var i = 0;   
                    for (i = 0; i < len; i++)   
                    names[i].checked = true;   
  
                }   
            }   
  
            //全不选   
            function checkAllNo(name) {   
                var names = document.getElementsByName(name);   
                var len = names.length;   
                if (len > 0) {   
                    var i = 0;   
                    for (i = 0; i < len; i++)   
                    names[i].checked = false;   
                }   
            }   
  
            //反选   
            function reserveCheck(name) {   
                var names = document.getElementsByName(name);   
                var len = names.length;   
                if (len > 0) {   
                    var i = 0;   
                    for (i = 0; i < len; i++) {   
                        if (names[i].checked) names[i].checked = false;   
                        else names[i].checked = true;   
  
                    }   
                }   
            }  
</script>  
<style type="text/css">
.right {
	background-image: url(images/bj_2.gif);
	font-family: "宋体";
	font-size: 30px;
	color: #213a62;
	text-align: center;
	padding: 28%;
	
}
.bottom {
	WIDTH: 930px;
	OVERFLOW: hidden;
	margin-top: 5px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: right;
}
</style>
<script src="js/function.js"></script>

</head>
<%	String message = request.getSession().getAttribute("message").toString();
	if("login".equals(message)) {%>
<body>

	<div class="right">		
    </div>

	<form id="hiddeForm" action="page" method="post">
		<input type="hidden" id="page" name="page"/>
		<input type="hidden" id="country" name="country"/>
		<input type="hidden" id="year" name="year"/>
		<input type="hidden" id="band" name="band"/>
		<input type="hidden" id="subband" name="subband"/>
		<input type="hidden" id="interouter" name="interouter"/>
		<input type="hidden" id="outer" name="outer"/>
		<input type="hidden" id="inter" name="inter"/>
		<input type="hidden" id="angle" name="angle"/>
		<input type="hidden" id="carType" name="carType"/>
	</form>
</body>
	<%	}
	if("error".equals(message)) {%>
	<body>

		<div class="right" >
			出错了，错误信息如下：
			<br></br>
			<%=request.getAttribute("messageError").toString() %>
	    </div>

		<form id="hiddeForm" action="page" method="post">
			<input type="hidden" id="page" name="page"/>
			<input type="hidden" id="country" name="country"/>
			<input type="hidden" id="year" name="year"/>
			<input type="hidden" id="band" name="band"/>
			<input type="hidden" id="subband" name="subband"/>
			<input type="hidden" id="interouter" name="interouter"/>
			<input type="hidden" id="outer" name="outer"/>
			<input type="hidden" id="inter" name="inter"/>
			<input type="hidden" id="angle" name="angle"/>
			<input type="hidden" id="carType" name="carType"/>
		</form>
	</body>
		<%	}
	if("search".equals(message)) {%>

<body>
	<form id="hiddeForm" action="<%=request.getContextPath()%>/page" method="post">
		<input type="hidden" id="page" name="page"/>
		<input type="hidden" id="sessionTime" name="sessionTime" value="<%=sessionTime%>"/>
		<input type="hidden" id="country" name="country"/>
		<input type="hidden" id="year" name="year"/>
		<input type="hidden" id="band" name="band"/>
		<input type="hidden" id="subband" name="subband"/>
		<input type="hidden" id="interouter" name="interouter"/>
		<input type="hidden" id="outer" name="outer"/>
		<input type="hidden" id="inter" name="inter"/>
		<input type="hidden" id="angle" name="angle"/>
		<input type="hidden" id="carType" name="carType"/>
	</form>

	<form id="" action="odetail.jsp" method="post" target="_blank">
	   <div class="wrap" style="margin-top:10px;">
	    	<div style="margin-top:5px;">
		    <%	
		    List<PictureVO> resultList = (List<PictureVO>)request.getSession().getAttribute("resultList" + sessionTime);	
		    
				for( int i = 0; i < resultList.size(); i++ ){
		    	String key = resultList.get(i).getKey();
		    		String imgPath = "downloadImgs/sp/" + resultList.get(i).getSp_jpgName();
						if (resultList.get(i).getJpg() == null) {
							imgPath= "images/" + resultList.get(i).getSp_jpgName();
						}
			%>
				 <div style="margin: 0px 10px 10px 0px; padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px; " class="set set_m twoline">
		            <a href="odetail.jsp?key=<%=i%>&sessionTime=<%=sessionTime%>" target="_blank"><img width=140 height=93 src="<%=imgPath%>"/>
		            </a>
		            <p> <%=resultList.get(i).getBand()%>&nbsp;<%=resultList.get(i).getSubBand()%>&nbsp; <%=resultList.get(i).getCarType()%></p>
		           	<p>	<input name="select" type="checkbox" id="<%=i%>,<%=sessionTime%>,<%=key%>" value="<%=i%>,<%=sessionTime%>,<%=key%>"/>选中</p>
		         </div>
	         <% 
				}
	         %>        
	    	</div>
	    </div>
	   	<div class="bottom">
	   	<%if (resultList.size() != 0) {  %>
		<input type="button" name="" value="全  选" onclick="checkAll('select')"/>   
		<input type="button" name="" value="全不选" onclick="checkAllNo('select')"/>
		<input type="button" name="" value="反  选" onclick="reserveCheck('select')"/>
	    <%} %>
	    </div>
	    
    </form>
    <%
    	if(resultList.size()>0){
    %>
    <div style="width:100%;margin-top:10px;">
    	<div id="Pagination" style="margin:0 auto;width:400px;"></div>
    </div>
    <%
    	}
    	if (resultList.size() == 0) { %>
    		<div class="right" >
				没有找到搜索结果 	
    		</div>		
    		
    <%	}
    %>
</body>

	<%	
	}
	%>

</html>
