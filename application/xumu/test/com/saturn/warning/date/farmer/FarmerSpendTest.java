package com.saturn.warning.date.farmer;

import static org.junit.Assert.*;

import org.junit.Test;

public class FarmerSpendTest {

	@Test
	public void testAdd() {
		FarmerSpend item = new FarmerSpend(null, "12313123123", "人员工资", "3000",
				"张三", "2012-04-02 00:00:00");

		assertEquals(1, FarmerSpend.add(item));

		item = FarmerSpend.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FarmerSpend.get(id));

		FarmerSpend.remove(id);
	}

}
