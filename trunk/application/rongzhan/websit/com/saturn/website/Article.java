package com.saturn.website;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

/**
 * 文章
 * 
 * @author Administrator
 *
 */
public class Article {
	
	private String id;
	private String cid;
	private String title;
	private String text;
	
	private String type;
	private String typeName;
	private String state;
	private String stateName;
	
	private String count;
	
	private String createTime;
	private String operater;
	private String operaterName;
	
	private static ORMapping<Article> mapping = new ResultORMapping<Article>();
	
	public static int add(Article vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO web_article(cid, title, text, type, typeName, state, stateName,  createTime, operater, operaterName) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				vo.getCid(),
				vo.getTitle(),
				vo.getText(),
				vo.getType(),
				vo.getTypeName(),
				vo.getState(),
				vo.getStateName(),
				vo.getCreateTime(),
				vo.getOperater(),
				vo.getOperaterName()
		);
	}
	
	public static int addOrEdit(Article vo) {
		Article article = Article.getOneByCid(vo.getCid());
		
		if (article == null) {
			return add(vo);
		} else {
			vo.setId(article.getId());
			return edit(vo);
		}
	}
	
	public static int edit(Article vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE web_article SET cid = ?, title = ?, text = ?, type = ?, typeName = ?, state = ?, stateName = ?, createTime = ?, operater = ?, operaterName = ? WHERE id = ?", 
				vo.getCid(),
				vo.getTitle(),
				vo.getText(),
				vo.getType(),
				vo.getTypeName(),
				vo.getState(),
				vo.getStateName(),
				vo.getCreateTime(),
				vo.getOperater(),
				vo.getOperaterName(),
				vo.getId()
		);
	}
	
	public static Article get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM web_article WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Article.class);
	}
	
	public static List<Article> getByCid(String cid) {
		return SimpleDaoTemplate.query("SELECT * FROM web_article WHERE 1 = 1 AND cid = '" + cid + "' order by type desc, createtime desc", null,
				mapping, Article.class);
	}
	
	public static Article getOneByCid(String cid) {
		List<Article> articles = getByCid(cid);
		
		if (!articles.isEmpty()) {
			return articles.get(0);
		}
		
		return null;
	}
	
	public static String getOneArticleText(String cid) {
		Article article = getOneByCid(cid);
		
		if (article != null) {
			return article.getText();
		}
		
		return "";
	}
	
	public static List<Article> getByLikeCid(String cid) {
		return SimpleDaoTemplate.query("SELECT * FROM web_article WHERE 1 = 1 AND cid like '%" + cid + "%' order by type desc, createtime desc", null,
				mapping, Article.class);
	}
	
	public static int show(String id) {
		Article vo = get(id);
		String state = vo.getState();
		
		if ("visible.true".equals(state)) {
			vo.setState("visible.false");
			vo.setStateName("隐藏");
		} else {
			vo.setState("visible.true");
			vo.setStateName("显示");
		}
		
		return edit(vo);
	}
	
	public static ListData<Article> getAll(Article vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM web_article WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "cid", "title", "type", "state", "createTime", "operaterName")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Article.class, start, offset);
	}
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM web_article WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public Article() {
		
	}

	public Article(String id, String cid, String title, String text,
			String type, String typeName, String state, String stateName,
			String count, String createTime, String operater,
			String operaterName) {
		
		super();
		this.id = id;
		this.cid = cid;
		this.title = title;
		this.text = text;
		this.type = type;
		this.typeName = typeName;
		this.state = state;
		this.stateName = stateName;
		this.count = count;
		this.createTime = createTime;
		this.operater = operater;
		this.operaterName = operaterName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getOperater() {
		return operater;
	}

	public void setOperater(String operater) {
		this.operater = operater;
	}

	public String getOperaterName() {
		return operaterName;
	}

	public void setOperaterName(String operaterName) {
		this.operaterName = operaterName;
	}
	
	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
