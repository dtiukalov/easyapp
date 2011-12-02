package com.saturn.system.easyform;

import static org.junit.Assert.*;

import org.junit.Test;

public class TableTest {

	@Test
	public void testAdd() {
		Table table = new Table(null, "test", "测试表");
		assertEquals(1, Table.add(table));
		
		table = Table.getAll(table, null, null, null, null).getList().get(0);
		String id = table.getId();
		
		table = Table.get(id);
		assertNotNull(table);
		
		table.setShowName("测试表1");
		assertEquals(1, Table.edit(table));
		assertEquals("测试表1", Table.get(id).getShowName());
		
		assertEquals(1, Table.remove(id));
	}

}
