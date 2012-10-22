<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ include file="/common/include.jsp"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Support - Support Page</title>
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
						<!-- <h2>产品组合</h2> -->
						<ul class="img-list">
							<li>
								<img src="images/NX.jpg" alt="NX" />
								<h3><a href="#">NX</a></h3>
								You are supposed to put information about your Support Chat operators and the time when this service is available.
							</li>
							<li>
								<img src="images/TECNOMATIX.jpg" alt="TECNOMATIX" />
								<h3><a href="#">TECNOMATIX</a></h3>
								Here your clients are supposed to submit their questions regarding services and products that you offer.
							</li>
							<li>
								<img src="images/TEAMCENTER.jpg" alt="TEAMCENTER" />
								<h3><a href="#">TEAMCENTER</a></h3>
								You are supposed to place here the answers to frequently asked questions.
							</li>
							<li>
								<img src="images/VELOCITY.jpg" alt="VELOCITY SERIES" />
								<h3><a href="#">VELOCITY SERIES</a></h3>
								Here your clients are supposed to submit their complaints regarding your products or services if they have any.
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
</body>
</html>