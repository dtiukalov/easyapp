package com.saturn.passing;

import com.saturn.app.utils.DateUtils;

public class Opertion {
	public Opertion(){
		super();
	}
	public static boolean execute(int[] data){
		String station = getStation(data);
		String card = getCard(data);
		String createTime = DateUtils.getSystemTime();
		Passing vo = new Passing(null, station, card, createTime);
		Passing.add(vo);
		//System.out.println(card);
		return true;
	}
	/**
	 * 组成站点号
	 * @param data
	 * @return
	 */
	public static String getStation(int[] data){
		String card="";
		if(data==null)
			return card;
		
		for(int i=1;i<3;i++){
				if(data[i]<16){
					card+="0"+Integer.toHexString(data[i]).toUpperCase();
				}else{
					card+=Integer.toHexString(data[i]).toUpperCase();
				}
		}
		return card;
	}
	/**
	 * 组成卡号
	 * @param data
	 * @return
	 */
	public static String getCard(int[] data){
		String card="";
		if(data==null)
			return card;
		
		for(int i=6;i<18;i++){
				if(data[i]<16){
					card+="0"+Integer.toHexString(data[i]).toUpperCase();
				}else{
					card+=Integer.toHexString(data[i]).toUpperCase();
				}
		}
		return card;
	}
	
	public static void main(String[] args){
		//IOCard card = new IOCard();
		//card.setI_card("1-1-1");
		//IOCard.getAll(card, "0", "5", null, null).getList().get(0);
		
		//IOCard.getByCard("0-1-0-19-0-20-0-1-0-0-18-2");
		
		//System.out.println(Integer.toHexString(16).toUpperCase());
		/*
		String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		IOCard vo = new IOCard();
		vo.setI_card("0-1-0-19-0-20-0-1-0-0-18-2");
		vo.setI_indate(now);
		vo.setI_date(now);
		vo.setI_type("1");//1卡到店 2总值
		IOCard.add(vo);
		*/
		/*
		IOCard vo = IOCard.getByCard("0-1-0-19-0-20-0-1-0-0-18-2");//-获取最后一条到店数据--
		//可在此处加其它离店判断
		if(vo!=null&&"0".equals(vo.getI_outdate())){//有记录，并且没有离店时间：更新离店时间
			String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			vo.setI_outdate(now);
			IOCard.edit(vo);
		}
		*/
		/*String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Duty dutyvo = new Duty();
		dutyvo.setCarcardid("");
		dutyvo.setCarvin("");
		dutyvo.setCarlicenseno("");
		dutyvo.setDutycarmodel("");
		dutyvo.setDutyintime(now);
		dutyvo.setCreatetime(now);
		dutyvo.setUserid("0");
		dutyvo.setUsername("0");
		Duty.add(dutyvo);*/
		//System.out.println(Calendar.getInstance().get(Calendar.HOUR_OF_DAY));
		
	}
}
