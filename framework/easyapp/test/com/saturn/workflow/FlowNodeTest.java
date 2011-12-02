package com.saturn.workflow;

import static org.junit.Assert.*;

import org.junit.Test;

public class FlowNodeTest {

	@Test
	public void testAdd() {
		FlowNode node = new FlowNode(null, "3", "测试节点", "flow.node.create", "创建节点");
		
		assertEquals(1, FlowNode.add(node));
		node = FlowNode.getAll(node, null, null, null, null).getList().get(0);
		
		String id = node.getId();
		assertNotNull(FlowNode.get(id));
		
		node.setName("测试节点2");
		assertEquals(1, FlowNode.edit(node));
		
		assertEquals("测试节点2", FlowNode.get(id).getName());
		
		assertEquals(1, FlowNode.remove(id));
	}

}
