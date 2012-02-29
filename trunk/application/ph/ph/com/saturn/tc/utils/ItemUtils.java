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
	private static final String[] relations = {
		"FV9LOPH_Rel",
		"FV9PLPH_Rel",
		"FV9PMPH_Rel",
		"FV9QAPH_Rel",
		"FV9SUPH_Rel",
		"FV9TEPH_Rel",
		"FV9VSCPH_Rel",
		"FV9SCPH_Rel"
	};
	
	private ItemUtils() {

	}

	public static Map<String, Object> getLastRevisionFormIds(Item item) {
		Map<String, Object> ids = new HashMap<String, Object>();

		PH.getDataService().getProperties(item, "object_name",
				"displayable_revisions");

		try {
			ModelObject[] itemRevs = (ModelObject[]) item
					.get_displayable_revisions();

			if (itemRevs.length > 0) {
				ItemRevision itemRev = (ItemRevision) itemRevs[itemRevs.length - 1];
				PH.getDataService().getProperties(itemRev, "object_name",
						"item_revision_id", "current_revision_id",
						"IMAN_specification", "view", "IMAN_requirement",
						"IMAN_reference", "TC_WorkContext_Relation",
						"TC_Attaches", "VisItemRevCreatedSnapshot2D");
				
				PH.getDataService().getProperties(itemRev, relations);
				
				for (String relation : relations) {
					ModelObject[] objects = itemRev.getProperty(relation).getModelObjectArrayValue();
					PH.getDataService().getProperties(objects, "object_type");
					PH.getDataService().getProperties(objects, "object_name");
					PH.getDataService().getProperties(objects, "fv9PreRelesed");
					
					for (ModelObject modelObject : objects) {
						String uid = modelObject.getUid();
						String type = modelObject.getType().getName();
						String isPublic = modelObject.getPropertyDisplayableValue("fv9PreRelesed");
						if ("yes".equalsIgnoreCase(isPublic)) {
							if(type.equalsIgnoreCase(WorkspaceUtils.DatasetType)){
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
			}

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return ids;
	}
}
