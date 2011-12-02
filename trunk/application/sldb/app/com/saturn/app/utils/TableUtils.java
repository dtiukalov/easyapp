package com.saturn.app.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.saturn.system.easyform.Table;
import com.saturn.system.easyform.TableColumn;

public class TableUtils {
	private static Logger logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private TableUtils() {

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getBean(HttpServletRequest request, String tableId) {
		Table table = Table.get(tableId);
		List<TableColumn> columns = TableColumn.getList(tableId);
		int size = columns.size();
		
		Map map = new HashMap();
		map.put("id", request.getParameter("id"));
		if (size > 0) {
			for (TableColumn column : columns) {
				String name = column.getName();
				map.put(name, request.getParameter(name));
			}
		}

		logger.debug("Inital Object[" + table.getName() + "]:" + map);
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
		logger.debug("DataGridJSON:" + buffer.toString());
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
