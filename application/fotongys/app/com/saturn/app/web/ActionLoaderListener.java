package com.saturn.app.web;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.saturn.app.utils.FileUtils;
import com.saturn.tc.utils.EmailUtils;

public class ActionLoaderListener implements ServletContextListener {

	private static final String ACTION_ROOT_PATH_DEFAULT = "/com/saturn/action";
	private static final String ACTION_ROOT_PATH = "actionRootPath";
	
	private static final String EMAIL_HOST = "emailHost";
	private static final String EMAIL_FROM_ADDRESS = "fromEmail";
	private static final String EMAIL_PASSWORD = "fromPass";

	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		
		String actionRootPath = context.getInitParameter(ACTION_ROOT_PATH);
		if (actionRootPath == null) {
			actionRootPath = ACTION_ROOT_PATH_DEFAULT;
		}
		
		String host = context.getInitParameter(EMAIL_HOST);
		if (host == null) {
			EmailUtils.host = host;
		}
		
		String fromEmail = context.getInitParameter(EMAIL_FROM_ADDRESS);
		if (fromEmail == null) {
			EmailUtils.fromEmail =fromEmail;
		}
		
		String fromPass = context.getInitParameter(EMAIL_PASSWORD);
		if (fromPass == null) {
			EmailUtils.fromPass = fromPass;
		}

		List<String> classNames = loadActionClass(actionRootPath);
		ActionManager.add(classNames);
	}

	public void contextDestroyed(ServletContextEvent event) {
	}

	public List<String> loadActionClass(String actionRootPath) {
		List<String> actionClass = new ArrayList<String>();

		URL url = ActionLoaderListener.class.getResource(actionRootPath);
		File rootDir = new File(url.getFile());

		LinkedList<File> dirs = new LinkedList<File>();
		dirs.add(rootDir);

		while (!dirs.isEmpty()) {
			File dir = dirs.removeFirst();
			addSubDirs(dir, dirs);
			print(actionClass, dir, actionRootPath);
		}
		
		return actionClass;
	}

	private void addSubDirs(File dir, LinkedList<File> dirs) {
		File[] files = FileUtils.getSubDirectory(dir);

		if (files != null) {
			for (File file : files) {
				dirs.add(file);
			}
		}
	}

	private void print(List<String> actionClass, File dir, String actionRootPath) {
		File[] file = FileUtils.getSubFile(dir, ".class");

		if (file != null) {
			for (int i = 0; i < file.length; i++) {
				actionClass.add(getClassFullName(file[i].getAbsolutePath(), actionRootPath));
			}
		}
	}

	public String getClassFullName(String filePath, String actionRootPath) {
		String classPath = new File(ActionLoaderListener.class.getResource("/")
				.getFile()).getAbsolutePath();
		
		String className = null;
		if (filePath.startsWith(classPath)) {
			className = filePath.replace(classPath, "");
		} else {
			actionRootPath = actionRootPath.replace("/", File.separator);
			if (!filePath.startsWith(actionRootPath)) {
				int index = filePath.indexOf(actionRootPath);
				if (index != -1) {
					className = filePath.substring(index);
				}
			}
		}
		
		className = className.replace(File.separator, ".");
		className = className.replace(".class", "");
		return className.substring(1);
	}
}
