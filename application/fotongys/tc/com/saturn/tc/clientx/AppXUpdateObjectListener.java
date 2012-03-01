//==================================================
//
//  Copyright 2010 Siemens Product Lifecycle Management Software Inc. All Rights Reserved.
//
//==================================================

package com.saturn.tc.clientx;

import com.teamcenter.soa.client.model.ChangeListener;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

/**
 * Implementation of the ChangeListener. Print out all objects that have been
 * updated.
 * 
 * @author emily
 */
public class AppXUpdateObjectListener implements ChangeListener {

	public void modelObjectChange(ModelObject[] objects) {
//		if (objects.length == 0)
//			return;
//		System.out.println("");
//		System.out
//				.println("Modified Objects handled in com.teamcenter.clientx.AppXUpdateObjectListener.modelObjectChange");
//		System.out
//				.println("The following objects have been updated in the client data model:");
//		for (int i = 0; i < objects.length; i++) {
//			String uid = objects[i].getUid();
//			String type = objects[i].getType().getName();
//			String name = "";
//			if (objects[i].getType().isInstanceOf("WorkspaceObject")) {
//				ModelObject wo = objects[i];
//				try {
//					name = wo.getProperty("object_string").getStringValue();
//				} catch (NotLoadedException e) {
//				} // just ignore
//			}
//			System.out.println("uid    " + uid + "type " + type + "name "
//					+ name);
//		}
	}

}
