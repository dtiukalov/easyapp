<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="edu.ccut.saturn.component.SaturnDictionaryManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@page import="org.apache.poi.hssf.util.CellRangeAddress"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="java.io.OutputStream"%>
<%
 String carlicenceno = request.getParameter("carlicenceno");
 String carcardid = request.getParameter("carcardid");
 String carvin = request.getParameter("carvin");
 String carbrand = request.getParameter("carbrand");
 String carseries = request.getParameter("carseries");
 String carmodel = request.getParameter("carmodel");
 String cararea = request.getParameter("cararea");
 String cstmname = request.getParameter("cstmname");
 String min_membjoindate = request.getParameter("min_membjoindate");
 String max_membjoindate = request.getParameter("max_membjoindate");
 String min_sumpoint = request.getParameter("min_sumpoint");
 String max_sumpoint = request.getParameter("max_sumpoint");
 String membcardid = request.getParameter("membcardid");
 String membtype = request.getParameter("membtype");

 
 Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crm?useUnicode=true&amp;characterEncoding=utf-8", "root", "root");

	String sql="select " +
			"a.carvin as carvin," +
			"a.memberid as memberid," +
			"a.membtype as membtype," +
			"a.membcardid as membcardid," +
			"a.membjoindate as membjoindate," +
			"a.membenjoyed as membenjoyed," +
			"a.membenjoying as membenjoying," +
			"b.cararea as cararea," +
			"b.carcardid as carcardid," +
			"b.carmodel as carmodel," +
			"b.carbrand as carbrand," +
			"b.carseries as carseries," +
			"b.carlicenceno as carlicenceno," +
			"c.cstmname as cstmname," +
			"c.cstmtel as cstmtel," +
			"c.cstmmobile as cstmmobile," +
			"d.sumpoint as sumpoint " +
			"from crm_member a left join crm_car b on a.carvin=b.carvin left join crm_customer c on a.carvin=c.carvin left join " +
			"(" +
			"select p_vin,sum(p_sumpoint) sumpoint from crm_point " +
			"where p_state=1 group by p_vin" +
			") d on a.carvin=d.p_vin " +
			"where 1=1 and a.membjoindate>='2010-01-01' "; 
    if(carlicenceno!=null&&!"".equals(carlicenceno)){
    	sql+="and b.carlicenceno like '%"+carlicenceno+"%'";
    }
    if(carcardid!=null&&!"".equals(carcardid)){
    	sql+="and b.carcardid='"+carcardid+"'";
    }
    if(carvin!=null&&!"".equals(carvin)){
    	sql+="and a.carvin like '%"+carvin+"%'";
    }
    if(carbrand!=null&&!"".equals(carbrand)){
    	sql+="and b.carbrand='"+carbrand+"'";
    }
    if(carseries!=null&&!"".equals(carseries)){
    	sql+="and b.carseries='"+carseries+"'";
    }
    if(carmodel!=null&&!"".equals(carmodel)){
    	sql+="and b.carmodel='"+carmodel+"'";
    }
    
    if(cararea!=null&&!"".equals(cararea)){
    	sql+="and b.cararea='"+cararea+"'";
    }
    if(cstmname!=null&&!"".equals(cstmname)){
    	sql+="and c.cstmname like '%"+cstmname+"%'";
    }
    if(min_membjoindate!=null&&!"".equals(min_membjoindate)){
    	sql+="and a.membjoindate>='"+min_membjoindate+"'";
    }
    if(max_membjoindate!=null&&!"".equals(max_membjoindate)){
    	sql+="and a.membjoindate<='"+max_membjoindate+"'";
    }
    if(min_sumpoint!=null&&!"".equals(min_sumpoint)){
    	sql+="and d.sumpoint>='"+min_sumpoint+"'";
    }
    if(max_sumpoint!=null&&!"".equals(max_sumpoint)){
    	sql+="and d.sumpoint<='"+max_sumpoint+"'";
    }
    if(membcardid!=null&&!"".equals(membcardid)){
    	sql+="and a.membcardid='"+membcardid+"'";
    }
    if(membtype!=null&&!"".equals(membtype)){
    	sql+="and a.membtype='"+membtype+"'";
    }
    sql+=" order by a.membjoindate desc,a.memberid";
    System.out.println(sql);
    Statement stmt=null; 
      ResultSet rs=null; 
      List<Map<String, Object>> result= new ArrayList<Map<String, Object>>();
     try {
		 stmt=conn.createStatement(); 
		 rs=stmt.executeQuery(sql);
		 SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
		 while(rs.next()){
			 Map<String, Object> mvo=new HashMap<String, Object>();
			 mvo.put("carvin",rs.getString("carvin"));
			 mvo.put("memberid",rs.getString("memberid"));
			 mvo.put("membtype",rs.getString("membtype"));
			 mvo.put("membcardid",rs.getString("membcardid"));
			 mvo.put("membjoindate",rs.getString("membjoindate"));
			 mvo.put("membenjoyed",rs.getString("membenjoyed"));
			 mvo.put("membenjoying",rs.getString("membenjoying"));
			 mvo.put("cararea",rs.getString("cararea"));
			 mvo.put("carcardid",rs.getString("carcardid"));
			 mvo.put("carmodel",rs.getString("carmodel"));
			 mvo.put("carbrand",rs.getString("carbrand"));
			 mvo.put("carseries",rs.getString("carseries"));
			 mvo.put("carlicenceno",rs.getString("carlicenceno"));
			 mvo.put("cstmname",rs.getString("cstmname"));
			 mvo.put("cstmtel",rs.getString("cstmtel"));
			 mvo.put("cstmmobile",rs.getString("cstmmobile"));
			 mvo.put("sumpoint",rs.getString("sumpoint"));
			 
			 try{
				 mvo.put("carmodel_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carmodel")).getValue());
			 }catch(Exception e){
				 mvo.put("carmodel_dict",rs.getString("carmodel"));
			 }
			 try{
				 mvo.put("carbrand_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carbrand")).getValue());
			 }catch(Exception e){
				 mvo.put("carbrand_dict",rs.getString("carbrand"));
			 }
			 try{
				 mvo.put("carseries_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carseries")).getValue());
			 }catch(Exception e){
				 mvo.put("carseries_dict",rs.getString("carseries"));
			 }
			 try{
				 mvo.put("cararea_dict",inst.getDataDictItemInfo("crm_carArea", rs.getString("cararea")).getValue());
			 }catch(Exception e){
				 mvo.put("cararea_dict",rs.getString("cararea"));
			 }
			 try{
				 mvo.put("membtype_dict",inst.getDataDictItemInfo("crm_membType", rs.getString("membtype")).getValue());
			 }catch(Exception e){
				 mvo.put("membtype_dict",rs.getString("membtype"));
			 }
			 
			 result.add(mvo);
		 }
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
        try {
        	if(rs!=null)
			rs.close();
        	if(stmt!=null)
			stmt.close();
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	String filename= "会员列表";
    filename = new String(filename.getBytes(),"iso8859-1");
	List resultmonth=(List)request.getAttribute("resultmonth");
	response.setHeader("Content-Disposition", "attachment;Filename="+filename+".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet("sheet1");
	
	
	//头样式
	HSSFCellStyle csH =wb.createCellStyle();
	csH.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	csH.setBorderTop(HSSFCellStyle.BORDER_THIN);
	csH.setBorderRight(HSSFCellStyle.BORDER_THIN);
	csH.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	csH.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	csH.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	csH.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	csH.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	csH.setWrapText(true);
	
	HSSFCellStyle cs=wb.createCellStyle();
	cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
	cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
	cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);

	HSSFRow row = sheet.createRow(0);
	             
	HSSFCell cell = row.createCell(0);
	cell.setCellValue("档案编号");
	cell.setCellStyle(csH);
	
	cell = row.createCell(1);
	cell.setCellValue("车架号");
	cell.setCellStyle(csH);
	
	cell = row.createCell(2);
	cell.setCellValue("车牌号");
	cell.setCellStyle(csH);
	
	cell = row.createCell(3);
	cell.setCellValue("品牌");
	cell.setCellStyle(csH);
	
	cell = row.createCell(4);
	cell.setCellValue("车系");
	cell.setCellStyle(csH);
	
	cell = row.createCell(5);
	cell.setCellValue("地区");
	cell.setCellStyle(csH);
	
	cell = row.createCell(6);
	cell.setCellValue("会员卡号");
	cell.setCellStyle(csH);
	
	cell = row.createCell(7);
	cell.setCellValue("会员类别");
	cell.setCellStyle(csH);
	
	cell = row.createCell(8);
	cell.setCellValue("入会日期");
	cell.setCellStyle(csH);
	
	cell = row.createCell(9);
	cell.setCellValue("积分数量");
	cell.setCellStyle(csH);
	
	cell = row.createCell(10);
	cell.setCellValue("车主");
	cell.setCellStyle(csH);
	
	cell = row.createCell(11);
	cell.setCellValue("电话");
	cell.setCellStyle(csH);
	
	cell = row.createCell(12);
	cell.setCellValue("手机");
	cell.setCellStyle(csH);
	
	//List<Map<String, Object>> result = (List)request.getAttribute("result");
	if (result != null){
		if (!result.isEmpty()) {
			int i = 0;
			for (; i < result.size(); ++i) {
				Map data = (Map)result.get(i);
				String carcardidz=data.get("carcardid")!=null?data.get("carcardid")+"":"";
				String carvinz=data.get("carvin")!=null?data.get("carvin")+"":"";
				String carlicencenoz=data.get("carlicenceno")!=null?data.get("carlicenceno")+"":"";
				String carbrand_dict=data.get("carbrand_dict")!=null?data.get("carbrand_dict")+"":"";
				String carseries_dict=data.get("carseries_dict")!=null?data.get("carseries_dict")+"":"";
				String cararea_dict=data.get("cararea_dict")!=null?data.get("cararea_dict")+"":"";
				String membcardidz=data.get("membcardid")!=null?data.get("membcardid")+"":"";
				String membtype_dict=data.get("membtype_dict")!=null?data.get("membtype_dict")+"":"";
				String membjoindate=data.get("membjoindate")!=null?data.get("membjoindate")+"":"";
				String sumpoint=data.get("sumpoint")!=null?data.get("sumpoint")+"":"";
				String cstmnamez=data.get("cstmname")!=null?data.get("cstmname")+"":"";
				String cstmtel=data.get("cstmtel")!=null?data.get("cstmtel")+"":"";
				String cstmmobile=data.get("cstmmobile")!=null?data.get("cstmmobile")+"":"";
				
				HSSFRow rowi = sheet.createRow(i+1);
				
				cell = rowi.createCell(0);
				cell.setCellValue(carcardidz);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(1);
				cell.setCellValue(carvinz);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(2);
				cell.setCellValue(carlicencenoz);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(3);
				cell.setCellValue(carbrand_dict);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(4);
				cell.setCellValue(carseries_dict);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(5);
				cell.setCellValue(cararea_dict);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(6);
				cell.setCellValue(membcardidz);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(7);
				cell.setCellValue(membtype_dict);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(8);
				cell.setCellValue(membjoindate);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(9);
				cell.setCellValue(sumpoint);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(10);
				cell.setCellValue(cstmnamez);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(11);
				cell.setCellValue(cstmtel);
				cell.setCellStyle(cs);
				
				cell = rowi.createCell(12);
				cell.setCellValue(cstmmobile);
				cell.setCellStyle(cs);
				
			}
			
			HSSFRow rowi = sheet.createRow(i+1);
			cell = rowi.createCell(0);
			cell.setCellValue("共有"+i+"条记录");
			cell.setCellStyle(cs);
		}
	}

	try {
		OutputStream os = response.getOutputStream();
		wb.write(os);
		os.flush();
		os.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	out.clear();
	out=pageContext.pushBody();
%>