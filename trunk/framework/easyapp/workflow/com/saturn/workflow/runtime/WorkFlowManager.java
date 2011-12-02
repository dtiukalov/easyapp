package com.saturn.workflow.runtime;

import java.sql.Connection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.jexl.ExpressionFactory;
import org.apache.commons.jexl.JexlContext;
import org.apache.commons.jexl.JexlHelper;

import com.saturn.app.db.ITransaction;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.exception.BSException;
import com.saturn.app.utils.DateUtils;
import com.saturn.auth.User;
import com.saturn.workflow.FlowLine;
import com.saturn.workflow.FlowNode;
import com.saturn.workflow.NodeCondition;
import com.saturn.workflow.runtime.condition.ParseCondition;

public class WorkFlowManager {

	private WorkFlowManager() {

	}

	public static String start(String flowId, String flowName, String flowShowName, String userId,
			String userName) {
		String createTime = DateUtils.getSystemTime();

		WorkFlowInstance instance = new WorkFlowInstance(null, flowId,
				flowName, flowShowName, userId, userName, createTime);
		WorkFlowInstance.add(instance);

		instance = WorkFlowInstance.getByUserAndCreateTime(userId, createTime);

		String instanceId = instance.getId();
		FlowNode startNode = FlowNode.getStartNode(flowId);

		addProcess(instanceId, startNode.getId());

		return instanceId;
	}

	private static void addProcess(final String instanceId, final String nodeId) {

		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		if (instance == null) {
			throw new BSException("工作流实例" + instanceId + ": 不存在");
		}
		final String flowId = instance.getFlowId();
		final String flowName = instance.getFlowName();

		FlowNode node = FlowNode.get(nodeId);
		if (node == null) {
			throw new BSException("工作流" + flowName + ": 无节点id=" + nodeId);
		}

		final List<NodeCondition> conditions = NodeCondition.getList(node
				.getId());

		if (conditions != null) {
			SimpleDaoTemplate.update(new ITransaction() {
				public int execute(Connection connection) {
					for (NodeCondition condition : conditions) {
						Set<User> users = getConditionUsers(instanceId,
								condition);
						String sign = condition.getSign();

						for (User user : users) {
							WorkFlowProcess.add(
									connection,
									new WorkFlowProcess(null, instanceId,
											flowId, nodeId, user.getId(), user
													.getName(), sign, "否", "否",
											"", "", "", DateUtils.getSystemTime()));
						}
					}

					return 0;
				}
			});
		}
	}

	@SuppressWarnings("rawtypes")
	public static Map getFormValue(String instanceId) {
		return FlowFormDao.get(instanceId);
	}

	public static WorkFlowProcess getProcess(String instanceId, String userId) {
		if (WorkFlowProcess.getByInstanceId(instanceId, null).isEmpty()) {//如果工作流实例创建没有初始化，在这补上
			WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
			if (instance != null) {
				final String flowId = instance.getFlowId();
				addProcess(instanceId, FlowNode.getStartNode(flowId).getId());
			}
		}
		
		return WorkFlowProcess.getNotEndByInstanceIdAndUserId(instanceId,
				userId);
	}

	public static void confirm(String instanceId, String userId, String remark) {
		WorkFlowProcess process = getProcess(instanceId, userId);

		if (process == null) {
			throw new BSException("工作流实例Id：" + instanceId + ", 已经结束");
		}

		WorkFlowProcess.remark(process.getId(), remark);
		int result = WorkFlowProcess.confirm(process.getId());
		
		if (1 == result) {
			FlowNode node = FlowNode.get(process.getNodeId());
			String nextNodeId = nextNodeId(instanceId, node.getId());
			
			if (nextNodeId != null) {
				FlowNode nextNode = FlowNode.get(nextNodeId);
				if (!"flow.node.realize".equals(nextNode.getType())) {
					addProcess(instanceId, nextNodeId);
				} else {
					WorkFlowInstance.end(instanceId);
				}
			}
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String nextNodeId(String instanceId, String nodeId) {
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
		String flowId = instance.getFlowId();

		List<FlowLine> lines = FlowLine.getList(flowId, nodeId);

		if (lines.size() == 1) {
			FlowLine line = lines.get(0);
			return line.getEndId();
		} else if (lines.size() > 1) {
			Map formValue = getFormValue(instanceId);
			JexlContext context = JexlHelper.createContext();
			context.getVars().putAll(formValue);

			for (FlowLine line : lines) {
				String express = line.getExpress();

				if (express != null && !"".equals(express.trim())) {

					try {
						Object result = ExpressionFactory.createExpression(express)
								.evaluate(context);

						if (result instanceof Boolean && (Boolean) result) {
							return line.getEndId();
						}
					} catch (Exception e) {
						//e.printStackTrace();
					}
				}
			}
		}

		return null;
	}

	public static Set<User> getConditionUsers(String instanceId,
			NodeCondition condition) {
		Set<User> users = new HashSet<User>();
		users.addAll(ParseCondition.getUser(instanceId, condition));

		return users;
	}
}
