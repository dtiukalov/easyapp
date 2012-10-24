<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ include file="/common/include.jsp"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>About - About Page</title>
	<style>
	.tit {
		height: 20px; color: rgb(0, 58, 99); line-height: 20px; padding-left: 15px; clear: both; font-weight: bold; margin-bottom: 20px; background-image: url("images/tit_bg.gif"); background-repeat: repeat-y;
	}
	</style>
</head>

<body id="page4" onload="new ElementMaxHeight();">
<!-- header -->
	<%@ include file="/common/header.jsp"%>
<!-- content -->
		<div id="content"><div class="inner_copy">More <a href="http://www.templates.com/">Website Templates</a> @ Templates.com!</div>
			<div class="container">
				<div class="wrapper">
					<%@ include file="/common/aside.jsp"%>
					<div class="mainContent maxheight">
						<div class="indent">
						
<div class="tit">公司简介：</div>
<div style="padding-left:10px; font-family:微软雅黑; font-size: 12px;" >
<p style="margin-bottom;10px;"><img src="images/foton.png" alt="" style="width: 150px; height: 100px; border: 2px solid gray; float: left;" />
<div style="text-indent:2em;padding-left: 170px; padding-top: 8px;" >北汽福田汽车股份有限公司（简称福田汽车），是一家跨地区、跨行业、跨所有制的国有控股上市公司。总部位于北京市昌平区，是一个以北京为管理中心，在京、津、鲁、冀、湘、鄂、辽、粤、新等9个省市区拥有整车和零部件事业部，研发分支机构分布在中国大陆、日本、德国、中国台湾等国家和地区的大型企业集团。						
</div>

<br>
<br>
<div class="tit">基于Teamcenter的造型图片管理系统</div>

以Teamcenter为基础平台，存储整车及零部件图片信息，由造型图片管理系统为终端用户实现批量导入，分类查询，造型对比，图片下载等功能。
<br><br>
<div class="tit">基于Teamcenter的供应商图纸发放系统	</div>		

以Teamcenter为基础平台，向供应商开放网络接口，为近一千多名供应商提供发放图纸下载入口。

											
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
</body>
</html>