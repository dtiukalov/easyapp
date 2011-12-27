<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	                        	<div class="tupian"><a href="../xingsheng/index.jsp" target="_blank"><img src="images/xingsheng.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingsheng/index.jsp" target="_blank"><span>吉林省融展兴盛汽车销售服务有限公司</span></a></p>
	                            <p>地址：吉林省长春市西新区长沈路3999号</p>
	                            <p>电话：0431-81971888/85971555</p>
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
	                            <p>销售热线：0435-3451888/3451999</p>
	                            <p>服务热线：0435-3632788</p>
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
	                        	<div class="tupian"><a href="../xingbang/index.jsp" target="_blank"><img src="images/xingbang.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingbang/index.jsp" target="_blank"><span>哈尔滨融展兴邦专营店</span></a></p>
	                            <p>地址：哈尔滨市道外区先锋路3号</p>
	                            <p>客服电话：0451-82460181</p>
	                            <p>销售热线：0451-82453997</p>
	                            <p>售后热线：0451-82453666</p>
	                            <p>救援预约电话：0451-82453666</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../dongri/index.jsp" target="_blank"><img src="images/hebrf.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../dongri/index.jsp" target="_blank"><span>东风日产融展东日专营店</span></a></p>
	                            <p>地址：哈尔滨市道里区机场路18号</p>
	                            <p>销售电话：0451-84357777/84348888</p>
	                            <p>售后服务电话：0451-84302299/84312299</p>
	                            <p>&nbsp;</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../ruihe/index.jsp" target="_blank"><img src="images/rzrh.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../ruihe/index.jsp" target="_blank"><span>东风日产融展瑞合专营店</span></a></p>
	                            <p>地址：吉林市船营区越山路235号</p>
	                            <p>销售热线：0432-62718999/62718666</p>
	                            <p>售后服务热线：0432-62717999/62719666</p>
	                            <p>24小时救援电话：0432-62717999</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="r01">
	                        	<div class="tupian"><a href="../suixin/index.jsp" target="_blank"><img src="images/rzsx.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../suixin/index.jsp" target="_blank"><span>东风日产绥化融展绥鑫专营店</span></a></p>
	                            <p>公司地址：绥化市北林区西二环路凤凰城对过</p>
	                            <p>客服电话：0455-8626662/8626669</p>
	                            <p>销售热线：0455-8283555/8411333</p>
	                            <p>售后热线：0455-8561122</p>
	                            <p>24小时救援电话：13091555900</p>
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
                            <p>客服热线：0435-3628519</p>
                            <p>销售热线：0435-3620866/3620799</p>
                            <p>售后、救援热线：0435-3611118</p>
                            <p>预约电话：0435-3623398</p>
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
	                            <p><a href="../xingsheng/index.jsp" target="_blank"><span>绥化融展兴盛别克4S店</span></a></p>
	                            <p>地址：北林区西二环路电力名苑南</p>
	                            <p>客服热线：0455-8251969</p>
	                            <p>销售热线：0455-8792123</p>
	                            <p>服务热线：0455-8251800</p>
	                            <p>救援热线：0455-8347700</p>
	                            <p>预约热线：0455-8251800</p>
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