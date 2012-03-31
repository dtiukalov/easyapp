package com.saturn.tc.utils;

import com.teamcenter.soa.client.model.strong.AllocationMap;
import com.teamcenter.soa.client.model.strong.AllocationMapRevision;
import com.teamcenter.soa.client.model.strong.Architecture;
import com.teamcenter.soa.client.model.strong.ArchitectureRevision;
import com.teamcenter.soa.client.model.strong.Company;
import com.teamcenter.soa.client.model.strong.CompanyRevision;
import com.teamcenter.soa.client.model.strong.DMTemplate;
import com.teamcenter.soa.client.model.strong.DMTemplateRevision;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.Design;
import com.teamcenter.soa.client.model.strong.Design_Revision;
import com.teamcenter.soa.client.model.strong.Document;
import com.teamcenter.soa.client.model.strong.DocumentRevision;
import com.teamcenter.soa.client.model.strong.Drawing;
import com.teamcenter.soa.client.model.strong.Drawing_Revision;
import com.teamcenter.soa.client.model.strong.Envelope;
import com.teamcenter.soa.client.model.strong.ExcelTemplate;
import com.teamcenter.soa.client.model.strong.ExcelTemplateRevision;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.Form;
import com.teamcenter.soa.client.model.strong.Functionality;
import com.teamcenter.soa.client.model.strong.FunctionalityRevision;
import com.teamcenter.soa.client.model.strong.GraphicOption;
import com.teamcenter.soa.client.model.strong.GraphicOptionRevision;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.client.model.strong.ObjectTemplate;
import com.teamcenter.soa.client.model.strong.ObjectTemplateRevision;
import com.teamcenter.soa.client.model.strong.RouteLocation;
import com.teamcenter.soa.client.model.strong.RouteLocationRevision;
import com.teamcenter.soa.client.model.strong.Schedule;
import com.teamcenter.soa.client.model.strong.ScheduleRevision;
import com.teamcenter.soa.client.model.strong.SpecTemplate;
import com.teamcenter.soa.client.model.strong.SpecTemplateRevision;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;

public class IconUtils {

	public static String getIconByType(WorkspaceObject wso) {
		String iconCls = "icon-ok";
		if ((wso instanceof Item) || (wso instanceof ItemRevision)) {
			iconCls = "icon-item";
		}
		
		if ((wso instanceof Document) || (wso instanceof DocumentRevision)) {
			iconCls = "icon-document";
		}
		
		if ((wso instanceof Drawing) || (wso instanceof Drawing_Revision)) {
			iconCls = "icon-drawing";
		}
		
		if ((wso instanceof DMTemplate) || (wso instanceof DMTemplateRevision)) {
			iconCls = "icon-DMTemplate";
		}
		
		if ((wso instanceof ExcelTemplate) || (wso instanceof ExcelTemplateRevision)) {
			iconCls = "icon-ExcelTemplate";
		}
		
		if ((wso instanceof ObjectTemplate) || (wso instanceof ObjectTemplateRevision)) {
			iconCls = "icon-ObjectTemplate";
		}
		
		if ((wso instanceof SpecTemplate) || (wso instanceof SpecTemplateRevision)) {
			iconCls = "icon-SpecTemplate";
		}
		
		if ((wso instanceof AllocationMap) || (wso instanceof AllocationMapRevision)) {
			iconCls = "icon-AllocationMap";
		}
		
		if ((wso instanceof Architecture) || (wso instanceof ArchitectureRevision)) {
			iconCls = "icon-architecture";
		}
		
		if ((wso instanceof Company) || (wso instanceof CompanyRevision)) {
			iconCls = "icon-Company";
		}
		
		if ((wso instanceof Design) || (wso instanceof Design_Revision)) {
			iconCls = "icon-Design";
		}
		
		if ((wso instanceof Functionality) || (wso instanceof FunctionalityRevision)) {
			iconCls = "icon-Functionality";
		}
		
		if ((wso instanceof GraphicOption) || (wso instanceof GraphicOptionRevision)) {
			iconCls = "icon-GraphicOption";
		}
		
		if ((wso instanceof RouteLocation) || (wso instanceof RouteLocationRevision)) {
			iconCls = "icon-RouteLocation";
		}

		if ((wso instanceof Schedule) || (wso instanceof ScheduleRevision)) {
			iconCls = "icon-Schedule";
		}
		if (wso instanceof Folder){
			iconCls = "icon-foleder";
		}
		
		if (wso instanceof Envelope) {
			iconCls = "icon-envelope";
		}
		
		if (wso instanceof Form) {
			iconCls = "icon-form";
		}
		
		if (wso instanceof Dataset) {
			iconCls = "icon-dataset";
		}
		return iconCls;
	}
}
