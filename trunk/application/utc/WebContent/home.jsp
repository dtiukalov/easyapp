<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
	<%@ include file="/common/include.jsp"%>
	<title>Home - 主页 Page</title>

</head>

<body id="page1" onload="new ElementMaxHeight();">
<!-- header -->
	<%@ include file="/common/header.jsp"%>
<!-- content -->
	<div id="content"><div class="inner_copy">More <a href="http://www.templates.com/">Website Templates</a> @ Templates.com!</div>
		<div class="container">
			<div class="wrapper">
				<%@ include file="/common/aside.jsp"%>
				<div class="mainContent maxheight">
					<div class="indent">
						<div class="section">
							<h2>Welcome High Technologies!</h2>
							<p>High Technologies Site is a free websites template created by Templates.com team. This website template is optimized for 1024X768 screen resolution. It is also XHTML &amp; CSS valid.</p>
							<p>The website template goes with two packages – with PSD source files and without them. PSD source files are available for free for the registered members of Templates.com. The basic package (without PSD is available for anyone without registration).</p> 
							This website template has several pages: <a href="#">Home</a>, <a href="#">About us</a>, <a href="#">Services</a>, <a href="#">Support</a>, <a href="#">Contacts</a> (note that contact us form – doesn’t work), <a href="#">Site Map</a>.
						</div>
						<h2>Recent Articles</h2>
						<ul class="img-list">
							<li>
								<img src="images/img1.jpg" alt="" />
								<h3><a href="#">High Technologies</a></h3>
								Technical progress doesn’t stand still and picks up steam every year. The most innovative technologies are developed and put on the market.	
							</li>
							<li>
								<img src="images/img1.jpg" alt="" />
								<h3><a href="#">About High Technologies Website</a></h3>
								Free 1024/768 Optimized Website Template from Templates.com. We really hope that you will like this template and use it for your website.	
							</li>
							<li>
								<img src="images/img1.jpg" alt="" />
								<h3><a href="#">Our services</a></h3>
								The complete information regarding our services you will find on the "Service" page.	
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