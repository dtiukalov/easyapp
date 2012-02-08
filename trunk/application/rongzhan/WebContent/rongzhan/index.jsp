<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>融展集团</title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="beijing">
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<div class="con1">
    	<div class="gsjj">
    	<div class="gsjjnr">
        	<div class="gsjjs"><img src="images/gsjjs.gif" /></div>
            <div class="gsjjz">
            <div class="gsjjzwz">
            <div class="tu"><img src="images/gsjj_bg.gif" /></div>
        <p><%=WebUtils.getTextWithMax(Article.getOneArticleText("rongzhan.about.introduce"), 280)%></p>
      </div>
            </div>
            <div class="gsjjx"><img src="images/gsjjx.gif" /></div>
            </div>
        </div><!--公司简介-->
        <div class="qiehuan">
        <div class="news">
        	<div class="newst">
        		<h1>新闻中心</h1>
                <span><a href="<%=WebUtils.getLink("rongzhan.new", null)%>">更多</a></span>
            </div>
            <div class="newsbg">
            	<ul>
            	<%
            		List artiles = Article.getByLikeCid("rongzhan.new.");
            		
            		int size = Math.min(artiles.size(), 10);
            		for (int i = 0; i < size; ++i) {
            			Article article = (Article) artiles.get(i);
            	%>
                <li><a href="<%="detail.jsp?cid=rongzhan.new&aid=" +article.getCid()+"&did="+article.getId()%>"><div style="margin: 0px;padding: 0px;"><div style="float:left;width:210px;"><%=WebUtils.getTextWithMax(article.getTitle(), 16)%></div><div style="float:left;width: 60px;" align="right"><%=article.getCreateTime().substring(0, 10) %></div></div></a></li>
                <%
            		}
                %>
                </ul>
            </div>
            <div class="newsx"><img src="images/xw_bottom.gif" /></div>
        </div>
        </div>
        <div class="qiehuan">
        	<div class="news">
	        	<div class="newst">
	        		<h1>领导致辞</h1>
	                <span><a href="<%=WebUtils.getLink("rongzhan.about", null)%>">更多</a></span>
	            </div>
	            <div class="newsbg">
	            	<div class="lzc"><img src="images/ldzctu.jpg" />
	            	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=WebUtils.getTextWithMax(Article.getOneArticleText("rongzhan.about.speak"), 60)%></p>
	            	</div>
	            </div>
	            <div class="newsx"><img src="images/xw_bottom.gif" /></div>
       		</div>
        </div>
        <div class="clear"></div>
    </div><!--第一行-->
    <div class="con2">
    	<div class="qxpp">
        <div class="tt">
        <h1>旗下品牌</h1>
        <span><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company">更多</a></span>
        <div class="clear"></div>
        </div>
        <div class="bg">
        <div class="zgtu">
            <div class="zj">
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/yfnd.jpg" /></a></div>
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/yqad.jpg" /></a></div>
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/dfjc.jpg" /></a></div>
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/yqdz.jpg" /></a></div>
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/honda.gif" /></a></div>
                <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/tybk.jpg" /></a></div>
                 <div class="bk"><a href="companylist.jsp?cid=rongzhan.about&aid=rongzhan.about.company"><img src="images/xfl.gif" /></a></div>
            </div>
            <div class="clear"></div>
        </div>
        </div><!--中间内容区-->
        <div class="xia"><img src="images/xia.gif" /></div>
        </div><!--旗下品牌-->
        
    </div><!--第二行-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>