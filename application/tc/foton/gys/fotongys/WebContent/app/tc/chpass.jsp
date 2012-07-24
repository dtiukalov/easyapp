<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
 <title> Change Password </title>
</head>
<script language="JavaScript" type="text/javascript">
/*	function setCookie(c_name,value,expiredays) {    
		var exdate=new Date()    
		exdate.setDate(exdate.getDate()+expiredays)    
	  	cookieVal=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());

		document.cookie=cookieVal;
	}
	alert(document.cookie);
	
	function getCookie(c_name) {   
		var cookie = document.cookie;
	 	if (cookie.length > 0) {      
	 		c_start = cookie.indexOf(c_name + "=");      
	 			if (c_start!=-1) {         
	 				c_start=c_start + c_name.length + 1;        
	  				c_end=cookie.indexOf(";",c_start);     
	     			if (c_end == -1) {
	     				c_end=cookie.length;
	     			}	
	       			
	       			return unescape(cookie.substring(c_start,c_end));      
	         }      
	     }    
	     return "";
	 }*/
</script>
<%
	String userid = request.getParameter("userid");
	System.out.println(userid);
%>
<body>
 <form action="webclient?logout&TC_file=chpass.html" name="ChangePassForm" method="POST" ID="ChangePassForm">

      <table style="width: 252px" class="transparent-body" id="trans-body" >
      <tr>
          <td align="left" class="input-label">User ID</td>
          <td width="1px"><font color="#999999" size="1">*</font></td>
          <td align="left"><input class="input-body" type="text" name="j_username" ID="Text1" size="15" value="<%=userid%>" readonly="readonly"></td>
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
          <td align="left" class="input-label">Old Password</td>
          <td width="1px"><font color="#999999" size="1">*</font></td>
          <td align="left"><input class="input-body" type="text" name="j_old_pass" size="15"></td>    
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
          <td align="left" class="input-label">New password</td>
          <td width="1px"><font color="#999999" size="1">*</font></td>
<input type="hidden" name="j_old_pass" />
          <td align="left"><input class="input-body" type="text" name="j_new_pass" size="15"></td>    
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
          <td colspan="2">&nbsp;</td>
          <td align="left"><input type="submit" value="Change" NAME="Submit"></td>
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      </table>

 </form>
</body>
