package com.saturn.website;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
	
	public static String getTextWithMax(String text, int max) {
		if (text == null) {
			return "";
		}
		
		if (text.length() <= max) {
			return text;
		}
		
		return text.substring(0, max) + "...";
	}
	
	public static String getRootCid(HttpServletRequest request) {
		String uri = request.getRequestURI();
		
		String rootCid = "rongzhan";
		
		if (uri != null) {
			String[] subs = uri.split("/");
			if (subs.length >= 3) {
				rootCid = subs[2];
			}
		}
		return rootCid;
	}
	
	public static String getTitle(HttpServletRequest request) {
		String cid = request.getParameter("cid");
		String aid = request.getParameter("aid");
		
		String title = "首页";
		
		if (cid == null) {
			return title;
		}
		
		if (aid == null) {
			List<Content> children = Content.getChildren(cid);
			if (children != null && !children.isEmpty()) {
				aid = children.get(0).getId();
			}
		}
		
		Content content = Content.get(aid);
		if (content != null) {
			title = content.getName();
		} 
		
		return title;
	}
	
	public static String getLink(String cid, String aid) {
		if (cid == null) {
			return "index.jsp";
		}
		
		Content content = Content.get(cid);
		
		if (content == null) {
			return "index.jsp";
		}
		
		String path = content.getPath();
		String mode = content.getMode();
		if (path == null || "".equals(path.trim())) {
			if ("content.mode.more".equals(mode)) {
				path = "list.jsp";
			} else  {
				path = "content.jsp";
			}
		}
		
		path += "?cid=" + cid;
		if (aid != null && !"".equals(aid)) {
			path += "&aid=" + aid;
		}
		
		return path;
	}
}
