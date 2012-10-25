package com.saturn.app.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.saturn.app.db.DatabaseManager;

public class BeanUtils {
	private static Logger logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private BeanUtils() {

	}

	public static <T> String[] getFields(Class<T> clazz, String ...args) {
		Field[] fields = clazz.getDeclaredFields();
		
		List<String> list = new ArrayList<String>();
		
		for (Field field : fields) {
			String name = field.getName();
			
			if (!hasFiled(args, name) && !Modifier.isStatic(field.getModifiers())) {
				list.add(name);
			}
		}
		
		return list.toArray(new String[0]);
	}
	
	public static <T> String[] getFieldValues(T t, String[] fields, String ...args) {
		int length = 0;
		if (fields != null) {
			length += fields.length;
		}
		
		if (args != null) {
			length += args.length;
		}
		
		String[] values = new String[length];
		int i = 0;
		
		if (fields != null) {
			for (String f : fields) {
				values[i++] = invokeGet(t, f);
			}
		}
		
		if (args != null) {
			for (String f : args) {
				values[i++] = invokeGet(t, f);
			}
		}
		
		return values;
	}
	
	private static boolean hasFiled(String[] fields, String field) {
		if (fields == null) {
			return true;
		}
		
		for (String f : fields) {
			if (f != null && f.equals(field)) {
				return true;
			}
		}
		
		return false;
	}
	
	public static <T> T getBean(HttpServletRequest request, Class<T> clazz) {
		Field[] fields = clazz.getDeclaredFields();
		T t = null;
		try {
			t = clazz.newInstance();

			if (fields != null) {
				for (Field field : fields) {
					String name = field.getName();
					String value = request.getParameter(name);

					invokeSet(t, name, value);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("Inital Object[" + clazz.getSimpleName() + "]:" + t);
		return t;
	}

	public static <T> void mapppingBean(ResultSet rs, T t) {
		try {
			ResultSetMetaData metaData = rs.getMetaData();

			if (metaData != null) {
				int size = metaData.getColumnCount();
				for (int i = 1; i <= size; ++i) {
					String name = metaData.getColumnName(i);

					try {
						String value = rs.getString(name);

						invokeSet(t, getFieldName(t, name), value);
					} catch (Exception e) {
						logger.debug(e);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("Result Mapping Object[" + t.getClass().getSimpleName()
				+ "]:" + t);
	}

	public static <T> String getFieldName(T t, String field) {
		String dbType = DatabaseManager.getInstance().getDataConfig()
				.getDbType();

		if ("oracle".equals(dbType)) {
			Field[] fs = t.getClass().getDeclaredFields();

			for (Field f : fs) {
				String name = f.getName();
				if (name.toLowerCase().equals(field.toLowerCase())) {
					return name;
				}
			}
		}

		return field;
	}

	public static <T> void invokeSet(T t, String field, String value) {
		Method method = null;
		try {
			method = t.getClass().getMethod(getMethodName("set", field),
					String.class);

			if (method != null && value != null) {
				method.invoke(t, value);
			}
		} catch (Exception e) {
			logger.debug(e);
		}
	}

	public static <T> String invokeGet(T t, String field) {
		Method method = null;
		Object value = null;
		try {
			method = t.getClass().getMethod(getMethodName("get", field));

			if (method != null) {
				value = method.invoke(t);
			}
		} catch (Exception e) {
			logger.debug(e);
		}

		if (value != null) {
			return value.toString();
		}

		return null;
	}

	private static String getMethodName(String suffix, String fieldName) {
		return suffix + fieldName.toUpperCase().substring(0, 1)
				+ fieldName.substring(1);
		// + fieldName.toLowerCase().substring(1);
	}
}
