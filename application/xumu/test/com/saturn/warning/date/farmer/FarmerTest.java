package com.saturn.warning.date.farmer;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.Test;

public class FarmerTest {

	@Test
	public void testAdd() {
		Farmer item = new Farmer(null, "zhangsan", "张三", "2012-04-02 00:00:00", "12313123123");

		assertEquals(1, Farmer.add(item));

		item = Farmer.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(Farmer.get(id));

		Farmer.remove(id);
	}
}
