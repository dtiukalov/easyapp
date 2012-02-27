<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>造型图片管理</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.t {
	font-family: "宋体";
	font-size: 12px;
	color: #000000;
}
-->
</style>

</head>

<body>
<table width="626" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="120">&nbsp;</td>
  </tr>
  
  <tr>
    <td height="330" valign="top" background="images/dly.jpg">
    
    <table width="626" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="180">&nbsp;</td>
      </tr>
      
      <tr>
        <td height="72" valign="top">
        <table width="626" height="72" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="95">&nbsp;</td>
            
            <td width="150">
            
	            <form id="form1" name="form1" method="post" action="login">
		              <table width="150" height="72" border="0" cellpadding="0" cellspacing="0">
		                <tr>
		                  <td><span class="t">用户名：</span>
		                    <label>
		                    <input name="name" type="text" class="t" size="12" />
		                    </label></td>
		                </tr>
		                <tr>
		                  <td><span class="t">密　码：</span>
		                    <input name="password" type="password" class="t" size="12" /></td>
		                </tr>
		                <tr>
		                  <td><label>
		                     <input name="Submit" type="submit" class="t" value="确  定" />
		                     <input name="Submit2" type="reset" class="t" value="取  消" />
		                  </label></td>
		                </tr>
		              </table>
	          </form>
	              
            </td>
            
            <td>&nbsp;</td>
            
          </tr>         
        </table>
        </td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
      </tr>     
    </table>
    
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
  </tr>
  
</table>

<script type="text/javascript">
if('<%=request.getAttribute("LOGINERROR")%>'!='null'){
alert('<%=(String)request.getAttribute("LOGINERROR")%>');
}
</script>

</body>
</html>
