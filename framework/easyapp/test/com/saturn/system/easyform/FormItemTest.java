package com.saturn.system.easyform;

import static org.junit.Assert.*;

import org.junit.Test;

public class FormItemTest {

	@Test
	public void testAdd() {
		FormItem item = new FormItem(null, "test_name", "名称", "zhangsan", "10", "boolean.true", "是", "boolean.true", "是", "visible.true", "显示", "1", "10", "regex.id", "标识", "请输入名称", "", "", "form.type.input", "输入框", "", "add");
	
		assertEquals(1, FormItem.add(item));
		
		item = FormItem.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FormItem.get(id));
		
		item.setShowName("名称2");
		assertEquals(1, FormItem.edit(item));
		assertEquals("名称2", FormItem.get(id).getShowName());
		
		
		FormItem.remove(id);
	}

}
