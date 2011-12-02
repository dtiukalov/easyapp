package com.saturn.sldb;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;


public class PersonTest {

	@Test
	public void testAdd() {
		Person info = new Person(null, "220102198112034412", "城镇低保", "2011-11-26 13:00:00", 
				"admin", "admin", "双辽民政", 
				"创建", "张三", "男", "汉族", 
				"农业", "三无人员家庭", "3", "已婚", "无劳动能力", 
				"在职", "是", "心脏病", "听力残疾", 
				"一级", "省直国有", "森工", 
				"养老保险", "1中专", "13596166666", "XX街道",
				"OO社区12小组", "备注");
		assertEquals(1, Person.add(info));
		
		info = Person.getAll(info, null, null, null, null).getList().get(0);
		String id = info.getId();
		
		info = Person.get(id);
		assertNotNull(info);
		
		info.setName("张三1");
		assertEquals(1, Person.edit(info));
		assertEquals("张三1", Person.get(id).getName());
		
		assertEquals(1, Person.remove(id));
	}

}
