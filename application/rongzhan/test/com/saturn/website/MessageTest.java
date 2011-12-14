package com.saturn.website;

import static org.junit.Assert.*;

import org.junit.Test;

import com.saturn.app.utils.DateUtils;

public class MessageTest {

	@Test
	public void testAdd() {
		Message message = new Message(null, "test.new", "website.message.received", "已回复", "visible.true","显示", DateUtils.getSystemTime(), "这个一个测试", "aa@bb.com", "18943630044", "张三", DateUtils.getSystemTime(), "测试成功", "admin", "管理员", "留言");
		Message.add(message);
		
		message = Message.getAll(message, "0", "1", "id", "desc").getList().get(0);
		String id = message.getId();
		assertNotNull(message);
		assertNotNull(Message.get(id));
		
		message.setCid("test.new1");
		Message.edit(message);
		assertEquals("test.new1", Message.get(id).getCid());
		
		Message.remove(id);
	}

}
