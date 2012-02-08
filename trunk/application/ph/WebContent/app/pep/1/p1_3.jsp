<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/app/pep/include/header.jsp"%>
	<style type="text/css">
	.coo .tab {
		background:#000;
		font-size:12px;
		width:1004px;
	}
	.coo .tab td{
		background:#fff;
		width:20px;
	}
	.coo .tab .taba {
		width:1004px;
	}
	.coo .tab .taba .lg{
		width:230px;
	}
	.coo .tab .taba .bt{
		width:444px;
	}
	.coo .tab  .taba .bz{
		width:230px;
	}
	.coo .bt h3 {
		text-align:center;
		font-size:18px;
	}
	.coo .ka {
		width:64px;
		height:15px;
		border:1px solid #d0d0d0;
	}
	.coo .kb {
		background-color:#afafaf;
		width:190px;
	}
	.coo .kc {
		background-color:#3e3e3e;
		color:#FFF;
		width:103px;
	}
	.coo .tab .a {
		width:232px;
	}
	.coo .tab .b {
		width:440px;
	}
	.coo .tab .c {
		width:232px;
	}
		
	</style>
</head>
<body>	
	<div id="container">
		<div id="nr">
		<div id="top"><h1>1.1 Anlaufübersicht</h1></div>
		<p></p>
		<div class="coo"><table width="986" border="0" cellpadding="1" cellspacing="1" class="tab">
  <tr>
    <td width="982"><table width="931"  height="60" border="0" cellpadding="0" cellspacing="0" class="taba">
      <tr>
        <td width="260" class="lg"><img src="../images/logo.jpg"/></td>
        <td width="384" class="bt"><h3>VWxxx Anlaufübersicht</h3>
        <h3>Muster</h3></td>
        <td width="287" class="bz"><p><span>Status:</span></p>
          <p>Ausgabe:xx.xx.10</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td style="width:904px;hight:400px"><iframe id="ff" name= "ff" frameborder="0"  src="GanttChart2.jsp" style="width:1000px;height:300px;"></iframe></td>
  </tr>
  <tr>
    <td><table width="904" height="50px" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="a"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>Legende:</td>
          </tr>
          <tr>
            <td><table width="300" border="0" cellspacing="3" cellpadding="0">
              <tr>
                <td width="78"><div class="ka">Producktidefinition</div></td>
                <td width="107"><div class="kb">Konzept und Serienentericklung</div></td>
                <td width="103"><div class="kc">Serienvorboreitung</div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td align="center" valign="bottom" class="b">RPLAN</td>
        <td class="c"><p>GMXSMax&nbsp;&nbsp;&nbsp;&nbsp;Mustemannxxx Qukdfjdkfjdkfj Tel kdkf df f<br />
          Profkdfldidf;dfuiddkjfdkfjkdfjdk
        </p></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>