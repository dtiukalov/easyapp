package ccioModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetVinByLike extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String likevin = (String)parameterContext.getParameterValue(1);
		String vins=null;
		if(likevin!=null&&likevin.trim()!=""){
			vins=getVin(conn,likevin);
		}
		//System.out.println(vins);
		parameterContext.setParameter(0, vins);
	}
	private String getVin(Connection conn,String likevin){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      String vinstring=null;
	      StringBuffer vins=new StringBuffer("");
	     try {
				String strSql="select carvin from crm_car where 1=1 "; 
				 if(likevin!=null&&likevin.trim()!=""){
					 strSql+="and carvin like '%"+likevin+"%'";
				 }else{
					 strSql+="and 1=0 ";
				 }
				 strSql+="order by carvin limit 0,20 ";
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
				 vinstring="{query:'"+likevin+"',suggestions:["+vins.toString()+"],data:[]}";
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
			return vinstring;
	}
}