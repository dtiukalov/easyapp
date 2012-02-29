package ccioModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class AddCarList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		String card = (String)parameterContext.getParameterValue(0);
		String vin = (String)parameterContext.getParameterValue(1);
		String q_date = (String)parameterContext.getParameterValue(2);
		if(card!=null&&card.trim()!=""){//到店卡
			setCarQueue(conn,card);
		}else if(vin!=null&&vin.trim()!=""){//总值输入
			setIOCardByVin(conn,vin,q_date);
		}
		
		parameterContext.setParameter(0, card);
		parameterContext.setParameter(1, vin);
	}
	private void setCarQueue(Connection conn,String card){
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
				 String carln="";
				 String vin="";
				 if(rs.next()){
					 id=rs.getString("carcardid");
					 carln=rs.getString("carlicenceno");
					 vin=rs.getString("carvin");
				 }
				 if(id!=null&&!"".equals(id.trim())){
					 strSql="insert into crm_carqueue(q_carid,q_card,q_carln,q_vin) values('"+id+"','"+card+"','"+carln+"','"+vin+"')"; 
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
	private void setIOCardByVin(Connection conn,String vinz,String q_date){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      StringBuffer vins=new StringBuffer("");
	     try {
				String strSql="select * from crm_car where 1=1 "; 
				 if(vinz!=null&&vinz.trim()!=""){
					 strSql+="and carvin='"+vinz+"'";
				 }else{
					 strSql+="and 1=0 ";
				 }
				 strSql+="order by carcardid limit 0,10 ";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql);
				 String id="";
				 String carln="";
				 String vin="";
				 if(rs.next()){
					 id=rs.getString("carcardid");
					 carln=rs.getString("carlicenceno");
					 vin=rs.getString("carvin");
				 }
				 if(id!=null&&!"".equals(id.trim())){
					 String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					 if(q_date!=null&&q_date.trim()!=""){
						 strSql="insert into crm_iodate(i_indate,i_date,i_type,i_vin,i_carln) values('"+q_date+"','"+now+"',2,'"+vinz+"','"+carln+"')";
					 }else{
						 strSql="insert into crm_iodate(i_indate,i_date,i_type,i_vin,i_carln) values('"+now+"','"+now+"',2,'"+vinz+"','"+carln+"')";
					 }
					 stmt=conn.createStatement(); 
					 stmt.executeUpdate(strSql);
				 }else{
					 //不在档案中的数据
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
	
	private void setCarQueueByVin(Connection conn,String vinz,String q_date){
	      Statement stmt=null; 
	      ResultSet rs=null; 
	      StringBuffer vins=new StringBuffer("");
	     try {
				String strSql="select * from crm_car where 1=1 "; 
				 if(vinz!=null&&vinz.trim()!=""){
					 strSql+="and carvin='"+vinz+"'";
				 }else{
					 strSql+="and 1=0 ";
				 }
				 strSql+="order by carcardid limit 0,10 ";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql);
				 String id="";
				 String carln="";
				 String vin="";
				 if(rs.next()){
					 id=rs.getString("carcardid");
					 carln=rs.getString("carlicenceno");
					 vin=rs.getString("carvin");
				 }
				 if(id!=null&&!"".equals(id.trim())){
					 if(q_date!=null&&q_date.trim()!=""){
						 strSql="insert into crm_carqueue(q_carid,q_card,q_carln,q_vin,q_date) values('"+id+"','0','"+carln+"','"+vin+"','"+q_date+"')";
					 }else{
						 strSql="insert into crm_carqueue(q_carid,q_card,q_carln,q_vin) values('"+id+"','0','"+carln+"','"+vin+"')";
					 }
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