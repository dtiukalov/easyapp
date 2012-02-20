package com.saturn.tc.utils;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class WorkspaceUtils {
	
	public static String HOST = "http://localhost:7001/tc";
	
	public static Folder getHome(TCSession session, String userId) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		
		User user = (User) service.loadModelObject(userId);

		Folder home = null;

		if (user != null) {
			try {
				home = user.get_home_folder();
				service.getProperties(home, "current_name",
						"object_name", "contents");

			} catch (NotLoadedException e) {
				e.printStackTrace();
			}
		}

		return home;
	}

	public static ModelObject[] getChildren(TCSession session, Folder root) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		ModelObject[] contents = null;

		try {
			root = (Folder)service.refreshObjects(root);
			service.getProperties(root, "current_name",
					"object_name", "contents");

			contents = root.get_contents();
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return contents;
	}
	
	public static Map<String,Item> initPHItemlist(TCSession session, String userUid) {
		Map<String,Item>  phItemMap = new HashMap<String,Item>();//PHItem对象

		EasyDataManagementService service = new EasyDataManagementService(
				session);
		Folder homeFolder = getHome(session, userUid);
		WorkspaceObject[] workspaceObjects = (WorkspaceObject[]) getChildren(session, homeFolder);
		service.getProperties(workspaceObjects, "uid", "object_name",
				"object_type", "contents");
		LinkedList<Folder> stack = new LinkedList<Folder>();
		for (WorkspaceObject wo : workspaceObjects) {
			if ("fv9PHReport_Item".equals(wo.getType().getName())) {
				Item phitem = (Item)wo;
				phItemMap.put(wo.getUid(), phitem);
			}
			if(wo instanceof Folder){
				Folder folder = (Folder)wo;
				stack.add(folder);
			}
		}
		while (!stack.isEmpty()) {
			Folder folder = stack.removeFirst();
			WorkspaceObject[] children = (WorkspaceObject[]) getChildren(session, folder);
			service.getProperties(children, "uid", "object_name",
					"object_type", "contents");
			for (WorkspaceObject wo : children) {
				if ("FV9PHReport".equals(wo.getType().getName())) {
					Item phitem = (Item)wo;
					phItemMap.put(wo.getUid(), phitem);
				}
				if(wo instanceof Folder){
					stack.add((Folder)wo);
				}
			}
		}
		
		return phItemMap;
	}

	private WorkspaceUtils() {

	}
}
