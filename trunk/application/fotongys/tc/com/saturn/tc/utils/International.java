package com.saturn.tc.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class International {
	
	public static String LOCAL = "__LOCAL__";
	private static Map<String, String> en = new HashMap<String, String>();
	private static Map<String, String> cn = new HashMap<String, String>();
	
	static {
		inital();
	}
	
	public static String get(HttpServletRequest request, String key) {
		String local = (String)request.getSession().getAttribute(LOCAL);
		return getValue(local, key);
	}
	
	public static String getValue(String local, String key) {
		String value = getMap(local).get(key);
		
		if (value == null) {
			return key;
		}
		
		return value;
	}
	
	private static void inital() {
		en.put("login_title", "Foton PLM system");
		en.put("username", "User");
		en.put("password", "Password");
		en.put("login", "Login");
		en.put("logout", "Logout");
		en.put("query.condition", "Query Condition");
		en.put("mail.list", "Mail List");
		en.put("mail.title", "Title");
		en.put("mail.from.user", "From User");
		en.put("mail.from.userdept", "Business Division");
		en.put("mail.receive.user", "User");
		en.put("mail.content", "Conent");
		en.put("mail.detail", "Mail Detail");
		en.put("mail.send.time", "Send Time");
		en.put("has.download", "Has Download");
		en.put("operation", "Operation");
		en.put("view", "View");
		en.put("delete", "Delete");
		en.put("delete.info", "If Email did not Download, it can not be Deleted");
		en.put("delete.noselect", "Please select at least one item");
		en.put("download.info", "Confirm Download?");
		en.put("download.noselect", "Please select at least one item");
		en.put("batch.delete", "Batch Delete");
		en.put("batch.download", "Batch Download");
		en.put("attachment", "Attachment");
		en.put("attachment.list", "Attachment List");
		en.put("attachment.name", "Name");
		en.put("attachment.status", "Status");
		en.put("attachment.version", "Version");
		en.put("attachment.type", "Type");
		en.put("attachment.download", "Download");
		en.put("attachment.detail", "Pelease Save!");
		en.put("delete", "Delete");
		en.put("yes", "Yes");
		en.put("no", "No");
		en.put("all", "All");
		en.put("ok", "Ok");
		en.put("cancel", "Cancel");
		en.put("back", "Back");
		en.put("info", "Info");
		
		
		cn.put("login_title", "福田汽车供应商PLM系统");
		cn.put("username", "用户名");
		cn.put("password", "密码");
		cn.put("login", "登录");
		cn.put("logout", "退出");
		cn.put("query.condition", "查询条件");
		cn.put("mail.list", "邮件列表");
		cn.put("mail.title", "主题");
		cn.put("mail.from.user", "发件人");
		cn.put("mail.from.userdept", "事业部");
		cn.put("mail.receive.user", "收件人");
		cn.put("mail.content", "内容");
		cn.put("mail.detail", "邮件详情");
		cn.put("mail.send.time", "发放时间");
		cn.put("has.download", "已下载");
		cn.put("operation", "操作");
		cn.put("view", "查看");
		cn.put("delete", "删除");
		cn.put("batch.delete", "批量删除");
		cn.put("batch.download", "批量下载");
		cn.put("attachment", "附件");
		cn.put("attachment.list", "附件列表");
		cn.put("attachment.name", "名称");
		cn.put("attachment.status", "状态");
		cn.put("attachment.version", "版本");
		cn.put("attachment.type", "类型");
		cn.put("attachment.download", "下载");
		cn.put("attachment.detail", "请保存!");
		cn.put("delete", "删除");
		cn.put("delete.info", "如果邮件没有被下载，不能被删除！");
		cn.put("delete.noselect", "请选择至少一项");
		cn.put("download.info", "确认下载吗?");
		cn.put("download.noselect", "请选择至少一项");
		cn.put("yes", "是");
		cn.put("no", "否");
		cn.put("all", "全部");
		cn.put("ok", "确定");
		cn.put("cancel", "取消");
		cn.put("back", "返回");
		cn.put("info", "提示");
		
	}

	private static Map<String, String> getMap(String local) {
		if ("en".equals(local)) {
			return en;
		} else {
			return cn;
		}
	}
}
