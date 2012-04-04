package com.saturn.warning.date.farmer;

import static org.junit.Assert.*;

import org.junit.Test;

public class FarmerPigTest {

	@Test
	public void testAdd() {
		FarmerPig item = new FarmerPig(null, "12313123123", "新增", "仔猪", "3", "20", "60", "张三", "2012-04-02 00:00:00");
		
		assertEquals(1, FarmerPig.add(item));
		
		item = FarmerPig.getAll(item, null, null, null, null).getList().get(0);
		String id = item.getId();
		assertNotNull(FarmerPig.get(id));
		
		FarmerPig.remove(null, id);
	}

}
