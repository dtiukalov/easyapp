package com.saturn.tc.utils.server;

import com.saturn.tc.clientx.TCSession;
import com.teamcenter.services.strong.core.FileManagementService;
import com.teamcenter.services.strong.core._2006_03.FileManagement.FileTicketsResponse;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.model.strong.ImanFile;

public class EasyFileManagementService {

	private TCSession session = null;
	
	public EasyFileManagementService(TCSession session) {
		this.session = session;
	}
	
	public FileManagementService getService() {
		return FileManagementService.getService(this.session.getConnection());
	}
	
	public FileManagementUtility newUtility() {
		return new FileManagementUtility(this.session.getConnection());
	}
	
	public FileTicketsResponse getFileReadTickets(ImanFile... files) {
		return getService().getFileReadTickets(files);
	}
	
}
