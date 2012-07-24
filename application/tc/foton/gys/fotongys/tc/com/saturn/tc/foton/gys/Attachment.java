package com.saturn.tc.foton.gys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.tc.clientx.TCSession;
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
import com.teamcenter.soa.client.model.strong.ReleaseStatus;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class Attachment {

	private String mailId;
	private String uid;

	private String name;
	private String status; // 状态
	private String version; // 版本
	private String type;
	private String size;
	private String path;
	private String parentId;
	private String iconCls;
	private WorkspaceObject wo;

	private ImanFile downloadfile; // 为了性能而添加的和下载相关的属性
	private String downloadpath;

	public static Map<String, String> statusDisPlayValue = new HashMap<String, String>();

	public Attachment() {

	}

	static {		
		statusDisPlayValue.put("F6_S", "S");
		statusDisPlayValue.put("F6_A", "A");
		statusDisPlayValue.put("F6_B", "B");
		statusDisPlayValue.put("F6_P", "工艺版");
		statusDisPlayValue.put("F6_F", "冻结版");
		statusDisPlayValue.put("F6_Released", "发布");
	}


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
			Attachment attachment = new Attachment(mailId, wo, null, service);
			attachments.add(attachment);
			stack.add(attachment);
		}

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
								(WorkspaceObject) itemRev, attachment.getUid(),
								service);
						attachments.add(atta);
						stack.add(atta);

					}

				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			} else if (workspaceObject instanceof ItemRevision) {
				ItemRevision envItemRev = (ItemRevision) workspaceObject;
				service.refreshObjects(envItemRev);

				service.getProperties(envItemRev, new String[] { "object_name",
						"item_revision_id", "current_revision_id", "item_id",
						"IMAN_specification", "view", "IMAN_requirement",
						"IMAN_reference", "TC_WorkContext_Relation",
						"TC_Attaches", "VisItemRevCreatedSnapshot2D",
						"release_status_list", "item_revision_id" });

				String[] relations = XMLUtils.getXmlValue();
				// 按关系类型查询附件
				
				RelationUtils.queryStacksByItemRevRelation(mailId,
						attachment, envItemRev, relations, stack, session,
						attachments);

				// 查找到IR对象，无论下面有没有可以下载的数据集对象  都 向DB插值，先判断 IR对象在数据中是否存在，如果不存在，才需要插值
			
					String revUid = envItemRev.getUid();
					Mail dbvo = Mail.getMailFromDBByMailUidAndRevUid(mailId,
							revUid, userUid);

					if (dbvo == null) {
						//如果DB下不存在IR,查找当前登录用户邮件是Mailid的所有IR对象。
						List<Mail> tempMails = Mail
								.getMailFromDBByMailUidAndUserUid(mailId, userUid);
						Mail tempMail = null;
						try {
							//如果有tempMails，遍历tempMails 找到 revuid是空的对象，设置RevUid和Revitemid，然后更新这一条的值；
							//如果 revuid都不是空，则新插入一条记录到数据库中，其它的值取自l
							if (tempMails.size() > 0) {
								for (Mail l : tempMails) {
									String lrevuid = l.getRevUid();
									if (lrevuid == null) {
										String itemid = envItemRev
												.getPropertyDisplayableValue("item_id");
										Mail.updateRevUidFromDBByMailUid(mailId, revUid, itemid, userUid);
										break;
									} else {
										tempMail = l;
									}
								}
							}

							if (tempMail != null) {
								tempMail.setRevUid(revUid);
								String itemid = envItemRev
										.getPropertyDisplayableValue("item_id");
								tempMail.setRevItemid(itemid);
								Mail.addMailUidAndRevUidtoDB(tempMail);
							}
						} catch (NotLoadedException e) {
							e.printStackTrace();
						}
					}
			
			} else if ("Folder".equals(attachment.getType())) {

				WorkspaceObject[] children = (WorkspaceObject[]) WorkspaceUtils
						.getChildren(session, (Folder) workspaceObject);
				service.getProperties(children, "uid", "object_name",
						"object_type", "contents");
				for (WorkspaceObject wo : children) {
					Attachment child = new Attachment(mailId, wo,
							attachment.getUid(), service);
					attachments.add(child);
					stack.add(child);
				}

			} else if (workspaceObject instanceof Dataset) {

				Dataset dataset = (Dataset) workspaceObject;
				service.refreshObjects(dataset);
				service.getProperties(new ModelObject[] { dataset },
						new String[] { "object_name", "displayable_revisions",
								"release_status_list", "object_type" });

				Attachment childdataset = new Attachment(mailId,
						workspaceObject, attachment.getParentId(), service);

				attachments.remove(attachment);
				attachments.add(childdataset);
			}
		}

		return attachments;
	}
	
	public static List<String> getRevUidsByMailId(TCSession session,
			String mailId) {
		List<String> result = new ArrayList<String>();
		
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
			Attachment attachment = new Attachment(mailId, wo, null, service);
			attachments.add(attachment);
			stack.add(attachment);
		}

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
								(WorkspaceObject) itemRev, attachment.getUid(),
								service);
						attachments.add(atta);
						stack.add(atta);

					}

				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			} else if (workspaceObject instanceof ItemRevision) {
				ItemRevision envItemRev = (ItemRevision) workspaceObject;
				result.add(envItemRev.getUid());
			} else if ("Folder".equals(attachment.getType())) {

				WorkspaceObject[] children = (WorkspaceObject[]) WorkspaceUtils
						.getChildren(session, (Folder) workspaceObject);
				service.getProperties(children, "uid", "object_name",
						"object_type", "contents");
				for (WorkspaceObject wo : children) {
					Attachment child = new Attachment(mailId, wo,
							attachment.getUid(), service);
					attachments.add(child);
					stack.add(child);
				}

			} else if (workspaceObject instanceof Dataset) {

				Dataset dataset = (Dataset) workspaceObject;
				service.refreshObjects(dataset);
				service.getProperties(new ModelObject[] { dataset },
						new String[] { "object_name", "displayable_revisions",
								"release_status_list", "object_type" });

				Attachment childdataset = new Attachment(mailId,
						workspaceObject, attachment.getParentId(), service);

				attachments.remove(attachment);
				attachments.add(childdataset);
			}
		}

		return result;
	}

	public Attachment(String mailId, WorkspaceObject wso, String parentId,
			EasyDataManagementService service) {
		this.mailId = mailId;
		this.parentId = parentId;
		this.wo = wso;
		this.uid = wso.getUid();// + System.currentTimeMillis()
		this.size = "";
		this.path = "";
		this.version = "";
		this.status = "";
		try {
			this.name = wso.get_object_name();
			if (wso instanceof ItemRevision) {
				service.getProperties(wso, "item_revision_id");
				name += " / " + ((ItemRevision) wso).get_item_revision_id();
				this.version = ((ItemRevision) wso).get_item_revision_id();
				ReleaseStatus[] status = (ReleaseStatus[]) wso
						.get_release_status_list();
				StringBuffer tempStatus = new StringBuffer();
				if (status != null && status.length > 0) {
					service.getProperties(status, "object_name");
					for (int p = 0; p < status.length; p++) {
						String value = status[p].getProperty("object_name").getStringValue();
						//if (!value.equalsIgnoreCase("F6_Released")) {
							if (statusDisPlayValue.containsKey(value)) {
								value = statusDisPlayValue.get(value);
							}
							tempStatus.append(",");
							tempStatus.append(value);
						//}
					}
					this.status = tempStatus.toString().replaceFirst(",", "");
				}
			} else if (wso instanceof Dataset) {
				ReleaseStatus[] status = (ReleaseStatus[]) wso
						.get_release_status_list();
				StringBuffer tempStatus = new StringBuffer();
				if (status != null && status.length > 0) {
					service.getProperties(status, "object_name");
					for (int t = 0; t < status.length; t++) {
						String value = status[t].getProperty("object_name").getStringValue();

						//if (!value.equalsIgnoreCase("F6_Released")) {
							if (statusDisPlayValue.containsKey(value)) {
								value = statusDisPlayValue.get(value);
							}
							tempStatus.append(",");
							tempStatus.append(value);
						//}
					}
					this.status = tempStatus.toString().replaceFirst(",", "");
				}
			}
			this.type = wso.get_object_type();
			this.iconCls = IconUtils.getIconByType(wso);

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

	}

	/*
	 * public Attachment(String mailId, ImanFile file, String parentId) {
	 * this.mailId = mailId; this.parentId = parentId; this.wo = null; this.uid
	 * = file.getUid(); //+ System.currentTimeMillis() this.size = ""; this.path
	 * = ""; this.version = ""; this.status = ""; try { this.name =
	 * file.get_original_file_name(); this.type =
	 * file.get_original_file_name().substring(
	 * file.get_original_file_name().lastIndexOf(".") + 1); this.iconCls =
	 * "icon-dataset"; } catch (NotLoadedException e) { e.printStackTrace(); } }
	 */

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}
