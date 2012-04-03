package com.saturn.warning.date.farmer;

import static org.junit.Assert.*;

import org.junit.Test;

public class FarmerForageTest {

	@Test
	public void testAdd() {
		FarmerForage item = new FarmerForage(null, "12313123123", "玉米", "4",
				"10", "40", "张三", "2012-04-02 00:00:00");

		assertEquals(1, FarmerForage.add(item));

		item = FarmerForage.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FarmerForage.get(id));

		FarmerForage.remove(id);
	}

}
