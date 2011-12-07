<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
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
        <div class="tu"><img src="images/gsjj_bg.gif" /></div>
        <%=Article.getOneArticleText("rongzhan.about.introduce")%>
        </div><!--公司简介-->
        <div class="qiehuan"><img src="images/qhtu.jpg" /></div>
        <div class="ldzc">
        	<div class="news">
	        	<div class="newst">
	        		<h1>领导致辞</h1>
	                <span><a href="<%=WebUtils.getLink("rongzhan.about.speak", null)%>">更多</a></span>
	            </div>
	            <div class="newsbg">
	            	<img src="images/ldzctu.jpg" />
	                <p><%=Article.getOneArticleText("rongzhan.about.speak")%></p>
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
        <span><a href="companylist.jsp">更多</a></span>
        <div class="clear"></div>
        </div>
        <div class="bg">
        <div class="zgtu">
        	<div class="jiantou1"><img src="images/iecool_arrow_017z.gif" /></div>
            <div class="zj">
            	<div class="bk"><a href="companylist.jsp"><img src="images/yqdz.jpg" /></a><p>一汽大众汽车有限公司是由中国第一汽车集团公司和德国大众汽车集团合资经营的大型乘用车生产企业...</p></div>
                <div class="bk"><a href="companylist.jsp"><img src="images/yfnd.jpg" /></a><p>英菲尼迪作为日产旗下的 豪华车品牌 诞生于1989年，最先在美国上市，英菲尼迪与雷克萨斯、宝马、奔驰在北美市场...</p></div>
                <div class="bk"><a href="companylist.jsp"><img src="images/yqad.jpg" /></a><p>精粹奥迪全部造车科技与美学感悟，奥迪A1拥有动感、时尚的设计，动力搭载 强劲 高效的1.4TFSI发动机...</p></div>
                <div class="bk"><a href="companylist.jsp"><img src="images/dfjc.jpg" /></a><p>东风日产“ 感心服务”传承NISSAN品牌人性化创新的DNA， 涵盖人车生活的每一个环节，为您提供...</p></div>
                <div class="bk"><a href="companylist.jsp"><img src="images/tybk.jpg" /></a><p>别克一个融合了“全球平台欧美技术”的产品科技与服务资源的中高档国际汽车品牌，涵盖八大系列数十款车型...</p></div>
            </div>
            <div class="jiantou2"><img src="images/iecool_arrow_017.gif" /></div>
            <div class="clear"></div>
        </div>
        </div><!--中间内容区-->
        <div class="xia"><img src="images/xia.gif" /></div>
        </div><!--旗下品牌-->
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
                <li><a href="<%="detail.jsp?cid=rongzhan.new&aid=" +article.getCid()+"&did="+article.getId()%>"><%=article.getTitle()%><%=article.getCreateTime().substring(0, 10) %></a></li>
                <%
            		}
                %>
                </ul>
            </div>
            <div class="newsx"><img src="images/xw_bottom.gif" /></div>
        </div>
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