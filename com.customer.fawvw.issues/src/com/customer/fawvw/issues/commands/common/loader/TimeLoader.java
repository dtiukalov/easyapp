package com.customer.fawvw.issues.commands.common.loader;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;


public class TimeLoader  {

	public static List<Integer> submited = new ArrayList<Integer>(); //已提交
	public static List<Integer> analysed = new ArrayList<Integer>(); //已分析
	public static List<Integer> apportioned = new ArrayList<Integer>(); //已分派
	public static List<Integer> excogitation = new ArrayList<Integer>(); //有方案
	public static List<Integer> operation = new ArrayList<Integer>(); //已实施
	public static List<Integer> validated = new ArrayList<Integer>(); //已验证
	public static List<Integer> closed = new ArrayList<Integer>();  //已关闭
	
	@SuppressWarnings("unchecked")
	/**
	 * 获取时间轴
	 * 
	 * @param issueVos
	 * @return
	 */
	public static Map<String, Object> load(ArrayList<HashMap<String, Object>> values) throws Exception {
		try{

			//赋值前先清除list原有值
			submited.clear();
			analysed.clear();
			apportioned.clear();
			excogitation.clear();
			operation.clear();
			validated.clear();
			closed.clear();
//System.out.println("submited = " + submited);
//System.out.println("analysed = " + analysed);
//System.out.println("apportioned = " + apportioned);
//System.out.println("excogitation = " + excogitation);
//System.out.println("operation = " + operation);
//System.out.println("validated = " + validated);
//System.out.println("closed = " + closed);
			
			Map<String, Object> timeValues = new HashMap<String, Object>();
			//获取最小问题提交日期和最大问题实际完成日期
			Map<String, String> time = new HashMap<String, String>();
			if (values.size() > 0) {
				time = getTime(values);
			}
			
			String startTime = time.get("start") + ""; //$NON-NLS-1$ //$NON-NLS-2$
			String endTime = time.get("end") + ""; //$NON-NLS-1$ //$NON-NLS-2$

//	System.out.println("startTime" + startTime); //$NON-NLS-1$
//	System.out.println("endTime" + endTime); //$NON-NLS-1$

			//获取时间轴

			List<Map<String, Integer>> weeks = new ArrayList<Map<String, Integer>>();
			if (!"".equals(startTime) && !"null".equals(startTime) //$NON-NLS-1$ //$NON-NLS-2$
					&& !"".equals(endTime) && !"null".equals(endTime)) { //$NON-NLS-1$ //$NON-NLS-2$

				weeks = collectWeek(startTime, endTime);

			}
			
//	System.out.println(weeks);

			// 用时间做循环计算数    
			if (weeks != null && weeks.size() > 0) {
				int i = 0;
				//循环每一周
				for (Iterator iterator = weeks.iterator(); iterator.hasNext();) {

					Map<String, Integer> week = (Map<String, Integer>) iterator.next();
					Date sunday = getSunDayOfWeek(week.get("year"),week.get("week")); //$NON-NLS-1$ //$NON-NLS-2$
					
					Format format = new SimpleDateFormat("yyyy-MM-dd"); //$NON-NLS-1$
					String weekSunday = format.format(sunday);
					weekSunday += " 23:59"; //$NON-NLS-1$

					
//		System.out.println(week.get("year") + "year and " + week.get("week") + "week");
					submited.add(0);
					analysed.add(0);
					apportioned.add(0);
					excogitation.add(0);
					operation.add(0);
					validated.add(0);
					closed.add(0);
		
//		System.out.println("submited = " + submited + "\n"
//						+ "analysed = " + analysed + "\n"
//						+ "apportioned = " + apportioned + "\n"
//						+ "excogitation = " + excogitation + "\n"
//						+ "operation = " + operation + "\n"
//						+ "validated = " + validated + "\n"
//						+ "closed = " + closed);

					
					if(!"".equals(weekSunday)) { //$NON-NLS-1$
						operateTime(values, weekSunday, i);
					}
					i++;
				}
				
			}
			
//		System.out.println("timeValues = " + timeValues);
			System.out.println("按时间统计\n" //$NON-NLS-1$
					+ "已提交： " + submited + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "已分析： " + analysed + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "已分派：" + apportioned + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "有方案：" + excogitation + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "已实施：" + operation + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "已验证：" + validated + "\n" //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					+ "已关闭：" + closed); //$NON-NLS-1$
			
			timeValues.put("weeks", weeks); //$NON-NLS-1$
			timeValues.put("submited", submited); //$NON-NLS-1$
			timeValues.put("analysed", analysed); //$NON-NLS-1$
			timeValues.put("apportioned", apportioned); //$NON-NLS-1$
			timeValues.put("excogitation", excogitation); //$NON-NLS-1$
			timeValues.put("operation", operation); //$NON-NLS-1$
			timeValues.put("validated", validated); //$NON-NLS-1$
			timeValues.put("closed", closed); //$NON-NLS-1$
	
			return timeValues;
			
		} catch (Exception e) {
			throw new FawvmLoaderException(e.getMessage());
		}
		
		
	}
	/*
	 * 根据最小问题提交日期和最大问题实际完成日期获取时间轴
	 * 
	 */
	
	private static List<Map<String, Integer>> collectWeek(String startTime,
			String endTime) throws Exception {
//System.out.println("startTime = " + startTime);	
//System.out.println("endTime = " + endTime);	
		try {
			
			List<Map<String, Integer>> times = new ArrayList<Map<String, Integer>>();

			// int number =0;

			int startYear = getIntegerDateOfYear(startTime);
			int endYear = getIntegerDateOfYear(endTime);
			int startWeek = getIntegerWeekOfYear(startTime);
			int endWeek = getIntegerWeekOfYear(endTime);
//System.out.println("startYear = " + startYear);
//System.out.println("endYear = " + endYear);
//System.out.println("startWeek = " + startWeek);
//System.out.println("endWeek = " + endWeek);
			Map<String, Integer> week = null;

			if ((endYear - startYear) >= 0) {
//System.out.println("aaaa");
				if ((endYear - startYear) == 0 && (endWeek - startWeek) >= 0) {
					// 都是本年的
					for (int i = 0; i <= endWeek - startWeek; i++) {
						week = null;
						week = new HashMap<String, Integer>();
						week.put("week", startWeek + i); //$NON-NLS-1$
						week.put("year", endYear); //$NON-NLS-1$
						times.add(week);
					}
				} else if ((endYear - startYear) == 1) {
					// 跨一年
					int maxWeek = getMaxWeekNumOfYear(startYear);
					// 跨年的前半年
					for (int i = startWeek; i <= maxWeek; i++) {
						week = null;
						week = new HashMap<String, Integer>();
						week.put("week", i); //$NON-NLS-1$
						week.put("year", startYear); //$NON-NLS-1$
						times.add(week);
					}
					// 跨年的后半年(周是从零开始的吗？？？)
					for (int i = 1; i <= endWeek; i++) {
						week = null;
						week = new HashMap<String, Integer>();
						week.put("week", i); //$NON-NLS-1$
						week.put("year", endYear); //$NON-NLS-1$
						times.add(week);
					}
				} else {
					// 跨越两年以上
					int maxWeek = getMaxWeekNumOfYear(startYear);
					// 跨年的前半年
					for (int i = startWeek; i <= maxWeek; i++) {
						week = null;
						week = new HashMap<String, Integer>();
						week.put("week", i); //$NON-NLS-1$
						week.put("year", startYear); //$NON-NLS-1$
						times.add(week);
					}
					// 中间段的时间计算
					for (int i = 1; (i + startYear) < endYear; i++) {
						int currentYear = i + startYear;
						
						for (int j = 1; j <= getMaxWeekNumOfYear(currentYear); j++) {
							week = null;
							week = new HashMap<String, Integer>();
							week.put("week", j); //$NON-NLS-1$
							week.put("year", currentYear); //$NON-NLS-1$
							times.add(week);
						}
					}
					// 跨年的后半年(周是从零开始的吗？？？)
					for (int i = 1; i <= endWeek; i++) {
						week = null;
						week = new HashMap<String, Integer>();
						week.put("week", i); //$NON-NLS-1$
						week.put("year", endYear); //$NON-NLS-1$
						times.add(week);
					}

				}
			}

			return times;
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new FawvmLoaderException(e.getMessage());
			
		}

		
	}

	

	/*
	 * 输入参数：问题列表、某周的星期日的日期、第I次循环
	 * 
	 */


	public static void operateTime(ArrayList<HashMap<String, Object>> values, String sunday, int i) throws Exception {
//System.out.println("values = " + values);	
//System.out.println("values.zise = " + values.size());
		try {
			
			for (int k=0; k<values.size(); k++) {
//System.out.println("[" + i + "]--------begin cal time-------");
//System.out.println(values.get(k));
				//选中周的周日大于问题关闭日期，已关闭+1
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeGreen")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeChangeGreen"), sunday)){ //$NON-NLS-1$
					
					closed.add(i, closed.get(i) + 1);
					closed.remove(i+1);
					
//System.out.println("closed--ture"); //$NON-NLS-1$
//System.out.println("closed" + closed); //$NON-NLS-1$
				}
				
				//选中周的周日大于方案验证日期，小于问题关闭日期，已验证+1
				//问题没有关闭，但已验证，则已验证
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeGreen")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeValidated")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeValidated"), sunday)) { //$NON-NLS-1$
					
					validated.add(i, validated.get(i) + 1);
					validated.remove(i+1);
					
//System.out.println("validated--ture"); //$NON-NLS-1$
//System.out.println("validated" + validated); //$NON-NLS-1$
					
				} 
				
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeValidated")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeGreen")) &&							 //$NON-NLS-1$ //$NON-NLS-2$
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeChangeGreen")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeValidated"), sunday)) { //$NON-NLS-1$
					
					validated.add(i, validated.get(i) + 1);
					validated.remove(i+1);
					
//System.out.println("validated--ture"); //$NON-NLS-1$
//System.out.println("validated" + validated); //$NON-NLS-1$
				}
				
				
				
				//选中周的星期日大于方案实施日期，小于方案验证日期，则已实施+1
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeValidated")) && //$NON-NLS-1$ //$NON-NLS-2$  
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeImplemented")) &&  //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeImplemented"), sunday)) { //$NON-NLS-1$
					operation.add(i, operation.get(i) + 1);
					operation.remove(i+1);

//System.out.println("operation--ture"); //$NON-NLS-1$
//System.out.println("operation" + operation);			 //$NON-NLS-1$
					
				}
				
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeImplemented")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeValidated")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeValidated")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeImplemented"), sunday)) { //$NON-NLS-1$
					
					operation.add(i, operation.get(i) + 1);
					operation.remove(i+1);

//System.out.println("operation--ture"); //$NON-NLS-1$
//System.out.println("operation" + operation);			 //$NON-NLS-1$
				}
				
				//选中周的星期日大于问题的提出方案日期，小于问题已实施日期，则有方案+1
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeImplemented")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeYellow")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeChangeYellow"), sunday)) { //$NON-NLS-1$
					excogitation.add(i, excogitation.get(i) + 1);
					excogitation.remove(i+1);

//System.out.println("excogitation--ture"); //$NON-NLS-1$
//System.out.println("excogitation" + excogitation); //$NON-NLS-1$
					
				}
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeYellow")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeImplemented")) && //$NON-NLS-1$ //$NON-NLS-2$  
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeImplemented")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeChangeYellow"), sunday)) { //$NON-NLS-1$
					
					excogitation.add(i, excogitation.get(i) + 1);
					excogitation.remove(i+1);

//System.out.println("excogitation--ture"); //$NON-NLS-1$
//System.out.println("excogitation" + excogitation); //$NON-NLS-1$
				}
				
				//选中周的星期日大于问题的分派日期，小于问题提出方案日期，则已分派+1
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeYellow")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeDispatched")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeDispatched"), sunday)) { //$NON-NLS-1$
					apportioned.add(i, apportioned.get(i) + 1);
					apportioned.remove(i+1);

//System.out.println("apportioned - ture"); //$NON-NLS-1$
//System.out.println("apportioned" + apportioned); //$NON-NLS-1$
					
				}
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeDispatched")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeYellow")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeChangeYellow")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeDispatched"), sunday)) { //$NON-NLS-1$
					apportioned.add(i, apportioned.get(i) + 1);
					apportioned.remove(i+1);

//System.out.println("apportioned - ture"); //$NON-NLS-1$
//System.out.println("apportioned" + apportioned); //$NON-NLS-1$
				}
				
				//选中周的星期日大于问题的分析日期，小于问题的分派日期，则已分析+1
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeDispatched")) && //$NON-NLS-1$ //$NON-NLS-2$  
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeAnalyzed")) && //$NON-NLS-1$ //$NON-NLS-2$  
						compareTime((String)(values.get(k)).get("fv9TimeAnalyzed"), sunday)) { //$NON-NLS-1$
					analysed.add(i, analysed.get(i) + 1);
					analysed.remove(i+1);

//System.out.println("analysed - ture"); //$NON-NLS-1$
//System.out.println("analysed-ss-"+ analysed); //$NON-NLS-1$
					
				}
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeAnalyzed")) && //$NON-NLS-1$ //$NON-NLS-2$
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeDispatched")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeDispatched")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeAnalyzed"), sunday)) { //$NON-NLS-1$

					analysed.add(i, analysed.get(i) + 1);
					analysed.remove(i+1);

//System.out.println("analysed - ture"); //$NON-NLS-1$
//System.out.println("analysed-ss-"+ analysed); //$NON-NLS-1$
				}
				
				
				//选中周的星期日大于问题提出日期，小于问题的分析日期，则已提交+1
				if ("0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeAnalyzed")) && //$NON-NLS-1$ //$NON-NLS-2$  
						!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeRed")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime((String)(values.get(k)).get("fv9TimeChangeRed"), sunday)) { //$NON-NLS-1$
					submited.add(i, submited.get(i) + 1);
					submited.remove(i+1);
					
//System.out.println("submited--ture");			 //$NON-NLS-1$
//System.out.println("submited-ss-" + submited); //$NON-NLS-1$
				}
				if (!"0-1-00 00:00".equals((String)(values.get(k)).get("fv9TimeChangeRed")) && //$NON-NLS-1$ //$NON-NLS-2$
						compareTime(sunday, (String)(values.get(k)).get("fv9TimeAnalyzed")) && //$NON-NLS-1$
						compareTime((String)(values.get(k)).get("fv9TimeChangeRed"), sunday)) { //$NON-NLS-1$

					submited.add(i, submited.get(i) + 1);
					submited.remove(i+1);
					
//System.out.println("submited--ture");			 //$NON-NLS-1$
//System.out.println("submited-ss-" + submited); //$NON-NLS-1$
				}
//System.out.println("[" + i + "]--------end cal time-------");				
				
	
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new FawvmLoaderException(e.getMessage());
			
		}
		

	}
	

	/**
	 * 获得最小问题提交日期和最大问题实际完成日期
	 * 
	 * @param issueVos
	 * @return
	 */
	public static Map<String, String> getTime(ArrayList<HashMap<String, Object>> values) throws Exception {
		Map<String, String> time = new HashMap<String, String>();
		String start = ""; //问题提交日期 //$NON-NLS-1$
		String end = ""; // 问题实际完成日期 //$NON-NLS-1$
		
		for (int i=0; i<values.size(); i++) {
//System.out.println(i + " start =" + start + "-------- end = " + end);

			//找到最小的问题提交日期
			if ("".equals(start) && !"0-1-00 00:00".equals((String)(values.get(i)).get("fv9TimeChangeRed"))) { //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				start = (String)(values.get(i)).get("fv9TimeChangeRed"); //$NON-NLS-1$
			}
			if (!"".equals(start) && !"0-1-00 00:00".equals((String)(values.get(i)).get("fv9TimeChangeRed")) && //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
					!compareTime(start, (String)(values.get(i)).get("fv9TimeChangeRed") )) { //$NON-NLS-1$
				start = (String)(values.get(i)).get("fv9TimeChangeRed"); //$NON-NLS-1$
			}
			
			//找出最大的问题实际完成日期
			if ("".equals(end) && !"0-1-00 00:00".equals((String)(values.get(i)).get("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				end = (String)(values.get(i)).get("fv9SolDeadlineDate"); //$NON-NLS-1$
			}
			if(!"".equals(end) && !"0-1-00 00:00".equals((String)(values.get(i)).get("fv9SolDeadlineDate")) && //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
					compareTime(end, (String)(values.get(i)).get("fv9SolDeadlineDate"))) { //$NON-NLS-1$
				end = (String)(values.get(i)).get("fv9SolDeadlineDate"); //$NON-NLS-1$
			}
			
//	System.out.println("start = " + start + "\t" + "end = " + end);


		}
//System.out.println("LAST start = " + start + "\t" + "end = " + end);
		time.put("start", start); //$NON-NLS-1$
		time.put("end", end); //$NON-NLS-1$

		return time;

	}
	
/**
 * @param date1
 * @param date2
 * @return
 * date1 <= date2  return true
 */
	private static boolean compareTime(String date1, String date2) throws Exception{
//System.out.println("date1 = " + date1);
//System.out.println("date2 = " + date2);
		try {
			Date startDate = new Date();
			Date endDate = new Date();
			if (!"".equals(date1)) { //$NON-NLS-1$
				startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1); //$NON-NLS-1$
			}
			if (!"".equals(date2)) { //$NON-NLS-1$
				endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2); //$NON-NLS-1$
			}
			
			//date1与date2均不为空，比较大小
			if (!"".equals(date1) && !"".equals(date2)) { //$NON-NLS-1$ //$NON-NLS-2$
				if ((startDate.getTime() - endDate.getTime()) / 24 / 1000 <= 0) {
					return true;
				}
			}
			//date1为空，date2不为空，返回true
			if ("".equals(date1) && !"".equals(date2)) { //$NON-NLS-1$ //$NON-NLS-2$
				return true;
			}
			//date1不为空，date2为空，返回
			if (!"".equals(date1) && "".equals(date2)) { //$NON-NLS-1$ //$NON-NLS-2$
				return false;
			}
			//date1 date2均为空
			if ("".equals(date1) && "".equals(date2)) { //$NON-NLS-1$ //$NON-NLS-2$
				return false;
			}
		
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException("比较时间失败，请参考日志"); //$NON-NLS-1$
		}
		return false;
	}
	/**
	 * 得到某年某周的第一天
	 */
	public static Date getSunDayOfWeek(int year, int week) {
		Calendar c = new GregorianCalendar();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, Calendar.JANUARY);
		c.set(Calendar.DATE, 1);

		Calendar cal = (GregorianCalendar) c.clone();
		cal.add(Calendar.DATE, week * 7);

		return getSunDayOfWeek(cal.getTime());
	}

	/**
	 * 取得指定日期所在周的周日
	 */
	@SuppressWarnings("static-access")
	public static Date getSunDayOfWeek(Date date) {
		Calendar c = new GregorianCalendar();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, c.SUNDAY); // Monday
		return c.getTime();
	}

	/**
	 * 取得当前日期是多少周
	 */
	public static String getWeekOfYear(String dateStr) {
		Calendar c = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //$NON-NLS-1$
			Date date = sdf.parse(dateStr);

			c = new GregorianCalendar();
			c.setFirstDayOfWeek(Calendar.MONDAY);
			c.setMinimalDaysInFirstWeek(7);
			c.setTime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "KW" + String.valueOf(c.get(Calendar.WEEK_OF_YEAR)); //$NON-NLS-1$
	}

	/**
	 * 取得当前日期是多少周
	 * 
	 * @param date
	 * @return
	 */
	public static int getWeekOfYear(Date date) {
		Calendar c = new GregorianCalendar();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setMinimalDaysInFirstWeek(7);
		c.setTime(date);

		return c.get(Calendar.WEEK_OF_YEAR);
	}

	/**
	 * 得到某一年周的总数
	 */
	public static int getMaxWeekNumOfYear(int year) {
		Calendar c = new GregorianCalendar();
		c.set(year, Calendar.DECEMBER, 31, 23, 59, 59);

		return getWeekOfYear(c.getTime());
	}

	/**
	 * 取得当前日期的年
	 */
	public static int getIntegerDateOfYear(String dateStr) {
		Calendar c = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //$NON-NLS-1$
			Date date = sdf.parse(dateStr);

			c = new GregorianCalendar();
			c.setFirstDayOfWeek(Calendar.MONDAY);
			c.setMinimalDaysInFirstWeek(7);
			c.setTime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c.get(Calendar.YEAR);
	}
	
	/**
	 * 取得当前日期是多少周
	 */
	public static int getIntegerWeekOfYear(String dateStr) {
		Calendar c = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //$NON-NLS-1$
			Date date = sdf.parse(dateStr);

			c = new GregorianCalendar();
			c.setFirstDayOfWeek(Calendar.MONDAY);
			c.setMinimalDaysInFirstWeek(7);
			c.setTime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c.get(Calendar.WEEK_OF_YEAR);
	}
	

}
