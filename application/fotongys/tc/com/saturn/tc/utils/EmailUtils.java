package com.saturn.tc.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.naming.InitialContext;

public class EmailUtils {

	public static String host = "smtp.163.com";
	public static String fromEmail = "foton_suppliers@163.com";
	public static String fromPass = "foton888";
	
	public static void sendMailToPerson(String toEmail, String subject, String content) {
//		String host = "smtp.163.com";
//		String fromEmail = "foton_suppliers@163.com";
//		String fromPass = "foton888";

//		发送邮件的邮箱服务器属性设置
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", true);
//		gmail邮箱需要一下设置:端口号为465，其他邮箱默认为25
//		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//		props.setProperty("mail.smtp.socketFactory.fallback", "false");
//		props.setProperty("mail.smtp.port", "465");
//		props.setProperty("mail.smtp.socketFactory.port", "465");
		
		Session session = null;

		try {
			InitialContext ic = new InitialContext();
			session = (Session) ic.lookup("myMailSession");
			
			if (session == null) {
				session = Session.getDefaultInstance(props);
			}
			
			session.setDebug(true);//查看发送邮件的日志
			
//			定义消息对象，设置消息内容
			MimeMessage message = new MimeMessage(session);
			
//			加载发件人地址
			message.setFrom(new InternetAddress(fromEmail));
//			加载收件人地址
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//			加载邮件主题
			message.setSubject(subject);
			message.setSentDate(new Date());

//			向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
			Multipart multipart = new MimeMultipart();
//			文本内容
			BodyPart bodypart = new MimeBodyPart();

			bodypart.setContent(content, "text/html;charset=utf-8");

			multipart.addBodyPart(bodypart);
//			添加附件
  
//			将multipart对象放到message中
			message.setContent(multipart);

//			保存邮件
			message.saveChanges();
			
//			连接邮件服务器并发送邮件
			Transport transport = session.getTransport("smtp");
			transport.connect(host, fromEmail, fromPass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	
		
	}
}
