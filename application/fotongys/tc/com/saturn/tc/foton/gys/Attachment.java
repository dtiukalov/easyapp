package com.saturn.tc.foton.gys;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.json.JSONObject;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.DatasetUtils;
import com.saturn.tc.utils.IconUtils;
import com.saturn.tc.utils.RelationUtils;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.XMLUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.Envelope;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class Attachment {
	

	private String mailId;
	private String uid;

	private String name;
	private String type;
	private String size;
	private String path;
	private String parentId;
	private String iconCls;
	private WorkspaceObject wo;

	private ImanFile downloadfile; // 为了性能而添加的和下载相关的属性
	private String downloadpath;

	public Attachment() {

	}

	@SuppressWarnings("unchecked")
	public static List<Attachment> getByMailId(TCSession session,
			String mailId, String userUid, String directory) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);
		List<Attachment> attachments = new ArrayList<Attachment>();

		Envelope envelope = (Envelope) service.loadModelObject(mailId);
		WorkspaceObject[] workspaceObjects = (WorkspaceObject[]) WorkspaceUtils
				.getChildren(session, envelope);

		service.getProperties(workspaceObjects, "uid", "object_name",
				"object_type", "contents");

		LinkedList<Attachment> stack = new LinkedList<Attachment>();

		for (WorkspaceObject wo : workspaceObjects) {
			Attachment attachment = new Attachment(mailId, wo, null);
			attachments.add(attachment);
			stack.add(attachment);
		}

		long time = System.currentTimeMillis();
		while (!stack.isEmpty()) {
			Attachment attachment = stack.removeFirst();
			WorkspaceObject workspaceObject = attachment.wo;

			if (workspaceObject instanceof Item) {
				Item item = (Item) workspaceObject;
				try {
					service.getProperties(new ModelObject[] { item },
							new String[] { "object_name",
									"displayable_revisions" });

					ModelObject[] envItemRev = (ModelObject[]) item
							.get_displayable_revisions();
					service.getProperties(envItemRev, new String[] {
							"object_name", "item_revision_id",
							"current_revision_id", "IMAN_specification",
							"view", "IMAN_requirement", "IMAN_reference",
							"TC_WorkContext_Relation", "TC_Attaches",
							"VisItemRevCreatedSnapshot2D" });
					for (ModelObject itemRevObject : envItemRev) {
						ItemRevision itemRev = (ItemRevision) itemRevObject; // envItemRev[envItemRev.length
																				// -
																				// 1];
						Attachment atta = new Attachment(mailId,
								(WorkspaceObject) itemRev, attachment.getUid());
						attachments.add(atta);
						stack.add(atta);

						/*
						 * String[] relations = XMLUtils.getXmlValue(); //
						 * 按关系类型查询附件 stack =
						 * RelationUtils.queryStacksByItemRevRelation(mailId,
						 * attachment, itemRev, relations, stack, session,
						 * attachments);
						 */
					}

				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			} else if (workspaceObject instanceof ItemRevision) {
				ItemRevision envItemRev = (ItemRevision) workspaceObject;
				service.getProperties(envItemRev, new String[] { "object_name",
						"item_revision_id", "current_revision_id",
						"IMAN_specification", "view", "IMAN_requirement",
						"IMAN_reference", "TC_WorkContext_Relation",
						"TC_Attaches", "VisItemRevCreatedSnapshot2D" });

				/*
				 * ItemRevision itemRev = (ItemRevision) envItemRev;
				 * //envItemRev[envItemRev.length - 1]; Attachment atta = new
				 * Attachment(mailId, (WorkspaceObject) itemRev,
				 * attachment.getUid()); attachments.add(atta); stack.add(atta);
				 */

				String[] relations = XMLUtils.getXmlValue();
				// 按关系类型查询附件
				stack = RelationUtils.queryStacksByItemRevRelation(mailId,
						attachment, envItemRev, relations, stack, session,
						attachments);

			} else if ("Folder".equals(attachment.getType())) {

				WorkspaceObject[] children = (WorkspaceObject[]) WorkspaceUtils
						.getChildren(session, (Folder) workspaceObject);
				service.getProperties(children, "uid", "object_name",
						"object_type", "contents");
				for (WorkspaceObject wo : children) {
					Attachment child = new Attachment(mailId, wo, attachment
							.getUid());
					attachments.add(child);
					stack.add(child);
				}

			} else if (workspaceObject instanceof Dataset) {
				
				Dataset dataset = (Dataset) attachment.wo;
				/*String dir = ATTACHMENT_ROOT + File.separator
						+ DateUtils.getSystemDate() + File.separator + userUid
						+ File.separator + time + File.separator;*/

				List<ImanFile> files = DatasetUtils.getdownloadDatasetFromTc(
						session, dataset);
				
				if (files != null) {
					for (ImanFile file : files) {
						Attachment childdataset = new Attachment(mailId, file,
								attachment.getParentId());
						attachments.remove(attachment);
						attachments.add(childdataset);
						try {
							childdataset.setName(file.get_original_file_name());
							childdataset.setPath(file.get_original_file_name());
							/*childdataset.setPath((dir + file
									.get_original_file_name()).replace(
									File.separatorChar + "", "/"));
							((Map<String, String>)request.getSession().getAttribute("TC_DATASET_FILEPATHMAP")).put(file.getUid(), directory + dir);
							((Map<String, ImanFile>)request.getSession().getAttribute("TC_DATASET_FILEMAP")).put(file.getUid(), file);
						*///	childdataset.setDownloadpath(directory + dir);
						//	childdataset.setDownloadfile(file);
						} catch (NotLoadedException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}

		return attachments;
	}

	public Attachment(String mailId, WorkspaceObject wso, String parentId) {
		this.mailId = mailId;
		this.parentId = parentId;
		this.wo = wso;

		this.uid = wso.getUid() + System.currentTimeMillis();
		this.size = "";
		this.path = "";

		try {
			this.name = wso.get_object_name();
			if (wso instanceof ItemRevision) {
				name += " / " + ((ItemRevision) wso).get_item_revision_id();
			}
			this.type = wso.get_object_type();
			this.iconCls = IconUtils.getIconByType(wso);

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

	}

	public Attachment(String mailId, ImanFile file, String parentId) {
		this.mailId = mailId;
		this.parentId = parentId;
		this.wo = null;

		this.uid = file.getUid() + System.currentTimeMillis();
		this.size = "";
		this.path = "";

		try {
			this.name = file.get_original_file_name();
			this.type = file.get_original_file_name().substring(
					file.get_original_file_name().lastIndexOf(".") + 1);
			this.iconCls = "icon-dataset";

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString().replace("parentId", "_parentId");
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public ImanFile getDownloadfile() {
		return downloadfile;
	}

	public void setDownloadfile(ImanFile downloadfile) {
		this.downloadfile = downloadfile;
	}

	public String getDownloadpath() {
		return downloadpath;
	}

	public void setDownloadpath(String downloadpath) {
		this.downloadpath = downloadpath;
	}

}
