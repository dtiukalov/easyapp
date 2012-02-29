package ccioModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetVinByCard extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String card = (String)parameterContext.getParameterValue(1);
		String b_vin=null;
		if(card!=null&&card.trim()!=""){
			b_vin=getVin(conn,card);
		}
		parameterContext.setParameter(0, b_vin);
	}
	private String getVin(Connection conn,String card){
	      Statement stmt=null; 
	      ResultSet rs=null; 
		String vin=null;
	     try {
				String strSql="select b_vin from crm_binding where 1=1 "; 
				 if(card!=null&&card.trim()!=""){
					 strSql+="and b_card='"+card+"'";
				 }
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 if(rs.next()){
					 vin=rs.getString("b_vin");
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