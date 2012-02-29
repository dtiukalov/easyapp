package ccioModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetQueueList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String card = (String)parameterContext.getParameterValue(0);
		getCarQueue(conn,card);
		parameterContext.setParameter(0, card);
	}
	private void getCarQueue(Connection conn,String card){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      StringBuffer vins=new StringBuffer("");
	     try {
				String strSql="select * from crm_binding a, crm_car b where a.b_vin=b.carvin "; 
				 if(card!=null&&card.trim()!=""){
					 strSql+="and a.b_card='"+card+"'";
				 }else{
					 strSql+="and 1=0 ";
				 }
				 strSql+="order by carcardid limit 0,10 ";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql);
				 String id="";
				 if(rs.next()){
					 id=rs.getString("carcardid");
				 }
				 if(id!=null&&!"".equals(id.trim())){
					 strSql="insert into crm_carqueue(q_carid,q_card) values('"+id+"','"+card+"')"; 
					 stmt=conn.createStatement(); 
					 stmt.executeUpdate(strSql);
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
	}
}