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
<div class="tit">公司简介</div>
<div style="padding-left:10px; font-family:微软雅黑; font-size: 12px;" >
<p style="margin-bottom;10px;"><img src="images/faw-fuao.png" alt="" style="width: 150px; height: 100px; border: 2px solid gray; float: left;" />
<div style="text-indent:2em;padding-left: 170px; padding-top: 8px;" >
</div>

<br>
<br>
<div class="tit"></div>
															
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
</body>
</html>