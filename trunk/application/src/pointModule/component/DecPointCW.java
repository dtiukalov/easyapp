package pointModule.component;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class DecPointCW extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		PointDao pdao=new PointDao(conn);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		//String p_title = dateFormat.format(new Date())+(int)(1+Math.random()*(10000-1+1));
		String p_title = "0";//财务标识为0，没有明细对比
		//VIN
		String vin = (String)parameterContext.getParameterValue(0);
		//兑换掉积分
		String pps = (String)parameterContext.getParameterValue(1);
		//兑换说明
		String p_note = (String)parameterContext.getParameterValue(2);
		//兑换数量
		//String pnum = (String)parameterContext.getParameterValue(2);
		//兑换规则编号
		//String pr_title="0000";
		//兑换规则积分
		//int pr_point=0;
		if(vin!=null&&!"".equals(vin)){
			//会得兑换项
			//Point pr_rs=pdao.getPRById(pr_id);
			//if(pr_rs!=null&&pr_rs!=null){
				//String pr_title=pr_rs.getPr_title();
				//int pr_point=pr_rs.getPr_point();
				//int num=Integer.parseInt(pnum);
				//兑换用掉积分
				int pp=Integer.parseInt(pps);;
				int ppt=pp;
				List<Point> p_rs=pdao.getPByVIN(vin);
				Iterator<Point> it = p_rs.iterator();
				while(pp>0&&p_rs!=null&&it.hasNext()){
					Point p=it.next();
					long p_id=p.getP_id();
					int p_sumpoint=p.getP_sumpoint();
					int p_decpoint=p.getP_decpoint();
					//System.out.println(pp+"---"+p_id+"-----"+p_sumpoint+"-----"+p_decpoint);
					if(p_sumpoint<pp){
						pp=pp-p_sumpoint;
						p_decpoint=p_decpoint+p_sumpoint;
						p_sumpoint=0;
					}else{
						p_sumpoint=p_sumpoint-pp;
						p_decpoint=p_decpoint+pp;
						pp=0;
					}
					//System.out.println("--bb---"+pp+"---"+p_id+"-----"+p_sumpoint+"-----"+p_decpoint);
					//兑换积分修改
					pdao.UpdatePById(p_id, p_decpoint, p_sumpoint);
				}
				//添加明细
				//pdao.insertPL(p_title,pr_title,ppt);
				//...添加积分兑换总表
				dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String p_date = dateFormat.format(new Date());
				pdao.insertP(p_title,vin,"",ppt,ppt,p_date,2,p_note);
			//}
		}
	}
}