package com.saturn.system.easyform;

import org.junit.Test;
import static org.junit.Assert.*;

public class TableColumnTest {
	
	@Test
	public void testAdd() {
		TableColumn column = new TableColumn(null, "testCol", "测试列", "1", "column.type.varchar", "varchar", "50", "无");
		assertEquals(1, TableColumn.add(column));
		
		column = TableColumn.getAll(column, null, null, null, null).getList().get(0);
		String id = column.getId();
		
		assertNotNull(TableColumn.get(id));
		
		column.setShowName("测试列2");
		assertEquals(1, TableColumn.edit(column));
		assertEquals("测试列2", TableColumn.get(id).getShowName());
		
		assertEquals(1, TableColumn.remove(id));
	}
}
