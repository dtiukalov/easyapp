package tc.wfcf.auto;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.Reader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.eclipse.core.runtime.IConfigurationElement;
import org.eclipse.core.runtime.IExtension;
import org.eclipse.core.runtime.IExtensionPoint;
import org.eclipse.core.runtime.Platform;
import org.osgi.framework.Bundle;

import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.util.MessageBox;

public class AutoProcessEnv {

	public final ScriptEngine se;

	public AutoProcessEnv(String initScript, String extPointID) {
		ScriptEngineManager sm = new ScriptEngineManager();
		se = sm.getEngineByName("JavaScript");
		try {
			se.put("pe", this);
			IExtensionPoint extPoint = Platform.getExtensionRegistry()
					.getExtensionPoint("tc.wfcf.CustomScriptHelper");
			for (IExtension ext : extPoint.getExtensions()) {
				for (IConfigurationElement ce : ext.getConfigurationElements()) {
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
				for (IConfigurationElement ce : ext.getConfigurationElements()) {
					if ("js".equals(ce.getName())) {
						String uri = ce.getAttribute("uri");
						Bundle bndl = Platform.getBundle(ce.getContributor()
								.getName());
						URL url = bndl.getEntry(uri);
						if (url == null)
							url = bndl.getResource(uri);
						if (url == null) {
							System.err.println(" No custom js '" + uri
									+ "' from bundle: " + bndl);
							continue;
						}
						InputStream is = url.openStream();
						Reader sr = new BufferedReader(new InputStreamReader(
								is, "UTF-8"));
						try {
							se.eval(sr);
						} catch (Exception e) {
							e.printStackTrace();
							System.err.println("Error executing custom js: '"
									+ uri + "' from bundle: " + bndl);
						} finally {
							sr.close();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected final List<AutoProcessor> autoProcessors = new ArrayList<AutoProcessor>();

	public void onAutoProcessRun(AutoProcessor processor) {
		processor.getClass();
		autoProcessors.add(processor);
	}

	public AutoProcessDecision autoProcessTask(TCComponentTask task,
			PrintStream log) throws Exception {
		try {
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
			if (!instruction.startsWith("//") && !instruction.startsWith("/*"))
				return null;

			try {
				se.eval("(function () {" + instruction + "})();");
			} catch (Exception e) {
				e.printStackTrace();
				log.print("Error executing instruction script: ");
				e.printStackTrace(log);
				log.println("The instruction script is:\n" + instruction);
				return null;
			}

			AutoProcessDecision dec = null;
			for (AutoProcessor proc : autoProcessors) {
				dec = proc.processTask(task, log);
				if (dec == null)
					continue;
				if (!dec.allowFurtherProcess())
					return dec;
			}
			return dec;
		} finally {
			autoProcessors.clear();
		}
	}

}
