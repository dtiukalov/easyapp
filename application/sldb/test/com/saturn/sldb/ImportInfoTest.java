package com.saturn.sldb;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;


public class ImportInfoTest {

	@Test
	public void testAdd() {
		ImportInfo info = new ImportInfo(null, "test", "tableName", "1", "测试表");
		assertEquals(1, ImportInfo.add(info));
		
		info = ImportInfo.getAll(info, null, null, null, null).getList().get(0);
		String id = info.getId();
		
		info = ImportInfo.get(id);
		assertNotNull(info);
		
		info.setName("测试表1");
		assertEquals(1, ImportInfo.edit(info));
		assertEquals("测试表1", ImportInfo.get(id).getName());
		
		assertEquals(1, ImportInfo.remove(id));
	}

}
