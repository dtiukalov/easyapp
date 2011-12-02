package com.saturn.workflow.runtime;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.saturn.app.db.ORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.LogManager;
import com.saturn.workflow.FlowFormItem;
import com.saturn.workflow.WorkFlow;

@SuppressWarnings("rawtypes")
public class FlowFormDao {
	private static Logger Logger = LogManager.getLogger(LogManager.LOG_KEY_APP);

	private static ORMapping<HashMap> mapping = new ORMapping<HashMap>() {

		@SuppressWarnings("unchecked")//hashmap的类型检查
		@Override
		public void mappingResult(ResultSet rs, HashMap t) throws SQLException {
			try {
				ResultSetMetaData metaData = rs.getMetaData();
				
				if (metaData != null) {
					int size = metaData.getColumnCount();
					for (int i = 1; i <= size; ++i) {
						String name = metaData.getColumnName(i);
						
						try {
							String value = rs.getString(name);
							t.put(name, value);
						} catch (Exception e) {
							Logger.debug(e);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			Logger.debug("Result Mapping Object[" + t.getClass().getSimpleName() + "]:" + t);
		}
	};
	
	public static int addOrEdit(Map vo, String instanceId) {
		Map formValue = get(instanceId);
		
		if (formValue == null) {
			return add(vo, instanceId);
		}
		
		return edit(vo, instanceId);
	}
	
	public static int add(Map vo, String instanceId) {
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		
		String flowId = instance.getFlowId();
		WorkFlow workflow = WorkFlow.get(flowId);
		List<FlowFormItem> items = FlowFormItem.getList(flowId);
		
		int size = items.size();

		if (size > 0) {
			String[] columnNames = new String[size];
			String[] values = new String[size];
			String[] quotes = new String[size];
			
			int i = 0;
			for (FlowFormItem item : items) {
				columnNames[i] = "`" + item.getName() + "`";
				values[i] = (String)vo.get(item.getName());
				quotes[i] = "?";
				++i;
			}
			
			return SimpleDaoTemplate.update(
					"INSERT INTO " + WorkFlow.WORKFLOW_FOMR_TABLE_PRE + workflow.getName() + "(instanceId, " + getStr(columnNames) + ") VALUES(" + instanceId + ", " + getStr(quotes)+ ")", values
			);
		}
		
		return 0;
	}
	
	public static int edit(Map vo, String instanceId) {
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		
		String flowId = instance.getFlowId();
		WorkFlow workflow = WorkFlow.get(flowId);
		List<FlowFormItem> items = FlowFormItem.getList(flowId);
		
		int size = items.size();

		if (size > 0) {
			String[] columnNames = new String[size];
			String[] values = new String[size];
			
			int i = 0;
			for (FlowFormItem column : items) {
				columnNames[i] = "`" + column.getName() + "` = ?";
				values[i] = (String)vo.get(column.getName());
				++i;
			}
			
			return SimpleDaoTemplate.update(
					"UPDATE " + WorkFlow.WORKFLOW_FOMR_TABLE_PRE + workflow.getName() + " SET " + getStr(columnNames) + " WHERE id = " + vo.get("id") + " AND instanceId = " + instanceId, values
			);
		}
		
		return 0;
	}
	
	public static HashMap get(String instanceId) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		String flowId = instance.getFlowId();
		WorkFlow workflow = WorkFlow.get(flowId);
		String name = WorkFlow.WORKFLOW_FOMR_TABLE_PRE + workflow.getName();
		
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM " + name + " WHERE 1 = 1 and instanceId = " + instanceId,
				null, mapping, HashMap.class);
	}
	
	public static String getStr(String[] vars) {
		StringBuffer buffer = new StringBuffer();
		for (String var : vars) {
			buffer.append(var).append(",");
		}
		
		buffer.deleteCharAt(buffer.length()-1);
		return buffer.toString();
	}
}
