package com.saturn.tc.foton.gys;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
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
	private String fromUser;// 发件人
	private String fromUserId;
	private String fromUserDept;// 发件人事业部属性
	private String userid;// 收件人 ：当前登录供应商
	private String userName;// 收件人 ：当前登录供应商
	private String userUid;// 收件人 ：当前登录供应商Uid
	private String to;
	private String content;
	private String datetime;

	private String mailpid;

	private String downloadNum;

	private String hasDownload;// 0:不可以删除,没被下载过 1:可以删除,已经被下载过 2:已经被删除了
	private String hasRead;

	private String revUid;
	private String revItemid;

	private static ORMapping<Mail> mapping = new ResultORMapping<Mail>();

	public static Map<String, String> dept = new HashMap<String, String>();

	public Mail() {
		super();
		dept.put("JTGS", "集团公司");
		dept.put("R&D", "工程研究院");
		dept.put("Huairou", "怀柔汽研所");
		dept.put("FJGC", "蒙派克工厂");
		dept.put("AMGC", " 欧曼工厂");

		dept.put("NFGC", "南方工厂");
		dept.put("BFGC", "北方工厂");
		dept.put("ALGC", "奥铃工厂");
		dept.put("NHGC", "萨普工厂");
		dept.put("OVGC", "欧V客车");

		dept.put("LWDL", "雷沃动力");
		dept.put("FTZJ", "雷沃重机");
		dept.put("ALFDJ", "奥铃发动机");
		dept.put("SDGC", "时代工厂");
		dept.put("XJFT", " 新疆福田");
	}

	public static WorkspaceObject[] getAllTcMailObject(User user,
			TCSession session) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);

		WorkspaceObject[] workspaceObjects = null;
		try {
			Folder mailbox = WorkspaceUtils.getMailBox(session, user.getUid());
			service.refreshObjects(mailbox);
			workspaceObjects = mailbox.get_contents();

			service.getProperties(workspaceObjects, "uid", "pid",
					"object_name", "object_type", "object_desc", "object_type",
					"envelopeReadFlag", "last_mod_user", "hasDownload");

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return workspaceObjects;
	}

	public static ListData<Mail> getAll(User user, TCSession session,
			WorkspaceObject[] workspaceObjects, Mail condition, String start,
			String offset) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);

		List<Mail> mails = new ArrayList<Mail>();

		for (WorkspaceObject wos : workspaceObjects) {
			if (wos instanceof Envelope) {
				service.refreshObjects(wos);
				Envelope envelope = (Envelope) wos;

				Mail mail = new Mail(user, session, envelope);
				// Mail dbmail = Mail.getMailFromDB(mail.getMailuid());
				List<Mail> dbmail = Mail.getMailFromDBByMailUidAndUserUid(
						mail.getMailuid(), mail.getUserUid());

				if (dbmail.size() > 0) {
					for (Mail ma : dbmail) {
						if (ma.getHasDownload().equalsIgnoreCase("0")) {
							mail.hasDownload = "0";
							break;
						} else if (ma.getHasDownload().equalsIgnoreCase("2")) {
							mail.hasDownload = "2";
							break;
						} else {
							mail.hasDownload = ma.getHasDownload();
						}
					}
					// mail.hasDownload = "0";
					// mail.downloadNum = dbmail.getDownloadNum();
				} else {
					Mail.addMailtoDB(mail);
				}

				String fromUser = condition.fromUser;
				String title = condition.title;
				String hasDownload = condition.hasDownload;
				String datetime = condition.datetime;
				String content = condition.content;

				if (like(mail.fromUser, fromUser) && like(mail.title, title)
						&& like(mail.hasDownload, hasDownload)
						&& like(mail.content, content)
						&& like(mail.datetime, datetime)) {

					mails.add(mail);
					// reviseProperties(envelope,session);
				}
			}
		}

		int startValue = 0;
		if (start != null && !"".equals(start)) {
			try {
				startValue = Integer.parseInt(start);
			} catch (NumberFormatException e) {
				// e.printStackTrace();
			}
		}

		int rowsValue = 10;
		if (offset != null && !"".equals(offset)) {
			try {
				rowsValue = Integer.parseInt(offset);
			} catch (NumberFormatException e) {
				// e.printStackTrace();
			}
		}

		List<Mail> result = new ArrayList<Mail>();

		int size = mails.size();
		for (int i = startValue; i < startValue + rowsValue; ++i) {
			if (i < size) {
				result.add(mails.get(i));
			}
		}

		return new ListData<Mail>(workspaceObjects.length, result);
	}

	private static boolean like(String src, String con) {
		return (con == null || "".equals(con.trim()) || src.indexOf(con) >= 0);
	}

	public static int addMailtoDB(Mail mail) {
		return SimpleDaoTemplate
				.update("INSERT INTO \"download\" (\"mailuid\", \"mailpid\", \"fromUser\", \"userid\", \"userUid\",\"datetime\", \"hasDownload\", \"downloadNum\", \"revUid\", \"revItemid\") VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						mail.getMailuid(), mail.getMailpid(),
						mail.getFromUser() + "_" + mail.getTitle(),
						mail.getUserid() + "(" + mail.getUserName() + ")",
						mail.getUserUid(), mail.getDatetime(),
						mail.getHasDownload(), "0", "", "");
	}

	public static int editMailFromDB(Mail mail) {
		return SimpleDaoTemplate
				.update("UPDATE \"download\" SET \"datetime\" = ?, \"hasDownload\" = ?, \"downloadNum\" = ? WHERE \"mailuid\" = ? and  \"revUid\" = ? and  \"userUid\" = ?",
						mail.getDatetime(), mail.getHasDownload(),
						mail.getDownloadNum(), mail.getMailuid(),
						mail.getRevUid(), mail.getUserUid());
	}
	
	/*
	 * public static Mail getMailFromDB(String uid) { Mail test =
	 * SimpleDaoTemplate.queryOne(
	 * "SELECT * FROM \"download\" WHERE 1 = 1 and \"mailuid\" = '" + uid + "'",
	 * null, mapping, Mail.class); return test; }
	 */

	/*
	 * public static List<Mail> getMailFromDBByMailUid(String mailuid) {
	 * List<Mail> test = SimpleDaoTemplate.query(
	 * "SELECT * FROM \"download\" WHERE 1 = 1 and \"mailuid\" = '" + mailuid +
	 * "'", null, mapping, Mail.class); return test; }
	 */

	public static List<Mail> getMailFromDBByMailUidAndUserUid(String mailuid,
			String userUid) {
		List<Mail> test = SimpleDaoTemplate.query(
				"SELECT * FROM \"download\" WHERE 1 = 1 and \"mailuid\" = '"
						+ mailuid + "' and \"userUid\" = '" + userUid + "'",
				null, mapping, Mail.class);
		return test;
	}

	public static Mail getMailFromDBByMailUidAndRevUid(String mailUid,
			String revUid, String userUid) {
		Mail test = SimpleDaoTemplate.queryOne(
				"SELECT * FROM \"download\" WHERE 1 = 1 and \"mailuid\" = '"
						+ mailUid + "' and \"revUid\" = '" + revUid
						+ "' and \"userUid\" = '" + userUid + "'", null,
				mapping, Mail.class);
		return test;
	}

	public static int updateRevUidFromDBByMailUid(final String mailUid,
			final String revUid, final String revItemid, final String userUid) {
		return SimpleDaoTemplate
				.update("UPDATE \"download\" SET \"revUid\" = ?, \"revItemid\" = ? WHERE \"mailuid\" = ?",
						revUid, revItemid, mailUid);
	}

	public static int addMailUidAndRevUidtoDB(Mail mail) {
		return SimpleDaoTemplate
				.update("INSERT INTO \"download\" (\"mailuid\", \"mailpid\", \"fromUser\", \"userid\", \"userUid\",\"datetime\", \"hasDownload\", \"downloadNum\", \"revUid\", \"revItemid\") VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						mail.getMailuid(), mail.getMailpid(),
						mail.getFromUser() + "_" + mail.getTitle(),
						mail.getUserid() + "(" + mail.getUserName() + ")",
						mail.getUserUid(),
						mail.getDatetime(), mail.getHasDownload(), "0",
						mail.getRevUid(), mail.getRevItemid());
	}

	public static int removeMailFromDB(final String uid) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		/*
		 * return SimpleDaoTemplate.update("DELETE FROM download WHERE uid = ?",
		 * uid);
		 */
		return SimpleDaoTemplate.update(
				"DELETE FROM \"download\" WHERE \"uid\" = ?", uid);
	}

	public static Mail getByUid(User user, TCSession session, String uid) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);
		Envelope envelope = (Envelope) service.loadModelObject(uid);
		service.getProperties(envelope, "uid", "object_name", "object_type",
				"object_desc", "object_type", "envelopeReadFlag",
				"last_mod_user", "contents", "sent_date", "senders_tag");

		Mail mail = new Mail(user, session, envelope);

		return mail;
	}

	public Mail(User receiveUser, TCSession session, Envelope envelope) {
		EasyDataManagementService service = new EasyDataManagementService(
				session);

		try {
			this.mailuid = envelope.getUid();
			this.mailpid = envelope.get_pid() + "";
			this.userUid = receiveUser.getUid();
			this.userid = receiveUser.get_userid();
			this.userName = receiveUser.get_user_name();
			this.title = envelope.get_object_name();
			this.type = envelope.get_object_type();
			this.content = envelope.get_object_desc();
			this.downloadNum = "0";
			SimpleDateFormat format = new SimpleDateFormat(
					DateUtils.getTimeFormat());
			service.getProperties(envelope, "sent_date");
			service.getProperties(envelope, "senders_tag");
			this.datetime = format.format(envelope.get_sent_date().getTime());// 邮戳时间

			this.hasDownload = "0";
			this.hasRead = envelope.get_envelopeReadFlag() + "";

			User user = (User) envelope.get_senders_tag();// get_last_mod_user();//发件人
			Person fromPerson = (Person) user.get_person();
			service.refreshObjects(fromPerson);
			service.getProperties(fromPerson, "PA9");
			service.getProperties(fromPerson, "PA3");
			this.fromUser = user.get_user_name();
			this.fromUserId = user.getUid();
			this.from = fromPerson.get_PA9();
			this.fromUserDept = "";

			if (fromPerson.get_PA3() != null) {
				this.fromUserDept = dept.get(fromPerson.get_PA3().trim());
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

	}

	public static String replaceSpecial(String str) {
		if (str != null) {
			if (str.startsWith("\"")) {
				str.replaceFirst("\"", "");
			}
		}
		return str;
	}

	public static void remove(TCSession session, final String id,
			final String userUid) {
		// Mail vo = Mail.getMailFromDB(id);
		List<Mail> vo = Mail.getMailFromDBByMailUidAndUserUid(id, userUid);

		if (vo != null) {
			for (Mail ma : vo) {
				String hasDownload = ma.getHasDownload();
				if ("0".equals(hasDownload)) {
					// 如果邮件没有被下载，不能删除；
					return;
				}
			}
		}
		/*
		 * if ("0".equals(vo.hasDownload)) { // 如果邮件没有被下载，不能删除； return; }
		 */

		EasyDataManagementService service = new EasyDataManagementService(
				session);

		Envelope envelope = (Envelope) service.loadModelObject(id);
		service.deleteObjects(envelope);
		if (vo != null) {
			for (Mail ma : vo) {
				ma.setDatetime(DateUtils.getSystemTime());
				ma.setHasDownload("2");
				Mail.editMailFromDB(ma);
			}
		}
		/*
		 * vo.setDatetime(DateUtils.getSystemTime()); vo.setHasDownload("2");
		 */
		// Mail.editMailFromDB(vo);
	}

	public static void removes(TCSession session, String[] ids, String userUid) {
		if (ids != null) {
			for (String id : ids) {
				remove(session, id, userUid);
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

	public String getHasRead() {
		return hasRead;
	}

	public void setHasRead(String hasRead) {
		this.hasRead = hasRead;
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

	public String getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}

	public String getFromUserDept() {
		return fromUserDept;
	}

	public void setFromUserDept(String fromUserDept) {
		this.fromUserDept = fromUserDept;
	}

	public String getRevUid() {
		return revUid;
	}

	public void setRevUid(String revUid) {
		this.revUid = revUid;
	}

	public String getRevItemid() {
		return revItemid;
	}

	public void setRevItemid(String revItemid) {
		this.revItemid = revItemid;
	}

	public String getUserUid() {
		return userUid;
	}

	public void setUserUid(String userUid) {
		this.userUid = userUid;
	}

}
