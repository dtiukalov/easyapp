<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.car.NewCar"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String rootcid=WebUtils.getRootCid(request);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>绥化融展兴盛别克专营店</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
</head>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<div class="con1">
    	<div class="gyyfnd">
    		<div class="yfnd">
        		<h1>关于兴盛</h1>
                <span><a href="<%="content.jsp?cid="+rootcid+".about&aid="+rootcid+".about.introduce" %>">更多</a></span>
       		</div>
        	<div class="yfndbg">
            	<div class="js">
                	<p>&nbsp;&nbsp;&nbsp;<%=WebUtils.getTextWithMax(Article.getOneArticleText(rootcid+".about.introduce"), 220)%></p>
                </div>
            </div>
        	<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    	</div><!--关于英菲尼迪-->
    <div class="qiehuan">
    <%@ include file="include/images.jsp" %>
    </div>
    	<div class="gyyfnd">
        	<div class="yfnd">
    			<h1>新闻动态</h1>
                <span><a href="<%=WebUtils.getLink(rootcid+".new", null)%>">更多</a></span>
            </div>
            <div class="yfndbg">
            	<div class="js">
            	<ul>
            	<%
            		List artiles_new = Article.getByLikeCid(rootcid+".new.");
            		int size_new = Math.min(artiles_new.size(), 8);
            		for (int i = 0; i < size_new; ++i) {
            			Article article = (Article) artiles_new.get(i);
		            	%>
		            	<li>·<a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>"><%=WebUtils.getTextWithMax(article.getTitle(), 20)%></a></li>
		                <%
            		}
                %>
                </ul>
                </div>
            </div>
        	<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    	</div><!--新闻动态-->
    </div><!--第一行-->
	<div class="con2">
    	<div class="cxzs">
        	<div class="cxzst">
            	<h1>车型展示</h1>
                <span><a href="cus_cars.jsp?cid=xingsheng.sall&aid=xingsheng.sall.new">更多</a></span>
            </div>
            <div class="cxzsbg">
            <%
        	//List cars = NewCar.getListByCid(WebUtils.getRootCid(request));
            String[] modelz={"car.buick.kaiyue","car.buick.junwei","car.buick.yinglanggt","car.buick.junyue","car.buick.yinglangxt","car.buick.gl8","car.buick.linyindadao","car.buick.angkelei"};
            List cars = new ArrayList();
            List carsz = null;
            for(int i=0;i<modelz.length;i++){
            	carsz = NewCar.getListByModel(WebUtils.getRootCid(request),modelz[i]);
            	double p1=0;
            	double p2=0;
                for(int j=0;j<carsz.size();j++){
                	NewCar car = (NewCar) carsz.get(j);
                	if(p1==0){
                		p1=Double.parseDouble(car.getPrice().trim());
                	}else{
                		double p = Double.parseDouble(car.getPrice().trim());
                		if(p>p1){
                			if(p>p2){
                				p2=p;
                			}
                		}else{
                			if(p1>p2){
                				p2=p1;
                			}
                			p1=p;
                		}
                	}
                	if(j==(carsz.size()-1)){
                		String m = "";
                		m=p1>0?m+p1:"";
                		m=p2>0?m+"——"+p2:m+"——"+p1;
                		car.setPrice(m);
                		cars.add(car);
                	}
                	
                }
            }
        	int count =  cars.size();
        	%>
            <table class="tableline" cellpadding="0" cellspacing="1" style="width:100%;">
    <tr align="center" height="30px">
      <td height="39" style="border-bottom: dashed thin #ffffff;">图片</td>
      <td style="border-bottom: dashed thin #ffffff;">品牌车型</td>
      <td style="border-bottom: dashed thin #ffffff;">报价(万元)</td>
    </tr>
    <%
		for (int i = 0; i < count; ++i) {
			NewCar car = (NewCar) cars.get(i);
			String bgcolor = "#f8f7f2";
			if(i % 2 == 1)
				bgcolor = "#ffffff";
			if(i==0){
				%>
  			<tr align="center" height="60px" bgcolor="<%=bgcolor%>">
	      <td style="border-top: dashed thin #ababab;border-width:1px;"><img src="<%=car.getImage()!=null?car.getImage():"images/car.gif" %>" width="90" height="60" /></td>
	      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>"><span style="color:#1478c6;font-size: 18px;"><%=car.getModelName() %></span></a></td>
	      <td style="border-top: dashed thin #ababab;border-width:1px;"><span style="color:#da251c;font-size: 18px;">&nbsp;<%=car.getPrice() %></span></td>
	      <!-- 
	      <td style="border-top: dashed thin #ababab;border-width:1px;">
		      <a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>">详情</a>
	      </td>
	      <td style="border-top: dashed thin #ababab;border-width:1px;">
	      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.change','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/dingche.gif"/></a> 
	      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.drive','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/shijia.gif"/></a> 
	      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.bookcar','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/zhihuan.gif"/></a>
	      </td>
	       -->
	    </tr>
   					<%
   				}else{
     		%>
       		<tr align="center" height="60px" bgcolor="<%=bgcolor%>">
		      <td ><span style="border-top: dashed thin #ababab;border-width:1px;"><img src="<%=car.getImage()!=null?car.getImage():"images/car.gif" %>" width="90" height="60" /></span></td>
		      <td ><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>"><span style="color:#1478c6;font-size: 18px;"><%=car.getModelName() %></span></a></td>
		      <td ><span style="color:#da251c;font-size: 18px;">&nbsp;<%=car.getPrice() %></span></td>
		      <!-- 
		      <td >
		      <a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>">详情</a>
		      </td>
		      <td >
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.change','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/dingche.gif"/></a> 
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.drive','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/shijia.gif"/></a> 
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.bookcar','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/zhihuan.gif"/></a>
		      </td>
		       -->
		    </tr>
     		<%
     				}
     			}
     		%>
  </table></div>
            <div class="cxzsx"><img src="images/cxzs_x.gif" /></div>        
        </div><!--车型展示-->
        <div class="ycxhd">
        	<div class="gyyfnd">
        		<div class="yfnd">
    				<h1>促销活动</h1>
               		<span><a href="<%="list.jsp?cid="+rootcid+".new&aid="+rootcid+".new.offsall" %>">更多</a></span>
            	</div>
            	<div class="yfndbg2">
                	<div class="cxhdnr">
                    	<table width="98%" border="0" cellspacing="0" cellpadding="0" class="cxhd">
                    	<%
            		List artiles_sall = Article.getByLikeCid(rootcid+".new.offsall");
            		int size_sall = Math.min(artiles_sall.size(), 6);
            		for (int i = 0; i < size_sall; ++i) {
            			Article article = (Article) artiles_sall.get(i);
		            	%>
		            	<tr>
						    <td width="9%" height="31"><img src="images/<%=i+1 %>.gif" width="19" height="14" /></td>
						    <td><a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>"><%=WebUtils.getTextWithMax(article.getTitle(), 16)%></a></td>
						    <td width="16%"><img src="images/www6Lucn0012.gif" width="35" height="15" /></td>
						  </tr>
		                <%
            		}
                %>
                      </table>

                    </div>
                </div>
        		<div class="yfndx"><img src="images/yfnd_x.gif" /></div>
    		</div><!--促销活动-->
            <div class="tupian">
       			<a href="cus_bookcar.jsp?cid=xingsheng.book&aid=xingsheng.book.drive"><img src="images/yysj.jpg" /></a>
        		<a href="cus_bookcar.jsp?cid=xingsheng.book&aid=xingsheng.book.maintain"><img src="images/byyy.jpg" /></a>
        		<a href="cus_bookcar.jsp?cid=xingsheng.book&aid=xingsheng.book.repair"><img src="images/wxyy.jpg" /></a>
            </div>
        </div><!--右侧促销活动等-->
    </div><!--第二行-->
</div><!--内容-->
 <%@ include file="include/foot.jsp" %>
</div>
<script type="text/javascript">
function addBookCar(type,brand,model,series,brandName,modelName,seriesName){
	
	if('bookcar.type.drive'==type){
		//试驾
		$('#typeName').val('试驾');
		$('#bookcar').attr('title','试驾');
	}else if('bookcar.type.change'==type){
		//置换
		$('#typeName').val('置换');
		$('#bookcar').attr('title','置换');
	}else if('bookcar.type.bookcar'==type){
		//订车
		$('#typeName').val('订车');
		$('#bookcar').attr('title','订车');
	}
	$('#cid').val('<%=WebUtils.getRootCid(request)%>');
	$('#type').val(type);
	$('#brand').val(brand);
	$('#model').val(model);
	$('#series').val(series);
	$('#brandName').val(brandName);
	$('#modelName').val(modelName);
	$('#seriesName').val(seriesName);
	
	
	$('#bookcar').window('open');
}
function submitForm() {
	if ($('#phone').val() == '') {
		alert('请填写电话');
		$('#phone').focus();
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/app/car/bookcar/addByClient.do', 
		type : 'post',         
		dataType : 'json',     
		data : {
			phone : $("#phone").val(),         
			text : $("#text").val(),         
			type : $("#type").val(),  
			typeName : $("#typeName").val(),     
			cid : '<%=WebUtils.getRootCid(request)%>',     
			brand : $("#brand").val(),  
			model : $("#model").val(),  
			series : $("#series").val(), 
			brandName : $("#brandName").val(),  
			modelName : $("#modelName").val(),  
			seriesName : $("#seriesName").val(),
			state : 'bookcar.state.false',
			stateName : '未确认',
			createTime : '<%=DateUtils.getSystemTime()%>',
			license : '',
			bookTime : ''
		},
		success : function(data) {
			if (data) {
				$("#createTime").val('');
				$("#text").val('');
				$('#phone').val('');
				
				$('#cid').val('');
				$('#type').val('');
				$('#typeName').val('');
				$('#brand').val('');
				$('#model').val('');
				$('#series').val('');
				$('#brandName').val('');
				$('#modelName').val('');
				$('#seriesName').val('');
				
				$('#bookcar').window('close');
				alert('保存成功!');
			}
		} 
	});
}
</script>
<div id="bookcar" class="easyui-window" closed="true" modal="true" title="预约服务" style="width:400px;height:200px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/car/bookcar/add.action"
			method="post">
			<table class="table-form">
				
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>电话:</td>
					<td><input id="phone" name="phone" type="text"></input></td>
					<td><div id="phoneTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">内容:</td>
					<td><textarea id="text" name="text" type="text" cols="40" rows="5"></textarea></td>
					<td><div id="textTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="javascript:void(0);" onclick="submitForm()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a>
						</div></td>
						<td></td>
				</tr>
			</table>
			<input id="cid" type="hidden" name="cid" type="text" value=""></input>
			<input id="brand" type="hidden" name="brand" type="text" value=""></input>
			<input id="model" type="hidden" name="model" type="text" value=""></input>
			<input id="series" type="hidden" name="series" type="text" value=""></input>

			<input id="brandName" type="hidden" name="brandName" type="text" value=""></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value=""></input>
			<input id="seriesName" type="hidden" name="seriesName" type="text" value=""></input>

			<input id="state" type="hidden" name="state" type="text" value="bookcar.state.false"></input>
			<input id="stateName" type="hidden" name="stateName" type="text" value="未确认"></input>
			<input id="type" type="hidden" name="type" type="text" value=""></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value=""></input>
			
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
</html>