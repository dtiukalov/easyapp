package com.saturn.tc.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			for (String relation : relations) {
				ModelObject[] objects = itemRev.getProperty(relation).getModelObjectArrayValue();
				PH.getDataService().getProperties(objects, "object_type");
				PH.getDataService().getProperties(objects, "object_name");
				PH.getDataService().getProperties(objects, "fv9PreRelesed");
				PH.getDataService().getProperties(objects, "fv9IsBackup");
				
				for (ModelObject modelObject : objects) {
					PH.getDataService().refreshObjects(modelObject);
					String uid = modelObject.getUid();				//获取对象Uid
					String type = modelObject.getType().getName();	//获取FormType名称
					String isPublic = modelObject.getPropertyDisplayableValue("fv9PreRelesed");//获取对象是否预发布，如果预发布则在Web端显示 
					if ("yes".equalsIgnoreCase(isPublic)) {
						if(type.equalsIgnoreCase(WorkspaceUtils.DatasetType)){//如果是数据集FV9PHImage 获取数据集页面名称作为Type
							PH.getDataService().getProperties(modelObject, "fv9PageName");
							try {
								type = modelObject.getProperty("fv9PageName").getDisplayableValue();
							} catch (NotLoadedException e) {
								e.printStackTrace();
							}
						}
						
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
				backUpSort(ids);
			}
		} catch (NotLoadedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ids;
	}

	private static void backUpSort(Map<String, Object> ids) {
		//	backup排序
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
