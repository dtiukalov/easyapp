package carModule.component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class InLevelLog extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		
			Connection conn=parameterContext.getConnection();
			LevelDao ledao = new LevelDao(conn);
			String nowz = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			String type = (String)parameterContext.getParameterValue(0);//级别变更日志类型 1:月刷新2单次刷新3手动死档
			String vin = (String)parameterContext.getParameterValue(1);
			String snote = (String)parameterContext.getParameterValue(2);//死档说明
			List<Level> carlist = new ArrayList<Level>();
			if("3".equals(type) && vin!=null && !"".equals(vin.trim())){
				//车辆修改操作时要在档案更新前操作
				carlist = ledao.getCarList(vin);
				for(Level le:carlist){
					String cardid=le.getCardid();//档案主键
					String carcardlevel=le.getCarcardlevel();//档案级别 101001 101002 101003 101004 101005 101006
					String carsource=le.getCarsource();//车辆来源 103001 103002 103003
					String carselldate=getFomatdate(le.getCarselldate());//销售日期
					String carvin=le.getCarvin();//车辆vin
					if(!"101006".equals(carcardlevel)){
						//如果不为新的才执行变更
						ledao.insertLe(cardid,carcardlevel,"101006",type,snote);
						ledao.updateCard(cardid,"101006");
					}
				}
			}else{
				if("1".equals(type)){
					carlist = ledao.getCarList(null);
				}else if("2".equals(type) && vin!=null && !"".equals(vin.trim())){
					carlist = ledao.getCarList(vin);
				}
				for(Level le:carlist){
					String cardid=le.getCardid();//档案主键
					String carcardlevel=le.getCarcardlevel();//档案级别 101001 101002 101003 101004 101005 101006
					String carsource=le.getCarsource();//车辆来源 103001 103002 103003
					String carselldate=getFomatdate(le.getCarselldate());//销售日期
					String carvin=le.getCarvin();//车辆vin
					if("103001".equals(carsource)){
						//自店
						if(carselldate!=null){
							//正确销售时间（判断是否6个月之内销售）
							if(getQuot(nowz, carselldate)<6 && ledao.getServiceCount(carvin)<3){
								//是6个月之内销售,且是进店3次以内（是新）
								if(!"101005".equals(carcardlevel)){
									//如果不为新的才执行变更
									ledao.insertLe(cardid,carcardlevel,"101005",type,"6个月之内销售且保养3次以内");
									ledao.updateCard(cardid,"101005");
								}
								continue;
							}else{
								//（6个月之外销售的 或 进店3次以外的 判断其它级别）
								//start 判断 优 良 中 差
								String maxt=null;
								if((maxt=getFomatdate(ledao.getMaxTime(carvin)))!=null){
									//有最大进厂时间
									if(getQuot(nowz, maxt)<3&&(ledao.getServiceCount(carvin)>=ledao.getMaxMin(carvin))){
										//3个月之内到店的
										//且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1(是优)
										if(!"101001".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101001",type,"3个月之内到店保养且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1");
											ledao.updateCard(cardid,"101001");
										}
									}else if(getQuot(nowz, maxt)<6){
										//6个月之内到店的(是良)
										if(!"101002".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101002",type,"6个月之内到店保养");
											ledao.updateCard(cardid,"101002");
										}
									}else if(getQuot(nowz, maxt)<12){
										//6个月至1年内到店(是中)
										if(!"101003".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101003",type,"6个月至1年内到店保养");
											ledao.updateCard(cardid,"101003");
										}
									}else{
										//1年以上未到店(是差)
										if(!"101004".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101004",type,"1年以上未到店保养");
											ledao.updateCard(cardid,"101004");
										}
									}
									continue;
								}else{
									//无最大进厂时间（自店的如果维修都没有进店时间，就按销售时间算）
									if(getQuot(nowz, carselldate)<3&&(ledao.getServiceCount(carvin)>=ledao.getMaxMin(carvin))){
										//3个月之内到店的
										//且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1(是优)
										if(!"101001".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101001",type,"3个月之内销售且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1");
											ledao.updateCard(cardid,"101001");
										}
									}else if(getQuot(nowz, carselldate)<6){
										//6个月之内销售的(是良)
										if(!"101002".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101002",type,"6个月之内销售未保养");
											ledao.updateCard(cardid,"101002");
										}
									}else if(getQuot(nowz, carselldate)<12){
										//6个月至1年内销售(是中)
										if(!"101003".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101003",type,"6个月至1年内销售未保养");
											ledao.updateCard(cardid,"101003");
										}
									}else{
										//1年以上未销售(是差)
										if(!"101004".equals(carcardlevel)){
											//如果不为新的才执行变更
											ledao.insertLe(cardid,carcardlevel,"101004",type,"1年以上内销售未保养");
											ledao.updateCard(cardid,"101004");
										}
									}
									continue;
								}
								//end
							}
						}else{
							//不正确销售时间（没有销售时间和格式不规范的判断其它级别）
							//start 判断 优 良 中 差
							String maxt=null;
							if((maxt=getFomatdate(ledao.getMaxTime(carvin)))!=null){
								//有最大进厂时间
								if(getQuot(nowz, maxt)<3&&(ledao.getServiceCount(carvin)>=ledao.getMaxMin(carvin))){
									//3个月之内到店的
									//且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1(是优)
									if(!"101001".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101001",type,"3个月之内到店保养且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1");
										ledao.updateCard(cardid,"101001");
									}
								}else if(getQuot(nowz, maxt)<6){
									//6个月之内到店的(是良)
									if(!"101002".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101002",type,"6个月之内到店保养");
										ledao.updateCard(cardid,"101002");
									}
								}else if(getQuot(nowz, maxt)<12){
									//6个月至1年内到店(是中)
									if(!"101003".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101003",type,"6个月至1年内到店保养");
										ledao.updateCard(cardid,"101003");
									}
								}else{
									//1年以上未到店(是差)
									if(!"101004".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101004",type,"1年以上未到店保养");
										ledao.updateCard(cardid,"101004");
									}
								}
								continue;
							}else{
								//无最大进厂时间（自店的如果维修都没有进店时间，也没有销售时间就不做判断）
								continue;
							}
							//end
						}
					}else{
						//103002 103003 ‘’ null 或其它格式 的都按它店来
						String mint=null;
						if((mint=getFomatdate(ledao.getMinTime(carvin)))!=null && getQuot(nowz, mint)<6){
							//有首次到店时间,他店客户6个月之内到店保养(“他店客户6个月之内到店保养的”按他店客户首次到店时间起6个月内)（是新）
							if(!"101005".equals(carcardlevel)){
								//如果不为新的才执行变更
								ledao.insertLe(cardid,carcardlevel,"101005",type,"他店客户6个月之内到店保养(按他店客户首次到店时间起6个月内)");
								ledao.updateCard(cardid,"101005");
							}
							continue;
						}else{
							//没有最小进厂时间 判断其它级别
							//start 判断 优 良 中 差
							String maxt=null;
							if((maxt=getFomatdate(ledao.getMaxTime(carvin)))!=null){
								//有最大进厂时间
								if(getQuot(nowz, maxt)<3&&(ledao.getServiceCount(carvin)>=ledao.getMaxMin(carvin))){
									//3个月之内到店的
									//且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1(是优)
									if(!"101001".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101001",type,"3个月之内到店保养且实际到店保养次数≥（最后一次进厂里程-第一次进厂里程）/10000（公里）+1");
										ledao.updateCard(cardid,"101001");
									}
								}else if(getQuot(nowz, maxt)<6){
									//6个月之内到店的(是良)
									if(!"101002".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101002",type,"6个月之内到店保养");
										ledao.updateCard(cardid,"101002");
									}
								}else if(getQuot(nowz, maxt)<12){
									//6个月至1年内到店(是中)
									if(!"101003".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101003",type,"6个月至1年内到店保养");
										ledao.updateCard(cardid,"101003");
									}
								}else{
									//1年以上未到店(是差)
									if(!"101004".equals(carcardlevel)){
										//如果不为新的才执行变更
										ledao.insertLe(cardid,carcardlevel,"101004",type,"1年以上未到店保养");
										ledao.updateCard(cardid,"101004");
									}
								}
								continue;
							}else{
								//无最大进厂时间（如果维修都没有进店时间，不做判断）
								continue;
							}
							//end
						}
					}
				}
			}
	}
	/**
	 * 获得正确时间
	 * @param selldate
	 * @return
	 */
	public String getFomatdate(String selldate){
		//System.out.println("---"+selldate+"---");
		String y="";
		String m="";
		String d="";
		try {
			String[] s=selldate.split(" ");
			String[] ss=s[0].split("-");
			y=ss[0];
			if(Integer.parseInt(ss[1])<10){
				m="-0"+Integer.parseInt(ss[1]);
			}else{
				m="-"+Integer.parseInt(ss[1]);
			}
			if(Integer.parseInt(ss[2])<10){
				d="-0"+Integer.parseInt(ss[2]);
			}else{
				d="-"+Integer.parseInt(ss[2]);
			}
			return y+m+d;
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
			return null;
		}
	}
	/**
	 * 获得两个时间的月份差和
	 * @param time1
	 * @param time2
	 * @return
	 * @throws ParseException
	 */
	public long getQuot(String time1, String time2) throws ParseException{   
	       long quot = 0;   
	        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");   
	        Date date1 = ft.parse( time1 );   
	       Date date2 = ft.parse( time2 );   
	        quot = date1.getTime() - date2.getTime();   
	        quot = quot / 1000 / 60 / 60 / 24 / 30;   
	       return quot;   
	 }
	
}