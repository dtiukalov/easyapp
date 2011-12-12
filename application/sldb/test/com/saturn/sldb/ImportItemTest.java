package com.saturn.sldb;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;


public class ImportItemTest {

	@Test
	public void testAdd() {
		ImportItem info = new ImportItem(null, "test", "test", "10", "数字", "10", "15");
		assertEquals(1, ImportItem.add(info));
		
		info = ImportItem.getAll(info, null, null, null, null).getList().get(0);
		String id = info.getId();
		
		info = ImportItem.get(id);
		assertNotNull(info);
		
		info.setName("test1");
		assertEquals(1, ImportItem.edit(info));
		assertEquals("test1", ImportItem.get(id).getName());
		
		assertEquals(1, ImportItem.remove(id));
	}

}
