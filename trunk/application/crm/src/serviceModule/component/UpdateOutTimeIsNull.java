package serviceModule.component;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class UpdateOutTimeIsNull extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String serviceid = (String)parameterContext.getParameterValue(0);
		String servouttime = (String)parameterContext.getParameterValue(1);
		if(servouttime==null||"".equals(servouttime.trim())){
			Update(conn,serviceid);
		}
	}
	public void Update(Connection conn,String serviceid){
	      Statement stmt=null; 
	     try {
			String strSql="update crm_service set servouttime=null where serviceid='"+serviceid+"'"; 
			 
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
}