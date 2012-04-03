package com.saturn.app.db;

import static org.junit.Assert.*;

import org.junit.Test;

public class DymaticConditionTest {

	@Test
	public void testAddCondition() {
		assertEquals(" and name='zhangsan' and age='12' ",
				new DymaticCondition().addCondition("and name='?'", "zhangsan")
						.addCondition("and age='?'", "12").toString());

		String value = null;
		assertEquals(" and name='zhangsan' ",
				new DymaticCondition().addCondition("and name='?'", "zhangsan")
						.addCondition("and age='?'", value).toString());

		assertEquals(" and name='zhangsan' ",
				new DymaticCondition().addCondition("and name='?'", "zhangsan")
						.addCondition("and age='?'", "").toString());

		assertEquals(
				" and (date > '2011-04-01' and date < '2011-04-29' ",
				new DymaticCondition().addCondition(
						"and (date > '{0}' and date < '{1}'", "2011-04-01",
						"2011-04-29").toString());
	}

}
