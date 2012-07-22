<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title><%=WebUtils.getTitle(request) %></title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/homepage.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="beijing">
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<%@ include file="include/navigate.jsp" %>
    <div class="right">
    	<%
    	%>
    	<div class="ybt">
        <div class="biaoti">公司列表</div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;公司列表</div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
        	<div class="xwlb">
        	  <div class="neirong">
        	  	<div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lg"><img src="images/logo_yfnd.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../infiniti/index.jsp" target="_blank"><img src="images/xingsheng.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../infiniti/index.jsp" target="_blank"><span>英菲尼迪长春融展兴盛专营店</span></a></p>
	                            <p>地址：吉林省长春市西新区长沈路3999号</p>
	                            <p>销售：0431-85971555/85972333</p>
	                            <p>客服：0431- 81501592</p>
	                          </div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	             <div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lg"><img src="images/logo_ad.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../rongsheng/index.jsp" target="_blank"><img src="images/rongsheng.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../rongsheng/index.jsp" target="_blank"><span>通化融晟奥迪专营店</span></a></p>
	                            <p>地址：通化市新胜北路5888号</p>
	                            <p>销售：0435-3451888/3451999</p>
	                            <p>客服：0435-3632788</p>
								</div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	             <div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lgg"><img src="images/logo_richan.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                          <div class="r01">
	                        	<div class="tupian"><a href="../dongri/index.jsp" target="_blank"><img src="images/hebrf.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../dongri/index.jsp" target="_blank"><span>哈尔滨融展东日专营店</span></a></p>
	                            <p>地址：哈尔滨市道里区机场路18号</p>
	                            <p>销售：0451-84348888/84357777</p>
	                            <p>客服：0451-84302992</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../xingbang/index.jsp" target="_blank"><img src="images/xingbang.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingbang/index.jsp" target="_blank"><span>哈尔滨融展兴邦专营店</span></a></p>
	                            <p>地址：哈尔滨市道外区先锋路3号</p>
	                            <p>销售：0451-82453997</p>
	                            <p>客服：0451-82460181</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../ruihe/index.jsp" target="_blank"><img src="images/rzrh.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../ruihe/index.jsp" target="_blank"><span>东风日产融展瑞合专营店</span></a></p>
	                            <p>地址：吉林市船营区越山路235号</p>
	                            <p>销售：0432-62718999/62718666</p>
	                            <p>客服：0432-62717999/62719666</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../suixin/index.jsp" target="_blank"><img src="images/rzsx.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../suixin/index.jsp" target="_blank"><span>东风日产绥化融展绥鑫专营店</span></a></p>
	                            <p>地址：绥化市北林区西二环路凤凰城对过</p>
	                            <p>销售：0455-8283555/8411333</p>
	                            <p>客服：0455-8626662/8626669</p>
	                            </div>
	                          </div><!--右一-->
	                          <div class="clear"></div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	           	 <div class="yqdz">
            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
               		<div class="qxppzj">
                    	<div class="qxppzjnr">
                		<div class="left1">
                        	<div class="lg"><img src="images/logo_yqdz.gif" /></div>
                        </div><!--左侧-->
                        <div class="right1">
                        	<div class="tupian"><a href="../xinyu/index.jsp" target="_blank"><img src="images/tonghu.jpg" /></a></div>
                            <div class="mingcheng">
                            <p><a href="../xinyu/index.jsp" target="_blank"><span>通化鑫宇一汽-大众专营店</span></a></p>
                            <p>地址：吉林省通化市新胜北路2355号(通梅零公里)</p>
                            <p>销售：0435-3620866/3620799</p>
                            <p>客服：0435-3628519</p>
                            </div>
                        </div><!--右侧-->
                        <div class="clear"></div>
                		</div><!--旗下品牌内容部分-->
                	</div>
               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	             <div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lg"><img src="images/logo_hoda.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../honda/index.jsp" target="_blank"><img src="images/suihua.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../honda/index.jsp" target="_blank"><span>融展东风本田专营店</span></a></p>
	                            <p>地址：</p>
	                            <p>销售：</p>
	                            <p>客服：</p>
								</div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	           	 <div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lg"><img src="images/logo_buick.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../xingsheng/index.jsp" target="_blank"><img src="images/suihua.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingsheng/index.jsp" target="_blank"><span>绥化融展兴盛别克专营店</span></a></p>
	                            <p>地址：北林区西二环路电力名苑南</p>
	                            <p>销售：0455-8792123</p>
	                            <p>客服：0455-8251969</p>
								</div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	           	 <div class="yqdz">
	            		<div class="qxpptt"><img src="images/qxpp_tt.gif" /></div>
	               		<div class="qxppzj">
	                    	<div class="qxppzjnr">
	                		<div class="left1">
	                        	<div class="lg"><img src="images/logo_xfl.gif" /></div>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../xuefulan/index.jsp" target="_blank"><img src="images/suihua.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xuefulan/index.jsp" target="_blank"><span>融展雪佛兰专营店</span></a></p>
	                            <p>地址：吉林省通化市新胜北路5838号</p>
	                            <p>销售：</p>
	                            <p>客服：0435-3450018</p>
								</div>
	                        </div><!--右侧-->
	                        <div class="clear"></div>
	                		</div><!--旗下品牌内容部分-->
	                	</div>
	               		<div class="qxppdi"><img src="images/qxpp_di.gif" /></div>
	           	 </div><!--一汽大众-->
	             <div class="clear"></div>
	            </div>
        	</div>
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</body>
</html>