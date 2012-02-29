<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>到店离店时间列表</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<script type="text/javascript">
		function checkz(){
		$('#op').attr("value","creatz");
		//校验
			$('#crmform').saturnValidate({
				rules:{
					c_a:{
						required: true
					},
					c_b:{
						required: true
					},
					c_c:{
						required: true
					},
					c_d:{
						required: true
					},
					c_num:{
						required: true
					}
				},
				messages:{
					c_a:{
						remote:"请选择国家"
					},
					c_b:{
						remote:"请选择省份"
					},
					c_c:{
						remote:"请选择城市"
					},
					c_d:{
						remote:"请选择4S店"
					},
					c_num:{
						remote:"请填写数量"
					}
				}
			});
		}
</script> 
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/ccioModule/action/SetCard.action',
				form:'crmform',
				percount:10
			});
			getDictList('c_a','0');
		});
</script>
<script type="text/javascript">
			function getDictList(divid,d_pid){
				jQuery.post("${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictRes.action",{'d_pid':d_pid},
					function(json,textStatus){
							var code = '<option id="-1" value=""></option>';
							if(divid=='c_a'){
								code = '<option id="-1" value=""></option>';
							}
							if(divid=='c_b'){
								code = '<option id="-1" value=""></option>';
							}
							if(divid=='c_c'){
								code = '<option id="-1" value=""></option>';
							}
							if(divid=='c_d'){
								code = '<option id="-1" value=""></option>';
							}
					        var num = json.dictresult.length;
					        for(i=0; i<num; i++){
					        	code += '<option title="'+json.dictresult[i].d_lable+'" id="'+json.dictresult[i].d_id+'" value="'+json.dictresult[i].d_id+'">'+json.dictresult[i].d_lable+'</option>';
					        }
						jQuery('#'+divid).html(code);
					},"json");
			}
			function getDictSaturnData(divid,d_id){
				jQuery.post("${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictByIdRes.action",{'d_id':d_id},
					function(json,textStatus){
					        var num = json.dictSaturnData.length;
					        if(json.dictSaturnData!=""){
					        	jQuery('#'+divid).html(json.dictSaturnData.d_lable);
					        }
					},"json");
			}
	</script>
</head>
<body>
<div id="man_zone"> 
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/SetCard.action">
			<input type="hidden" name="op" id="op" value=""/>
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>生成卡号</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName" style="width:8%;">国家:</td>
                      <td class="detailColVal">
                      	<select style="width:100px;" name="c_a" id="c_a" onchange="getDictList('c_b',this.options[this.selectedIndex].id)">
                      		<option value=""></option>
                      	</select>
                      </td>
                      <td class="colName" style="width:8%;">省份:</td>
                      <td class="detailColVal">
                      	<select style="width:100px;" name="c_b" id="c_b" onchange="getDictList('c_c',this.options[this.selectedIndex].id)">
                      		<option value=""></option>
                      	</select>
                      </td>
                      <td class="colName" style="width:8%;">城市:</td>
                      <td class="detailColVal">
                      	<select style="width:100px;" name="c_c" id="c_c" onchange="getDictList('c_d',this.options[this.selectedIndex].id)">
                      		<option value=""></option>
                      	</select>
                      </td>
                      <td class="colName" style="width:8%;">4S店:</td>
                      <td class="detailColVal">
                      	<select style="width:100px;" name="c_d" id="c_d">
                      		<option value=""></option>
                      	</select>
                      </td>
                      <td class="colName" style="width:8%;">数量:</td>
                      <td class="detailColVal">
                      	<input style="width:100px;" name="c_num" id="c_num" />
                      </td>
                    </tr>
                    <tr>
              </table>   
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="生成" onclick="return checkz();" />
              </div>     
			</fieldset>           
		</form>
		<table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;">&nbsp;<!-- <div class="optAdd"><a href="${pageContext.request.contextPath}/crm/ccioModule/web/addDict.jsp?d_pid=${d_pid }">新增</a></div> --></td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th style="width:130px;">卡号</th>
	                        <th>国家</th>
	                        <th>省份</th>
	                        <th>城市</th>
	                        <th>4S店</th>
	                        <th style="width:45px;">批号</th>
	                        <th style="width:45px;">序号</th>
	                        <th style="width:45px;">状态</th>
	                        <th style="width:90px;">创建时间</th>
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var" varStatus="sta">
                 	 <tr>
                        <td style="width:130px;">${var.c_card}</td>
                        <td>
                        <div id="c_a_${sta.index}"></div>
                        <script type="text/javascript">getDictSaturnData("c_a_"+${sta.index},${var.c_a});</script>
                        </td>
                        <td>
                        <div id="c_b_${sta.index}"></div>
                        <script type="text/javascript">getDictSaturnData("c_b_"+${sta.index},${var.c_b});</script>
                        </td>
                        <td>
                        <div id="c_c_${sta.index}"></div>
                        <script type="text/javascript">getDictSaturnData("c_c_"+${sta.index},${var.c_c});</script>
                        </td>
                        <td>
                        <div id="c_d_${sta.index}"></div>
                        <script type="text/javascript">getDictSaturnData("c_d_"+${sta.index},${var.c_d});</script>
                        </td>
                        <td style="width:45px;">
                        <div id="c_e_${sta.index}"></div>
                        <script type="text/javascript">getDictSaturnData("c_e_"+${sta.index},${var.c_e});</script>
                        </td>
                        <td style="width:45px;">${var.c_num}</td>
                        <td style="width:45px;">${var.c_state==0?"未写卡":"已写卡"}</td>
                        <td style="width:90px;">${var.c_datetime}</td>
                        </tr>
                 </c:forEach>
            </table>
    </div>
</div>

</body>
</html>
