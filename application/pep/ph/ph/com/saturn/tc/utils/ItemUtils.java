package com.saturn.tc.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.saturn.ph.PH;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class ItemUtils {
	
	
	private ItemUtils() {

	}

	public static Map<String, Object> getLastRevisionFormIds(
			ItemRevision itemRev,
			String[] relations) {
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
					}
				}
			}
		} catch (NotLoadedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ids;
	}
}
