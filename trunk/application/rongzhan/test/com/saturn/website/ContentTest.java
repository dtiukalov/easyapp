package com.saturn.website;

import static org.junit.Assert.*;

import org.junit.Test;

public class ContentTest {

	@Test
	public void testAdd() {
		Content content = new Content("test.home", "首页", "Home", "/index.jsp", "test", null, "visible.true", "显示", "content.mode.none", "空项");
		
		assertEquals(1, Content.add(content));
		assertNotNull(Content.get("test.home"));
		
		assertTrue(Content.getAll(content, "0", "10", "id", "desc").getList().size() > 0);
		content = Content.getAll(content, "0", "10", "id", "desc").getList().get(0);
		content.setEnglish("Home1");
		assertEquals(1, Content.edit(content));
		assertEquals("Home1",  Content.getAll(content, "0", "10", "id", "desc").getList().get(0).getEnglish());
		
		Content content2 = new Content("test.new", "新闻", "New", "/new.jsp", "test", null, "visible.true", "显示", "content.mode.none", "空项");
		assertEquals(1, Content.add(content2));
		content2 = Content.getAll(content2, "0", "10", "id", "desc").getList().get(0);
		
		String sort1 = content.getSort();
		String sort2 = content2.getSort();
		Content.changeSort("test.home", "test.new");
		
		assertEquals(sort2, Content.get("test.home").getSort());
		assertEquals(sort1, Content.get("test.new").getSort());
		
		assertEquals(1, Content.remove("test.home"));
		assertEquals(1, Content.remove("test.new"));
	}

}
