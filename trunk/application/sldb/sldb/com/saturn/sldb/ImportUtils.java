package com.saturn.sldb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

public class ImportUtils {
	private ImportUtils() {

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getBean(HttpServletRequest request, String id) {
		Import imp = Import.get(id);
		String type = imp.getType();
		
		ImportInfo info = ImportInfo.get(type);
		
		List<ImportItem> items = ImportItem.getList(info.getId());
		
		int size = items.size();
		
		Map map = new HashMap();
		map.put("id", request.getParameter("id"));
		if (size > 0) {
			for (ImportItem column : items) {
				String name = column.getColume();
				map.put(name, request.getParameter(name));
			}
		}

		return map;
	}
	
	public static String getDataGridJSON(int total, List<?> rows, List<?> footer) {
		StringBuffer buffer = new StringBuffer();

		buffer.append("{");

		buffer.append("\"total\":" + total + ",");
		buffer.append("\"rows\":" + getStrList(rows));
		if (footer != null) {
			buffer.append(",\"footer\":" + getStrList(footer));
		}

		buffer.append("}");
		return buffer.toString();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private static List<String> getStrList(List<?> list) {
		List<String> strs = new ArrayList<String>();
		
		for (int i = 0; i < list.size(); ++i) {
			Map map = (Map)list.get(i);
			
			strs.add(new JSONObject(map).toString());
		}
		
		return strs;
	}
}
