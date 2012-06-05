package com.saturn.tc.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.saturn.ph.ReportPage;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class SortUtils {
	

	public static void sortPHReportItem(final EasyDataManagementService service, 
			List<Map<String,Item>> itemList) {
		
		Collections.sort(itemList, new Comparator<Map<String,Item>>() {
			public int compare(Map<String,Item> map1, Map<String,Item> map2) {
				String key1 = map1.keySet().iterator().next().toString();
				Item item1 = map1.get(key1);
				String key2 = map2.keySet().iterator().next().toString();
				Item item2 = map2.get(key2);
				service.refreshObjects(item1);
				service.refreshObjects(item2);
				service.getProperties(item1, "creation_date");
				service.getProperties(item2, "creation_date");
				Date date1 = new Date();
				Date date2 = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM");
				try {
					date1 = item1.getProperty("creation_date").getDateValue().getTime();
					date2 = item2.getProperty("creation_date").getDateValue().getTime();
		System.out.println("date1 = " + date1 + " date2 = " + date2);
		
				} catch (NotLoadedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				long time1 = date1.getTime();
				long time2 = date2.getTime();
				long result = time2 - time1;
		System.out.println("result = " + result);	
				if (result > 0) {
					return 1;
				} else {
					return -1;
				}
			
			}
		});
		
	}
	
	public static List<ReportPage> phSort(List<ReportPage> indexes) {
		List<ReportPage> newList = new ArrayList<ReportPage>();
//		主文件(由无序变成有序)
		List<ReportPage> mainList = new ArrayList<ReportPage>();
//		主文件pageName
		List<String> mainPageNameList = new ArrayList<String>();
//		无序的Backup
		List<ReportPage> backupList = new ArrayList<ReportPage>();
//		有序的Backup
		List<ReportPage> newbackupList = new ArrayList<ReportPage>();
		
		for (ReportPage rp : indexes) {
			boolean backup = rp.getBackup();
			if (backup) {
				backupList.add(rp);
			} else {
				mainList.add(rp);
			}
		}
		System.out.println("mainList length = " + mainList.size());
		System.out.println("backupList length = " + backupList.size());
		//主文件按照“排序编号”排序
		Collections.sort(mainList, new Comparator<ReportPage>() {
			public int compare(ReportPage rp1, ReportPage rp2) {
				String sortNum1 = rp1.getSortNum().replaceAll("\\D", "");
				String sortNum2 = rp2.getSortNum().replaceAll("\\D", "");
				
				int num1 = 999999;
				int num2 = 999999;
				if (!"".equals(sortNum1)) 
					num1 = Integer.parseInt(sortNum1);
					
				if (!"".equals(sortNum2))
					num2 = Integer.parseInt(sortNum2);
				
				return num1 - num2;
			}
		});
		
//		获取主文件的pageName排序
		for (ReportPage main : mainList) {
			mainPageNameList.add(main.getPageName());
		}
		
//		//Backup 首先按照 主文件的 pageName排序
//		for (String pageName : mainPageNameList) {
//			for (ReportPage backup : backupList) {
//				if (pageName.equalsIgnoreCase(backup.getPageName())) {
//					newbackupList.add(backup);
//				}
//			}
//		}
		//Backup 首先按照 pageName排序 ,pageName相同的再按照“排序编号”排序(逻辑不对)
		//Backup 按照 “排序编号”排序
		Collections.sort(backupList, new Comparator<ReportPage>() {
			public int compare(ReportPage rp1, ReportPage rp2) {
				
				String sortNum1 = rp1.getSortNum().replaceAll("\\D", "");
				String sortNum2 = rp2.getSortNum().replaceAll("\\D", "");
				
				int num1 = 999999;
				int num2 = 999999;
				if (!"".equals(sortNum1)) 
					num1 = Integer.parseInt(sortNum1);
					
				if (!"".equals(sortNum2))
					num2 = Integer.parseInt(sortNum2);
				
				return num1 - num2;
			}
				//Backup 首先按照 pageName排序 ,pageName相同的再按照“排序编号”排序(逻辑不对)
//				String pageName1 = rp1.getPageName();
//				String pageName2 = rp2.getPageName();
//				if (pageName1.compareTo(pageName2) == 0) {
//					if (!"".equals(sortNum1) &&
//							!"".equals(sortNum2)) {
//						int num1 = Integer.parseInt(sortNum1);
//						int num2 = Integer.parseInt(sortNum2);
//						result = num1 - num2;
//					}
//				} else {
//					result = pageName1.compareTo(pageName2);
//				}
//				return result;
		});
		
//		先加载主文件，再加载Backup
		for (ReportPage main : mainList) {
			newList.add(main);
		}
		for (ReportPage backup : backupList) {
			newList.add(backup);
		}
		 
		return newList;
	}
	

}
