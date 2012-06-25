package tc.wfcf;

import gctc.common.ConcatReader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.eclipse.core.runtime.IConfigurationElement;
import org.eclipse.core.runtime.IExtension;
import org.eclipse.core.runtime.IExtensionPoint;
import org.eclipse.core.runtime.Platform;
import org.osgi.framework.Bundle;

import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.kernel.TCCRDecision;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentFolder;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCComponentUserType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class TaskEnv {

	public final TCComponentTask task;
	public final ScriptEngine se;

	public TaskEnv(TCComponentTask task, String initScript, String extPointID) {
		this.task = task;

		String instruction = null;
		try {
			instruction = task.getTaskDefinition().getInstructions();
		} catch (Exception e) {
			e.printStackTrace();
			MessageBox.post(e);
		}
		if (instruction != null)
			instruction = instruction.trim();
		else
			instruction = "";
		if (instruction.startsWith("//") || instruction.startsWith("/*")) {
			ScriptEngineManager sm = new ScriptEngineManager();
			se = sm.getEngineByName("JavaScript");
			try {
				se.put("te", this);
				IExtensionPoint extPoint = Platform.getExtensionRegistry()
						.getExtensionPoint("tc.wfcf.CustomScriptHelper");
				for (IExtension ext : extPoint.getExtensions()) {
					for (IConfigurationElement ce : ext
							.getConfigurationElements()) {
						if ("helper".equals(ce.getName())) {
							String varName = ce.getAttribute("id");
							Object ho = ce.createExecutableExtension("class");
							se.put(varName, ho);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				MessageBox.post(e, "Error initializing custom helper objects");
			}
			try {
				Reader sr = new BufferedReader(new InputStreamReader(getClass()
						.getResourceAsStream("CustomInit.js"), "UTF-8"));
				try {
					se.eval(sr);
				} finally {
					sr.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				MessageBox.post(e, "Error executing CustomInit.js");
			}
			try {
				Reader sr = new BufferedReader(new InputStreamReader(getClass()
						.getResourceAsStream(initScript), "UTF-8"));
				try {
					se.eval(sr);
				} finally {
					sr.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				MessageBox.post(e, "Error executing " + initScript);
			}

			IExtensionPoint extPoint = Platform.getExtensionRegistry()
					.getExtensionPoint(extPointID);
			for (IExtension ext : extPoint.getExtensions()) {
				try {
					for (IConfigurationElement ce : ext
							.getConfigurationElements()) {
						if ("js".equals(ce.getName())) {
							String uri = ce.getAttribute("uri");
							Bundle bndl = Platform.getBundle(ce
									.getContributor().getName());
							URL url = bndl.getEntry(uri);
							if (url == null)
								url = bndl.getResource(uri);
							if (url == null) {
								System.err.println(" No custom js '" + uri
										+ "' from bundle: " + bndl);
								continue;
							}
							InputStream is = url.openStream();
							Reader sr = new BufferedReader(
									new InputStreamReader(is, "UTF-8"));
							try {
								se.eval(sr);
							} catch (Exception e) {
								e.printStackTrace();
								System.err
										.println("Error executing custom js: '"
												+ uri + "' from bundle: "
												+ bndl);
							} finally {
								sr.close();
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			try {
				se.eval(instruction);
			} catch (Exception e) {
				e.printStackTrace();
				MessageBox.post("Instruction Script:\n" + instruction,
						"Error executing instruction as script: ",
						MessageBox.ERROR);
			}
		} else {
			se = null;
		}
	}

	protected final List<JavaHandler> beforeDecisionScripts = new ArrayList<JavaHandler>();

	public void beforeDecisionRun(JavaHandler handler) {
		handler.getClass();
		beforeDecisionScripts.add(handler);
	}

	public boolean runHandlersBeforeDecision(TCCRDecision decision)
			throws Exception {
		for (JavaHandler handler : beforeDecisionScripts) {
			if (!handler.handleDecision(task, decision)) {
				MessageBox.post(String.valueOf(handler.getMessage()),
						"Java Handler Reported Error", MessageBox.ERROR);
				return false;
			}
		}
		return true;
	}

	protected final List<JavaHandler> afterDecisionScripts = new ArrayList<JavaHandler>();

	public void afterDecisionRun(JavaHandler handler) {
		handler.getClass();
		afterDecisionScripts.add(handler);
	}

	public boolean runHandlersAfterDecision(TCCRDecision decision)
			throws Exception {
		for (JavaHandler handler : afterDecisionScripts)
			if (!handler.handleDecision(task, decision)) {
				MessageBox.post(String.valueOf(handler.getMessage()),
						"Java Handler Reported Error", MessageBox.ERROR);
				return false;
			}
		return true;
	}

	protected final List<JavaHandler> beforeCompletionScripts = new ArrayList<JavaHandler>();

	public void beforeCompletionRun(JavaHandler handler) {
		handler.getClass();
		beforeCompletionScripts.add(handler);
	}

	public boolean runHandlersBeforeCompletion(boolean unableToComplete)
			throws Exception {
		for (JavaHandler handler : beforeCompletionScripts) {
			if (!handler.handleCompletion(task, unableToComplete)) {
				MessageBox.post(String.valueOf(handler.getMessage()),
						"Java Handler Reported Error", MessageBox.ERROR);
				return false;
			}
		}
		return true;
	}

	protected final List<JavaHandler> afterCompletionScripts = new ArrayList<JavaHandler>();

	public void afterCompletionRun(JavaHandler handler) {
		handler.getClass();
		afterCompletionScripts.add(handler);
	}

	public boolean runHandlersAfterCompletion(boolean unableToComplete)
			throws Exception {
		for (JavaHandler handler : afterCompletionScripts) {
			if (!handler.handleCompletion(task, unableToComplete)) {
				MessageBox.post(String.valueOf(handler.getMessage()),
						"Java Handler Reported Error", MessageBox.ERROR);
				return false;
			}
		}
		return true;
	}

	public String runAdminScripts(String folderPath) throws Exception {
		String userID = "infodba";
		int sepPos = folderPath.indexOf(':');
		if (sepPos >= 0) {
			userID = folderPath.substring(0, sepPos);
			folderPath = folderPath.substring(sepPos + 1);
		}
		TCComponentFolder scriptFolder = getAdminFolder(task.getSession(),
				userID, folderPath);
		if (scriptFolder == null)
			return "Can't find configured folder '" + folderPath + "' from "
					+ userID + "'s home!";
		String scriptName = null;
		File scriptFile = null;
		Object msg = null;
		try {
			for (AIFComponentContext ctx : scriptFolder.getChildren("contents")) {
				if (!(ctx.getComponent() instanceof TCComponentDataset))
					continue;
				TCComponentDataset ds = (TCComponentDataset) ctx.getComponent();
				scriptName = ds.getProperty("object_name");
				// allow comment out some datasets
				if (scriptName.startsWith("--"))
					continue;
				if (scriptName.startsWith("//"))
					continue;
				File[] files = null;
				if ("Text".equals(ds.getType())) {
					files = ds.getFiles("Text");
				}
				if (files == null)
					throw new TCException("Dataset '" + ds
							+ "' has unknow type: " + ds.getType());
				if (files.length < 1)
					throw new TCException("Dataset '" + ds
							+ "' contains no file!");
				if (files.length > 1)
					throw new TCException("Dataset '" + ds
							+ "' contains multiple files!");
				scriptFile = files[0];
				Reader sr = new BufferedReader(new InputStreamReader(
						new FileInputStream(scriptFile), "UTF-8"));
				try {
					ConcatReader reader = new ConcatReader(new StringReader(
							"(function () {"), sr, new StringReader("})();"));
					msg = se.eval(reader);
				} finally {
					sr.close();
				}
				if (msg != null)
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error executing script file: " + scriptFile
					+ " from dataset " + scriptName);
			return "Error executing " + scriptName;
		}
		return msg == null ? null : msg.toString();
	}

	public static TCComponentFolder getAdminFolder(TCSession session,
			String userID, String folderPath) throws TCException {
		TCComponentUserType userType = (TCComponentUserType) session
				.getTypeComponent("User");
		TCComponentUser user = userType.find(userID);
		if (user == null)
			return null;
		TCComponentFolder home = user.getHomeFolder();
		TCComponentFolder folder = home;
		StringTokenizer tk = new StringTokenizer(folderPath, "/", false);
		path_match: while (tk.hasMoreTokens()) {
			String folderName = tk.nextToken();
			for (AIFComponentContext ctx : folder.getChildren("contents")) {
				if (ctx.getComponent() instanceof TCComponentFolder
						&& folderName.equals(((TCComponentFolder) ctx
								.getComponent()).getProperty("object_name"))) {
					folder = (TCComponentFolder) ctx.getComponent();
					continue path_match;
				}
			}
			return null;
		}
		return folder;
	}

}
