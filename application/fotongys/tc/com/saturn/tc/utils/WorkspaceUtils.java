package com.saturn.tc.utils;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.Folder;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class WorkspaceUtils {
	
	public static String HOST = "http://localhost:7001/tc";
	
	public static Folder getHome(TCSession session, String userId) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		
		User user = (User) service.loadModelObject(userId);

		Folder home = null;

		if (user != null) {
			try {
				home = user.get_home_folder();
				service.getProperties(home, "current_name",
						"object_name", "contents");

			} catch (NotLoadedException e) {
				e.printStackTrace();
			}
		}

		return home;
	}
	
	public static ImanFile getFile(TCSession session, String userId) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		
		Object object = service.loadModelObject(userId);
		
		ImanFile file = null;
		if(object instanceof ImanFile){
			file = (ImanFile) object;
		}
	/*	if (file != null) {
			service.getProperties(file, "file_name", "original_file_name");
		}*/

		return file;
	}


	public static Folder getMailBox(TCSession session, String userId) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		
		Folder mailBox = null;

		User user = (User) service.loadModelObject(userId);

		try {
			service.getProperties(user, "mailbox");
			mailBox = user.get_mailbox();

			service.getProperties(mailBox, "current_name",
					"object_name", "contents");

		} catch (NotLoadedException e) {
			e.printStackTrace();
		}
		
		return (Folder)service.refreshObjects(mailBox);
	}

//	public static Envelope[] getMailEnvelopes(Folder mailBox) {
//		Envelope[] envelopes = null;
//
//		try {
//			envelopes = (Envelope[])mailBox.get_contents();
//			
//			EasyDataManagementService
//					.getProperties(envelopes, "contents", "pid");
//
//			for (int i = 0; i < envelopes.length; i++) {
//				Envelope envelope = envelopes[i];
//				// System.out.println("邮件 = " + envelope.get_object_string() +
//				// "  邮件类型 = " + envelope.get_object_type());
//				// System.out.println("邮件PID = " + envelope.get_pid());
//
//				WorkspaceObject[] envfolders = (WorkspaceObject[]) envelope
//						.get_contents();
//				EasyDataManagementService.getProperties(envfolders,
//						"object_name", "displayable_revisions",
//						"last_mod_user", "pid", "active_seq", "acl_bits");
//
//				for (int j = 0; j < envfolders.length; j++) {
//
//					WorkspaceObject wso = envfolders[j];
//					// 找到邮件发送人的邮箱地址
//					User fromUser = (User) wso.get_last_mod_user();
//					Person fromPerson = (Person) fromUser.get_person();
//					EasyDataManagementService.getProperties(fromPerson, "PA9");
////					System.out.println("name = " + fromPerson.get_user_name()
////							+ "  PA9 = " + fromPerson.get_PA9());
////					System.out.println(Arrays.toString(wso.getPropertyNames()));
////
////					System.out.println("附件名称 = " + wso.get_object_name());
////					System.out.println("附件类型 = " + wso.get_object_type());
////					System.out.println("附件类= " + wso.getClass());
////					System.out.println("附件PID = " + wso.get_pid());
////					System.out.println();
//					if ("Folder".equals(wso.get_object_type())) {
//						Folder fo = (Folder) wso;
//						WorkspaceObject[] wsoArray = (WorkspaceObject[]) getChildren(fo);
//					} else {
//						System.out.println("非文件夹");
//					}
//				}
//
//			}
//		} catch (NotLoadedException ne) {
//			ne.printStackTrace();
//		} 
//		
//		return envelopes;
//	}

	public static ModelObject[] getChildren(TCSession session, Folder root) {
		EasyDataManagementService service = new EasyDataManagementService(session);
		ModelObject[] contents = null;

		try {
			root = (Folder)service.refreshObjects(root);
			service.getProperties(root, "current_name",
					"object_name", "contents");

			contents = root.get_contents();
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return contents;
	}

	private WorkspaceUtils() {

	}
}
