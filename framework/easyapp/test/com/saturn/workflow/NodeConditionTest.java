package com.saturn.workflow;

import static org.junit.Assert.*;

import org.junit.Test;

public class NodeConditionTest {

	@Test
	public void testAdd() {
		NodeCondition condition = new NodeCondition(null, "3", "node.condition.model.auth", "权限", "node.condition.type.user", "用户", "admin, rongzhan", "管理员, 融展", "否");
		
		assertEquals(1, NodeCondition.add(condition));
		condition = NodeCondition.getAll(condition, null, null, null, null).getList().get(0);
		
		String id = condition.getId();
		assertNotNull(NodeCondition.get(id));
		
		condition.setValue("admin");
		condition.setValueName("管理者");
		assertEquals(1, NodeCondition.edit(condition));
		
		condition = NodeCondition.get(id);
		assertEquals("admin", condition.getValue());
		assertEquals("管理者", condition.getValueName());
		
		assertEquals(1, NodeCondition.remove(id));
	}

}
