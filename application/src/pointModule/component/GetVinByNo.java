package pointModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetVinByNo extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String carlicenceno = (String)parameterContext.getParameterValue(1);
		String carengineno = (String)parameterContext.getParameterValue(2);
		String p_vin=null;
		if((carlicenceno!=null&&carlicenceno.trim()!="")||(carengineno!=null&&carengineno.trim()!="")){
			p_vin=getVin(conn,carlicenceno,carengineno);
		}
		parameterContext.setParameter(0, p_vin);
	}
	
	private String getVin(Connection conn,String carlicenceno,String carengineno){
	      Statement stmt=null; 
	      ResultSet rs=null; 
		String vin=null;
	     try {
				String strSql="select carvin from crm_car where 1=1 "; 
				 if(carlicenceno!=null&&carlicenceno.trim()!=""){
					 strSql+="and carLicenceNo='"+carlicenceno+"'";
				 }
				 if(carengineno!=null&&carengineno.trim()!=""){
					 strSql+="and carEngineNo='"+carengineno+"'";
				 }
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 if(rs.next()){
					 vin=rs.getString("carVin");
				 }
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
			return vin;
	}
}