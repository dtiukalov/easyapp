package com.saturn.tc.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.saturn.ph.FormManager;
import com.saturn.ph.PH;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class ItemUtils {
	
	
	private ItemUtils() {

	}

	public static Map<String, Object> getLastRevisionFormIds(
			ItemRevision itemRev,
			String[] relations,
			HttpServletRequest request) {
		Map<String, Object> ids = new HashMap<String, Object>();
		
		try {
//			循环关系
			for (String relation : relations) {
				ModelObject[] objects = itemRev.getProperty(relation).getModelObjectArrayValue();
				PH.getDataService().getProperties(objects, "object_type");
				PH.getDataService().getProperties(objects, "object_name");
				PH.getDataService().getProperties(objects, "fv9PreRelesed");
				PH.getDataService().getProperties(objects, "fv9IsBackup");
//				循环每个关系下的所有对象
				for (ModelObject modelObject : objects) {
					PH.getDataService().refreshObjects(modelObject);
					String uid = modelObject.getUid();				//获取对象Uid
					String type = modelObject.getType().getName();	//获取FormType名称
					String isPublic = modelObject.getPropertyDisplayableValue("fv9PreRelesed");//获取对象是否预发布，如果预发布则在Web端显示 
//					加载的前提：预发布
					if ("yes".equalsIgnoreCase(isPublic)) {
/*						//如果是数据集FV9PHImage Type为FV9PHImage
						if(type.equalsIgnoreCase(WorkspaceUtils.DatasetType)){
							PH.getDataService().getProperties(modelObject, "fv9PageName");
							type = WorkspaceUtils.DatasetType;
//							try {
//								type = modelObject.getProperty("fv9PageName").getDisplayableValue();
//							} catch (NotLoadedException e) {
//								e.printStackTrace();
//							}
						}*/
						
						if (ids.containsKey(type)) {
							Object obj = ids.get(type);
							
							if (obj instanceof List) {
								((List)obj).add(uid);
							} else {
								List<String> arr = new ArrayList<String>();
								arr.add((String)obj);
								arr.add(uid);
								ids.put(type, arr);
							}
						} else {
							ids.put(type, uid);
						}
						
						//将3.4 Funktionsmaße nach Bauteilen的UID放在session中，
						//供3.4 Funktionsmaße 获取公差尺寸的总数
						if ("FV9_34FuntNachBaut".equals(type)) {
							request.getSession().setAttribute("FuntionsmasseUID", uid);
						}
						
					}
					
				}
				//backup排序
				
				System.out.println(ids);
				backUpSort(ids);
				System.out.println(ids);
			}
		} catch (NotLoadedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ids;
	}

	private static void backUpSort(Map<String, Object> ids) {
		//	backup排序
//		获取所有FV9PHBackup类型的对象
		if(ids.get(WorkspaceUtils.BackUpType)!= null){
			Object object = ids.get(WorkspaceUtils.BackUpType);
		
			if(object instanceof List){
				List<String> list = (List<String>)ids.get(WorkspaceUtils.BackUpType);
				List<String>  backupids = new ArrayList<String>();
				List<String> backupNameList = new ArrayList<String>();
				Map<String,Object>  backupNameMap = new HashMap<String,Object>();
				
				for(String id: list){
					try {
						PH.getDataService().getProperties(PH.getDataService().loadModelObjectRefresh(id), "fv9PageName");
						String name = (String)PH.getDataService().loadModelObjectRefresh(id).getPropertyDisplayableValue("fv9PageName");
							if(backupNameMap.containsKey(name)){
								Object object2 = backupNameMap.get(name);
								if (object2 instanceof List) {
									((List)object2).add(id);
								} else {
									List<String> arr = new ArrayList<String>();
									arr.add((String)object2);
									arr.add(id);
									backupNameMap.put(name, arr);
								}
								
							} else {
								backupNameMap.put(name, id);
							}
							//backupNameList.add(name);
						} catch (NotLoadedException e) {
							e.printStackTrace();
						}
				}
				Iterator<String> iterator = backupNameMap.keySet().iterator();
				while(iterator.hasNext()){
					backupNameList.add(iterator.next());
				}
				Collections.sort(backupNameList);
				
				for(String backupName : backupNameList){
					Object object3 = backupNameMap.get(backupName);
					
					if(object3 instanceof List){
						List<String> object4 = (List<String>) object3;
						for(String ob4 : object4){
							backupids.add(ob4);
						}
					} else {
						backupids.add((String)object3);
					}
				}
				ids.put(WorkspaceUtils.BackUpType, backupids);
			}
		}
//  backup排序
	}
	/*
	 * 
	 */
	public static List<Map<String, Object>> getFormIds(
			ItemRevision itemRev,
			String[] relations,
			HttpServletRequest request) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> currentIds = new HashMap<String, Object>();
		Map<String, Object> backUpIds = new HashMap<String, Object>();
		Map<String, Object> pageNameNullIds = new HashMap<String, Object>();
		int pageNameNulltempCont = 0; 
		try {
			for (String relation : relations) {
				ModelObject[] objects = itemRev.getProperty(relation).getModelObjectArrayValue();
				PH.getDataService().getProperties(objects, "object_type");
				PH.getDataService().getProperties(objects, "object_name");
				PH.getDataService().getProperties(objects, "fv9PreRelesed");
				PH.getDataService().getProperties(objects, "fv9IsBackup");
			//	PH.getDataService().getProperties(objects, "fv9SortNum");
				PH.getDataService().getProperties(objects, "fv9PageName");
				
				for (ModelObject modelObject : objects) {
					PH.getDataService().refreshObjects(modelObject);
					String uid = modelObject.getUid();				//获取对象Uid
					String type = modelObject.getType().getName();	//获取FormType名称
				//	String fv9sortnum = modelObject.getProperty("fv9SortNum").getStringValue();//获取排序属性值
					String isPublic = modelObject.getPropertyDisplayableValue("fv9PreRelesed");//获取对象是否预发布，如果预发布则在Web端显示 
					String isBackup = modelObject.getPropertyDisplayableValue("fv9IsBackup");//获取对象是否BackUp 
					String pageName = modelObject.getPropertyDisplayableValue("fv9PageName");//获取对象是否BackUp 
			
					//将3.4 Funktionsmaße nach Bauteilen的UID放在session中，
					//供3.4 Funktionsmaße 获取公差尺寸的总数
					if ("FV9_34FuntNachBaut".equals(type)) {
						request.getSession().setAttribute("FuntionsmasseUID", uid);
					}

//					无论FV9_11ProjectTermin和FV9_11VorserienTer是否预发布，均取其时间作为公共数据
					Map<String, Object> otherForm = FormManager.getFormValue(
							type, 
							uid, 
							true);
					if ("FV9_11ProjectTermin".equals(type)) {
				System.out.println("获取到FV9_11ProjectTermin的otherUid");
						request.getSession().setAttribute(type, otherForm);
						
						//里程碑开始时间
						String DATE_VFF = DateUtils.getDateValue(otherForm.get("fv9VFFMLDate")) + " 00:00";   //2013-07-31
						String DATE_PVS = DateUtils.getDateValue(otherForm.get("fv9PVSMLDate")) + " 00:00"; //2013-10-31
						String DATE_0S = DateUtils.getDateValue(otherForm.get("fv90SMLDate")) + " 00:00"; //2014-03-29
						String DATE_SOP = DateUtils.getDateValue(otherForm.get("fv9SOPMLDate")) + " 00:00"; //2014-06-30
						String DATE_ME = DateUtils.getDateValue(otherForm.get("fv9MEMLDate")) + " 00:00";
						
						request.getSession().setAttribute("DATE_VFF", DATE_VFF);
						request.getSession().setAttribute("DATE_PVS", DATE_PVS);
						request.getSession().setAttribute("DATE_0S", DATE_0S);
						request.getSession().setAttribute("DATE_SOP", DATE_SOP);
						request.getSession().setAttribute("DATE_ME", DATE_ME);
						
						request.getSession().setAttribute("SOP_DATE", DateUtils.getDateValue(otherForm.get("fv9SOPMLDate")));

						//里程碑开始周
						int KW_VFF =DateUtils.getWeekOfYear(DATE_VFF);
						int KW_PVS = DateUtils.getWeekOfYear(DATE_PVS);
						int KW_0S = DateUtils.getWeekOfYear(DATE_0S);
						int KW_SOP = DateUtils.getWeekOfYear(DATE_SOP);
						int KW_ME = DateUtils.getWeekOfYear(DATE_ME);
						
						request.getSession().setAttribute("KW_VFF", KW_VFF);
						request.getSession().setAttribute("KW_PVS", KW_PVS);
						request.getSession().setAttribute("KW_0S", KW_0S);
						request.getSession().setAttribute("KW_SOP", KW_SOP);
						request.getSession().setAttribute("KW_ME", KW_ME);
						
						//每个里程碑经历的周数
						int KWNo_VFF = 0, KWNo_PVS = 0, KWNo_0S = 0, KWNo_SOP = 0;
						KWNo_VFF = DateUtils.getWeekNumBetweenStartAndEnd(DATE_VFF, DATE_PVS);
						KWNo_PVS = DateUtils.getWeekNumBetweenStartAndEnd(DATE_PVS, DATE_0S);
						KWNo_0S = DateUtils.getWeekNumBetweenStartAndEnd(DATE_0S, DATE_SOP);
						KWNo_SOP = DateUtils.getWeekNumBetweenStartAndEnd(DATE_SOP, DATE_ME);
						
						request.getSession().setAttribute("KWNo_VFF", KWNo_VFF);
						request.getSession().setAttribute("KWNo_PVS", KWNo_PVS);
						request.getSession().setAttribute("KWNo_0S", KWNo_0S);
						request.getSession().setAttribute("KWNo_SOP", KWNo_SOP);
						
						//计算每个里程碑所占的比例
						double sum = Double.parseDouble((KWNo_VFF + KWNo_PVS + KWNo_0S + KWNo_SOP) + "");
						double vff = 0.0, pvs = 0.0, os = 0.0, sop = 0.0;
						vff = (KWNo_VFF/sum)*100;
						pvs = (KWNo_PVS/sum)*100;
						os = (KWNo_0S/sum)*100;
						sop = (KWNo_SOP/sum)*100;
					}
					
					if ("FV9_11VorserienTer".equals(type)) {
			System.out.println("获取到FV9_11VorserienTer的otherUid");
						request.getSession().setAttribute(type, otherForm);
						
						String fv9VFFTBTZP5 = DateUtils.getDateValue(otherForm.get("fv9VFFTBTZP5")) + " 00:00"; //2011-12-10
						String fv9VFFTBTZP7 = DateUtils.getDateValue(otherForm.get("fv9VFFTBTZP7")) + " 00:00"; //2012-01-10
						
						String fv9PVSTBTZP5 = DateUtils.getDateValue(otherForm.get("fv9PVSTBTZP5")) + " 00:00"; //2012-01-30
						String fv9PVSTBTZP7 = DateUtils.getDateValue(otherForm.get("fv9PVSTBTZP7")) + " 00:00"; //2012-02-04
						
						String fv90STBTZP5 = DateUtils.getDateValue(otherForm.get("fv90STBTZP5")) + " 00:00"; //2012-03-22
						String fv90STBTZP7 = DateUtils.getDateValue(otherForm.get("fv90STBTZP7")) + " 00:00"; //2012-04-11
						
						//ZP7的SOP取自项目的SOP，ZP5的SOP是ZP7 SOP的前两周
						String fv9ZP7SOP = (String)DateUtils.getDateValue(request.getSession().getAttribute("SOP_DATE")) + " 00:00";
						String fv9ZP5SOP = DateUtils.oneDateAddOrSubDays(fv9ZP7SOP, 2, "-") + " 00:00";
						
						request.getSession().setAttribute("fv9VFFTBTZP5", fv9VFFTBTZP5);
						request.getSession().setAttribute("fv9VFFTBTZP7", fv9VFFTBTZP7);
						request.getSession().setAttribute("fv9PVSTBTZP5", fv9PVSTBTZP5);
						request.getSession().setAttribute("fv9PVSTBTZP7", fv9PVSTBTZP7);
						request.getSession().setAttribute("fv90STBTZP5", fv90STBTZP5);
						request.getSession().setAttribute("fv90STBTZP7", fv90STBTZP7);
						request.getSession().setAttribute("fv9ZP7SOP", fv9ZP7SOP);
						request.getSession().setAttribute("fv9ZP5SOP", fv9ZP5SOP);
						
						int VFFTBTZP5 = DateUtils.getWeekOfYear(fv9VFFTBTZP5);
						int VFFTBTZP7 = DateUtils.getWeekOfYear(fv9VFFTBTZP7);
						int PVSTBTZP5 = DateUtils.getWeekOfYear(fv9PVSTBTZP5);
						int PVSTBTZP7 = DateUtils.getWeekOfYear(fv9PVSTBTZP7);
						int OSTBTZP5 = DateUtils.getWeekOfYear(fv90STBTZP5);
						int OSTBTZP7 = DateUtils.getWeekOfYear(fv90STBTZP7);
						int ZP7SOP = DateUtils.getWeekOfYear(fv9ZP7SOP );
						int ZP5SOP = DateUtils.getWeekOfYear(fv9ZP5SOP);
						
						request.getSession().setAttribute("VFFTBTZP5", VFFTBTZP5);
						request.getSession().setAttribute("VFFTBTZP7", VFFTBTZP7);
						request.getSession().setAttribute("PVSTBTZP5", PVSTBTZP5);
						request.getSession().setAttribute("PVSTBTZP7", PVSTBTZP7);
						request.getSession().setAttribute("OSTBTZP5", OSTBTZP5);
						request.getSession().setAttribute("OSTBTZP7", OSTBTZP7);
						request.getSession().setAttribute("ZP7SOP", ZP7SOP);
						request.getSession().setAttribute("ZP5SOP", ZP5SOP);
					}
					
//					首要条件是“预发布”
					if ("yes".equalsIgnoreCase(isPublic)) {
//						标题不为空
						if(pageName!= null && !"".equalsIgnoreCase(pageName)){
//							主文件
							if(!isBackup.equalsIgnoreCase("yes") && type != WorkspaceUtils.BackUpType){
//								存在多个相同类型或者相同标题的表单
								if (currentIds.containsKey(pageName)) {
									Object obj = currentIds.get(pageName);
									if (obj instanceof List) {
										((List)obj).add(uid);
									} else {
										List<String> arr = new ArrayList<String>();
										arr.add((String)obj);
										arr.add(uid);
										currentIds.put(pageName, arr);
									}
//								仅有一个相同类型或者相同标题的表单
								} else {
									currentIds.put(pageName, uid);
								}
								
//							Backup
							} else {
//								存在多个相同类型或者相同标题的Backup
								if (backUpIds.containsKey(pageName)) {
									Object obj = backUpIds.get(pageName);
									if (obj instanceof List) {
										((List)obj).add(uid);
									} else {
										List<String> arr = new ArrayList<String>();
										arr.add((String)obj);
										arr.add(uid);
										backUpIds.put(pageName, arr);
									}
//								仅有一个相同类型或者相同标题的Backup
								} else {
									backUpIds.put(pageName, uid);
								}
							}
						} else {
//							标题为空
							pageNameNulltempCont++;
							pageNameNullIds.put("pageNameBull_" + pageNameNulltempCont, uid);
						}
						
					}
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
			return null;
		}
		
		list.add(currentIds);
		list.add(backUpIds);
		return list;
	}
}
