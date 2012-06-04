package com.saturn.ph;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.PropertyDescription;
import com.teamcenter.soa.client.model.ServiceData;
import com.teamcenter.soa.exceptions.NotLoadedException;

public abstract class Form {

	public abstract String[] getAttributes();

	public abstract String getJspPath();

	public abstract String getType();

	public abstract String getTitle();

	public Map<String, Object> getValue(String uid, boolean refresh) {
		ModelObject model = loadModelObject(uid, refresh);
		Map<String, Object> value = new HashMap<String, Object>();
		String[] attributes = getAttributes();

		if (model != null && attributes != null) {
			getProperties(model, attributes);

			for (String attr : attributes) {
				try {
					PropertyDescription propertyDescription = model
							.getProperty(attr).getPropertyDescription();
					if (propertyDescription.isArray()) {
						int type = propertyDescription.getType();

						switch (type) {
							case PropertyDescription.CLIENT_PROP_TYPE_string: {
								String[] ps = model.getProperty(attr)
										.getStringArrayValue();
								if (ps != null && ps.length > 0) {
									List<String> values = new ArrayList<String>(ps.length);
									for (String p : ps) {
										if(p == null){
											p = "";
										}
										values.add(p + "");
									}
									value.put(attr, values);
								}
								break;
							}
							case PropertyDescription.CLIENT_PROP_TYPE_int: {
								int[] ps = model.getProperty(attr)
										.getIntArrayValue();
	
								if (ps != null && ps.length > 0) {
									List<String> values = new ArrayList<String>(ps.length);
									
									for (int p : ps) {
										values.add(p + "");
									}
									
									value.put(attr, values);
								}
								break;
							}
							case PropertyDescription.CLIENT_PROP_TYPE_double: {
								double[] ps = model.getProperty(attr)
										.getDoubleArrayValue();
								
								if (ps != null && ps.length > 0) {
									List<String> values = new ArrayList<String>(ps.length);
									//精确到小数点后一位
									DecimalFormat df = new DecimalFormat("0.0");
									for (double p : ps) {
										values.add(df.format(p) + "");
									}
									value.put(attr, values);
								}
								break;
							}
							case PropertyDescription.CLIENT_PROP_TYPE_date: {
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								Calendar[] date = model.getProperty(attr)
									.getDateArrayValue();
								
								if (date != null && date.length > 0) {
									List<String> values = new ArrayList<String>(date.length);
									
									for (Calendar cal : date){
										if (cal != null) {
											values.add(df.format(cal.getTime()));
										} else {
											values.add("1900-01-01 00:00:00");
										}
									}
									value.put(attr, values);
								}
								break;
							}
							default : {
								value.put(attr, model.getPropertyDisplayableValues(attr));
							}
						}
					} else {
						int type = propertyDescription.getType();
	
						switch (type) {
							case PropertyDescription.CLIENT_PROP_TYPE_date: {
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								Calendar date = model.getProperty(attr)
									.getDateValue();
								if (date != null) {
									value.put(attr, df.format(date.getTime()));
								} else {
									value.put(attr, "1900-01-01 00:00:00");
								}
								
								break;
							}
							default : {
								value.put(attr, model.getPropertyDisplayableValue(attr));
							}
						}
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
		}

		return value;
	}

	public ServiceData getProperties(ModelObject model, String... args) {
		return PH.getDataService().getProperties(model, args);
	}

	public ModelObject loadModelObject(String uid, boolean refresh) {
		if (refresh) {
			return PH.getDataService().loadModelObjectRefresh(uid);
		} else {
			return PH.getDataService().loadModelObject(uid);
		}
	}
}
