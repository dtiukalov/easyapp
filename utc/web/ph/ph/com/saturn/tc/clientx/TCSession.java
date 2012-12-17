package com.saturn.tc.clientx;

import org.apache.commons.httpclient.HttpState;

import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.schemas.soa._2006_03.exceptions.ServiceException;
import com.teamcenter.services.strong.core.SessionService;
import com.teamcenter.services.strong.core._2006_03.Session.LoginResponse;
import com.teamcenter.soa.SoaConstants;
import com.teamcenter.soa.client.Connection;
import com.teamcenter.soa.client.model.strong.User;

public class TCSession {

	private Connection connection;

	private AppXCredentialManager credentialManager;

	public TCSession(String host) {
		credentialManager = new AppXCredentialManager();

		String protocol = (host.startsWith("http")) ? SoaConstants.HTTP
				: SoaConstants.IIOP;

		connection = new Connection(host, new HttpState(), credentialManager,
				SoaConstants.REST, protocol, false);

		connection.setExceptionHandler(new AppXExceptionHandler());

		connection.getModelManager().addPartialErrorListener(
				new AppXPartialErrorListener());

		connection.getModelManager().addChangeListener(
				new AppXUpdateObjectListener());

		connection.getModelManager().addDeleteListener(
				new AppXDeletedObjectListener());

		Connection.addRequestListener(new AppXRequestListener());

	}

	public Connection getConnection() {
		return connection;
	}

	public User login(String name, String password)
			throws InvalidCredentialsException {
		
		SessionService sessionService = SessionService.getService(connection);
		String[] credentials = { name, password, "", "", "SoaAppX" };// credentialManager.promptForCredentials();
		
		while (true) {
			LoginResponse out = sessionService.login(credentials[0],
					credentials[1], credentials[2], credentials[3], "",
					credentials[4]);
			
			return out.user;
		}
	}

	public void logout() {
		SessionService sessionService = SessionService.getService(connection);
		try {
			sessionService.logout();
		} catch (ServiceException e) {
		}
	}
}
