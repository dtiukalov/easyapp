package com.saturn.ph;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.ServiceData;
import com.teamcenter.soa.exceptions.NotLoadedException;

public abstract class Form {
	
	public abstract String[] getAttributes();
	
	public abstract String getJspPath();
	
	public abstract String getType();
	
	public abstract String getTitle();
	
	public Map<String, Object> getValue(String uid, boolean refresh) {
		ModelObject model = loadModelObject(uid, refresh);
		Map<String, Object> value = new HashMap<String, Object>();
		String[] attributes = getAttributes();
		
		if (model != null && attributes != null) {
			getProperties(model, attributes);
			
			for (String attr : attributes) {
				try {
					if (model.getProperty(attr).getPropertyDescription().isArray()) {
						value.put(attr, Arrays.asList(model.getProperty(attr).getStringArrayValue()));
					} else {
						value.put(attr, model.getPropertyDisplayableValue(attr));
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
		}
		
		return value;
	}
	
	public ServiceData getProperties(ModelObject model, String... args) {
		return PH.getDataService().getProperties(model, args);
	}
	
	public ModelObject loadModelObject(String uid, boolean refresh) {
		if (refresh) {
			return PH.getDataService().loadModelObjectRefresh(uid);
		} else {
			return PH.getDataService().loadModelObject(uid);
		}
	}
}
