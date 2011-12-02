package com.saturn.workflow.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.saturn.app.utils.LogManager;
import com.saturn.workflow.FlowFormItem;
import com.saturn.workflow.runtime.WorkFlowInstance;

public class FlowFormUtils {
	private static Logger logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private FlowFormUtils() {

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getBean(HttpServletRequest request, String instanceId) {
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		String flowId = instance.getFlowId();
		String flowName = instance.getFlowName();
		
		List<FlowFormItem> items = FlowFormItem.getList(flowId);
		
		int size = items.size();
		
		Map map = new HashMap();
		map.put("id", request.getParameter("id"));
		map.put("instanceId", request.getParameter("instanceId"));
		if (size > 0) {
			for (FlowFormItem item : items) {
				String name = item.getName();
				map.put(name, request.getParameter(name));
			}
		}

		logger.debug("Inital Object[" + flowName + "]:" + map);
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
