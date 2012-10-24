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
								<h3><a href="nxintroduction.jsp">NX</a></h3>
								通过知识共享，过程自动化，以及更加有效的创意评估和变更管理来加速创新。
								</br>知识驱动的自动化
								</br>仿真与验证
								</br>可控的开发环境 
								</br>系统级工程
								建立在先进多CAD系统上的一体化集成解决方案								
							</li>
							<li>
								<img src="images/TECNOMATIX.jpg" alt="TECNOMATIX" />
								<h3><a href="tecnomatix.jsp">TECNOMATIX</a></h3>
								TECNOMATIX是一套完善的数字化制造解决方案，可以帮助企业快速确立提升效率、降低成本的最佳策略。
								</br>排名第一的企业数字化制造解决方案
							</li>
							<li>
								<img src="images/TEAMCENTER.jpg" alt="TEAMCENTER" />
								<h3><a href="teamcenter.jsp">TEAMCENTER</a></h3>
								Teamcenter软件提供了一整套全方位的数字化声明周期管理解决方案，是您能最大限度地发挥您的产品知识，并利用它在产品生命周期中的每一个阶段提高盈利能力和生产效率。
							</li>
							<li>
								<img src="images/VELOCITY.jpg" alt="VELOCITY SERIES" />
								<h3><a href="velocity.jsp">VELOCITY SERIES</a></h3>
								Velocity系列的设计、仿真、制造与数据管理解决方案专为中端市场量身订制 模块化同时也是集成的解决方案 易于配置和使用(in Native
								Microsoft) 预配置了行业最佳实践 总拥有成本低 可升级至完整的 Siemens PLM Software 解决方案</li>
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