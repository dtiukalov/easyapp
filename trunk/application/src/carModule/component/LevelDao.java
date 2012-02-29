package carModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import pointModule.component.Point;

public class LevelDao {
	Connection conn=null;
	public LevelDao(Connection conn){
		this.conn=conn;
	}
	
	/**
	 * 获得可以更改档案级别的车辆
	 * @return
	 */
	public List<Level> getCarList(String vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      List<Level> result = new ArrayList<Level>();
	     try {
	    	 String strSql=""; 
	    	 if(vin!=null && !"".equals(vin.trim())){
	    		strSql="select * from crm_car where ((carvin like 'LVH%' or carvin like 'JHM%') or ((carvin like 'LVH%' or carvin like 'JHM%') and carbrand='104001')) and carvin='"+vin+"'"; 
	 		}else{
	 			strSql="select * from crm_car where ((carvin like 'LVH%' or carvin like 'JHM%') or ((carvin like 'LVH%' or carvin like 'JHM%') and carbrand='104001')) and carcardlevel<>'101006'"; 
	 		}
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 while(rs.next()){
				 Level le=new Level();
				 le.setCardid(String.valueOf(rs.getLong("carid")));
				 le.setCarcardlevel(rs.getString("carcardlevel"));
				 le.setCarselldate(rs.getString("carselldate"));
				 le.setCarsource(rs.getString("carsource"));
				 le.setCarvin(rs.getString("carvin"));
				 result.add(le);
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
		return result;
	}
	/**
	 * 获得该车到店次数
	 * @return
	 */
	public long getServiceCount(String vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql="select count(*) from crm_service where carvin='"+vin+"'"; 
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 return rs.getLong(1);
			 }else{
				 return 0;
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
		return 0;
	}
	/**
	 * 插入日志
	 * @param cardid
	 * @param l_oldlevel
	 * @param l_newlevel
	 * @param l_type
	 * @param l_note
	 */
	public void insertLe(String cardid,String l_oldlevel,String l_newlevel,String l_type,String l_note){
	      Statement stmt=null; 
	     try {
			String strSql="insert into crm_levellog(cardid,l_oldlevel,l_newlevel,l_type,l_note) values('"+cardid+"','"+l_oldlevel+"','"+l_newlevel+"',"+l_type+",'"+l_note+"')"; 
			 
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
	 * 变更档案级别
	 * @param cardid
	 * @param carcardlevel
	 */
	public void updateCard(String cardid,String carcardlevel){
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car set carCardLevel='"+carcardlevel+"' where carid="+cardid; 
			 
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
	 * 获得公式返回结果
	 * @param carvin
	 * @return
	 */
	public long getMaxMin(String carvin){
		Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql="select max(a.servKilometer) maxk,min(a.servKilometer) mink from crm_service a " +
				"where a.carvin='"+carvin+"' " +
				"group by a.carvin";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 return (rs.getLong(1)-rs.getLong(2))/10000+1;
			 }else{
				 return 1;
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
		return 1;
		
	}
	/**
	 * 获得最大进厂时间
	 * @param carvin
	 * @return
	 */
	public String getMaxTime(String carvin){
		Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql="select max(a.servintime) maxt from crm_service a " +
				"where a.carvin='"+carvin+"' and (a.servintime is not null or a.servintime<>'') " +
				"group by a.carvin";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 return rs.getString(1);
			 }else{
				 return null;
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
		return null;
		
	}
	/**
	 * 获得最小进厂时间
	 * @param carvin
	 * @return
	 */
	public String getMinTime(String carvin){
		Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql="select min(a.servintime) mint from crm_service a " +
				"where a.carvin='"+carvin+"' and (a.servintime is not null or a.servintime<>'') " +
				"group by a.carvin";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 return rs.getString(1);
			 }else{
				 return null;
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
		return null;
		
	}
}
