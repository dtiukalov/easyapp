package com.saturn.sldb;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;


public class ImportTest {

	@Test
	public void testAdd() {
		Import info = new Import(null, "房产局", "2011-11-28 00:00:00", "admin",
				"admin", "100", "2011-11-28", "/import/test.xls");
		assertEquals(1, Import.add(info));
		
		info = Import.getAll(info, null, null, null, null).getList().get(0);
		String id = info.getId();
		
		info = Import.get(id);
		assertNotNull(info);
		
		info.setType("房产局1");
		assertEquals(1, Import.edit(info));
		assertEquals("房产局1", Import.get(id).getType());
		
		assertEquals(1, Import.remove(id));
	}

}
