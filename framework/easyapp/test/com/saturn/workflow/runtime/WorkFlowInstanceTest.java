package com.saturn.workflow.runtime;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

public class WorkFlowInstanceTest {

	@Test
	public void testAdd() {
		WorkFlowInstance instance = new WorkFlowInstance(null, "-1", "testFlow", "测试工作流", "admin", "管理员", "2011-10-17 20:24:00");
		assertEquals(1, WorkFlowInstance.add(instance));
		
		instance = WorkFlowInstance.getAll(instance, null, null, null, null).getList().get(0);
		
		String id = instance.getId();
		assertNotNull(WorkFlowInstance.get(id));
		
		assertEquals(1, WorkFlowInstance.end(id));
		assertNotNull(WorkFlowInstance.get(id).getEndTime());
		assertEquals(1, WorkFlowInstance.remove(id));
	}

}
