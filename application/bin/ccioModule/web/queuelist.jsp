<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
class PageMenuBar {
	
	public String url="";			// 链接
	public int rowPerPage = 0;		// 每页显示行数
	public long sumRow = 0;			// 总行数
	public int pageNo = 1;			// 当前页号
	public int pagePerScreen = 0;	// 每屏页数
	public int sumPage = 0;		// 总页数
	public int screenNo = 1;		// 当前屏号码
	public int sumScreen = 0;		// 总屏数
	public String pageName = "pageNo";		// 当前分页条当前页参数名

	public PageMenuBar() {
	}
	public PageMenuBar(String url,int rowPerPage,long sumRow,int pageNo,int pagePerScreen,String pageName) {
		//this.page=page;
		this.pageName=pageName!=null?pageName.trim():"pageNo";
		this.url=url.indexOf("?")>-1?url+"&"+this.pageName+"=":url+"?"+this.pageName+"=";
		this.rowPerPage=rowPerPage;
		this.sumRow=sumRow;
		this.sumPage=sumPage();
		this.pageNo=pageNo<1?1:pageNo>this.sumPage?this.sumPage:pageNo;
		this.pagePerScreen = pagePerScreen;
		this.screenNo=screenNo();
		this.sumScreen=sumScreen();
		
	}
	public int shouPageFirst(){
		return 0;
	}
	public int shouPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (1==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (1 !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (1 - 1) * this.rowPerPage + rowcount;
	}
	public int priviorPageFirst(){
		return (this.getPriviorPage() - 1) * this.rowPerPage+1-1;
	}
	public int priviorPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorPage() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getPriviorPage() - 1) * this.rowPerPage + rowcount;
	}
	public int priviorScreenFirst(){
		return (this.getPriviorScreen() - 1) * this.rowPerPage+1-1;
	}
	public int priviorScreenLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorScreen() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getPriviorScreen() - 1) * this.rowPerPage + rowcount;
	}
	public int pageFirst(int pNo){
		return (pNo - 1) * this.rowPerPage + 1-1;
	}
	public int pageLast(int pNo){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (pNo ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (pNo !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (pNo - 1) * this.rowPerPage + rowcount;
	}
	public int nextScreenFirst(){
		return (this.getNextScreen() - 1) * this.rowPerPage+1-1;
	}
	public int nextScreenLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextScreen() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getNextScreen() - 1) * this.rowPerPage + rowcount;
	}
	public int nextPageFirst(){
		return (this.getNextPage() - 1) * this.rowPerPage+1-1;
	}
	public int nextPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextPage() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getNextPage() - 1) * this.rowPerPage + rowcount;
	}
	public int moPageFirst(){
		if (1==this.sumPage)
			return 0;
		return (this.sumPage - 1) * this.rowPerPage+1-1;
	}
	public int moPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (0<this.sumRow)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		rowcount=rowcount>0?rowcount-1:0;
		return (this.sumPage - 1) * this.rowPerPage + rowcount;
	}
	public int sumPage() {
		return (int)(this.sumRow%this.rowPerPage==0 ? this.sumRow/this.rowPerPage : this.sumRow/this.rowPerPage+1);
	}
	public int screenNo(){
		return this.pageNo%this.pagePerScreen==0 ? this.pageNo/this.pagePerScreen : this.pageNo/this.pagePerScreen+1;
	}
	public int sumScreen(){
		return this.sumPage%this.pagePerScreen==0 ? this.sumPage/this.pagePerScreen : this.sumPage/this.pagePerScreen+1;
	}
	public int getStart() {
		return (this.screenNo-1)*this.pagePerScreen+1;
	}
	
	public int getEnd() {
		return this.screenNo*this.pagePerScreen<this.sumPage?this.screenNo*this.pagePerScreen:this.sumPage;
	}
	public int getPriviorPage() {
		return this.pageNo>1?this.pageNo-1:this.pageNo;
	}
	public int getNextPage() {
		return this.pageNo<this.sumPage?this.pageNo+1:this.pageNo;
	}
	public int getPriviorScreen() {
		return this.screenNo>1?(this.screenNo-2)*this.pagePerScreen+1:this.pageNo;
	}
	public int getNextScreen() {
		return this.screenNo<this.sumScreen?this.screenNo*this.pagePerScreen+1:this.pageNo;
	}
	public String getHref(String formname,String action) {
		return "javascript:document.getElementById('"+formname+"').action='"+action+"';document.getElementById('"+formname+"').submit();";
	}
	public String pageMenuBar(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href='"+bar.url+"1' title='首页'>首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getPriviorPage()+"' title='上一页'>上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href='"+bar.url+bar.getPriviorScreen()+"' title='上"+bar.pagePerScreen+"页'>&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href='"+bar.url+i+"'>"+i+"</A>");
				}else{
					menubar.append("[<A href='"+bar.url+i+"'>"+i+"</A>]");
				}
			}
			menubar.append("<A href='"+bar.url+bar.getNextScreen()+"' title='下"+bar.pagePerScreen+"页'>&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getNextPage()+"' title='下一页'>下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.sumPage+"' title='尾页'>尾页</A>]&nbsp;");
		if(type>0){
			menubar.append(" 转到第<SELECT name='"+bar.pageName+"' id='"+bar.pageName+"' onchange=\"window.location.href='"+bar.url+"'+this.value;\">");
			for(int j=1;j<=bar.sumPage;j++){
				if(j==bar.pageNo){
					menubar.append("<OPTION selected='selected' value='"+j+"'>"+j+"</OPTION>");
				}else{
					menubar.append("<OPTION value='"+j+"'>"+j+"</A></OPTION>");
				}
			}
			menubar.append("</SELECT>页");
		}
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	public String pageMenuBar(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName,String formname,String validate){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		if(formname==null||"".equals(formname.trim())){
			return pageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,type,pageName);
		}
		if(validate==null||"".equals(validate.trim())){
			validate="true";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+"1")+"\" onclick=\"return "+validate+"\" title=\"首页\">首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorPage())+"\" onclick=\"return "+validate+"\" title=\"上一页\">上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorScreen())+"\" onclick=\"return "+validate+"\" title=\"上"+bar.pagePerScreen+"页\">&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href=\""+bar.getHref(formname, bar.url+i)+"\" onclick=\"return "+validate+"\">"+i+"</A>");
				}else{
					menubar.append("[<A href=\""+bar.getHref(formname, bar.url+i)+"\" onclick=\"return "+validate+"\">"+i+"</A>]");
				}
			}
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getNextScreen())+"\" onclick=\"return "+validate+"\" title=\"下"+bar.pagePerScreen+"页\">&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getNextPage())+"\" onclick=\"return "+validate+"\" title=\"下一页\">下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.sumPage)+"\" onclick=\"return "+validate+"\" title=\"尾页\">尾页</A>]&nbsp;");
		if(type>0){
			menubar.append(" 转到第<SELECT name='"+bar.pageName+"' id='"+bar.pageName+"' onchange=\"javascript:document.getElementById('"+formname+"').action='"+bar.url+"'+this.value;document.getElementById('"+formname+"').submit();\" onclick=\"return "+validate+"\">");
			for(int j=1;j<=bar.sumPage;j++){
				if(j==bar.pageNo){
					menubar.append("<OPTION selected='selected' value='"+j+"'>"+j+"</OPTION>");
				}else{
					menubar.append("<OPTION value='"+j+"'>"+j+"</A></OPTION>");
				}
			}
			menubar.append("</SELECT>页");
		}
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	public String pageMenuBar_(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href='"+bar.url+"1&startIndex="+bar.shouPageFirst()+"&endIndex="+bar.shouPageLast()+"' title='首页'>首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getPriviorPage()+"&startIndex="+bar.priviorPageFirst()+"&endIndex="+bar.priviorPageLast()+"' title='上一页'>上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href='"+bar.url+bar.getPriviorScreen()+"&startIndex="+bar.priviorScreenFirst()+"&endIndex="+bar.priviorScreenLast()+"' title='上"+bar.pagePerScreen+"页'>&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href='"+bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i)+"'>"+i+"</A>");
				}else{
					menubar.append("[<A href='"+bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i)+"'>"+i+"</A>]");
				}
			}
			menubar.append("<A href='"+bar.url+bar.getNextScreen()+"&startIndex="+bar.nextScreenFirst()+"&endIndex="+bar.nextScreenLast()+"' title='下"+bar.pagePerScreen+"页'>&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getNextPage()+"&startIndex="+bar.nextPageFirst()+"&endIndex="+bar.nextPageLast()+"' title='下一页'>下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.sumPage+"&startIndex="+bar.moPageFirst()+"&endIndex="+bar.moPageLast()+"' title='尾页'>尾页</A>]&nbsp;");
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	public String pageMenuBar_(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName,String formname,String validate){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		if(formname==null||"".equals(formname.trim())){
			return pageMenuBar_(url,rowPrePage,sumRow,pageNo,pagePreScreen,type,pageName);
		}
		if(validate==null||"".equals(validate.trim())){
			validate="true";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+"1&startIndex="+bar.shouPageFirst()+"&endIndex="+bar.shouPageLast())+"\" onclick=\"return "+validate+"\" title=\"首页\">首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorPage()+"&startIndex="+bar.priviorPageFirst()+"&endIndex="+bar.priviorPageLast())+"\" onclick=\"return "+validate+"\" title=\"上一页\">上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorScreen()+"&startIndex="+bar.priviorScreenFirst()+"&endIndex="+bar.priviorScreenLast())+"\" onclick=\"return "+validate+"\" title=\"上"+bar.pagePerScreen+"页\">&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href=\""+bar.getHref(formname, bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i))+"\" onclick=\"return "+validate+"\">"+i+"</A>");
				}else{
					menubar.append("[<A href=\""+bar.getHref(formname, bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i))+"\" onclick=\"return "+validate+"\">"+i+"</A>]");
				}
			}
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getNextScreen()+"&startIndex="+bar.nextScreenFirst()+"&endIndex="+bar.nextScreenLast())+"\" onclick=\"return "+validate+"\" title=\"下"+bar.pagePerScreen+"页\">&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getNextPage()+"&startIndex="+bar.nextPageFirst()+"&endIndex="+bar.nextPageLast())+"\" onclick=\"return "+validate+"\" title=\"下一页\">下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.sumPage+"&startIndex="+bar.moPageFirst()+"&endIndex="+bar.moPageLast())+"\" onclick=\"return "+validate+"\" title=\"尾页\">尾页</A>]&nbsp;");
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getRowPerPage() {
		return rowPerPage;
	}
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	public long getSumRow() {
		return sumRow;
	}
	public void setSumRow(long sumRow) {
		this.sumRow = sumRow;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPagePerScreen() {
		return pagePerScreen;
	}
	public void setPagePerScreen(int pagePerScreen) {
		this.pagePerScreen = pagePerScreen;
	}
	public int getSumPage() {
		return sumPage;
	}
	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}
	public int getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(int screenNo) {
		this.screenNo = screenNo;
	}
	public int getSumScreen() {
		return sumScreen;
	}
	public void setSumScreen(int sumScreen) {
		this.sumScreen = sumScreen;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
}

%>
<%
String path = request.getContextPath();
    int pageNo=request.getParameter("pageNo")!=null?Integer.parseInt(request.getParameter("pageNo")):1;//页号
    int rowPerPage=11;//每页行数
	long sumRow=request.getAttribute("count")!=null?Long.parseLong(request.getAttribute("count").toString()):0;//总行数
	PageMenuBar bar=new PageMenuBar(path+"/crm::/ccioModule/action/GetQueueList.action",rowPerPage,sumRow,pageNo,3,null);
    List result =  request.getAttribute("result")!=null?(List)request.getAttribute("result"):new ArrayList();
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
                      <td><img src="<%=path %>/crm/ccioModule/web/image/shuaxin.png" width="80" height="44" onclick="javascript:location.reload();"  style="cursor: pointer;"/></td>
                    </tr>
              </table> 
		</form>
  <table id="browero" cellpadding="0" cellspacing="0">
    <tr>
      <th height="30" style="height:35px;line-height:35px;color:#ff5500; font-size:28px;">车&nbsp;&nbsp;牌</th>
      <th style="height:35px;line-height:35px;color:#ff5500; font-size:28px;">到店时间</th>
      </tr>
      <%
      int i=0;
   	  for(Iterator it=result.iterator();it.hasNext();){
   	      	SaturnData sd=(SaturnData)it.next();
   	      	//System.out.println(sd.get("q_carln"));
   	      	%>
   	      	<tr class="<%=i%2==0?"x":"xx" %>" onclick="javascript:document.location.href='<%=path %>/crm::/ccioModule/action/GetQueueDect.action?io_vin=<%=sd.get("i_vin") %>'" style="cursor: pointer;height:55px;line-height:55px;<%="1".equals(sd.get("i_type").toString())?"background-color: #ebe08a;":"" %>">
   	      <td><%=sd.get("i_carln") %></td><td><%=sd.get("i_indate") %></td>
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

