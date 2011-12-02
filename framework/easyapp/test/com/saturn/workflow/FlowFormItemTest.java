package com.saturn.workflow;

import static org.junit.Assert.*;

import org.junit.Test;

public class FlowFormItemTest {

	@Test
	public void testAdd() {
		FlowFormItem item = new FlowFormItem(null, "-3", "名称", "zhangsan", "10", "1", "10", "regex.id", "标识", "请输入名称", "", "", "form.type.input", "输入框", "");
	
		assertEquals(1, FlowFormItem.add(item));
		
		item = FlowFormItem.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FlowFormItem.get(id));
		
		item.setShowName("名称2");
		assertEquals(1, FlowFormItem.edit(item));
		assertEquals("名称2", FlowFormItem.get(id).getShowName());
		
		FlowFormItem.remove(id);
	}

}
