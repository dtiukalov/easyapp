<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page import="java.util.*"%>
<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crm?useUnicode=true&amp;characterEncoding=utf-8", "root", "root");
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		String sql="select * from crm_carinfo_view where 1=1 ";
		String op=request.getParameter("op");
		if(op!=null&&"excelz".equals(op.trim())){
			String _carbrand=request.getParameter("carbrand");
			String _carcardid=request.getParameter("carcardid");
			String _carcardlevel=request.getParameter("carcardlevel");
			String _carcardtype=request.getParameter("carcardtype");
			String _max_carcreatetime=request.getParameter("max_carcreatetime");
			String _min_carcreatetime=request.getParameter("min_carcreatetime");
			String _carlicenceno=request.getParameter("carlicenceno");
			String _carmodel=request.getParameter("carmodel");
			String _max_carselldate=request.getParameter("max_carselldate");
			String _min_carselldate=request.getParameter("min_carselldate");
			String _carseries=request.getParameter("carseries");
			String _carshoprange=request.getParameter("carshoprange");
			String _carsource=request.getParameter("carsource");
			String _carusertype=request.getParameter("carusertype");
			String _carvin=request.getParameter("carvin");
			String _cstmcontact=request.getParameter("cstmcontact");
			String _cstmname=request.getParameter("cstmname");
			String _membtype=request.getParameter("membtype");
			String _cararea=request.getParameter("cararea");
			String _carcolor=request.getParameter("carcolor");
			String _cstmmobile=request.getParameter("cstmmobile");
			String _cstmtel=request.getParameter("cstmtel");
			String _cstmcontmobile=request.getParameter("cstmcontmobile");
		
			if(_carbrand!=null&&!"".equals(_carbrand.trim())){
				sql+="and carbrand='"+_carbrand+"' ";
			}
			if(_carcardid!=null&&!"".equals(_carcardid.trim())){
				sql+="and carcardid='"+_carcardid+"' ";
			}
			if(_carcardlevel!=null&&!"".equals(_carcardlevel.trim())){
				sql+="and carcardlevel='"+_carcardlevel+"' ";
			}
			if(_carcardtype!=null&&!"".equals(_carcardtype.trim())){
				sql+="and carcardtype='"+_carcardtype+"' ";
			}
			if(_max_carcreatetime!=null&&!"".equals(_max_carcreatetime.trim())){
				sql+="and carcreatetime<=concat(substr('"+_max_carcreatetime+"',1,10),' 23:59:59') ";
			}
			if(_min_carcreatetime!=null&&!"".equals(_min_carcreatetime.trim())){
				sql+="and carcreatetime>=concat(substr('"+_min_carcreatetime+"',1,10),' 00:00:00') ";
			}
			if(_carlicenceno!=null&&!"".equals(_carlicenceno.trim())){
				sql+="and carlicenceno like '%"+_carlicenceno+"%' ";
			}
			if(_carmodel!=null&&!"".equals(_carmodel.trim())){
				sql+="and carmodel='"+_carmodel+"' ";
			}
			if(_max_carselldate!=null&&!"".equals(_max_carselldate.trim())){
				sql+="and carselldate<=concat(substr('"+_max_carselldate+"',1,10),' 23:59:59') ";
			}
			if(_min_carselldate!=null&&!"".equals(_min_carselldate.trim())){
				sql+="and carselldate>=concat(substr('"+_min_carselldate+"',1,10),' 00:00:00') ";
			}
			if(_carseries!=null&&!"".equals(_carseries.trim())){
				sql+="and carseries='"+_carseries+"' ";
			}
			if(_carshoprange!=null&&!"".equals(_carshoprange.trim())){
				sql+="and carshoprange='"+_carshoprange+"' ";
			}
			if(_carsource!=null&&!"".equals(_carsource.trim())){
				sql+="and carsource='"+_carsource+"' ";
			}
			if(_carusertype!=null&&!"".equals(_carusertype.trim())){
				sql+="and carusertype='"+_carusertype+"' ";
			}
			if(_carvin!=null&&!"".equals(_carvin.trim())){
				sql+="and carvin like '%"+_carvin+"%' ";
			}
			if(_cstmcontact!=null&&!"".equals(_cstmcontact.trim())){
				sql+="and cstmcontact like '%"+_cstmcontact+"%' ";
			}
			if(_cstmname!=null&&!"".equals(_cstmname.trim())){
				sql+="and cstmname like '%"+_cstmname+"%' ";
			}
			if(_membtype!=null&&!"".equals(_membtype.trim())){
				sql+="and membtype='"+_membtype+"' ";
			}
			if(_cararea!=null&&!"".equals(_cararea.trim())){
				sql+="and cararea='"+_cararea+"' ";
			}
			if(_carcolor!=null&&!"".equals(_carcolor.trim())){
				sql+="and carcolor='"+_carcolor+"' ";
			}
			if(_cstmmobile!=null&&!"".equals(_cstmmobile.trim())){
				sql+="and cstmmobile like '%"+_cstmmobile+"%' ";
			}
			if(_cstmtel!=null&&!"".equals(_cstmtel.trim())){
				sql+="and cstmtel like '%"+_cstmtel+"%' ";
			}
			if(_cstmcontmobile!=null&&!"".equals(_cstmcontmobile.trim())){
				sql+="and cstmcontmobile like '%"+_cstmcontmobile+"%' ";
			}
		}
		ResultSet rs = stmt.executeQuery(sql);
		SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
		
		String filename="车辆车主查询信息";
		String filedownload="c:/"+filename+".txt";
		//先删除文件
		File file = new File(filedownload);
		if(file.exists()&&file.isFile()){
			file.delete();
		}
		
		FileWriter os=null;
		BufferedWriter bufferout=null;
		try {
			os=new FileWriter(filedownload,true);
			bufferout=new BufferedWriter(os);
			bufferout.write("档案编号"+'\t'
					+"建档时间"+'\t'
					+"档案级别"+'\t'
					+"档案分类"+'\t'
					+"车架号"+'\t'
					+"车牌号"+'\t'
					+"品牌"+'\t'
					+"车系"+'\t'
					+"车型"+'\t'
					+"车色"+'\t'
					+"年款"+'\t'
					+"地区"+'\t'
					+"车辆类别"+'\t'
					+"车辆来源"+'\t'
					+"车店距离"+'\t'
					+"销售日期"+'\t'
					+"会员类型"+'\t'
					+"车主"+'\t'
					+"性别"+'\t'
					+"电话"+'\t'
					+"手机"+'\t'
					+"联系人"+'\t'
					+"联系人性别"+'\t'
					+"电话"+'\t'
					+"手机");
			bufferout.newLine();
			bufferout.flush();
			int sum=0;
			while(rs.next()){
				sum++;
				
				String carcardlevel = rs.getString("carcardlevel");
				try{
					carcardlevel = inst.getDataDictItemInfo("crm_cardLevel",rs.getString("carcardlevel"))!=null?inst.getDataDictItemInfo("crm_cardLevel",rs.getString("carcardlevel")).getValue():rs.getString("carcardlevel");
				}catch(Exception e){
					carcardlevel = rs.getString("carcardlevel")!=null?rs.getString("carcardlevel"):"";
				}
				String carcardtype = rs.getString("carcardtype");
				try{
					carcardtype = inst.getDataDictItemInfo("crm_cardType",carcardtype)!=null?inst.getDataDictItemInfo("crm_cardType",carcardtype).getValue():rs.getString("carcardtype");
				}catch(Exception e){
					carcardtype = rs.getString("carcardtype")!=null?rs.getString("carcardtype"):"";
				}
				String carbrand = rs.getString("carbrand");	
				try{
					carbrand = inst.getDataDictItemInfo("crm_carModel",carbrand)!=null?inst.getDataDictItemInfo("crm_carModel",carbrand).getValue():rs.getString("carbrand");
				}catch(Exception e){
					carbrand = rs.getString("carbrand")!=null?rs.getString("carbrand"):"";
				}
				String carseries = rs.getString("carseries");
				try{
					carseries = inst.getDataDictItemInfo("crm_carModel",carseries)!=null?inst.getDataDictItemInfo("crm_carModel",carseries).getValue():rs.getString("carseries");
				}catch(Exception e){
					carseries = rs.getString("carseries")!=null?rs.getString("carseries"):"";
				}
				String carmodel = rs.getString("carmodel");
				try{
					carmodel = inst.getDataDictItemInfo("crm_carModel",carmodel)!=null?inst.getDataDictItemInfo("crm_carModel",carmodel).getValue():rs.getString("carmodel");
				}catch(Exception e){
					carmodel = rs.getString("carmodel")!=null?rs.getString("carmodel"):"";
				}
				String carcolor = rs.getString("carcolor");	
				try{
					carcolor = inst.getDataDictItemInfo("crm_carColor",carcolor)!=null?inst.getDataDictItemInfo("crm_carColor",carcolor).getValue():rs.getString("carcolor");
				}catch(Exception e){
					carcolor = rs.getString("carcolor")!=null?rs.getString("carcolor"):"";
				}
				String caryearstyle = rs.getString("caryearstyle");	
				try{
					caryearstyle = inst.getDataDictItemInfo("crm_yearStyle",caryearstyle)!=null?inst.getDataDictItemInfo("crm_yearStyle",caryearstyle).getValue():rs.getString("caryearstyle");
				}catch(Exception e){
					caryearstyle = rs.getString("caryearstyle")!=null?rs.getString("caryearstyle"):"";
				}
				String cararea = rs.getString("cararea");	 
				try{
					cararea = inst.getDataDictItemInfo("crm_carArea",cararea)!=null?inst.getDataDictItemInfo("crm_carArea",cararea).getValue():rs.getString("cararea");
				}catch(Exception e){
					cararea = rs.getString("cararea")!=null?rs.getString("cararea"):"";
				}
				String carownership = rs.getString("carownership");	
				try{
					carownership = inst.getDataDictItemInfo("crm_carType",carownership)!=null?inst.getDataDictItemInfo("crm_carType",carownership).getValue():rs.getString("carownership");
				}catch(Exception e){
					carownership = rs.getString("carownership")!=null?rs.getString("carownership"):"";
				}
				String carsource = rs.getString("carsource");
				try{
					carsource = inst.getDataDictItemInfo("crm_carSource",carsource)!=null?inst.getDataDictItemInfo("crm_carSource",carsource).getValue():rs.getString("carsource");
				}catch(Exception e){
					carsource = rs.getString("carsource")!=null?rs.getString("carsource"):"";
				}
				String carshoprange = rs.getString("carshoprange");	
				try{
					carshoprange = inst.getDataDictItemInfo("crm_shopRange",carshoprange)!=null?inst.getDataDictItemInfo("crm_shopRange",carshoprange).getValue():rs.getString("carshoprange");
				}catch(Exception e){
					carshoprange = rs.getString("carshoprange")!=null?rs.getString("carshoprange"):"";
				}
				//String carselldate = rs.getString("carselldate");	 
				//try{
				//	carselldate = inst.getDataDictItemInfo("crm_carUserType",carusertype)!=null?inst.getDataDictItemInfo("crm_carUserType",carusertype).getValue():rs.getString("carusertype");
				//}catch(Exception e){
				//	carselldate = rs.getString("carusertype")!=null?rs.getString("carusertype"):"";
				//}
				String membtype = rs.getString("membtype");
				try{
					membtype = inst.getDataDictItemInfo("crm_membType",membtype)!=null?inst.getDataDictItemInfo("crm_membType",membtype).getValue():rs.getString("membtype");
				}catch(Exception e){
					membtype = rs.getString("membtype")!=null?rs.getString("membtype"):"";
				}
				String cstmsex = rs.getString("cstmsex");
				try{
					cstmsex = inst.getDataDictItemInfo("crm_sex",cstmsex)!=null?inst.getDataDictItemInfo("crm_sex",cstmsex).getValue():rs.getString("cstmsex");
				}catch(Exception e){
					cstmsex = rs.getString("cstmsex")!=null?rs.getString("cstmsex"):"";
				}
				String cstmcontsex = rs.getString("cstmcontsex");
				try{
					cstmcontsex = inst.getDataDictItemInfo("crm_sex",cstmcontsex)!=null?inst.getDataDictItemInfo("crm_sex",cstmcontsex).getValue():rs.getString("cstmcontsex");
				}catch(Exception e){
					cstmcontsex = rs.getString("cstmcontsex")!=null?rs.getString("cstmcontsex"):"";
				}
				bufferout.write((rs.getString("carcardid")!=null?rs.getString("carcardid"):"")+'\t'
						+(rs.getString("carcreatetime")!=null?rs.getString("carcreatetime"):"")+'\t'
						+carcardlevel+'\t'						
						+carcardtype+'\t'
						+(rs.getString("carvin")!=null?rs.getString("carvin"):"")+'\t'
						+(rs.getString("carlicenceno")!=null?rs.getString("carlicenceno"):"")+'\t'
						+carbrand+'\t'
						+carseries+'\t'
						+carmodel+'\t'
						+carcolor+'\t'
						+caryearstyle+'\t'
						+cararea+'\t'
						+carownership+'\t'
						+carsource+'\t'
						+carshoprange+'\t'
						+(rs.getString("carselldate")!=null?rs.getString("carselldate"):"")+'\t'
						+membtype+'\t'
						+(rs.getString("cstmname")!=null?rs.getString("cstmname"):"")+'\t'
						+cstmsex+'\t'
						+(rs.getString("cstmtel")!=null?rs.getString("cstmtel"):"")+'\t'
						+(rs.getString("cstmmobile")!=null?rs.getString("cstmmobile"):"")+'\t'
						+(rs.getString("cstmcontact")!=null?rs.getString("cstmcontact"):"")+'\t'
						+cstmcontsex+'\t'
						+(rs.getString("cstmconttel")!=null?rs.getString("cstmconttel"):"")+'\t'
						+(rs.getString("cstmcontmobile")!=null?rs.getString("cstmcontmobile"):""));
				bufferout.newLine();
				bufferout.flush();
			}
			bufferout.write("记录数："+sum);
			bufferout.newLine();
			bufferout.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bufferout != null)
	          {
				bufferout.close();
				bufferout=null;
	          }
	          if(os != null)
	          {
	        	  os.close();
	        	  os=null;
	          }
	          if(rs != null)
	          {
	        	  rs.close();
	          }
	          if(stmt != null)
	          {
	        	  stmt.close();
	          }
	        filename = new String(filename.getBytes("gb2312"),"iso8859-1");
			response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
			response.setContentType("application/ms-excel");
			response.setCharacterEncoding("iso8859-1");

		      OutputStream outp = null;
		      FileInputStream in = null;
		      try
		      {
		          outp = response.getOutputStream();
		          in = new FileInputStream(filedownload);

		          byte[] b = new byte[1024];
		          int i = 0;
		          while((i = in.read(b)) > 0)
		          {
		              outp.write(b, 0, i);
		          }
		          outp.flush();
		      }
		      catch(Exception e)
		      {
		          System.out.println("Error!");
		          e.printStackTrace();
		      }
		      finally
		      {
		          if(in != null)
		          {
		              in.close();
		              in = null;
		          }
		          if(outp != null)
		          {
		              outp.close();
		              outp = null;
		          }
		      }
			out.clear();
			out=pageContext.pushBody();
		}
	
		
		%>

