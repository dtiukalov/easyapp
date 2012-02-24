package com.saturn.tc.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.httpclient.util.DateUtil;

public class DateUtils {

	public static void main(String[] args) {
//		DateUtils.getKWArray("2011-12-10 00:00", "2012-01-01 00:00");
		System.out.println(oneDateAddOrSubDays("2011-12-10", 3, "-"));
	}
	
	public static String getLastTwoNum(int year) {
		return (String)(year + "").subSequence(2, 4);
	}
	
	public static String[] getKWArray(String beginDate, String endDate) {
		int tdNum = DateUtils.getWeekNumBetweenStartAndEnd(beginDate, endDate);
		System.out.println();
		String[] kws = new String[tdNum];
		
		int begin = DateUtils.getWeekOfYear(beginDate); //最早时间所在周数
		System.out.println("beigin = " + begin);
		int end = DateUtils.getWeekOfYear(endDate); //最晚时间所在周数
		System.out.println("end = " + end);
		int year1 = Integer.parseInt(beginDate.split("-")[0]);
		int year2 = Integer.parseInt(endDate.split("-")[0]);
		int sep = year2 - year1; //判断是否跨年
		int weekNum = 0; //周数
		if (sep > 0) {
			//跨1年以上
			if (sep > 1) {
				int num = DateUtils.getMaxWeekNumOfYear(year1) - begin + 1;
				
				//第一年的总周数 - 开始周数 + 1
				int days = DateUtils.getMaxWeekNumOfYear(year1);
				for (int i=0; i<days; i++) {
					kws[i] = "KW" + (begin+i) + "/" + getLastTwoNum(year1);
				}
				for (int i=1; i<sep; i++) {
					for (int j=0; j<DateUtils.getMaxWeekNumOfYear(year1+i); j++){
						kws[days-begin+1+ (i-1)*getMaxWeekNumOfYear(year1+i)+ j] = "KW" + (j+1) + "/" + getLastTwoNum(year1+i);
					}
					num += DateUtils.getMaxWeekNumOfYear(year1 + i);
				}
				for (int i=0; i<end; i++) {
					kws[num + i] = "KW" + (i+1) + "/" + getLastTwoNum(year2);
				}
			} 
			//只跨1年
			if (sep == 1){
				int days = DateUtils.getMaxWeekNumOfYear(year1); //得到每年有多少周
				int n = compareDaysBetweenTwoDate(beginDate, endDate);
				if ((end > begin) && n < 365){
					weekNum += end - begin + 1;
					for (int i=0; i<end-begin+1; i++) {
						int kw = begin + i;
						kws[i] = "KW" + kw + "/" + getLastTwoNum(year1);
					}
				} else {
					weekNum += days - begin + 1 + end;
					for (int i=0; i<days-begin+1; i++) {
						int kw = begin + i;
						kws[i] = "KW" + kw + "/" + getLastTwoNum(year1);
					}
					for (int i=0; i<end; i++) {
						kws[days-begin+1+i] = "KW" + (i+1) + "/" + getLastTwoNum(year1 + 1);
					}
					
				}
				
				
			}
			
		} else {
			//不跨年  结束周数-开始周数+1
			if (end >= begin) {
				weekNum = end - begin + 1; 
				for (int i=0; i<weekNum; i++) {
					int kw = begin + i;
					kws[i] = "KW" + kw + "/" + getLastTwoNum(year1);
				}
			} else {
				int days = DateUtils.getMaxWeekNumOfYear(year1); 
				weekNum = days - begin + end + 1;
				for (int i=0; i<(days-begin+1); i++) {
					kws[i] = "KW" + (begin + i) + "/" + getLastTwoNum(year1);
				}
				for (int i=0; i<end; i++) {
					kws[days-begin+1 + i] = "KW" + (i+1) + "/" + getLastTwoNum(year1 + 1);
				}
			}
			
		}
		
		return kws;
	}
	/**
	 * 根据开始日期和结束日期计算经历的周数
	 * @param 开始日期
	 * @param 结束日期
	 * @return 周数
	 */
	public static int getWeekNumBetweenStartAndEnd(
			String beginDate, String endDate) {
		int begin = DateUtils.getWeekOfYear(beginDate); //最早时间所在周数
		int end = DateUtils.getWeekOfYear(endDate); //最晚时间所在周数
		int year1 = Integer.parseInt(beginDate.split("-")[0]);
		int year2 = Integer.parseInt(endDate.split("-")[0]);
		int sep = year2 - year1; //判断是否跨年
		int weekNum = 0; //周数
		if (sep > 0) {
			//跨1年以上
			if (sep > 1) {
				//第一年的总周数 - 开始周数 + 1
				weekNum += DateUtils.getMaxWeekNumOfYear(year1) - begin + 1; 
				for (int i=1; i<sep; i++) {
					weekNum += DateUtils.getMaxWeekNumOfYear(year1 + i);
				}
				weekNum += end; //最后一年有多少周
			} 
			//只跨1年
			if (sep == 1){
				int days = DateUtils.getMaxWeekNumOfYear(year1); //得到每年有多少周
				int n = compareDaysBetweenTwoDate(beginDate, endDate);
				if ((end > begin) && n < 365){
					weekNum += end - begin + 1;
				} else {
					weekNum += days - begin + 1 + end;
				}
				
			}
			
		} else {
			//不跨年  结束周数-开始周数+1
			if (end >= begin) {
				weekNum = end - begin + 1; 
			} else {
				int days = DateUtils.getMaxWeekNumOfYear(year1); 
				weekNum = days - begin + end + 1;
			}
		}
		System.out.println(" weekNum = " + weekNum);   
		return weekNum;
	}
	/*
	 * 获取这一年的最大周数
	 */
	public static int getMaxWeekNumOfYear(int year) {
		Calendar c = new GregorianCalendar();
		c.set(year, Calendar.DECEMBER, 31, 23, 59, 59);
		
		return getWeekOfYear2(c.getTime());
	}
	
	/**
	 * 获取输入日期的周数
	 * 输入为日期类型
	 */
	public static int getWeekOfYear2(Date date) {
		  Calendar c = new GregorianCalendar();
		  c.setFirstDayOfWeek(Calendar.MONDAY);
		  c.setMinimalDaysInFirstWeek(7);
		  c.setTime(date);

		  return c.get(Calendar.WEEK_OF_YEAR);
	}
	
	/** 
	 * 取得输入日期是多少周
	 * 输入为字符串类型 
	 */ 
	 public static int getWeekOfYear(String dateStr) { 
		Calendar c = null;
		try {
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			 Date date = sdf.parse(dateStr);

			 c = new GregorianCalendar(); 
			 c.setFirstDayOfWeek(Calendar.MONDAY); 
			 c.setMinimalDaysInFirstWeek(7); 
			 c.setTime (date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
		 return c.get(Calendar.WEEK_OF_YEAR);
	 } 


	public static Date getDate(int year, int month, int date) {
		Calendar c = Calendar.getInstance();
		c.set(year, month, date);
		return new Date(year, month, date);
	}
	
	public static String getSysDate() {
		Date now = new Date(); 
		DateFormat df = DateFormat.getDateInstance();
		String sysDate = df.format(now);
		return sysDate;
	}

	/**
	 * 获取当前年的字符串
	 */
    public static String getCurrentYear() {
    	return getSysDate().split("-")[0];
	}
	
    /**
     * 比较一个日期在两个日期中间
     * 输入均为字符串
     */
	public static Boolean betweenStartAndEnd(String selectTime, String startTime, String endTime) {
			
		if (compareTime(startTime, selectTime) && 
				compareTime(selectTime, endTime)) { 
			return true;
		}
		
		return false;
	}
	
	public static int compareDaysBetweenTwoDate(String date1, String date2) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long d1 = 0;long d2 = 0;
		try {
			d1 = sdf.parse(date1).getTime();
			d2 = sdf.parse(date2).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return (int)Math.abs((d1-d2)/1000/60/60/24);
	}
	public static String transformTime(String oldTime, String pattern) {
//		System.out.println("oldTime = " + oldTime);
		String newTime = oldTime;
		if ("MM.dd".equals(pattern) && !"".equals(oldTime)) {
			newTime = oldTime.split(" ")[0].split("-")[1] + "." + oldTime.split(" ")[0].split("-")[2];
		}
		if ("YYYY.MM.dd".equals(pattern) && !"".equals(oldTime)) {
			newTime = oldTime.split(" ")[0].split("-")[0] + "." + oldTime.split(" ")[0].split("-")[1] + "." + oldTime.split(" ")[0].split("-")[2];
		}
		if ("YY".equals(pattern) && !"".equals(oldTime)) {
			newTime = oldTime.split(" ")[0].split("-")[0].substring(2, 4);
		}
//		System.out.println("newTime = " + newTime);
		return newTime;
		
	}
	/**
	 * date1 < date2 返回 true
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean compareTime(String date1, String date2) {
		Date startDate = new Date();
		Date endDate = new Date();
		try {
			if (!"".equals(date1)) { //$NON-NLS-1$
				startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1); //$NON-NLS-1$
			}
			if (!"".equals(date2)) { //$NON-NLS-1$
				 endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2); //$NON-NLS-1$
			}
			if ((startDate.getTime() - endDate.getTime())/3600/24/1000 <= 0) {
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	 /** 
	 * 得到某年某周的第一天 
	 */ 
	 public static Date getFirstDayOfWeek(int year, int week) { 
		 Calendar c = new GregorianCalendar(); 
		 c.set(Calendar.YEAR, year); 
		 c.set (Calendar.MONTH, Calendar.JANUARY); 
		 c.set(Calendar.DATE, 1); 
	
		 Calendar cal = (GregorianCalendar) c.clone(); 
		 cal.add(Calendar.DATE, week * 7); 
	
		 return getFirstDayOfWeek(cal.getTime ()); 
	 } 

	 /** 
	 * 得到某年某周的最后一天 
	 */ 
	 public static Date getLastDayOfWeek(int year, int week) { 
		 Calendar c = new GregorianCalendar(); 
		 c.set(Calendar.YEAR, year); 
		 c.set(Calendar.MONTH, Calendar.JANUARY); 
		 c.set(Calendar.DATE, 1); 
	
		 Calendar cal = (GregorianCalendar) c.clone(); 
		 cal.add(Calendar.DATE , week * 7); 
	
		 return getLastDayOfWeek(cal.getTime()); 
	 } 

	 /** 
	 * 取得指定日期所在周的第一天 
	 */ 
	 public static Date getFirstDayOfWeek(Date date) { 
		 Calendar c = new GregorianCalendar(); 
		 c.setFirstDayOfWeek(Calendar.MONDAY); 
		 c.setTime(date); 
		 c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek()); // Monday 
		 return c.getTime (); 
	 } 

	 /** 
	 * 取得指定日期所在周的最后一天 
	 */ 
	 public static Date getLastDayOfWeek(Date date) { 
		 Calendar c = new GregorianCalendar(); 
		 c.setFirstDayOfWeek(Calendar.MONDAY); 
		 c.setTime(date); 
		 c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek() + 6); // Sunday 
		 return c.getTime(); 
	 } 
	 
	 /** 
	 * 取得当前日期所在周的第一天 
	 */ 
	 public static Date getFirstDayOfWeek() { 
		 Calendar c = new GregorianCalendar(); 
		 c.setFirstDayOfWeek(Calendar.MONDAY); 
		 c.setTime(new Date()); 
		 c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek()); // Monday 
		 return c.getTime (); 
	 } 

	 /** 
	 * 取得当前日期所在周的最后一天 
	 */ 
	 public static Date getLastDayOfWeek() { 
		 Calendar c = new GregorianCalendar(); 
		 c.setFirstDayOfWeek(Calendar.MONDAY); 
		 c.setTime(new Date()); 
		 c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek() + 6); // Sunday 
		 return c.getTime(); 
	 } 
	 
	 /**
	  * 给定一个日期型字符串，返回加减n天后的日期型字符串
	  * @param date_str  "yyyy-MM-dd hh:mm"
	  * @param days
	  * @return date_str
	  */
	public static String oneDateAddOrSubDays(String dateStr, int n, String flag) {
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
		 Date tmpDate = null;  
		 try {
			tmpDate = df.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long n_day = 0L;
		if ("+".equals(flag)) {
			n_day = (tmpDate.getTime()/(24*60*60*1000)+1+n)*(24*60*60*1000); 
		}
		if ("-".equals(flag)) {
			n_day = (tmpDate.getTime()/(24*60*60*1000)+1-n)*(24*60*60*1000); 
		}
		
		tmpDate.setTime(n_day);
		
		return df.format(tmpDate);
	}

}
