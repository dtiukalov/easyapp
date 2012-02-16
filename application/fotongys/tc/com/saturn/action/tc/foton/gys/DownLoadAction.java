package com.saturn.action.tc.foton.gys;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Attachment;
import com.saturn.tc.foton.gys.Mail;
import com.saturn.tc.utils.DatasetUtils;
import com.saturn.tc.utils.DownLoadAttachmentUtil;
import com.saturn.tc.utils.EmailUtils;
import com.saturn.tc.utils.WorkspaceUtils;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;

public class DownLoadAction implements IAction {

	private String tempPath = "";

	public static final String ATTACHMENT_ROOT = "tcattachments";

	@SuppressWarnings( { "unchecked", "deprecation" })
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");
		String userUid = (String) request.getSession().getAttribute("TC_uid");
		String mailuid = request.getParameter("uid");// 获取的是该数据集所在邮件的uid
		// String attachmentsPaths = request.getParameter("idpaths");//
		// 获取的是数据集的文件路径
		// 不是数据集的为null
		String files = request.getParameter("ids");// 获取的是数据集的uids 带时间戳的 都有
		// String flag = request.getParameter("flag");
		List<String> attachments = new ArrayList<String>();

		String attachmentPath = request.getRealPath("/");
		// long time = System.currentTimeMillis();
		String dir = ATTACHMENT_ROOT + File.separator
				+ DateUtils.getSystemDate() + File.separator + userUid
				+ File.separator;// + time + File.separator;

		String downloadpath = attachmentPath + dir;
		// -----------------从TC中下载数据集--------------------------------------
		String[] keys = files.split(",");
		for (String key : keys) {
			if (!"".equals(key.trim()) && key != null) {
				key = key.substring(0, 14);
				/*
				 * String path = ((Map<String, String>) request.getSession()
				 * .getAttribute("TC_DATASET_FILEPATHMAP")).get(key); ImanFile
				 * file = ((Map<String, ImanFile>) request.getSession()
				 * .getAttribute("TC_DATASET_FILEMAP")).get(key);
				 */
				// if (path != null || file != null) {
				ImanFile file = WorkspaceUtils.getFile(session, key);
				if (file != null) {
					String picpath = DatasetUtils.downloadDatasetFromTc(session, file,
							downloadpath);
					attachments.add(picpath);
				}

				// DatasetUtils.downloadDatasetFromTc(session, file, path);
				// }
			}
		}
		Mail vo = Mail.getByUid(request, session, mailuid);
	//	if (attachments.size() > 1) {
			this.tempPath = request.getRealPath("/") + ATTACHMENT_ROOT + File.separator + userUid
					+ File.separator;
			String zipName = "";
			String zipPath = null;
			Boolean zipdone = false;
			// 设置浏览器显示的内容类型为Zip
			// BufferedInputStream bin = null;
			try {
				// out = response.getOutputStream();
				zipName = vo.getTitle() + System.currentTimeMillis();
				String zipFolderPath = this.tempPath + zipName;
				zipPath = this.tempPath + zipName + ".zip";
				zipdone = DownLoadAttachmentUtil.doZip(zipName, zipFolderPath,
						zipPath, attachments);
			} catch (Exception e) {
				e.printStackTrace();
			}

			updateMail(request, session, mailuid, attachments);
			request.setAttribute("zipPath", File.separator + ATTACHMENT_ROOT
					+ File.separator + userUid + File.separator + zipName
					+ ".zip");
			request.setAttribute("zipdone", zipdone);
			return new JspView("/app/tc/downsuccess.jsp");
	//	} else if (attachments.size() == 1) {
			// 处理单个数据集的下载
	//		updateMail(request, session, mailuid, attachments);
			/*
			 * String filePath = (String) request.getParameter("filename");
			 * String path = ""; String datasetPath = attachments.get(0); path =
			 * datasetPath; if (filePath != null) { path =
			 * request.getSession().getServletContext() .getRealPath("/") +
			 * File.separator + filePath; } path = path.replace("/", "\\");
			 */
			//String attachPath = attachments.get(0).substring(attachments.get(0).indexOf("tcattachments"));
	//		request.setAttribute("zipPath", attachments.get(0));
			
	//		return new JspView("/app/tc/downsuccess.jsp");
			// response.setContentType("application/zip");
			// 设置内容作为附件下载，并且名字为：export.zip
			// OutputStream out = null;
			// ---------------------------------1---------------------------------------------

			/*
			 * try { File file = new File(path);
			 * 
			 * String filename = file.getName(); InputStream fis = new
			 * BufferedInputStream( new FileInputStream(path)); byte[] buffer =
			 * new byte[fis.available()]; fis.read(buffer); fis.close();
			 * response.reset(); response.setCharacterEncoding("UTF-8");
			 * response.addHeader("Content-Disposition", "attachment; filename=" +
			 * new String((filename).getBytes(), "ISO8859_1"));
			 * response.addHeader("Content-Length", "" + file.length());
			 * OutputStream toClient = new BufferedOutputStream(response
			 * .getOutputStream());
			 * response.setContentType("application/octet-stream");
			 * toClient.write(buffer); toClient.flush(); toClient.close(); }
			 * catch (FileNotFoundException e) { e.printStackTrace(); } catch
			 * (UnsupportedEncodingException e) { e.printStackTrace(); } catch
			 * (IOException e) { e.printStackTrace(); }
			 */
			// ---------------------------------1---------------------------------------------
			// return null;
			// return new JspView("/app/tc/show.jsp");
	//	} else {
	//		return null;
			// return new JspView("/app/tc/main.jsp");
	//	}

	}

	private void updateMail(HttpServletRequest request, TCSession session,
			String id, List<String> attachments) {
		Mail vo = Mail.getByUid(request, session, id);
		Mail dbvo = Mail.getMailFromDB(id);
		vo.setDatetime(DateUtils.getSystemTime());
		vo.setDownloadNum(String.valueOf((Integer.parseInt(dbvo
				.getDownloadNum()) + 1)));
		vo.setHasDownload("1");
		Mail.editMailFromDB(vo);

		// 发件人的邮件地址存在，则发送反馈邮件
		String fromEmail = vo.getFrom();
		String subject = "外发文档已被【";
		String content = "【" + vo.getTitle() + "】信封中的";
		if (fromEmail != null && !"".equals(fromEmail)) {
			System.out.println("发件人的邮件地址存在，则发送反馈邮件");
			List<String> datasetNames = attachments;
			if (datasetNames != null && datasetNames.size() > 0) {
				for (String datasetName : datasetNames) {
					datasetName = datasetName.substring(datasetName.lastIndexOf(File.separator) + 1);
					content += "《" + datasetName + "》   ";
				}

			}
			subject += vo.getUserid() + "】下载";
			content += "已被（" + vo.getUserid() + "）下载";

			EmailUtils.sendMailToPerson(fromEmail, subject, content);
		}
		request.setAttribute("mail", vo);
	}

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
		return "/app/tc/foton/gys/download.action";
	}

}
