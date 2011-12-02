package com.saturn.website;

import static org.junit.Assert.*;

import org.junit.Test;

import com.saturn.app.utils.DateUtils;

public class ArticleTest {

	@Test
	public void testAdd() {
		Article article = new Article(null, "test.home", "测试", "一个测试", "article.state.recommand", "推荐", "visible.true", "可见", "0", DateUtils.getSystemTime(), "admin", "管理员");
		assertEquals(1, Article.add(article));
		
		article = Article.getAll(article, "0", "1", "id", "desc").getList().get(0);
		String id = article.getId();
		
		assertNotNull(article);
		assertNotNull(id);
		
		article.setCid("test.home1");
		assertEquals(1, Article.edit(article));
		assertEquals("test.home1", Article.get(id).getCid());
		
		assertEquals(1, Article.remove(id));
	}

}
