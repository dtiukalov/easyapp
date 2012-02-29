<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
 String likevin=request.getParameter("query");
 String vinstring="";
 if(likevin!=null&&likevin.trim()!=""){
	 likevin=likevin.trim().toUpperCase();
	 Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ccio?useUnicode=true&amp;characterEncoding=utf-8", "root", "root");
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery("select * from crm_carinfo_view");
		
		
	      StringBuffer vins=new StringBuffer("");
	     try {
				String strSql="select carvin from crm_car where 1=1 "; 
				 if(likevin!=null&&likevin.trim()!=""){
					 strSql+="and carvin like '"+likevin+"%'";
				 }else{
					 strSql+="and 1=0 ";
				 }
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql);
				 int i=0;
				 while(rs.next()){
					 String vin=rs.getString("carvin");
					 if(i==0){
						 vins.append("'"+vin+"'");
					 }else{
						 vins.append(",'"+vin+"'");
					 }
					 i++;
				 }
				 vinstring="{query:'"+likevin+"',suggestions:["+vins.toString()+"],data:["+vins.toString()+"]}";
				 //System.out.println("语句执行成功1:"+rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				try {
					 rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
 			}
 }
		
				out.print(vinstring);
		%>