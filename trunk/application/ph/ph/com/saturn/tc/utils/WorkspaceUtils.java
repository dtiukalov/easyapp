package com.saturn.tc.utils;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class WorkspaceUtils {

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

	private WorkspaceUtils() {

	}
}
