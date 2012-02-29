package memberModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import carModule.component.LevelDao;
import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnDictionaryManager;

public class GetMemberList extends DefaultComponent {
	private String carlicenceno;
	private String carcardid;
	private String carvin;
	private String carbrand;
	private String carseries;
	private String carmodel;
	private String cararea;
	private String cstmname;
	private String min_membjoindate;
	private String max_membjoindate;
	private String min_sumpoint;
	private String max_sumpoint;
	private String membcardid;
	private String membtype;
	private String startIndex;
	private String endIndex;

	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		carvin = (String)parameterContext.getParameterValue(2);
		carbrand = (String)parameterContext.getParameterValue(3);
		carseries = (String)parameterContext.getParameterValue(4);
		carmodel = (String)parameterContext.getParameterValue(5);
		cararea = (String)parameterContext.getParameterValue(6);
		cstmname = (String)parameterContext.getParameterValue(7);
		min_membjoindate = (String)parameterContext.getParameterValue(8);
		max_membjoindate = (String)parameterContext.getParameterValue(9);
		min_sumpoint = (String)parameterContext.getParameterValue(10);
		max_sumpoint = (String)parameterContext.getParameterValue(11);
		membcardid = (String)parameterContext.getParameterValue(12);
		membtype = (String)parameterContext.getParameterValue(13);
		startIndex = (String)parameterContext.getParameterValue(14);
		endIndex = ""+(Integer.parseInt(parameterContext.getParameterValue(15).toString())+1-Integer.parseInt(startIndex));
		carlicenceno = (String)parameterContext.getParameterValue(16);
		carcardid = (String)parameterContext.getParameterValue(17);
		
		parameterContext.setParameter(0,getList(conn));
		parameterContext.setParameter(1,getCount(conn));
	}
	
	public List getList(Connection conn){
		String sql="select " +
				"a.carvin as carvin," +
				"a.memberid as memberid," +
				"a.membtype as membtype," +
				"a.membcardid as membcardid," +
				"a.membjoindate as membjoindate," +
				"a.membenjoyed as membenjoyed," +
				"a.membenjoying as membenjoying," +
				"b.cararea as cararea," +
				"b.carcardid as carcardid," +
				"b.carmodel as carmodel," +
				"b.carbrand as carbrand," +
				"b.carseries as carseries," +
				"b.carlicenceno as carlicenceno," +
				"c.cstmname as cstmname," +
				"c.cstmtel as cstmtel," +
				"c.cstmmobile as cstmmobile," +
				"d.sumpoint as sumpoint " +
				"from crm_member a left join crm_car b on a.carvin=b.carvin left join crm_customer c on a.carvin=c.carvin left join " +
				"(" +
				"select p_vin,sum(p_sumpoint) sumpoint from crm_point " +
				"where p_state=1 group by p_vin" +
				") d on a.carvin=d.p_vin " +
				"where 1=1 and a.membjoindate>='2010-01-01' "; 
	    if(carlicenceno!=null&&!"".equals(carlicenceno)){
	    	sql+="and b.carlicenceno like '%"+carlicenceno+"%'";
	    }
	    if(carcardid!=null&&!"".equals(carcardid)){
	    	sql+="and b.carcardid='"+carcardid+"'";
	    }
	    if(carvin!=null&&!"".equals(carvin)){
	    	sql+="and a.carvin like '%"+carvin+"%'";
	    }
	    if(carbrand!=null&&!"".equals(carbrand)){
	    	sql+="and b.carbrand='"+carbrand+"'";
	    }
	    if(carseries!=null&&!"".equals(carseries)){
	    	sql+="and b.carseries='"+carseries+"'";
	    }
	    if(carmodel!=null&&!"".equals(carmodel)){
	    	sql+="and b.carmodel='"+carmodel+"'";
	    }
	    
	    if(cararea!=null&&!"".equals(cararea)){
	    	sql+="and b.cararea='"+cararea+"'";
	    }
	    if(cstmname!=null&&!"".equals(cstmname)){
	    	sql+="and c.cstmname like '%"+cstmname+"%'";
	    }
	    if(min_membjoindate!=null&&!"".equals(min_membjoindate)){
	    	sql+="and a.membjoindate>='"+min_membjoindate+"'";
	    }
	    if(max_membjoindate!=null&&!"".equals(max_membjoindate)){
	    	sql+="and a.membjoindate<='"+max_membjoindate+"'";
	    }
	    if(min_sumpoint!=null&&!"".equals(min_sumpoint)){
	    	sql+="and d.sumpoint>='"+min_sumpoint+"'";
	    }
	    if(max_sumpoint!=null&&!"".equals(max_sumpoint)){
	    	sql+="and d.sumpoint<='"+max_sumpoint+"'";
	    }
	    if(membcardid!=null&&!"".equals(membcardid)){
	    	sql+="and a.membcardid='"+membcardid+"'";
	    }
	    if(membtype!=null&&!"".equals(membtype)){
	    	sql+="and a.membtype='"+membtype+"'";
	    }
	    sql+=" order by a.membjoindate desc,a.memberid limit "+startIndex+","+endIndex;
	    //System.out.println(sql);
	    Statement stmt=null; 
	      ResultSet rs=null; 
	      List<Map<String, String>> ml= new ArrayList<Map<String, String>>();
	     try {
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(sql);
			 SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
			 while(rs.next()){
				 Map<String, String> mvo=new HashMap<String, String>();
				 mvo.put("carvin",rs.getString("carvin"));
				 mvo.put("memberid",rs.getString("memberid"));
				 mvo.put("membtype",rs.getString("membtype"));
				 mvo.put("membcardid",rs.getString("membcardid"));
				 mvo.put("membjoindate",rs.getString("membjoindate"));
				 mvo.put("membenjoyed",rs.getString("membenjoyed"));
				 mvo.put("membenjoying",rs.getString("membenjoying"));
				 mvo.put("cararea",rs.getString("cararea"));
				 mvo.put("carcardid",rs.getString("carcardid"));
				 mvo.put("carmodel",rs.getString("carmodel"));
				 mvo.put("carbrand",rs.getString("carbrand"));
				 mvo.put("carseries",rs.getString("carseries"));
				 mvo.put("carlicenceno",rs.getString("carlicenceno"));
				 mvo.put("cstmname",rs.getString("cstmname"));
				 mvo.put("cstmtel",rs.getString("cstmtel"));
				 mvo.put("cstmmobile",rs.getString("cstmmobile"));
				 mvo.put("sumpoint",rs.getString("sumpoint"));
				 
				 try{
					 mvo.put("carmodel_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carmodel")).getValue());
				 }catch(Exception e){
					 mvo.put("carmodel_dict",rs.getString("carmodel"));
				 }
				 try{
					 mvo.put("carbrand_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carbrand")).getValue());
				 }catch(Exception e){
					 mvo.put("carbrand_dict",rs.getString("carbrand"));
				 }
				 try{
					 mvo.put("carseries_dict",inst.getDataDictItemInfo("crm_carModel", rs.getString("carseries")).getValue());
				 }catch(Exception e){
					 mvo.put("carseries_dict",rs.getString("carseries"));
				 }
				 try{
					 mvo.put("cararea_dict",inst.getDataDictItemInfo("crm_carArea", rs.getString("cararea")).getValue());
				 }catch(Exception e){
					 mvo.put("cararea_dict",rs.getString("cararea"));
				 }
				 try{
					 mvo.put("membtype_dict",inst.getDataDictItemInfo("crm_membType", rs.getString("membtype")).getValue());
				 }catch(Exception e){
					 mvo.put("membtype_dict",rs.getString("membtype"));
				 }
				 
				 ml.add(mvo);
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
		return ml;
	}
	
	public long getCount(Connection conn){
		String sql="select count(*) from crm_member a left join crm_car b on a.carvin=b.carvin left join crm_customer c on a.carvin=c.carvin left join " +
				"(" +
				"select p_vin,sum(p_sumpoint) sumpoint from crm_point " +
				"where p_state=1 group by p_vin" +
				") d on a.carvin=d.p_vin " +
				"where 1=1 and a.membjoindate>='2010-01-01' "; 
	    if(carlicenceno!=null&&!"".equals(carlicenceno)){
	    	sql+="and b.carlicenceno like '%"+carlicenceno+"%'";
	    }
	    if(carcardid!=null&&!"".equals(carcardid)){
	    	sql+="and b.carcardid='"+carcardid+"'";
	    }
	    if(carvin!=null&&!"".equals(carvin)){
	    	sql+="and a.carvin like '%"+carvin+"%'";
	    }
	    if(carbrand!=null&&!"".equals(carbrand)){
	    	sql+="and b.carbrand='"+carbrand+"'";
	    }
	    if(carseries!=null&&!"".equals(carseries)){
	    	sql+="and b.carseries='"+carseries+"'";
	    }
	    if(carmodel!=null&&!"".equals(carmodel)){
	    	sql+="and b.carmodel='"+carmodel+"'";
	    }
	    
	    if(cararea!=null&&!"".equals(cararea)){
	    	sql+="and b.cararea='"+cararea+"'";
	    }
	    if(cstmname!=null&&!"".equals(cstmname)){
	    	sql+="and c.cstmname like '%"+cstmname+"%'";
	    }
	    if(min_membjoindate!=null&&!"".equals(min_membjoindate)){
	    	sql+="and a.membjoindate>='"+min_membjoindate+"'";
	    }
	    if(max_membjoindate!=null&&!"".equals(max_membjoindate)){
	    	sql+="and a.membjoindate<='"+max_membjoindate+"'";
	    }
	    if(min_sumpoint!=null&&!"".equals(min_sumpoint)){
	    	sql+="and d.sumpoint>='"+min_sumpoint+"'";
	    }
	    if(max_sumpoint!=null&&!"".equals(max_sumpoint)){
	    	sql+="and d.sumpoint<='"+max_sumpoint+"'";
	    }
	    if(membcardid!=null&&!"".equals(membcardid)){
	    	sql+="and a.membcardid='"+membcardid+"'";
	    }
	    if(membtype!=null&&!"".equals(membtype)){
	    	sql+="and a.membtype='"+membtype+"'";
	    }
	    //sql+=" order by a.memberid limit "+startIndex+","+endIndex;
	    //System.out.println("--"+sql);
	    Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	      List<Map<String, String>> ml= new ArrayList<Map<String, String>>();
	     try {
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(sql);
			 
			 SaturnDictionaryManager inst = SaturnDictionaryManager.getInstance();
			 if(rs.next()){
				 count=rs.getLong(1);
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
		return count;
	}
}