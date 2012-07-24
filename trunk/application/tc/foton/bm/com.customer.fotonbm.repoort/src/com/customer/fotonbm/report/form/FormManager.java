package com.customer.fotonbm.report.form;

import java.util.HashMap;
import java.util.Map;

import com.customer.fotonbm.report.utils.ImageUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCComponentTcFile;

/**
 * Form信息加载核心类.
 * <p>根据TCComponentForm类型名车,在classpath/forms中寻找对应的form描述文件.
 * <p>根据form描述文件中定义的property属性读取TCComponentForm中的信息.
 * <p>目前支持的property类型:string, image
 * 
 * @author LeslieGu
 */
public class FormManager {
	
	private static FormManager instance = new FormManager();

	private Map<String, FormTemplateInfo> forms = new HashMap<String, FormTemplateInfo>();

	private boolean reload = false;

	private FormLoader formLoader = new FormLoader();

	private FormManager() {
	}

	public static FormManager getInstance() {
		return instance;
	}

	public void addFormTemplate(FormTemplateInfo formTemplateInfo) {
		if (formTemplateInfo != null) {
			this.forms.put(formTemplateInfo.getKey(), formTemplateInfo);
		}
	}

	public FormTemplateInfo getExcelTemplate(String key) {
		if (!this.forms.containsKey(key) || reload) {
			FormTemplateInfo formTemplateInfo = formLoader.loadFormInfo(key);
			if (formTemplateInfo != null) {
				this.forms.put(key, formTemplateInfo);
			}
		}

		return this.forms.get(key);
	}

	public Map<String, Object> loadForm(String key,
			InterfaceAIFComponent component) throws Exception {
		FormTemplateInfo formTemplateInfo = this.getExcelTemplate(key);
		Map<String, Object> values = new HashMap<String, Object>();

		if (formTemplateInfo != null && component != null) {

			for (String formPropertyInfoKey : formTemplateInfo.getProperties()
					.keySet()) {
				FormPropertyInfo formPropertyInfo = formTemplateInfo
						.getProperty(formPropertyInfoKey);
				String type = formPropertyInfo.getType();

				Object value = null;

				if (FormPropertyInfo.TYPE_STRING.equals(type)) {
					value = component.getProperty(formPropertyInfoKey);
				} else if (FormPropertyInfo.TYPE_IMAGE.equals(type)) {
					if (component instanceof TCComponentForm) {
						TCComponentForm componentForm = (TCComponentForm) component;
						TCComponentDataset componentDataset = (TCComponentDataset) componentForm
								.getReferenceProperty(formPropertyInfoKey);

						if (componentDataset != null) {
							TCComponentTcFile[] componentTcFiles = componentDataset
									.getTcFiles();

							if (componentTcFiles != null
									&& componentTcFiles.length > 0) {
								TCComponentTcFile tcFile = componentTcFiles[0];

								value = ImageUtil.readBufferedImg(tcFile.getFmsFile());
							}
						}
					}
				}

				if (value != null) {
					values.put(formPropertyInfoKey, value);
				}
			}
		}

		return values;
	}
}
