package com.customer.fotonbm.report.form;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.customer.fotonbm.report.utils.Dom4jUtils;
import com.customer.fotonbm.report.utils.ExceptionUtils;
import com.customer.fotonbm.report.utils.Utils;
import com.teamcenter.rac.util.MessageBox;

/**
 * 根据Form模板Key值加载/classpath/forms下的*.form文件
 * 
 * @author LeslieGu
 */
public class FormLoader {

	public static final String TEMPLATE_FILE_SUFFIX = ".form"; //$NON-NLS-1$

	public static final String FAWBM_FORM = "fawbm-form"; //$NON-NLS-1$

	public static final String FORM = "form"; //$NON-NLS-1$

	public static final String FORM_KEY = "key"; //$NON-NLS-1$

	public static final String FORM_DESC = "description"; //$NON-NLS-1$

	public static final String PROPERTY = "property"; //$NON-NLS-1$

	public static final String PROPERTY_KEY = "key"; //$NON-NLS-1$

	public static final String PROPERTY_DEFAULT_VALUE = "default-value"; //$NON-NLS-1$

	public static final String PROPERTY_TYPE = "type"; //$NON-NLS-1$

	public FormTemplateInfo loadFormInfo(String key) {
		InputStream in = null;

		try {
			in = new FileInputStream(new File(Utils.FORM_PATH + key + TEMPLATE_FILE_SUFFIX));
			return this.loadFormInfo(in);
		} catch (Exception e) {
			MessageBox.post(ExceptionUtils.getExMessage(e), "FormLoader.Error", MessageBox.ERROR); //$NON-NLS-1$
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

	public FormTemplateInfo loadFormInfo(InputStream in) throws Exception {
		Document document = Dom4jUtils.getDocment(in);

		if (document != null) {
			Element root = document.getRootElement();
			Element form = root.element(FORM);

			String formKey = form.attributeValue(FORM_KEY);
			String formDesc = form.attributeValue(FORM_DESC);

			return new FormTemplateInfo(formKey, formDesc, this
					.loadCellInfos(form));
		}

		return null;
	}

	@SuppressWarnings("unchecked") //$NON-NLS-1$
	private Map<String, FormPropertyInfo> loadCellInfos(Element form) {
		List<Element> cells = (List<Element>)form.elements(PROPERTY);

		Map<String, FormPropertyInfo> propertyInfos = new HashMap<String, FormPropertyInfo>();

		for (Element cell : cells) {
			FormPropertyInfo propertyInfo = createPropertyInfo(cell);
			propertyInfos.put(propertyInfo.getKey(), propertyInfo);
		}

		return propertyInfos;
	}

	private FormPropertyInfo createPropertyInfo(Element property) {
		String key = property.attributeValue(PROPERTY_KEY).trim();
		String type = property.attributeValue(PROPERTY_TYPE).trim();
		String defaultValue = property.attributeValue(PROPERTY_DEFAULT_VALUE);

		return new FormPropertyInfo(key, type, defaultValue);
	}
}
