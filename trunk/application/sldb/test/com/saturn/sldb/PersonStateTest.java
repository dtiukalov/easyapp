package com.saturn.sldb;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;


public class PersonStateTest {

	@Test
	public void testAdd() {
		PersonState info = new PersonState(null, "-1", "admin", "admin", 
				"2011-11-26 13:00:00", "zhangsan", "220102198112034412", "申报", "", "管理部");
		
		assertEquals(1, PersonState.add(info));
		
		info = PersonState.getAll(info, null, null, null, null).getList().get(0);
		String id = info.getId();
		
		info = PersonState.get(id);
		assertNotNull(info);
		
		info.setName("张三1");
		assertEquals(1, PersonState.edit(info));
		assertEquals("张三1", PersonState.get(id).getName());
		
		assertEquals(1, PersonState.remove(id));
	}

}
