package com.saturn.auth;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

public class RoleTest {

	@Test
	public void testRole() {
		Role role = new Role(null, "roler", "一个角色");
		
		assertEquals(1, Role.add(role));
		String id = Role.getRoles(role, "0", "2", "id","desc").getList().get(0).getId();
		
		Role role2 = new Role(id, "roler2", "一个角色2");
		
		assertEquals(1, Role.addResource(id, "test.role.resourceId"));
		assertEquals(1, Role.addUser(id, "test.role.userId"));
		
		assertEquals(1, Role.edit(role2));
		
		Role role3 = Role.get(id);
		assertEquals(id, role3.getId());
		assertEquals("roler2", role3.getName());
		assertEquals("一个角色2", role3.getDescription());
		
		List<Role> users = Role.getRoles(role3, "0", "2", "id","desc").getList();
		assertEquals(false, users.isEmpty());
		
		assertEquals(1, Role.getRolesByResourceId("test.role.resourceId", "0", "2", "id").size());
		assertEquals(1, Role.getRolesByUserId("test.role.userId", "0", "2", "id", "desc").getList().size());
		
		assertEquals(1, Role.removeResource(id, "test.role.resourceId"));
		assertEquals(1, Role.removeUser(id, "test.role.userId"));
		assertEquals(1, Role.remove(id));
	}
}
