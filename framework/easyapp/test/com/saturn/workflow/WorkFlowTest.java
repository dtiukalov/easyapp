package com.saturn.workflow;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

public class WorkFlowTest {

	@Test
	public void testAdd() {
		WorkFlow flow = new WorkFlow(null, "test_flow", "测试工作流", "admin", "管理员", "2011-10-17 20:24:00");
		assertEquals(1, WorkFlow.add(flow));
		
		flow = WorkFlow.getAll(flow, null, null, null, null).getList().get(0);
		
		String id = flow.getId();
		assertNotNull(WorkFlow.get(id));
		
		flow.setName("test_flow2");
		assertEquals(1, WorkFlow.edit(flow));
		assertEquals("test_flow2", WorkFlow.get(id).getName());
		
		assertEquals(1, WorkFlow.remove(id));
	}

}
