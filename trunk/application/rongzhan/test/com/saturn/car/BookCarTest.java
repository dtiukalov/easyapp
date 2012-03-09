package com.saturn.car;

import static org.junit.Assert.*;

import org.junit.Test;

import com.saturn.app.utils.DateUtils;

public class BookCarTest {

	@Test
	public void testAdd() {
		BookCar car = new BookCar(null, "test.rongzhan", "car.dongfenghongda", "car.dongfenghongda.crv", "car.dongfenghongda.crv.1", "东风本田", "CRV", "系列一", "吉ADX813", "18943630044", "bookcar.shijia", "试驾", "想预约试驾", DateUtils.getSystemTime(), DateUtils.getSystemTime(), "bookcar.state.false", "未确认", "谷先生");
		assertEquals(1, BookCar.add(car));
		
		car = BookCar.getAll(car, "0", "5", null, null).getList().get(0);
		String id = car.getId();
		assertNotNull(BookCar.get(id));
		
		car.setCid("test.rongzhan2");
		assertEquals(1, BookCar.edit(car));
		assertEquals("test.rongzhan2", BookCar.get(id).getCid());
		
		assertEquals(1, BookCar.remove(id));
	}

}
