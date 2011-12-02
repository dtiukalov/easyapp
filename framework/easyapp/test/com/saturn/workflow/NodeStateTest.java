package com.saturn.workflow;

import static org.junit.Assert.*;

import org.junit.Test;

public class NodeStateTest {

	@Test
	public void testAdd() {
		NodeState state = new NodeState(null, "-1", "2", "name", "node.state.normal");
		
		assertEquals(1, NodeState.add(state));
		
		String id = NodeState.getList("-1").get(0).getId();
		
		assertEquals(1, NodeState.remove(id));
	}

}
