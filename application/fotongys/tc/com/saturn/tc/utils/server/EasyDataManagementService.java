package com.saturn.tc.utils.server;

import com.saturn.tc.clientx.TCSession;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.ServiceData;

public class EasyDataManagementService {
	private TCSession session = null;

	public EasyDataManagementService(TCSession session) {
		this.session = session;
	}
	
	public DataManagementService getService() {
		return DataManagementService.getService(this.session.getConnection());
	}
	
	public ServiceData loadObjects(String... args) {
		return getService().loadObjects(args);
	}
	
	public ModelObject loadModelObject(String arg) {
		ServiceData serviceData = getService().loadObjects(new String[] {arg});
		
		if (serviceData != null && serviceData.sizeOfPlainObjects() > 0) {
			ModelObject modelObject = serviceData.getPlainObject(0);
			
			return refreshObjects(modelObject);			
		}
		
		return null;
	}
	
	public ServiceData getProperties(ModelObject model, String... args) {
		return getService().getProperties(new ModelObject[] {model}, args);
	}
	
	public ServiceData getProperties(ModelObject[] models, String... args) {
		return getService().getProperties(models, args);
	}
	
	public ServiceData deleteObjects(ModelObject... models) {
		return getService().deleteObjects(models);
	}
	
	public ModelObject refreshObjects(ModelObject model) {
		ServiceData serviceData = getService().refreshObjects(new ModelObject[] {model});
		
		if (serviceData != null && serviceData.sizeOfPlainObjects() > 0) {
			return serviceData.getPlainObject(0);
		}
		
		return model;
	}
}
