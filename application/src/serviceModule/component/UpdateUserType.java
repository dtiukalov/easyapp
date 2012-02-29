package serviceModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import carModule.component.Level;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class UpdateUserType extends DefaultComponent {
	Connection conn= null;
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		conn=parameterContext.getConnection();
		String usertype="";
		String vin = (String)parameterContext.getParameterValue(1);
		usertype=getServCount(vin);
		parameterContext.setParameter(0,usertype);//返回用户类别
	}
	
	public String getServCount(String vin){
			String usertype="";
			int i=0,j=0;
	      Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql=""; 
	    	 if(vin!=null && !"".equals(vin.trim())){
	    		 strSql="select * from crm_car where carvin='"+vin+"'"; 
		    		stmt=conn.createStatement(); 
					 rs=stmt.executeQuery(strSql); 
					 if(rs.next()){
						 String carsource=rs.getString("carsource");
						 if("103001".equals(carsource)){
							 //自店
							 i=1;
						 }else{
							//它店
							 i=2;
						 }
					 }
	    		strSql="select count(*) from crm_service where carvin='"+vin+"'"; 
	    		stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 if(rs.next()){
					 long countz=rs.getLong(1);
					 if(countz==0){
						 //新到店
						 j=1;
					 }else if(countz>0){
						 //老到店
						 j=2;
					 }
				 }
	 		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
	        try {
	        	if(rs!=null){
	        		rs.close();
	        	}
	        	if(stmt!=null){
	        		stmt.close();
	        	}
				
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(i==1&&j==1){
			//自新店
			usertype="109002";
		}else if(i==1&&j==2){
			//自老店
			usertype="109001";
		}else if(i==2&&j==1){
			//他新店
			usertype="109004";
		}else if(i==2&&j==2){
			//它老店
			usertype="109003";
		}
		return usertype;
	}
}