package pointModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

public class PointDao {
	Connection conn=null;
	public PointDao(Connection conn){
		this.conn=conn;
	}
	/**
	 * 插入积分明细
	 * @param p_title
	 * @param pr_title
	 * @param pl_point
	 */
	public void insertPL(String p_title,String pr_title,int pl_point){
	      Statement stmt=null; 
	      ResultSet rs=null; 
		
	     try {
			String strSql="insert into crm_pointlog(p_title,pr_title,pl_point) values('"+p_title+"','"+pr_title+"',"+pl_point+")"; 
			 stmt=conn.createStatement(); 
			 stmt.executeUpdate(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
	        try {
				 stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
      }
	}
	/**
	 * 检查是否3月或6月内到店
	 * @param vin
	 * @param calendar
	 * @return
	 */
	public int getService(String vin,Calendar calendar){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String p_date=null;
	      int point=0;
	     try {
	    	 calendar.add(Calendar.MONTH, -3);
		     p_date=dateFormat.format(calendar.getTime());
	    	 String strSql="select count(*) from crm_service where carvin='"+vin+"' and servInTime>'"+p_date+"'"; 
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 rs.next();
			 //System.out.println("语句执行成功1:"+rs);
			 int a= rs.getInt(1);
			 if(a>0){
				 point=5;
			 }else{
				 calendar.add(Calendar.MONTH, -6);
				 p_date=dateFormat.format(calendar.getTime());
		    	 strSql="select count(*) from crm_service where carvin='"+vin+"' and servInTime>'"+p_date+"'"; 
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 rs.next();
				 //System.out.println("语句执行成功2:"+rs);
				 a= rs.getInt(1);
				 if(a>0){
					 point=2;
				 }else{
					 point=0;
				 }
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
	        try {
				rs.close();
				stmt.close();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
      }
		return point;
	}
	/**
	 * 插入积分本次总操作
	 * @param p_title
	 * @param p_vin
	 * @param p_addpoint
	 * @param p_sumpoint
	 * @param p_date
	 */
	public void insertP(String p_title,String p_vin,String p_oid,int p_addpoint,int p_sumpoint,String p_date,int p_state,String p_note){
	      Statement stmt=null; 
	      ResultSet rs=null; 
		
	     try {
			String strSql="insert into crm_point(p_title,p_vin,p_oid,p_addpoint,p_sumpoint,p_date,p_state,p_note) values('"+p_title+"','"+p_vin+"','"+p_oid+"',"+p_addpoint+","+p_sumpoint+",'"+p_date+"',"+p_state+",'"+p_note+"')"; 
			 
			 stmt=conn.createStatement(); 
			 stmt.executeUpdate(strSql); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
	        try {
				 stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
      }
	}
	/**
	 * 获得汇总积分情况
	 * @param p_vin
	 * @return
	 */
	public int getAddPoint(String p_vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      int addpoint=0;
	     try {
				String strSql="select sum(p_addpoint) from crm_point where p_vin='"+p_vin+"' and p_state=1"; 
				 
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 rs.next();
				 addpoint= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
	    }
			return addpoint;
	}
	public int getDecPoint(String p_vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      int decpoint=0;
	     try {
	    	 String strSql="select sum(p_decpoint) from crm_point where p_vin='"+p_vin+"' and p_state=1";  
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 rs.next();
				 decpoint= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
	    }
			return decpoint;
	}
	public int getSumPoint(String p_vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      int sumpoint=0;
	     try {
	    	 String strSql="select sum(p_sumpoint) from crm_point where p_vin='"+p_vin+"' and p_state=1";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 rs.next();
				 sumpoint= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
	    }
			return sumpoint;
	}
	
	/**
	 * 按主键或得积分规则
	 * @param pr_id
	 * @return
	 */
	public Point getPRById(String pr_id){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      Point p= null;
	     try {
	    	 String strSql="select * from crm_pointrule where pr_id='"+pr_id+"'";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 if(rs.next()){
					 p=new Point();
					 p.setPr_title(rs.getString("pr_title"));
					 p.setPr_point(rs.getInt("pr_point"));
				 }
				 //rs.next();
				 //sumpoint= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
	    }
			return p;
	}
	/**
	 * 按vin获得有积分列表
	 * @param vin
	 * @return
	 */
	public List<Point> getPByVIN(String vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      List<Point> result = new ArrayList<Point>();
	     try {
	    	 String strSql="select * from crm_point where p_vin='"+vin+"' and p_state=1 and p_sumpoint>0 order by p_date,p_id";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 while(rs.next()){
					 Point p=new Point();
					 p.setP_id(rs.getLong("p_id"));
					 p.setP_sumpoint(rs.getInt("p_sumpoint"));
					 p.setP_decpoint(rs.getInt("p_decpoint"));
					 result.add(p);
				 }
				 //sumpoint= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
		        try {
					 stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		       
	    }
			return result;
	}
	/**
	 * 按id修改兑换积分
	 * @param p_id
	 * @param p_decpoint
	 * @param p_sumpoint
	 */
	public void UpdatePById(long p_id,int p_decpoint,int p_sumpoint){
	      Statement stmt=null; 
	     try {
			String strSql="update crm_point set p_decpoint="+p_decpoint+",p_sumpoint="+p_sumpoint+" where p_id="+p_id; 
			 
			 stmt=conn.createStatement(); 
			 stmt.executeUpdate(strSql); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
	        try {
				 stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
		}
	}
	/**
	 * 检测此工单是否已经积分
	 * @param p_oid
	 * @return
	 */
	public int getIsPoint(String p_oid){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      int boo=0;
	     try {
	    	 String strSql="select count(*) from crm_point where p_oid='"+p_oid+"' and p_state=1";  
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 rs.next();
				 boo= rs.getInt(1);
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
			return boo;
	}
}
