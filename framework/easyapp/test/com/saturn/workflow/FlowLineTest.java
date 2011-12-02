package com.saturn.workflow;

import static org.junit.Assert.*;

import org.junit.Test;

public class FlowLineTest {

	@Test
	public void testAdd() {
		FlowLine item = new FlowLine(null, "1", "test_line", "1", "开始", "2", "第一步", "否", "");
		
		assertEquals(1, FlowLine.add(item));
		
		item = FlowLine.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FlowLine.get(id));
		
		item.setName("test_line2");
		assertEquals(1, FlowLine.edit(item));
		assertEquals("test_line2", FlowLine.get(id).getName());
		
		FlowLine.remove(id);
	}

}
