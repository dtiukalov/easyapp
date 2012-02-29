package carModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetListMore extends DefaultComponent {
	
	Connection conn=null;
	List<Map<String,String>> list = null;
	Map<String,String> map = null;
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		conn=parameterContext.getConnection();
		//list = new ArrayList<Map<String,String>>();
		map = new HashMap<String, String>();
		String vin = (String)parameterContext.getParameterValue(1);
		getCarMore(vin);
		getServMore(vin);
		//list.add(map);
		parameterContext.setParameter(0,map);
	}
	
	public void getCarMore(String vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 //String strSql="select * from crm_car where carvin='"+vin+"'"; 
	    	 String strSql="select * from crm_service where servtype in ('112001','112004') and carvin='"+vin+"' order by servintime desc"; 
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 map.put("carlmaintaintime", rs.getString("servintime")!=null?rs.getString("servintime"):"");
				 map.put("carlmaintainmile", rs.getString("servkilometer")!=null&&!"0".equals(rs.getString("servkilometer"))?rs.getString("servkilometer"):"");
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
	}
	public void getServMore(String vin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql="select * from crm_service where carvin='"+vin+"' order by servintime desc"; 
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 map.put("servintime", rs.getString("servintime")!=null?rs.getString("servintime"):"");
				 map.put("servkilometer", rs.getString("servkilometer")!=null?rs.getString("servkilometer"):"");
				 map.put("servitems", rs.getString("servitems")!=null?rs.getString("servitems"):"");
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
	}
}