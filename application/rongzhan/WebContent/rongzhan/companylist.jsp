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
                        	<div class="lg"><img src="images/logo_yqdz.gif" /></div>
                            <p><span>一汽-大众汽车有限公司（简称一汽-大众）</span>于1991年2月6日成立， 是由中国第一汽车集团公司（60%）...</p>
                        </div><!--左侧-->
                        <div class="right1">
                        	<div class="tupian"><a href="../xinyu/index.jsp" target="_blank"><img src="images/tonghu.jpg" /></a></div>
                            <div class="mingcheng">
                            <p><a href="../xinyu/index.jsp" target="_blank"><span>通化鑫宇汽车销售有限公司</span></a></p>
                            <p>地址：吉林省通化市新胜北路2355号(通梅零公里)</p>
                            <p>预约热线：0435-3623398</p>
                            <p>救援热线：0435-3611118</p>
                            <p>销售热线：0435-3629870</p>
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
	                        	<div class="lg"><img src="images/logo_yfnd.gif" /></div>
	                            <p>作为<span>英菲尼迪</span>20周年的献礼之作，这款超级跑车尽现美学菁华：修长的身段与风格大胆的曲面造型，散发着雕塑般的高贵......</p>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../xingsheng/index.jsp" target="_blank"><img src="images/xingsheng.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingsheng/index.jsp" target="_blank"><span>吉林省融展兴盛汽车销售服务有限公司</span></a></p>
	                            <p>城市展厅地址：长春市高新区卫星路银河家园50#英菲尼迪</p>
	                            <p>电话：</p>
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
	                            <p>“以心悦心”的含义是“以全心全意的卓越服务带给用户发自内心的愉悦”。在服务理念的追求上，<span>奥迪</span>不仅致力于满足...</p>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../rongsheng/index.jsp" target="_blank"><img src="images/rongsheng.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../rongsheng/index.jsp" target="_blank"><span>通化市融晟汽车销售服务有限公司</span></a></p>
	                            <p>地址：</p>
	                            <p>电话：</p>
	                            <p>&nbsp;</p>
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
	                            <p><span>日产</span>自动车株式会社于1933年在神奈川县横滨市创立，目前， 拥有包括日本在内的分布于全球20个国家与地区的生产基地，为160多个国家与地区提供商品及相关...</p>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="01">
	                        	<div class="tupian"><a href="../xingbang/index.jsp" target="_blank"><img src="images/xingbang.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingbang/index.jsp" target="_blank"><span>东风日产融展兴邦专营店</span></a></p>
	                            <p>地址：哈尔滨市道里区机场路18号</p>
	                            <p>电话：400-698-1006</p>
	                            <p>救援热线：0435-3611118</p>
	                            <p>销售热线：0435-3629870</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="01">
	                        	<div class="tupian"><a href="../dongri/index.jsp" target="_blank"><img src="images/hebrf.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../dongri/index.jsp" target="_blank"><span>哈尔滨瑞孚东日专营店</span></a></p>
	                            <p>地址：哈尔滨市道里区机场路18号</p>
	                            <p>电话：400-698-1006</p>
	                            <p>&nbsp;</p>
	                            <p>&nbsp;</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="01">
	                        	<div class="tupian"><a href="../ruihe/index.jsp" target="_blank"><img src="images/rzrh.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../ruihe/index.jsp" target="_blank"><span>吉林市东风日产融展瑞合专营店</span></a></p>
	                            <p>地址：吉林市船营区越山路235号</p>
	                            <p>销售热线：0432-62718999、62718666</p>
	                            <p>24小时救援电话：0432-62717999</p>
	                            <p>客户投诉热线：0432-62719666</p>
	                          </div>
	                          </div><!--右一-->
	                          <div class="01">
	                        	<div class="tupian"><a href="../suixin/index.jsp" target="_blank"><img src="images/rzsx.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../suixin/index.jsp" target="_blank"><span>绥化融展绥鑫专营店</span></a></p>
	                            <p>公司地址：黑龙江省绥化市西二环香格里拉凤凰城斜对面</p>
	                            <p>销售热线:0455-8283555  8411333</p>
	                            <p>服务热线:0455-8561122                          </p>
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
	                        	<div class="lg"><img src="images/logo_buick.gif" /></div>
	                            <p><span>别克</span>关怀Buick Care——上海通用汽车创立的中国第一个汽车服务品牌。自创立伊始，始终秉承“比你更关心你”的理念...</p>
	                        </div><!--左侧-->
	                        <div class="right1">
	                        	<div class="tupian"><a href="../xingsheng/index.jsp" target="_blank"><img src="images/suihua.jpg" /></a></div>
	                            <div class="mingcheng">
	                            <p><a href="../xingsheng/index.jsp" target="_blank"><span>绥化融展兴盛汽车销售服务有限公司</span></a></p>
	                            <p>地址：哈尔滨道里区机场路18号（二手车市场对面）</p>
	                            <p>电话：0451- 84315499/84312499</p>
	                            <p>&nbsp;</p>
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