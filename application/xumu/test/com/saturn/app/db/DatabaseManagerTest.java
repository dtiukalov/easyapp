package com.saturn.app.db;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class DatabaseManagerTest {

	@Test
	public void testGetDataSource() {
		assertNotNull(DatabaseManager.getInstance().getDataSource());
	}

	@Test
	public void testGetConnection() {
		Connection connection = DatabaseManager.getInstance().getConnection();
		assertNotNull(connection);
		
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
