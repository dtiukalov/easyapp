package com.satrun.spider;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.beans.LinkBean;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeIterator;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.NodeVisitor;

public class Main {
	public static void main(String[] args) throws Exception {
		/*
		 * HttpClient httpclient = new DefaultHttpClient(); HttpGet httpget =
		 * new HttpGet("http://data.auto.sina.com.cn/"); HttpResponse response =
		 * httpclient.execute(httpget); HttpEntity entity =
		 * response.getEntity(); if (entity != null) { InputStream instream =
		 * entity.getContent(); BufferedReader reader = new BufferedReader(new
		 * InputStreamReader( instream, "gb2312")); String line = null; while
		 * ((line = reader.readLine()) != null) { System.out.println(line); }
		 * 
		 * }
		 */

		try {
			Parser parser = new Parser();
			parser.setURL("http://www.baidu.com/");
			parser.setEncoding(parser.getEncoding());
			NodeVisitor visitor = new NodeVisitor() {
				public void visitTag(Tag tag) {
					System.out.println("testVisitorAll()  Tag name is :"
							+ tag.getTagName() + "\n Class is :"
							+ tag.getClass());
				}
			};

			parser.visitAllNodesWith(visitor);
		} catch (ParserException e) {
			e.printStackTrace();
		}

		try {

			NodeFilter filter = new NodeClassFilter(LinkTag.class);
			Parser parser = new Parser();
			parser.setURL("http://www.baidu.com/");
			parser.setEncoding(parser.getEncoding());
			NodeList list = parser.extractAllNodesThatMatch(filter);
			for (int i = 0; i < list.size(); i++) {
				LinkTag node = (LinkTag) list.elementAt(i);
				System.out.println("testLinkTag() Link is :"
						+ node.extractLink());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		Parser parser = new Parser();
		LinkBean linkBean = new LinkBean();
		linkBean.setURL("http://www.baidu.com/");
		URL[] urls = linkBean.getLinks();

		for (int i = 0; i < urls.length; i++) {
			URL url = urls[i];
			System.out.println("testLinkBean() -url  is :" + url);
		}

	}
}
