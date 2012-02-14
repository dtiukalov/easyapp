package com.saturn.tc.foton.gys;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Envelope;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.Person;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class Mail {

	private String mailuid;
	private String title;
	private String type;

	private String from;
	private String fromUser;
	private String userid;// 收件人 ：当前登录供应商
	private String userName;// 收件人 ：当前登录供应商
	private String to;
	private String content;
	private String datetime;

	private String mailpid;
	private String downloadNum;

	private String hasDownload;// 0:不可以删除,没被下载过 1:可以删除,已经被下载过 2:已经被删除了
	private String hasRead;
	private String hasAttachment;
	private ModelObject[] attachments;

	private static ORMapping<Mail> mapping = new ResultORMapping<Mail>();

	public Mail() {
		super();
	}

	public static List<Mail> getAll(HttpServletRequest request,
			TCSession session, String userId, String fromUser, String title,
			String hasDownload, String datetime) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);
		List<Mail> mails = new ArrayList<Mail>();

		try {
			Folder mailbox = WorkspaceUtils.getMailBox(session, userId);
			WorkspaceObject[] workspaceObjects = mailbox.get_contents();

			service.getProperties(workspaceObjects, "uid", "pid",
					"object_name", "object_type", "object_desc", "object_type",
					"envelopeReadFlag", "last_mod_user", "hasDownload");
			service.getProperties((User) request.getSession().getAttribute(
					"TC_USER"), "userid", "user_name");

			for (WorkspaceObject wos : workspaceObjects) {
				Envelope envelope = (Envelope) wos;

				Mail mail = new Mail(request, session, envelope);

				Mail dbmail = Mail.getMailFromDB(mail.getMailuid());

				if (dbmail != null) {
					mail.downloadNum = dbmail.getDownloadNum();
					mail.hasDownload = dbmail.getHasDownload();
				} else {
					Mail.addMailtoDB(mail);
				}

				if ((fromUser == null || "".equals(fromUser.trim()) || mail
						.getFromUser().indexOf(fromUser) >= 0)
						&& (title == null || "".equals(title.trim()) || mail
								.getTitle().indexOf(title) >= 0)
						&& (hasDownload == null
								|| "".equals(hasDownload.trim()) || mail
								.getHasDownload().indexOf(hasDownload) >= 0)
						&& (datetime == null || "".equals(datetime.trim()) || mail
								.getDatetime().indexOf(datetime) >= 0)) {

					mails.add(mail);
					// reviseProperties(envelope,session);
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return mails;
	}

	public static int addMailtoDB(Mail mail) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		/*
		 * return SimpleDaoTemplate .update( "INSERT INTO download (mailuid,
		 * mailpid, fromUser, userid, datetime, hasDownload, downloadNum)
		 * VALUES(?, ?, ?, ?, ?, ?, ?)", mail.getMailuid(), mail.getMailpid(),
		 * mail.getFromUser() + "_" + mail.getTitle(), mail.getUserid() + "(" +
		 * mail.getUserName() + ")",mail .getDatetime(), mail.getHasDownload(),
		 * "0"); mysql
		 */

		return SimpleDaoTemplate
				.update(
						"INSERT INTO \"download\" (\"mailuid\", \"mailpid\", \"fromUser\", \"userid\", \"datetime\", \"hasDownload\", \"downloadNum\") VALUES(?, ?, ?, ?, ?, ?, ?)",
						mail.getMailuid(), mail.getMailpid(), mail
								.getFromUser()
								+ "_" + mail.getTitle(), mail.getUserid() + "("
								+ mail.getUserName() + ")", mail.getDatetime(),
						mail.getHasDownload(), "0");
	}

	public static int editMailFromDB(Mail mail) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		/*
		 * return SimpleDaoTemplate .update( "UPDATE download SET datetime = ?,
		 * hasDownload = ?, downloadNum = ? WHERE mailuid = ?",
		 * mail.getDatetime(), mail.getHasDownload(), mail .getDownloadNum(),
		 * mail.getMailuid()); mysql
		 */
		return SimpleDaoTemplate
				.update(
						"UPDATE \"download\" SET \"datetime\" = ?, \"hasDownload\" = ?, \"downloadNum\" = ? WHERE \"mailuid\" = ?",
						mail.getDatetime(), mail.getHasDownload(), mail
								.getDownloadNum(), mail.getMailuid());
	}

	public static Mail getMailFromDB(String uid) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping

		/*Mail test = SimpleDaoTemplate.queryOne(
				"SELECT * FROM download WHERE 1 = 1 and mailuid = '" + uid
						+ "'", null, mapping, Mail.class);*/
		
		Mail test = SimpleDaoTemplate.queryOne(
				"SELECT * FROM \"download\" WHERE 1 = 1 and \"mailuid\" = '" + uid
						+ "'", null, mapping, Mail.class);
		return test;
	}

	public static int removeMailFromDB(final String uid) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
	/*	return SimpleDaoTemplate.update("DELETE FROM download WHERE uid = ?",
				uid);*/
		return SimpleDaoTemplate.update("DELETE FROM \"download\" WHERE \"uid\" = ?",
				uid);
	}

	/*
	 * public static void reviseProperties(Envelope envelope,TCSession session) {
	 * 
	 * try { String flag = envelope.get_envelopeReadFlag() + ""; } catch
	 * (NotLoadedException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } // Get the service stub DataManagementService
	 * dmService = DataManagementService.getService(session.getConnection());
	 * 
	 * ReviseProperties revProps = new ReviseProperties(); revProps.description =
	 * "describe testRevise";
	 * 
	 * Map<String,String> attrs = new HashMap<String,String>();
	 * attrs.put("project_id", "true");
	 * 
	 * revProps.extendedAttributes = attrs; ReviseInfo reviseInfo = new
	 * ReviseInfo(); reviseInfo.description = "describe testRevise";
	 * 
	 * try { ReviseResponse revised = dmService.revise(attrs); } catch
	 * (ServiceException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 */

	public static Mail getByUid(HttpServletRequest request, TCSession session,
			String uid) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);
		Envelope envelope = (Envelope) service.loadModelObject(uid);
		service.getProperties(envelope, "uid", "object_name", "object_type",
				"object_desc", "object_type", "envelopeReadFlag",
				"last_mod_user", "contents");

		service.getProperties((User) request.getSession().getAttribute(
				"TC_USER"), "userid", "user_name");

		Mail mail = new Mail(request, session, envelope);

		return mail;
	}

	public Mail(HttpServletRequest request, TCSession session, Envelope envelope) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);

		try {
			this.mailuid = envelope.getUid();
			this.mailpid = envelope.get_pid() + "";
			this.userid = ((User) request.getSession().getAttribute("TC_USER"))
					.get_userid();
			this.userName = ((User) request.getSession()
					.getAttribute("TC_USER")).get_user_name();
			this.title = envelope.get_object_name();
			this.type = envelope.get_object_type();
			this.content = envelope.get_object_desc();
			this.downloadNum = "0";
			SimpleDateFormat format = new SimpleDateFormat(DateUtils
					.getTimeFormat());
			this.datetime = format.format(envelope.get_last_mod_date()
					.getTime());

			this.hasDownload = "0";
			this.hasRead = envelope.get_envelopeReadFlag() + "";
			this.hasAttachment = "false";
			this.attachments = WorkspaceUtils.getChildren(session, envelope);
			if (this.attachments != null && this.attachments.length > 0) {
				this.hasAttachment = "true";
			}

			User user = (User) envelope.get_last_mod_user();
			Person fromPerson = (Person) user.get_person();
			service.getProperties(fromPerson, "PA9");
			this.fromUser = user.get_user_name() + "_" + user.getUid();
			this.from = fromPerson.get_PA9();
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

	}

	public static void remove(TCSession session, final String id) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);

		Envelope envelope = (Envelope) service.loadModelObject(id);
		service.deleteObjects(envelope);
		Mail vo = Mail.getMailFromDB(id);
		vo.setDatetime(DateUtils.getSystemTime());
		vo.setHasDownload("2");
		Mail.editMailFromDB(vo);
	}

	public static void removes(TCSession session, String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(session, id);
			}
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getHasDownload() {
		return hasDownload;
	}

	public void setHasDownload(String hasDownload) {
		this.hasDownload = hasDownload;
	}

	public String getHasAttachment() {
		return hasAttachment;
	}

	public void setHasAttachment(String hasAttachment) {
		this.hasAttachment = hasAttachment;
	}

	public String getHasRead() {
		return hasRead;
	}

	public void setHasRead(String hasRead) {
		this.hasRead = hasRead;
	}

	public ModelObject[] getAttachments() {
		return attachments;
	}

	public void setAttachments(ModelObject[] attachments) {
		this.attachments = attachments;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}

	public String getDownloadNum() {
		return downloadNum;
	}

	public void setDownloadNum(String downloadNum) {
		this.downloadNum = downloadNum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userId) {
		this.userid = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMailuid() {
		return mailuid;
	}

	public void setMailuid(String mailuid) {
		this.mailuid = mailuid;
	}

	public String getMailpid() {
		return mailpid;
	}

	public void setMailpid(String mailpid) {
		this.mailpid = mailpid;
	}
}
