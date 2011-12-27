<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String rootcid=WebUtils.getRootCid(request);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<div class="con1">
    	<div class="gyyfnd">
    		<div class="yfnd">
        		<h1>关于英菲尼迪</h1>
                <span><a href="<%="content.jsp?cid="+rootcid+".about&aid="+rootcid+".about.introduce" %>">更多</a></span>
       		</div>
        	<div class="yfndbg">
            	<div class="js">
                	<p>&nbsp;&nbsp;&nbsp;<%=WebUtils.getTextWithMax(Article.getOneArticleText(rootcid+".about.introduce"), 120)%></p>
                </div>
            </div>
        	<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    	</div><!--关于英菲尼迪-->
    <div class="qiehuan"><img src="images/qh.jpg" /></div>
    	<div class="gyyfnd">
        	<div class="yfnd">
    			<h1>新闻动态</h1>
                <span><a href="<%=WebUtils.getLink(rootcid+".new", null)%>">更多</a></span>
            </div>
            <div class="yfndbg">
            	<div class="js">
            	<ul>
            	<%
            		List artiles_new = Article.getByLikeCid(rootcid+".new.");
            		int size_new = Math.min(artiles_new.size(), 8);
            		for (int i = 0; i < size_new; ++i) {
            			Article article = (Article) artiles_new.get(i);
		            	%>
		            	<li>·<a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>"><%=WebUtils.getTextWithMax(article.getTitle(), 20)%></a></li>
		                <%
            		}
                %>
                </ul>
                </div>
            </div>
        	<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    	</div><!--新闻动态-->
    </div><!--第一行-->
	<div class="con2">
    	<div class="cxzs">
        	<div class="cxzst">
            	<h1>车型展示</h1>
                <span><a href="#">更多</a></span>
            </div>
            <div class="cxzsbg"><table class="tableline" cellpadding="0" cellspacing="1">
    <tr align="center" height="30px">
      <td width="192" height="39" style="border-bottom: dashed thin #ffffff;">图片</td>
      <td width="135" style="border-bottom: dashed thin #ffffff;">品牌车型</td>
      <td width="119" style="border-bottom: dashed thin #ffffff;">报价(万元)</td>
      <td width="29" style="border-bottom: dashed thin #ffffff;">详情</td>
      <td width="171" style="border-bottom: dashed thin #ffffff;">操作</td>
    </tr>
    <tr align="center" height="98px" bgcolor="#f8f7f2">
      <td height="120" style="border-top: dashed thin #ababab;border-width:1px;"><img src="images/Convertible.jpg" width="160" height="86" /></td>
      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="#"><span style="color:#1478c6;">G　Convertible</span></a></td>
      <td style="border-top: dashed thin #ababab;border-width:1px;"><span style="color:#da251c;">&nbsp;21.78</span></td>
      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="#">详情</a></td>
      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="#"><img src="images/dingche.gif"/></a> <a href="#"><img src="images/shijia.gif"/></a> <a href="#"><img src="images/zhihuan.gif"/></a></td>
    </tr>
    <tr align="center" height="98px" bgcolor="#ffffff">
      <td height="120" ><img src="images/coupe.jpg" width="159" height="87" /></td>
      <td ><a href="#"><span style="color:#1478c6;">G　Coupe</span></a></td>
      <td ><span style="color:#da251c;">&nbsp;23.98</span></td>
      <td ><a href="#">详情</a></td>
      <td ><a href="#"><img src="images/dingche.gif"/></a> <a href="#"><img src="images/shijia.gif"/></a> <a href="#"><img src="images/zhihuan.gif"/></a></td>
    </tr>
    <tr align="center" height="98px" bgcolor="#f8f7f2">
      <td height="120" ><p>&nbsp;</p>
        <p><img src="images/sedan.jpg" width="159" height="85" /></p></td>
      <td ><a href="#"><span style="color:#1478c6;">G　sedan</span></a></td>
      <td ><span style="color:#da251c;">&nbsp;25.28</span></td>
      <td ><a href="#">详情</a></td>
      <td ><a href="#"><img src="images/dingche.gif"/></a> <a href="#"><img src="images/shijia.gif"/></a> <a href="#"><img src="images/zhihuan.gif"/></a></td>
    </tr>
  </table></div>
            <div class="cxzsx"><img src="images/cxzs_x.gif" /></div>        
        </div><!--车型展示-->
        <div class="ycxhd">
        	<div class="gyyfnd">
        		<div class="yfnd">
    				<h1>促销活动</h1>
               		<span><a href="<%="list.jsp?cid="+rootcid+".new&aid="+rootcid+".new.offsall" %>">更多</a></span>
            	</div>
            	<div class="yfndbg2">
                	<div class="cxhdnr">
                    	<table width="98%" border="0" cellspacing="0" cellpadding="0" class="cxhd">
                    	<%
            		List artiles_sall = Article.getByLikeCid(rootcid+".new.offsall");
            		int size_sall = Math.min(artiles_sall.size(), 6);
            		for (int i = 0; i < size_sall; ++i) {
            			Article article = (Article) artiles_sall.get(i);
		            	%>
		            	<tr>
						    <td width="9%" height="31"><img src="images/<%=i %>.gif" width="19" height="14" /></td>
						    <td><a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>"><%=WebUtils.getTextWithMax(article.getTitle(), 16)%></a></td>
						    <td width="16%"><img src="images/www6Lucn0012.gif" width="35" height="15" /></td>
						  </tr>
		                <%
            		}
                %>
                      </table>

                    </div>
                </div>
        		<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    		</div><!--促销活动-->
            <div class="tupian">
       			<img src="images/yysj.jpg" />
        		<img src="images/byyy.jpg" />
        		<img src="images/wxyy.jpg" />
            </div>
        </div><!--右侧促销活动等-->
    </div><!--第二行-->
</div><!--内容-->
 <%@ include file="include/foot.jsp" %>
</div>
</body>
</html>