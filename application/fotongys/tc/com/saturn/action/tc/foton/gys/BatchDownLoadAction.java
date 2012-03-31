package com.saturn.action.tc.foton.gys;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.WebHelper;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Attachment;
import com.saturn.tc.foton.gys.Mail;
import com.saturn.tc.utils.DatasetUtils;
import com.saturn.tc.utils.DownLoadAttachmentUtil;
import com.saturn.tc.utils.EmailUtils;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.XMLUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class BatchDownLoadAction implements IAction {

	private String tempPath = "";

	public static final String ATTACHMENT_ROOT = "tcattachments";

	@SuppressWarnings("deprecation")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");
		User user = (User) request.getSession().getAttribute("TC_USER");
		String userUid = user.getUid();
		String mailuid = request.getParameter("uid");// 获取的是该数据集所在邮件的uid

		List<String> revUids = Attachment.getRevUidsByMailId(session, mailuid);

		List<String> attachments = new ArrayList<String>();

		String attachmentPath = request.getRealPath("/");
		String dir = ATTACHMENT_ROOT + File.separator
				+ DateUtils.getSystemDate() + File.separator + userUid
				+ File.separator;// + time + File.separator;

		String downloadpath = attachmentPath + dir;

		Boolean download = downLoadDatasetFromTC(session, revUids, attachments,
				downloadpath, mailuid, userUid);

		if (mailuid == null && "".equals(mailuid)) {
			request.setAttribute(WebHelper.ERROR_MESSAGE, "MailUid is Null!");
			return new JspView(WebHelper.ERROR_JSP);
		}
		Mail vo = Mail.getByUid(user, session, mailuid);

		this.tempPath = request.getRealPath("/") + ATTACHMENT_ROOT
				+ File.separator + userUid + File.separator;// 该路径到tcattachment
		String zipName = "";
		String zipPath = null;
		Boolean zipdone = false;
		// 设置浏览器显示的内容类型为Zip
		zipName = vo.getDatetime().replaceAll(":", "") + "_From_"
				+ vo.getFromUser();// 下载完压缩包的名字
		String zipFolderPath = this.tempPath + zipName;// 下载完压缩包的路径
		zipPath = this.tempPath + zipName + ".zip";// 下载完压缩包的路径 + 压缩包的名字 + zip
		zipdone = DownLoadAttachmentUtil.doZip(zipName, zipFolderPath, zipPath,
				attachments);
		if (zipdone) {
			updateMail(request, session, mailuid, attachments);
			request.setAttribute("zipPath", File.separator + ATTACHMENT_ROOT
					+ File.separator + userUid + File.separator + zipName
					+ ".zip");
			request.setAttribute("zipdone", zipdone);
			request.setAttribute("download", download);
			return new JspView("/app/tc/downsuccess.jsp");
		} else {
			request.setAttribute(WebHelper.ERROR_MESSAGE, "download failed");
			return new JspView(WebHelper.ERROR_JSP);
		}
	}

	// -----------------从TC中下载数据集--------------------------------------
	private Boolean downLoadDatasetFromTC(TCSession session, List<String> revUids,
			List<String> attachments, String downloadpath, String mailuid, String userUid) {
		
		Boolean result = false;
		if (revUids != null && revUids.size() > 0 ) {
			for(String revUid : revUids){
			
			Mail dbvo = Mail.getMailFromDBByMailUidAndRevUid(mailuid, revUid, userUid);
			
			EasyDataManagementService service = new EasyDataManagementService(
					session);
			ModelObject itemRev = service.loadModelObject(revUid);
			
			if(itemRev instanceof ItemRevision){
				
				String[] relations = XMLUtils.getXmlValue();
				// 按关系类型查询附件
				DataManagementService dmService = DataManagementService.getService(session.getConnection());
				List<String> datesetsUid =  new ArrayList<String>();
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
								datesetsUid.add(modelObject.getUid());
								num ++ ;
							}
						}
					} catch (NotLoadedException e) {
						e.printStackTrace();
					}
				}
				
				if(num > 0){ //有可以下载的数据集对象
					for(String datsetUid : datesetsUid){//下载
						ImanFile file = WorkspaceUtils.getFirstFileFromDataset(session, datsetUid);
						if (file != null) {
							String picpath = DatasetUtils.downloadDatasetFromTc(session, file,
									downloadpath);
							attachments.add(picpath);
						}
					}
					if(dbvo != null){//设置下载次数
						dbvo.setDatetime(DateUtils.getSystemTime());
						dbvo.setDownloadNum(String.valueOf((Integer.parseInt(dbvo
								.getDownloadNum()) + 1)));
						dbvo.setHasDownload("1");
						Mail.editMailFromDB(dbvo);
					}
					result = true;
				} else {   //没有可以下载的数据集对象    设置该条IR可删除 状态是1
					if(dbvo != null){
						dbvo.setDatetime(DateUtils.getSystemTime());
						dbvo.setHasDownload("1");
						Mail.editMailFromDB(dbvo);
					}
				}
				
			}
			}
		}
		return result;
	}

	// ----------------发送反馈邮件--------------------------------------
	private void updateMail(HttpServletRequest request, TCSession session,
			String id, List<String> attachments) {
		User user = (User) request.getSession().getAttribute("TC_USER");
		Mail vo = Mail.getByUid(user, session, id);
		// 发件人的邮件地址存在，则发送反馈邮件
		String fromEmail = vo.getFrom();
		String subject = "外发文档已被【";
		String content = "【" + vo.getTitle() + "】信封中的 <Br>";
		if (fromEmail != null && !"".equals(fromEmail)) {
			System.out.println("发件人的邮件地址存在，则发送反馈邮件");
			List<String> datasetNames = attachments;
			if (datasetNames != null && datasetNames.size() > 0) {
				for (String datasetName : datasetNames) {
					datasetName = datasetName.substring(datasetName
							.lastIndexOf(File.separator) + 1);
					content += "< " + datasetName + " > <Br> ";
				}
			}
			subject += vo.getUserid() + "】下载";
			content += "已被（" + vo.getUserid() + "）下载  <Br>" + "  下载时间：  "
					+ vo.getDatetime();

			EmailUtils.sendMailToPerson(fromEmail, subject, content);
		}
		request.setAttribute("mail", vo);
	}

	@SuppressWarnings({ "unused", "deprecation" })
	private List<String> getDownLoadAttachmensList(HttpServletRequest request,
			String attachmens) {
		attachmens = attachmens.substring(0, attachmens.length());
		String[] indexs = attachmens.split(",");

		List<String> results = new ArrayList<String>();
		for (String index : indexs) {
			if (!"".equals(index.trim())) {
				index = index.replace("/", File.separator);
				results.add(request.getRealPath("/") + index);
			}
		}

		return results;
	}

	@SuppressWarnings("unused")
	private List<String> getDownLoadDatasetList(String attachmens) {

		attachmens = attachmens.substring(0, attachmens.length());
		String[] indexs = attachmens.split(",");

		List<String> results = new ArrayList<String>();
		for (String index : indexs) {
			if (!"".equals(index.trim())) {

				int n = index.split("/").length;

				String datasetName = index.split("/")[n - 1];

				results.add(datasetName);
			}
		}
		return results;
	}

	public String requestMapping() {
		return "/app/tc/foton/gys/batchdownload.action";
	}

}
