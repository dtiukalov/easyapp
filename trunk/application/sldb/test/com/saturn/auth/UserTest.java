package com.saturn.auth;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

public class UserTest {

	@Test
	public void testUser() {
		User user = new User("test.user", "tester", "1234", "test@test.com",
				"1111111");
		assertEquals(1, User.add(user));
		User user2 = new User("test.user", "tester", "12345", "test@test.com",
		"1111111");
		
		assertEquals(1, User.addRole(user.getId(), "-1"));
		
		assertEquals(1, User.edit(user2));
		
		User user3 = User.get("test.user");
		assertEquals("test.user", user3.getId());
		assertEquals("tester", user3.getName());
		assertEquals("12345", user3.getPassword());
		assertEquals("test@test.com", user3.getEmail());
		assertEquals("1111111", user3.getPhone());
		
		List<User> users = User.getUsers(user3, "0", "2", "id", "desc").getList();
		assertEquals(false, users.isEmpty());
		
		assertEquals(1, User.getUsersByRoleId("-1", "0", "2", "id").getList().size());
		
		assertEquals(1, User.removeRole(user.getId(), "-1"));
		assertEquals(1, User.remove("test.user"));
	}
}
