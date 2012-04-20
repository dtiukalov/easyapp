<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<style type="text/css">
		/* .table td {
		border:#8DB2E3 1px solid;
		} */
	</style>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table style="margin-left:200px;">
				<tr align="right">
					<td>产品追溯码:</td>
					<td align="left"><input id="number" name="number" type="text"></input></td>
					<td>&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">查询</a></td>
				<!-- <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a> -->
				</tr>
			</table>
			
		</form>
	</div>
	<table id="queryTable">
		
	</table>
		<div id="panel" class="easyui-panel" title="产品追溯信息"
				icon="icon-query-form" collapsible="true" style="padding: 10px;">
					<div class="easyui-tabs" fit="true" plain="true" style="height:350px;width:300px;">
						<div title="养殖信息" style="padding:10px;">
				<table class="table" cellpadding="0px" cellspacing="0" bgcolor="#000000" width="800px" style="color:#416AA3;">
					<tr bgcolor="#ffffff" height="25px">
					<td style="font-size:15px;text-align:left;background-color:#F1F7FE" colspan=4;>产品信息</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">部门名称</td>
					<td width="150px;">后鞧肉</td><td width="200px;" style="font-size:12px;">分割重量(Kg)</td>
					<td width="150px;">0.402</td>
					</tr>
					<tr bgcolor="#ffffff" height="25px">
					<td style="font-size:12px;" width="200px;">生产批次</td>
					<td width="150px;">201112140001</td><td width="200px;" style="font-size:12px;">加工包装日期</td>
					<td width="150px;">2012-01-14 15：06：44</td>
					</tr>
				</table>
				<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="margin-top:20px;color:#416AA3;">
					<tr bgcolor="#ffffff" height="25px">
					<td style="font-size:15px;text-align:left;background-color:#F1F7FE"" colspan=4;>猪只信息</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">养殖场</td>
					<td width="150px;">格润养殖场</td><td width="200px;" style="font-size:12px;">屠宰地点</td>
					<td width="150px;">格润屠宰场</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">品种</td>
					<td width="150px;">大长</td><td width="200px;" style="font-size:12px;">品系</td>
					<td width="150px;">大长</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">入栏日期</td>
					<td width="150px;">2011-07-21</td><td width="200px;" style="font-size:12px;">出栏日期</td>
					<td width="150px;">2012-01-12</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">出栏体重(Kg)</td>
					<td width="150px;">116.8</td><td width="200px;" style="font-size:12px;">检疫结果</td>
					<td width="150px;">合格</td>
					</tr>
				</table>
		</div>
				<div title="生物猪流信息" style="padding:10px;">
					<table cellpadding="0px" cellspacing="0	px" bgcolor="#000000" width="800px" style="color:#416AA3;">
						<tr bgcolor="#ffffff" height="25px">
						<td style="font-size:15px;text-align:left;background-color:#F1F7FE"" colspan=4;>物流信息</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">物流单据号</td>
						<td width="150px;">2012011210001</td><td width="200px;" style="font-size:12px;">养殖场</td>
						<td width="150px;">上海湾</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">送货人</td>
						<td width="150px;">王乐乐</td><td width="200px;" style="font-size:12px;">司机</td>
						<td width="150px;">徐海峰</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">车号</td>
						<td width="150px;">吉A41597</td><td width="200px;" style="font-size:12px;"></td>
						<td width="150px;"></td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">运送屠宰场</td>
						<td width="220px;">吉林省绿邦肉业科技有限公司</td><td width="200px;" style="font-size:12px;">接收人</td>
						<td width="150px;">朱莱</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">主要天气</td>
						<td width="150px;">晴</td><td width="200px;" style="font-size:25px;"></td>
						<td width="150px;"></td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">发车时间</td>
						<td width="150px;">2012-01-12 12:45:19</td><td width="200px;" style="font-size:12px;">到达</td>
						<td width="150px;">2012-01-12 :15:16:23</td>
						</tr>
					</table>
				</div>
				<div title="屠宰信息" style="padding:10px;">
					<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;">
						<tr bgcolor="#ffffff" height="25px">
						<td style="font-size:15px;text-align:left;background-color:#F1F7FE" colspan=4;>屠宰信息</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">耳标号</td>
						<td width="150px;">122035611072100221</td><td width="200px;" style="font-size:12px;">批次编号</td>
						<td width="150px;">0201201120001</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">屠宰场</td>
						<td width="220px;">吉林省绿邦肉业科技有限公司</td><td width="200px;" style="font-size:12px;">屠宰时间</td>
						<td width="150px;">2012-01-14</td>
						</tr>
					</table>
					<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;margin-top:20px;">
						<tr bgcolor="#ffffff" height="25px">
						<td style="font-size:15px;text-align:left;background-color:#F1F7FE"" colspan=2;>检疫信息</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="120px;">进场检疫</td>
						<td width="150px;">合格</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="120px;">宰前检疫</td>
						<td width="150px;">合格</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="120px;">宰后检疫</td>
						<td width="350px;" style="">体表检疫：合格<br>寄生虫检疫：合格<br>淋巴系统检疫：合格</td>
						</tr>
					</table>
				</div>
				<div title="仓储信息" style="padding:10px;">
				<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;">
					<tr bgcolor="#ffffff" height="25px">
					<td style="font-size:15px;text-align:left;background-color:#F1F7FE" colspan=4;>仓储入库信息</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">入库单</td>
					<td width="150px;">12020208204367323514</td><td width="200px;" style="font-size:12px;">送货人</td>
					<td width="150px;">王琦</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">入库时间</td>
					<td width="150px;">2012-02-02 08:445:50</td><td width="200px;" style="font-size:12px;">接收人</td>
					<td width="150px;">李响</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
				<td style="font-size:12px;" width="200px;">存放仓库</td>
				<td width="150px;">榆树市冷冻库</td><td width="200px;" style="font-size:12px;">库位</td>
				<td width="150px;">1号库位</td>
				</tr>
				</table>
				<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;margin-top:20px;">
					<tr bgcolor="#ffffff" height="25px">
					<td style="font-size:15px;text-align:left;background-color:#F1F7FE"" colspan=4;>仓储出库信息</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">出库单</td>
					<td width="150px;">12020209051143856296</td><td width="200px;" style="font-size:12px;">送货人</td>
					<td width="150px;">王琦</td>
					</tr>
					<tr bgcolor="#ffffff" height="20px">
					<td style="font-size:12px;" width="200px;">出库日期</td>
					<td width="150px;">2012-02-02 09：05：11</td><td width="200px;" style="font-size:12px;">接收人</td>
					<td width="150px;">李响</td>
					</tr>
				</table>
				</div>
				<div title="产品物流信息" style="padding:10px;">
					<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;">
						<tr bgcolor="#ffffff" height="25px">
						<td style="font-size:15px;text-align:left;background-color:#F1F7FE" colspan=4;>分割肉物流信息</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">物流单号</td>
						<td width="150px;">2012020220001</td><td width="200px;" style="font-size:12px;">订单号</td>
						<td width="150px;">12013114013150170776</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">送货人</td>
						<td width="150px;">李响</td><td width="200px;" style="font-size:12px;">接收人</td>
						<td width="150px;">张汉青</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">司机</td>
						<td width="150px;">徐海峰</td><td width="200px;" style="font-size:12px;">车号</td>
						<td width="150px;">吉A11314</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">发车时间</td>
						<td width="150px;">2012-02-03 06:01:00</td><td width="200px;" style="font-size:12px;">到货时间</td>
						<td width="150px;">2012-02-03 10:39:55</td>
						</tr>
					</table>
				</div>
				<div title="产品销售信息" style="padding:10px;">
					<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="color:#416AA3;">
						<tr bgcolor="#ffffff" height="25px">
						<td style="font-size:15px;text-align:left;background-color:#F1F7FE" colspan=4;>零售信息</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">零售编号</td>
						<td width="150px;">12022023082416451327</td><td width="200px;" style="font-size:12px;">销售点</td>
						<td width="150px;">长春市门店</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">顾客</td>
						<td width="150px;">沈先生</td><td width="200px;" style="font-size:12px;">购买时间</td>
						<td width="150px;">2012-02-20 23:10:37</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">产品名称</td>
						<td width="150px;" colspan=3>高档礼盒</td>
						</tr>
						<tr bgcolor="#ffffff" height="20px">
						<td style="font-size:12px;" width="200px;">产品价格</td>
						<td width="150px;">598:00</td><td width="200px;" style="font-size:12px;">产品数量</td>
						<td width="150px;">1</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
</body>
</html>