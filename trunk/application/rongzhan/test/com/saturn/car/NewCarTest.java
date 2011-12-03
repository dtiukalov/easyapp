package com.saturn.car;

import static org.junit.Assert.*;

import org.junit.Test;

public class NewCarTest {

	@Test
	public void testAdd() {
		NewCar newCar = new NewCar(null, "test.rongzhan", "car.hongda", "东风本田", "car.hongda.crv", "CRV", "car.hongda.crv.4", "4驱", "/images", "20", "19", "雨伞", "张三:13596160507");
		assertEquals(1, NewCar.add(newCar));
		
		newCar = NewCar.getAll(newCar, "0", "1", "id", "asc").getList().get(0);
		String id = newCar.getId();
		
		assertNotNull(newCar);
		assertNotNull(NewCar.get(id));
		
		newCar.setPrice("22");
		assertEquals(1, NewCar.edit(newCar));
		
		newCar = NewCar.get(id);
		assertEquals("22", newCar.getPrice());
		
		assertEquals(1, NewCar.remove(id));
	}

}
