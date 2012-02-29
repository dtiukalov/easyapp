package reportModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import carModule.component.Level;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class Report1 extends DefaultComponent {
	Connection conn= null;
	String[][] report = null;
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		conn=parameterContext.getConnection();
		String datetime = (String)parameterContext.getParameterValue(0);//时间
		//售后分析类型：接车：jc 预约：yy 机油：jy 投保：tb 精品：jp 养护：yh 索赔：sp
		String typez = (String)parameterContext.getParameterValue(2);//类型
		String jycount="0";
		if(datetime!=null&&typez!=null){
			if("jc".equals(typez)){//接车情况
				getWaiter(8);
				if(report!=null){
					//当日接车台次
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
			        String inz = getCount1_in(datetime);
			        if(inz!=null&&!"".equals(inz.trim())){
			        	for(int j=1;j<dq.length;j++){
				        	long count=getCount1(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
			        //当日接车金额
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChange1(datetime, report[0][j]);
			        	long sumchange_jp=getSumChangeJP1(datetime,report[0][j]);
			        	sum+=sumchange+sumchange_jp;
			        	dq[j]=""+(sumchange+sumchange_jp);
			        }
			        dq[0]=""+sum;
			      //当日接车未录
			        sum=0;
			        inz = getCount2_in(datetime);
			        dq = report[4];//当前行
			        if(inz!=null&&!"".equals(inz.trim())){
				        for(int j=1;j<dq.length;j++){
				        	long count=getCount2(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
			      //当月接车台次
					sum=0;//第一列总计
			        inz = getCount3_in(datetime);
			        dq = report[5];//当前行
			        if(inz!=null&&!"".equals(inz.trim())){
				        for(int j=1;j<dq.length;j++){
				        	long count=getCount3(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
			      //当月接车金额
			        sum=0;
			        dq = report[6];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChange2(datetime, report[0][j]);
			        	long sumchange_jp=getSumChangeJP2(datetime,report[0][j]);
			        	sum+=sumchange+sumchange_jp;
			        	dq[j]=""+(sumchange+sumchange_jp);
			        }
			        dq[0]=""+sum;
			      //当月接车未录
			        sum=0;
			        inz = getCount4_in(datetime);
			        dq = report[7];//当前行
			        if(inz!=null&&!"".equals(inz.trim())){
				        for(int j=1;j<dq.length;j++){
				        	long count=getCount4(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
				}
			}else if("yy".equals(typez)){//招揽预约
				getWaiter(6);
				if(report!=null){
					//当日预约
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
		        	for(int j=1;j<dq.length;j++){
			        	long count=getCountYY1(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			        //当月预约
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long count=getCountYY2(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			      //当日成功预约
			        sum=0;
			        dq = report[4];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long count=getCountYY3(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			      //当月成功预约
					sum=0;//第一列总计
			        dq = report[5];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long count=getCountYY4(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
				}
			}else if("jy".equals(typez)){//节余机油
				getWaiter(4);
				if(report!=null){
					//当日机油
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
		        	for(int j=1;j<dq.length;j++){
			        	long count=getCountJY1(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			        //当月机油
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long count=getCountJY2(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			      //现存机油
			        jycount=getCountJY3()+"";
				}
			}else if("tb".equals(typez)){//投保台次
				getWaiter(4);
				if(report!=null){
					//当日投保
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
		        	for(int j=1;j<dq.length;j++){
			        	long count=getCountTB1(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
			        //当月投保
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long count=getCountTB2(datetime,report[0][j]);
			        	sum+=count;
			        	dq[j]=""+count;
			        }
			        dq[0]=""+sum;
				}
			}else if("jp".equals(typez)){//精品金额
				getWaiter(4);
				if(report!=null){
					//当日精品
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
		        	for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChangeJP1(datetime,report[0][j]);
			        	sum+=sumchange;
			        	dq[j]=""+sumchange;
			        }
			        dq[0]=""+sum;
			        //当月精品
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChangeJP2(datetime,report[0][j]);
			        	sum+=sumchange;
			        	dq[j]=""+sumchange;
			        }
			        dq[0]=""+sum;
				}
			}else if("yh".equals(typez)){//养护品金额
				getWaiter(4);
				if(report!=null){
					//当日养护品
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
		        	for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChangeYH1(datetime,report[0][j]);
			        	sum+=sumchange;
			        	dq[j]=""+sumchange;
			        }
			        dq[0]=""+sum;
			        //当月养护品
			        sum=0;
			        dq = report[3];//当前行
			        for(int j=1;j<dq.length;j++){
			        	long sumchange=getSumChangeYH2(datetime,report[0][j]);
			        	sum+=sumchange;
			        	dq[j]=""+sumchange;
			        }
			        dq[0]=""+sum;
				}
			}else if("sp".equals(typez)){//索赔台次
				getWaiter(4);
				if(report!=null){
					//当日索赔
					long sum=0;//第一列总计
					String[] dq = report[2];//当前行
					String inz = getCount5_in(datetime);
			        if(inz!=null&&!"".equals(inz.trim())){
			        	for(int j=1;j<dq.length;j++){
				        	long count=getCountSP1(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
			        //当月索赔
			        sum=0;
			        dq = report[3];//当前行
			        inz = getCount6_in(datetime);
			        if(inz!=null&&!"".equals(inz.trim())){
				        for(int j=1;j<dq.length;j++){
				        	long count=getCountSP2(datetime,report[0][j],inz);
				        	sum+=count;
				        	dq[j]=""+count;
				        }
				        dq[0]=""+sum;
			        }
				}
			}
			/*if(report!=null){
				//打印结果
				for(int i=0;i<report.length;i++){   
			        String[] d = report[i]; 
			        for(int j=0;j<d.length;j++){
			        	System.out.print(report[i][j]+"\t");
			        }
			        System.out.println();
				 }
			}*/
		}
		parameterContext.setParameter(1,report);
		parameterContext.setParameter(3,jycount);
	}
	/**
	 * 获得接待人员
	 */
	public void getWaiter(int rowcount){
		Statement stmt=null; 
	      ResultSet rs=null; 
	     try {
	    	 String strSql = "select count(*) from saturn_dict where TYPE='crm_waiter' and (HIDDEN_FLAG!=1 or HIDDEN_FLAG is null or HIDDEN_FLAG='')";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 if(rs.getInt(1)>0){
					 report = new String[rowcount][rs.getInt(1)+1];
					 for(int i=0;i<report.length;i++){   
				        String[] d = report[i]; 
				        for(int j=0;j<d.length;j++){
				        	report[i][j]="0";
				        }
					 }
				 }
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
	         if(report!=null){
		         strSql = "select * from saturn_dict where TYPE='crm_waiter' and (HIDDEN_FLAG!=1 or HIDDEN_FLAG is null or HIDDEN_FLAG='')";
				 stmt=conn.createStatement(); 
				 rs=stmt.executeQuery(strSql); 
				 report[1][0]= "总计";
				 for(int i=1;rs.next();i++){
					 String code=rs.getString("code");
					 String value=rs.getString("value");
					 report[0][i]=code;
					 report[1][i]=value;
				 }
				 if(rs!=null)
					rs.close();
		         if(stmt!=null)
					stmt.close();
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
	/**
	 * 获得日接车台次
	 */
	public long getCount1(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_service "
	    		 +"where 1=1 "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and substr(servinTime,1,10) ='"+datetime+"' "
	    		 +"and servOrderId is not null and servOrderId!='' "
	    		 +"and (carvin,servinTime) in ("+inz+")";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 去除当日重复进厂后的 当日进厂车辆
	 * @param datetime
	 * @return
	 */
	public String getCount1_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,10) ='"+datetime+"'  "
		 		+"and servOrderId is not null and servOrderId!='' "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
	/**
	 * 当日接车金额
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChange1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(servAmountExp) sumexp "
	    		 +"from crm_service  "
	    		 +"where 1=1 "
	    		 +"and	substr(servOutTime,1,10) ='"+datetime+"' "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and servOrderId is not null and servOrderId!=''";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 获得日接车台次 未录
	 */
	public long getCount2(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_service "
	    		 +"where 1=1 "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and substr(servinTime,1,10) ='"+datetime+"' "
	    		 +"and (servOrderId is null or servOrderId='') "
	    		 +"and (carvin,servinTime) in ("+inz+")";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 去除当日重复进厂后的 当日进厂未录车辆
	 * @param datetime
	 * @return
	 */
	public String getCount2_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,10) ='"+datetime+"'  "
		 		+"and (servOrderId is null or servOrderId='') "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
	/**
	 * 获得月接车台次
	 */
	public long getCount3(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_service "
	    		 +"where 1=1 "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and substr(servinTime,1,7)=substr('"+datetime+"',1,7) "
	    		 +"and substr(servinTime,1,10)<=substr('"+datetime+"',1,10) "
	    		 +"and servOrderId is not null and servOrderId!='' "
	    		 +"and (carvin,servinTime) in ("+inz+")";
	    	 //System.out.println(strSql);
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 去除当月重复进厂后的 当月进厂车辆
	 * @param datetime
	 * @return
	 */
	public String getCount3_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,7) =substr('"+datetime+"',1,7)  "
		 		+"and servOrderId is not null and servOrderId!='' "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
	/**
	 * 当月接车金额
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChange2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(servAmountExp) sumexp "
	    		 +"from crm_service  "
	    		 +"where 1=1 "
	    		 +"and	substr(servOutTime,1,7)=substr('"+datetime+"',1,7) "
	    		 +"and	substr(servOutTime,1,10)<=substr('"+datetime+"',1,10) "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and servOrderId is not null and servOrderId!=''";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 获得月接车台次 未录
	 */
	public long getCount4(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_service "
	    		 +"where 1=1 "
	    		 +"and servStaff='"+waiter+"' "
	    		 +"and substr(servinTime,1,7) =substr('"+datetime+"',1,7) "
	    		 +"and substr(servinTime,1,10) <=substr('"+datetime+"',1,10) "
	    		 +"and (servOrderId is null or servOrderId='') "
	    		 +"and (carvin,servinTime) in ("+inz+")";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 去除当月重复进厂后的 当月进厂未录车辆
	 * @param datetime
	 * @return
	 */
	public String getCount4_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,7) =substr('"+datetime+"',1,7)  "
		 		+"and (servOrderId is null or servOrderId='') "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
	/**
	 * 预约 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountYY1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_reserve "
				+"where 1=1  "
				+"and servStaff='"+waiter+"' "
				+"and substr(servOrderDate,1,10)=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 预约 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountYY2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_reserve "
				+"where 1=1  "
				+"and servStaff='"+waiter+"' "
				+"and substr(servOrderDate,1,7)=substr('"+datetime+"',1,7)"
				+"and substr(servOrderDate,1,10)<=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 成功预约 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountYY3(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_reserve "
				+"where 1=1  "
				+"and servStaff='"+waiter+"' "
				+"and resvstate in ('128002','128004')"
				+"and substr(servOrderDate,1,10)=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 成功预约 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountYY4(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_reserve "
				+"where 1=1  "
				+"and servStaff='"+waiter+"' "
				+"and resvstate in ('128002','128004')"
				+"and substr(servOrderDate,1,7)=substr('"+datetime+"',1,7)"
				+"and substr(servOrderDate,1,10)<=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 机油 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountJY1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_oil "
				+"where 1=1  "
				+"and oilStaff='"+waiter+"' "
				+"and substr(oilStoreTime,1,10)=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 机油 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountJY2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_oil "
				+"where 1=1  "
				+"and oilStaff='"+waiter+"' "
				+"and substr(oilStoreTime,1,7)=substr('"+datetime+"',1,7)"
				+"and substr(oilStoreTime,1,10)<=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 机油 现存
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountJY3(){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_oil ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 投保 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountTB1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_insurance "
				+"where 1=1  "
				+"and insustaff='"+waiter+"' "
				+"and substr(insuDate,1,10)=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 投保 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountTB2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(*) from crm_insurance "
				+"where 1=1  "
				+"and insustaff='"+waiter+"' "
				+"and substr(insuDate,1,7)=substr('"+datetime+"',1,7)"
				+"and substr(insuDate,1,10)<=substr('"+datetime+"',1,10)";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 精品 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChangeJP1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(partsExpense) "
	    		 +"from crm_parts  "
	    		 +"where 1=1 "
	    		 +"and	substr(partsOutTime,1,10)=substr('"+datetime+"',1,10) "
	    		 +"and partsStaff='"+waiter+"' ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 精品 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChangeJP2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(partsExpense) "
	    		 +"from crm_parts  "
	    		 +"where 1=1 "
	    		 +"and	substr(partsOutTime,1,7)=substr('"+datetime+"',1,7) "
	    		 +"and	substr(partsOutTime,1,10)<=substr('"+datetime+"',1,10) "
	    		 +"and partsStaff='"+waiter+"' ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 养护品 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChangeYH1(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(careExpense) "
	    		 +"from crm_care  "
	    		 +"where 1=1 "
	    		 +"and	substr(careOutTime,1,10)=substr('"+datetime+"',1,10) "
	    		 +"and careStaff='"+waiter+"' ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 养护品 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getSumChangeYH2(String datetime,String waiter){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long sum=0;
	     try {
	    	 String strSql = "select SUM(careExpense) "
	    		 +"from crm_care  "
	    		 +"where 1=1 "
	    		 +"and	substr(careOutTime,1,7)=substr('"+datetime+"',1,7) "
	    		 +"and	substr(careOutTime,1,10)<=substr('"+datetime+"',1,10) "
	    		 +"and careStaff='"+waiter+"' ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 sum=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return sum;
	}
	/**
	 * 索赔 当日
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountSP1(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(servOrderId) from crm_service "
				+"where 1=1  "
				+"and servType='112009' "
				+"and servStaff='"+waiter+"' "
				+"and substr(servInTime,1,10)=substr('"+datetime+"',1,10)"
				+"and (carvin,servinTime) in ("+inz+")";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 索赔 当月
	 * @param datetime
	 * @param waiter
	 * @return
	 */
	public long getCountSP2(String datetime,String waiter,String inz){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      long count=0;
	     try {
	    	 String strSql = "select count(servOrderId) from crm_service "
				+"where 1=1  "
				+"and servType='112009' "
				+"and servStaff='"+waiter+"' "
				+"and substr(servInTime,1,7)=substr('"+datetime+"',1,7)"
				+"and substr(servInTime,1,10)<=substr('"+datetime+"',1,10)"
	    	 	+"and (carvin,servinTime) in ("+inz+")";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			 if(rs.next()){
				 count=rs.getLong(1);
			 }
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
	/**
	 * 去除当日重复进厂后的 当日进厂 索赔 车辆
	 * @param datetime
	 * @return
	 */
	public String getCount5_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,10) ='"+datetime+"'  "
 		 		+"and servType='112009' "
		 		//+"and servOrderId is not null and servOrderId!='' "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
	/**
	 * 去除当月重复进厂后的 当月进厂 索赔 车辆
	 * @param datetime
	 * @return
	 */
	public String getCount6_in(String datetime){
		Statement stmt=null; 
	      ResultSet rs=null; 
	      String inz="";
	     try {
	    	 String strSql = "select carvin,min(servinTime) servinTime from crm_service "
 		 		+"where substr(servinTime,1,7) =substr('"+datetime+"',1,7)  "
 		 		+"and servType='112009' "
		 		//+"and servOrderId is not null and servOrderId!='' "
		 		+"group by carvin,substr(servinTime,1,10)  ";
			 stmt=conn.createStatement(); 
			 rs=stmt.executeQuery(strSql); 
			int i=0;
			while(rs.next()){
				String carvin = rs.getString(1);
				String servinTime = rs.getString(2).replace(".0", "").trim();
					if(i==0){
						inz+="('"+carvin+"','"+servinTime+"')";
					}else{
						inz+=",('"+carvin+"','"+servinTime+"')";
					}
					i++;
			}
			 if(rs!=null)
				rs.close();
	         if(stmt!=null)
				stmt.close();
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
		return inz;
	}
}