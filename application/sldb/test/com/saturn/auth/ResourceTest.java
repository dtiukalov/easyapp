package com.saturn.auth;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

public class ResourceTest {

	@Test
	public void testResource() {
		Resource resource = new Resource("test.resource", "resourcer", "/root/test", "test.parentId", null, null);
		
		assertEquals(1, Resource.add(resource));
		
		resource = Resource.get("test.resource");
		resource.setName("testName");
		assertEquals(1, Resource.edit(resource));
		assertEquals("testName", Resource.get("test.resource").getName());
		
		List<Resource> users = Resource.getResources(resource, "0", "2", "id", "desc").getList();
		assertEquals(false, users.isEmpty());
		
		Resource resource2 = new Resource("test.resource2", "resourcer2", "/root/test2", "test.parentId2", null, null);
		assertEquals(1, Resource.add(resource2));
		
		String sort1 = resource.getSort();
		String sort2 = Resource.get("test.resource2").getSort();
		Resource.changeSort("test.resource", "test.resource2");
										 
		assertEquals(sort2, Resource.get("test.resource").getSort());
		assertEquals(sort1, Resource.get("test.resource2").getSort());
		
		assertEquals(1, Resource.remove("test.resource"));
		assertEquals(1, Resource.remove("test.resource2"));
	}
}
