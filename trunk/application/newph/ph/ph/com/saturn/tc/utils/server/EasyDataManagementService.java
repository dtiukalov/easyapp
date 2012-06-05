package com.saturn.tc.utils.server;

import com.saturn.tc.clientx.TCSession;
import com.teamcenter.services.strong.core.DataManagementRestBindingStub;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.ServiceData;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;

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
	
	public ModelObject loadModelObject(String uid) {
		ServiceData serviceData = getService().loadObjects(new String[] {uid});
		
		if (serviceData != null && serviceData.sizeOfPlainObjects() > 0) {
			ModelObject modelObject = serviceData.getPlainObject(0);
			
			return modelObject;			
		}
		
		return null;
	}
	
	public ModelObject loadModelObjectRefresh(String uid) {
		return refreshObjects(loadModelObject(uid));
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
	
	public ModelObject[] whereReferenced(int levle, WorkspaceObject... wos) {
		DataManagementRestBindingStub stub = (DataManagementRestBindingStub)getService();

		ServiceData data =  stub.whereReferenced(wos, levle).serviceData;
		
		ModelObject[] refs = null;
		int size = data.sizeOfPlainObjects();
		if (size > 0) {
			 refs = new ModelObject[size];
			 
			 for (int i = 0; i < size; ++i) {
				 refs[i] = data.getPlainObject(i);
			 }
		}
		
		return refs;
	}
}
