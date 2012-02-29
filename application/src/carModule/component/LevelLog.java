package carModule.component;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import pointModule.component.PointDao;
import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class LevelLog extends DefaultComponent {
	
	Connection conn=null;
	//String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		conn=parameterContext.getConnection();
		//String vin = (String)parameterContext.getParameterValue(0);
		//String oid = (String)parameterContext.getParameterValue(1);
		//parameterContext.setParameter(1, vin);
		
		//InitLevel();
		//UpdateLevelCha();
		//UpdateLevelZhong();
		//UpdateLevelLiang();
		UpdateLevelYou();
		//UpdateLevelXin();
	}
	public void InitLevel(){
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.LevelLog='' where crm_car.LevelLog is null ";
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
		System.out.println("init:初");
		try {
			String strSql="update crm_car a, saturn_dict b SET a.LevelLog=b.value where a.carCardLevel=b.code and a.LevelLog='' ";
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
	public void UpdateLevelCha(){
		System.out.println("cha:差");
		String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.carCardLevel='101004',crm_car.LevelLog=concat(LevelLog,'_"+nowz+"_差') " +
					"where crm_car.carVin IN ( " +
					"select carvin " +
					"FROM(" +
						"select s.carVin,SUBSTR(MAX(s.servintime),1,7) servintime " +
						"from crm_service s, crm_car c " +
						"where s.carVin=c.carVin and c.carCardLevel !='101004' " +
						"group by s.carVin) a" +
					" where 1=1 and a.servintime < substr(SUBDATE(now(),INTERVAL 12 MONTH),1,7)) ";
			 
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
	public void UpdateLevelZhong(){
		System.out.println("zhong:中");
		String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.carCardLevel='101003',crm_car.LevelLog=concat(LevelLog,'_"+nowz+"_中') " +
					"where crm_car.carVin IN (" +
					"select carvin " +
					"FROM(" +
					"select s.carVin , SUBSTR(MAX(s.servintime),1,7) servintime " +
					"from crm_service s, crm_car c " +
					"where s.carVin=c.carVin " +
					"and c.carCardLevel !='101003' " +
					"group by s.carVin) a " +
					"where 1=1 and a.servintime < substr(SUBDATE(now(),INTERVAL 6 MONTH),1,7) " +
					"and a.servintime >= substr(SUBDATE(now(),INTERVAL 12 MONTH),1,7))";
			 
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
	public void UpdateLevelLiang(){
		System.out.println("liang:良");
		String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.carCardLevel='101002',crm_car.LevelLog=concat(LevelLog,'_"+nowz+"_良') " +
					"where crm_car.carVin IN (" +
						"select carvin " +
						"from (" +
						"select s.carVin, SUBSTR(MAX(s.servintime),1,7) servintime " +
						"from crm_service s, crm_car c " +
						"where s.carVin=c.carVin " +
						"and c.carCardLevel != '101002' " +
						"group by s.carVin) a " +
					"where 1=1 and a.servintime> substr(SUBDATE(now(),INTERVAL 6 MONTH),1,7))";
			 
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
	public void UpdateLevelYou(){
		System.out.println("you:优");
		String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.carCardLevel='101001',crm_car.LevelLog=concat(LevelLog,'_"+nowz+"_优') " +
					"where crm_car.carVin IN (" +
						"SELECT  a.carVin" +
						"from(" +
						"select COUNT(c.carVin) countnum,c.carVin,max(s.servKilometer) maxk,min(s.servKilometer) mink " +
						"from crm_service s, crm_car c " +
						"where s.carVin = c.carVin " +
						"and s.servintime > substr(SUBDATE(now(),INTERVAL 6 MONTH),1,7) " +
						"and c.carCardLevel != '101001' " +
						"group by c.carVin) a " +
					"where 1=1 and a.countnum >=3 and  a.countnum >= (a.maxk-a.mink)/10000+1 )";
			 
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
	public void UpdateLevelXin(){
		System.out.println("xin:新");
		String nowz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	      Statement stmt=null; 
	     try {
			String strSql="update crm_car SET crm_car.carCardLevel='101005',crm_car.LevelLog=concat(LevelLog,'_"+nowz+"_新') " +
					"where crm_car.carVin IN (select carVin " +
						"FROM(" +
						"select COUNT(c.carVin) countnum,c.carVin " +
						"from crm_service s, crm_car c " +
						"where s.carVin = c.carVin " +
						"and substr(c.carSellDate,1,7) >= substr(SUBDATE(NOW(),INTERVAL 6 MONTH),1,7) " +
						"and c.carCardLevel != '101005' " +
						"group by c.carVin) a " +
					"where 1=1 and a.countnum<3)";
			 
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