package pointModule.component;

import importModule.component.DateTimeFormat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class AddPoint extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		PointDao pdao=new PointDao(conn);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String p_title = dateFormat.format(new Date())+(int)(1+Math.random()*(10000-1+1));
		
		//VIN
		String vin = (String)parameterContext.getParameterValue(0);
		//工单号
		String oid = (String)parameterContext.getParameterValue(1);
		/*
		 * 积分小类编号 
		 * 消费积分：0101保养等 0102保险事故
		 * .....活跃积分：0201三月内回店 0202六月内回店
		 * 活动积分：0301回访成功 0302预约成功 0303参加活动
		 * 专项积分：0401购新车 0402店内保险 0403网络查询
		 */ 
		String typenum = (String)parameterContext.getParameterValue(2);
		//消费积分金额
		String t_money = (String)parameterContext.getParameterValue(3);
		//进厂时间
		String p_date = (String)parameterContext.getParameterValue(4);
		//System.out.println(vin+"---"+typenum);
		if(vin!=null&&!"".equals(vin)&&typenum!=null&&!"".equals(typenum)){
			int p_addpoint=0;
			int pl_point=0;
			String pr_title="";
			//消费，活动
			if(t_money!=null&&!"".equals(t_money.trim())&&p_date!=null&&!"".equals(p_date.trim())&&oid!=null&&!"".equals(oid.trim())){
				//检测此工单是否有已经积分
				int boo=pdao.getIsPoint(oid);
				if(boo==0){
					//消费积分
					int money=(int)Double.parseDouble(t_money);
					if("0101".equals(typenum)){
						pl_point=money/10;
						pr_title="0101";
					}else if("0102".equals(typenum)){
						pl_point=money/30;
						pr_title="0102";
					}
					if(pl_point>0){
						p_addpoint+=pl_point;
						pdao.insertPL(p_title,pr_title,pl_point);
					}
					//活跃积分
					int a=pdao.getService(vin,getCalendar(p_date));
					if(a==5){
						pr_title="0201";
					}else if(a==2){
						pr_title="0202";
					}
					pl_point=a;
					//System.out.println("a:"+a);
					if(pl_point>0){
						p_addpoint+=pl_point;
						pdao.insertPL(p_title,pr_title,pl_point);
					}
					//...添加积分总表
					if(p_addpoint>0){
						pdao.insertP(p_title,vin,oid,p_addpoint,p_addpoint,p_date,1,"");
					}
				}
			}
			//购新车
			if("0401".equals(typenum)){
				pdao.insertPL(p_title,"0401",50);
				dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String p_date_t = dateFormat.format(new Date());
				pdao.insertP(p_title,vin,"",50,50,p_date_t,1,"");
			}
		}
	}
	
	
	private Calendar getCalendar(String date){
		String[] str=date.split(" ");
		//System.out.println(str[0]+"---"+str[1]);
		String[] str1=str[0].split("-");
		//System.out.println(str1[0]+"---"+(Integer.parseInt(str1[1])-1)+"---"+str1[2]);
		String[] str2=str[1].split(":");
		//System.out.println(str2[0]+"---"+str2[1]+"---"+str2[2]);
		Calendar calendar = Calendar.getInstance();
		calendar.set(Integer.parseInt(str1[0]),(Integer.parseInt(str1[1])-1), Integer.parseInt(str1[2]), Integer.parseInt(str2[0]), Integer.parseInt(str2[1]), 59);
		return calendar;
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println(dateFormat.format(calendar.getTime()));
	}
}