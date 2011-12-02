package com.saturn.action.workflow.info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.workflow.FlowFormItem;
import com.saturn.workflow.FlowNode;
import com.saturn.workflow.NodeState;

@SuppressWarnings("rawtypes")
public class AjaxUpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		Map map = request.getParameterMap();
		String flowId = request.getParameter("flowId");

		if (NodeState.addAll(getList(map, flowId)) > 1) {
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}

	public String requestMapping() {
		return "/app/workflow/state/ajaxupdate.action";
	}

	public List<NodeState> getList(Map map, String flowId) {
		List<FlowFormItem> items = FlowFormItem.getList(flowId);
		List<FlowNode> nodes = FlowNode.getByFlowId(flowId);

		List<NodeState> states = new ArrayList<NodeState>();

		for (int i = 0; i < items.size(); ++i) {
			FlowFormItem item = items.get(i);
			String itemName = item.getName();

			for (FlowNode node : nodes) {
				String nodeId = node.getId();

				String[] value = (String[]) map.get("states[" + i + "][process_"
						+ nodeId + "]");
				if (value != null && value.length > 0) {
					NodeState state = new NodeState(null, flowId, nodeId,
							itemName, value[0]);
					states.add(state);
				}
			}
		}

		return states;
	}
}
