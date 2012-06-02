package com.saturn.tc.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.saturn.ph.ReportPage;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class SortUtils {
	
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
				int result = 0;
				
				String sortNum1 = "";
				if (rp1.getSortNum().split(".").length > 0) {
					for (int l=0; l<rp1.getSortNum().split(".").length-1; l++) {
						sortNum1 += rp1.getSortNum().split(".")[l];
					}
				}
				
				String sortNum2 = rp2.getSortNum();
				if (rp2.getSortNum().split(".").length > 0) {
					for (int l=0; l<rp2.getSortNum().split(".").length-1; l++) {
						sortNum2 += rp2.getSortNum().split(".")[l];
					}
				}
		System.out.println("sortNum1 = " + sortNum1 + " sortNum2 = " + sortNum2);

				if (!"".equals(sortNum1) &&
						!"".equals(sortNum2)) {
					int num1 = Integer.parseInt(sortNum1);
					int num2 = Integer.parseInt(sortNum2);
					result = num1 - num2;
				}
				return result;
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
		//Backup 首先按照 pageName排序 ,pageName相同的再按照“排序编号”排序
		Collections.sort(backupList, new Comparator<ReportPage>() {
			public int compare(ReportPage rp1, ReportPage rp2) {
				
				int result = 0;
				
				String pageName1 = rp1.getPageName();
				String pageName2 = rp2.getPageName();
				
				if (pageName1.compareTo(pageName2) == 0) {
			System.out.println("pageName相同");
					String sortNum1 = "";
					if (rp1.getSortNum().split(".").length > 0) {
						for (int l=0; l<rp1.getSortNum().split(".").length-1; l++) {
							sortNum1 += rp1.getSortNum().split(".")[l];
						}
					}
					
					String sortNum2 = rp2.getSortNum();
					if (rp2.getSortNum().split(".").length > 0) {
						for (int l=0; l<rp2.getSortNum().split(".").length-1; l++) {
							sortNum2 += rp2.getSortNum().split(".")[l];
						}
					}
					
					if (!"".equals(sortNum1) &&
							!"".equals(sortNum2) && 
							pageName1.equalsIgnoreCase(pageName2)) {
						int num1 = Integer.parseInt(sortNum1);
						int num2 = Integer.parseInt(sortNum2);
						result = num1 - num2;
					}
				} else {
					System.out.println("pageName不相同");
					result = pageName1.compareTo(pageName2);
				}
				
				return result;
			}
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
