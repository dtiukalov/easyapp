<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ include file="/common/include.jsp"%>
	<title>Contacts - Contacts Page | High Technologies - Free Website Template from Templates.com</title>
</head>

<body id="page5" onload="new ElementMaxHeight();">
<!-- header -->
	<%@ include file="/common/header.jsp"%>
<!-- content -->
	<div id="content"><div class="inner_copy">More <a href="http://www.templates.com/">Website Templates</a> @ Templates.com!</div>
		<div class="container">
			<div class="wrapper">
				<%@ include file="/common/aside.jsp"%>
				<div class="mainContent maxheight">
					<div class="indent">
						<h2>Contact Us</h2>
						<form id="contacts-form" action="" method="post">
							 <fieldset>
								 <div class="field">
									 <label>Your Name:</label>
									 <input type="text" value=""/>
								 </div>
								 <div class="field">
									 <label>Your E-mail:</label>
									 <input type="text" value=""/>
								 </div>
								 <div class="field">
									 <label>Your Website:</label>
									 <input type="text" value=""/>
								 </div>
								 <div class="field">
									 <label>Your Message:</label>
									 <textarea cols="1" rows="1"></textarea>
								 </div>
								 <div class="alignright"><a href="#" onclick="document.getElementById('contacts-form').submit()">Send Your Message</a></div>
							 </fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- footer -->
	<%@ include file="/common/footer.jsp"%>
</body>
</html>