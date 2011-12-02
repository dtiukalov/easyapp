package com.saturn.workflow.runtime.condition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.saturn.auth.Organization;
import com.saturn.auth.User;
import com.saturn.workflow.NodeCondition;
import com.saturn.workflow.runtime.WorkFlowInstance;

public class ParseCondition {
	private static Map<String, IConditionUser> maps = new HashMap<String, IConditionUser>();
	
	private static IConditionUser empty = new IConditionUser() {
		
		public List<User> getConditionUsers(String instanceId,
				NodeCondition condition) {
			
			return new ArrayList<User>();
		}
	};
	
	static {
		inital();
	}
	
	private ParseCondition() {
		
	}
	
	private static void inital() {
		maps.put("node.condition.workflow:node.condition.creater", new IConditionUser() {
			
			public List<User> getConditionUsers(String instanceId,
					NodeCondition condition) {
			
				WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
				String createrId = instance.getCreater();
			
				String value = condition.getValue();
				if (value == null || "".equals(value)) {
					return new ArrayList<User>();
				}
				
				String[] ids = value.split(",");
				
				List<User> users = new ArrayList<User>();
				
				for (String id : ids) {
					if ("node.condition.creater.self".equals(id)) {
						users.add(User.get(createrId));
					} else if ("node.condition.creater.department".equals(id)) {
						List<Organization> ors = Organization.getOrganizationByUser(createrId);
						if (ors != null) {
							for (Organization or : ors) {
								Organization manager = Organization.getManager(or.getId());
								if (manager != null) {
									List<User> managers = User.getUsersByOrganizationId(manager.getId(), null, null, null).getList();
									users.addAll(managers);
								}
							}
						}
					} else if ("node.condition.creater.department.people".equals(id)) {
						List<Organization> ors = Organization.getOrganizationByUser(createrId);
						if (ors != null) {
							for (Organization or : ors) {
								Organization department = Organization.get(or.getParentId());
								if (department != null) {
									List<User> managers = User.getUsersByOrganizationId(department.getId(), null, null, null).getList();
									users.addAll(managers);
								}
							}
						}
					}
					
				}
				
				return users;
			}
		});
		
		maps.put("node.condition.auth:node.condition.auth.user", new IConditionUser() {
			
			public List<User> getConditionUsers(String instanceId,
					NodeCondition condition) {
				
				String value = condition.getValue();
				if (value == null || "".equals(value)) {
					return new ArrayList<User>();
				}
				
				String[] userIds = value.split(",");
				
				List<User> users = new ArrayList<User>();
				
				for (String id : userIds) {
					users.add(User.get(id));
				}
				
				return users;
			}
		});
		
		maps.put("node.condition.auth:node.condition.auth.role", new IConditionUser() {
			
			public List<User> getConditionUsers(String instanceId,
					NodeCondition condition) {
				
				String value = condition.getValue();
				if (value == null || "".equals(value)) {
					return new ArrayList<User>();
				}
				
				String[] roleIds = value.split(",");
				
				List<User> users = new ArrayList<User>();
				
				for (String id : roleIds) {
					users.addAll(User.getUsersByRoleId(id, null, null, null).getList());
				}
				
				return users;
			}
		});
		
		maps.put("node.condition.auth:node.condition.auth.department", new IConditionUser() {
			
			public List<User> getConditionUsers(String instanceId,
					NodeCondition condition) {
				
				String value = condition.getValue();
				if (value == null || "".equals(value)) {
					return new ArrayList<User>();
				}
				
				String[] departmentIds = value.split(",");
				
				List<User> users = new ArrayList<User>();
				
				for (String id : departmentIds) {
					users.addAll(User.getUsersByOrganizationId(id, null, null, null).getList());
				}
				
				return users;
			}
		});
	}
	
	public static List<User> getUser(String instanceId, NodeCondition condition) {
		return getConditionUser(condition).getConditionUsers(instanceId, condition);
	}
	
	private static IConditionUser getConditionUser(NodeCondition condition) {
		String model = condition.getModel();
		String type = condition.getType();
		
		IConditionUser conditionUser = maps.get(model + ":" + type);
		if (conditionUser == null) {
			return empty;
		}
		
		return conditionUser;
	}
}


