package com.satrun.data.extraction.utils;

import java.util.ArrayList;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.OrFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.BulletList;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.TitleTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.HtmlPage;

import com.sun.org.apache.xerces.internal.impl.dv.dtd.NOTATIONDatatypeValidator;

public class ParserUtils {

	private static String CHARSET = "gb2312";
	/**
	 * @param 
	 * @param  
	 * @return  
	 * @throws  
	 */
	public static String getHtmlTitle(String htmlCode){
		Parser parser = Parser.createParser(htmlCode, CHARSET);
		HtmlPage visitor = new HtmlPage(parser);
		String title = "";
		try {
			parser.visitAllNodesWith(visitor);
			title = visitor.getTitle();
		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return title;
		
    }
	
	/**
	 * @throws ParserException 
	 * @throws ParserException 
	 * @param 
	 * @param  
	 * @return  
	 * @throws  
	 */
	public static NodeList getNodeList(Parser parser) throws ParserException {
		NodeList nodeList;
		
		NodeFilter textFilter = new NodeClassFilter(TextNode.class);
		NodeFilter linkFilter = new NodeClassFilter(LinkTag.class);
		NodeFilter titleFilter = new NodeClassFilter(TitleTag.class);
		OrFilter filter = new OrFilter();
		filter.setPredicates(new NodeFilter[] {textFilter, linkFilter, titleFilter});
		
		nodeList = parser.parse(filter);
		
		return nodeList;
	}

	/**
	 * @param  htmlCode html页面源代码
	 * @param  tagNameFilter 页面标签
	 * @return  NodeList
	 * @throws  
	 */
	public static NodeList getNodeListByTagFilter(String htmlCode, String tagNameFilter) {
		Parser parser = Parser.createParser(htmlCode, CHARSET);
		HtmlPage visitor = new HtmlPage(parser);
		try {
			parser.visitAllNodesWith(visitor);
		} catch (ParserException e1) {
			e1 = null;
		}
		// 所有的节点
		NodeList nodelist = visitor.getBody();
		
		// 建立一个节点filter用于过滤节点
		NodeFilter filter = new TagNameFilter(tagNameFilter);
		// 得到所有过滤后，想要的节点
		nodelist = nodelist.extractAllNodesThatMatch(filter, true);
		
		return nodelist;
	}
	
	/**
	 * @param  htmlCode html页面源代码
	 * @param  tagNameFilter 页面标签
	 * @param  cssClass 页面标签的样式
	 * @return  ArrayList<TagNode>
	 * @throws  
	 */
	public static ArrayList<TagNode> getNodeListByTagAndClass(String htmlCode, 
			String tagNameFilter, String cssClass) {
		ArrayList<TagNode> nodes = new ArrayList<TagNode>();
		NodeList nodelist = getNodeListByTagFilter(htmlCode, tagNameFilter);
		if (nodelist.size() > 0) {
			for(int i = 0; i < nodelist.size(); i++) {
				TagNode node = (TagNode)nodelist.elementAt(i);
				if (node.getAttribute("class") != null && 
						cssClass.equals(node.getAttribute("class"))) {
					nodes.add(node);
				}
			}
		}
		
		return nodes;
	}
	
	public static String addBodyTag(String htmlCode) {
		return "<body>" + htmlCode + "</body>"; 
	}


}
