package com.saturn.system.easyform;

import static org.junit.Assert.*;

import org.junit.Test;

public class QueryFormItemTest {

	@Test
	public void testAdd() {
		QueryFormItem item = new QueryFormItem(null, "test_age", "年龄", "-1", "boolean.true", "是", "visible.true", "显示", "boolean.true", "是", "100", "", "", "input", "输入框");
		
		assertEquals(1, QueryFormItem.add(item));
		item = QueryFormItem.getAll(item, null, null, null, null).getList().get(0);
		
		String id = item.getId();
		
		assertNotNull(QueryFormItem.get(id));
		item.setShowName("年龄1");
		assertEquals(1, QueryFormItem.edit(item));
		assertEquals("年龄1", QueryFormItem.get(id).getShowName());
		
		assertEquals(1, QueryFormItem.remove(id));
	}

}
