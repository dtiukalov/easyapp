package com.saturn.auth;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class OrganizationTest {
	
	@Test
	public void testOrganization() {
		Organization organization = new Organization(null, "test_organization", "/root/test", "否", null);
		
		assertEquals(1, Organization.add(organization));
		organization = Organization.getOrganizations(organization, "0", "2", "id", "desc").getList().get(0);
		
		String id = organization.getId();
		
		organization = Organization.get(id);
		organization.setName("test_organization2");
		
		assertEquals(1, Organization.edit(organization));
		assertEquals("test_organization2", organization.getName());
		
		assertEquals(1, Organization.remove(id));
	}
}
