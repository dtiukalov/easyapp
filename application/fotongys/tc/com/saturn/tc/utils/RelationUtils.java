package com.saturn.tc.utils;

import java.util.LinkedList;
import java.util.List;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Attachment;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class RelationUtils {

	public static int queryStacksByItemRevRelation(
			String mailId, Attachment attachment,
			ItemRevision itemRev, String[] relations,
			LinkedList<Attachment> stack, TCSession session,List<Attachment> attachments) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		DataManagementService dmService = DataManagementService.getService(session.getConnection());
		int num = 0;
		if (relations.length > 0) {
			try {
				ModelObject[] objects1 = { itemRev };
				dmService.getProperties(objects1, relations);
				
				for (int r = 0; r < relations.length; r++) {
					String relation = relations[r];
					
					ModelObject[] models1 = itemRev.getProperty(relation).getModelObjectArrayValue();
					service.getProperties(models1, 
							new String[] {"object_name"});
					for (int i = 0; i < models1.length; i++) {
						ModelObject modelObject = models1[i];
						Attachment child  = new Attachment(mailId, 
								(WorkspaceObject)modelObject, attachment.getUid(), service);
						attachments.add(child);
						stack.add(child);
						num ++ ;
					}
				}
			} catch (NotLoadedException e) {
				e.printStackTrace();
			}
		}
		return num;
	}
}
