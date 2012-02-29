package carModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetVinIn extends DefaultComponent {
	Connection conn=null;
	String min_servintime = null;
	String max_servintime = null;
	String min_servouttime = null;
	String max_servouttime = null;
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		conn=parameterContext.getConnection();
		//list = new ArrayList<Map<String,String>>();
		min_servintime = (String)parameterContext.getParameterValue(1);
		max_servintime = (String)parameterContext.getParameterValue(2);
		min_servouttime = (String)parameterContext.getParameterValue(3);
		max_servouttime = (String)parameterContext.getParameterValue(4);
		String inz=getServVin();
		parameterContext.setParameter(0,inz);
	}
	
	public String getServVin(){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 boolean tf=false;
	    	 String strSql="select carvin from crm_service where 1=1 "; 
	    	 if(min_servintime!=null&&!"".equals(min_servintime)){
	    		 strSql+="and substr(servinTime,1,10)>='"+min_servintime+"' ";
	    		 tf=true;
	    	 }
	    	 if(max_servintime!=null&&!"".equals(max_servintime)){
	    		 strSql+="and substr(servinTime,1,10)<='"+max_servintime+"' ";
	    		 tf=true;
	    	 }
	    	 if(min_servouttime!=null&&!"".equals(min_servouttime)){
	    		 strSql+="and substr(servOutTime,1,10)>='"+min_servouttime+"' ";
	    		 tf=true;
	    	 }
	    	 if(max_servouttime!=null&&!"".equals(max_servouttime)){
	    		 strSql+="and substr(servOutTime,1,10)<='"+max_servouttime+"' ";
	    		 tf=true;
	    	 }
	    	 //System.out.println(strSql);
	    	 if(tf){
	    		 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 int i=0;
				 while(rs.next()){
					String carvin = rs.getString(1);
						if(i==0){
							inz+="'"+carvin+"'";
						}else{
							inz+=",'"+carvin+"'";
						}
						i++;
				}
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
		if("".equals(inz.trim()))
			return null;
		else
			return inz;
	}
}